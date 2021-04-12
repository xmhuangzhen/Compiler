package Optimize;

import RISCV.Inst.*;
import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Stack;

public class GraphColoringRegAllocator extends ASMPass {

    //data structure of vertexes, worklists, sets, stacks
    public HashSet<RISCVRegister> precolored = new LinkedHashSet<>();
    public HashSet<RISCVRegister> initialed = new LinkedHashSet<>();
    public HashSet<RISCVRegister> simplifyWorklist = new LinkedHashSet<>();
    public HashSet<RISCVRegister> freezeWorklist = new LinkedHashSet<>();
    public HashSet<RISCVRegister> spillWorklist = new LinkedHashSet<>();
    public HashSet<RISCVRegister> spilledNodes = new LinkedHashSet<>();
    public HashSet<RISCVRegister> coalescedNodes = new LinkedHashSet<>();
    public HashSet<RISCVRegister> coloredNodes = new LinkedHashSet<>();
    public Stack<RISCVRegister> selectStack = new Stack<>();

    //data structure for move instruction
    public HashSet<RISCVmvInst> coalescedMoves = new LinkedHashSet<>();
    public HashSet<RISCVmvInst> constrainedMoves = new LinkedHashSet<>();
    public HashSet<RISCVmvInst> frozenMoves = new LinkedHashSet<>();
    public HashSet<RISCVmvInst> worklistMoves = new LinkedHashSet<>();
    public HashSet<RISCVmvInst> activeMoves = new LinkedHashSet<>();

    //other data structure
    //adjList, degree, moveList, alias, color are defined in RISCVRegister Node
    public HashSet<Edge> adjSet = new LinkedHashSet<>();

    public int K;
    public RISCVFunction curFunc;
    public HashSet<RISCVRegister> SpillTemp = new LinkedHashSet<>();

    public static int INF = 0x3f3f3f3f;//1073741823;

    public GraphColoringRegAllocator(RISCVModule tmpModule) {
        super(tmpModule);
        precolored.addAll(curRISCVModule.PhyRegList);
        K = curRISCVModule.okPhyRegList.size();
    }

    @Override
    public boolean run() {
        for (var tmpFunc : curRISCVModule.RISCVFuncMap.values())
            if (!tmpFunc.IsBuiltIn) {
                curFunc = tmpFunc;
                functionGraphColoring();

                // sw ra,-4(sp)
                // sw s0,-8(sp)
                // mv s0,sp
                // addi sp,sp,-GCSize

                RISCVInstruction tmpInst = tmpFunc.EntranceBlock.HeadInst;
                RISCVInstruction tmpInst1 = new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                        curRISCVModule.getPhyReg("ra"),
                        curRISCVModule.getPhyReg("sp"),
                        new RISCVImm(-4));
                if (tmpInst == null) {
                    tmpFunc.EntranceBlock.HeadInst = tmpInst1;
                } else {
                    tmpInst.addInstPre(tmpFunc.EntranceBlock, tmpInst1);
                }
                tmpInst = tmpInst1;
                for (int i = 0; i < 12; ++i)
                    if (curFunc.usedPhyReg.contains(curRISCVModule.getPhyReg("s" + i))) {
                        tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                                new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                        curRISCVModule.getPhyReg("s" + i),
                                        curRISCVModule.getPhyReg("sp"),
                                        new RISCVImm(-4 * (2 + i))));
                        tmpInst = tmpInst.nextInst;
                    }

                tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                        new RISCVmvInst(curRISCVModule.getPhyReg("s0"),
                                curRISCVModule.getPhyReg("sp")));
                tmpInst = tmpInst.nextInst;

                tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                        new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                curRISCVModule.getPhyReg("sp"),
                                curRISCVModule.getPhyReg("sp"),
                                null, new RISCVImm(-tmpFunc.GCRealStackSize())));


                if (tmpFunc.LastBlock.TailInst == null) {
                    throw new RuntimeException(tmpFunc.FunctionName);
                }

                tmpInst = tmpFunc.LastBlock.TailInst;
                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                curRISCVModule.getPhyReg("sp"),
                                curRISCVModule.getPhyReg("sp"),
                                null, new RISCVImm(tmpFunc.GCRealStackSize())));

                for (int i = 0; i < 12; ++i)
                    if (curFunc.usedPhyReg.contains(curRISCVModule.getPhyReg("s" + i))) {
                        tmpInst.addInstPre(tmpFunc.LastBlock,
                                new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                        curRISCVModule.getPhyReg("s" + i),
                                        curRISCVModule.getPhyReg("sp"),
                                        new RISCVImm(-4 * (2 + i))));
                    }

                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                curRISCVModule.getPhyReg("ra"),
                                curRISCVModule.getPhyReg("sp"),
                                new RISCVImm(-4)));


                //remove useless mv inst
                for (RISCVBasicBlock tmpBlock = curFunc.EntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBlock) {
                    for (tmpInst = tmpBlock.HeadInst;
                         tmpInst != null; tmpInst = tmpInst.nextInst) {
                        if (tmpInst instanceof RISCVmvInst) {
                            if (((RISCVmvInst) tmpInst).rd.color == ((RISCVmvInst) tmpInst).rs1.color) {
                                tmpInst.removeInst(tmpBlock);
                            }
                        }
                    }
                }


            }
        return false;
    }

    public void functionGraphColoring() {
        while (true) {
            init();
            LivenessAnalysis tmpLivenessAnalysis = new LivenessAnalysis(curFunc);
            tmpLivenessAnalysis.run();

            Build();
            MakeWorklist();

            do {
                if (!simplifyWorklist.isEmpty()) {
                    Simplify();
                } else if (!worklistMoves.isEmpty()) {
                    Coalesce();
                } else if (!freezeWorklist.isEmpty()) {
                    Freeze();
                } else if (!spillWorklist.isEmpty()) {
                    SelectSpill();
                }
            } while (!(simplifyWorklist.isEmpty() && worklistMoves.isEmpty() &&
                    freezeWorklist.isEmpty() && spillWorklist.isEmpty()));

            AssignColors();
            if (!spilledNodes.isEmpty())
                RewriteProgram();
            else
                break;
        }
    }

    public void init() {
        initialed.clear();
        simplifyWorklist.clear();
        freezeWorklist.clear();
        spillWorklist.clear();
        spilledNodes.clear();
        coalescedNodes.clear();
        coloredNodes.clear();
        selectStack.clear();

        coalescedMoves.clear();
        constrainedMoves.clear();
        frozenMoves.clear();
        worklistMoves.clear();
        activeMoves.clear();

        adjSet.clear();


        for (RISCVBasicBlock tmpBlock = curFunc.EntranceBlock;
             tmpBlock != null; tmpBlock = tmpBlock.nextBlock) {
            for (RISCVInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null; tmpInst = tmpInst.nextInst) {
                initialed.addAll(tmpInst.use());
                initialed.addAll(tmpInst.def());
            }
        }

        initialed.removeAll(precolored);

        for (var tmpReg : initialed) {
            tmpReg.weight = 0;
            tmpReg.alias = null;
            tmpReg.color = null;
            tmpReg.degree = 0;
            tmpReg.adjList.clear();
            tmpReg.moveList.clear();
        }

        for (var tmpReg : precolored) {
            tmpReg.alias = null;
            tmpReg.color = (RISCVPhyReg) tmpReg;
            tmpReg.degree = INF;
            tmpReg.adjList.clear();
            tmpReg.moveList.clear();
        }

        for (RISCVBasicBlock tmpBlock = curFunc.EntranceBlock; tmpBlock != null;
             tmpBlock = tmpBlock.nextBlock) {
            double tmpWeight = Math.pow(10, Math.min(tmpBlock.predecessor.size(), tmpBlock.successor.size()));
            for (RISCVInstruction tmpInst = tmpBlock.HeadInst; tmpInst != null;
                 tmpInst = tmpInst.nextInst) {
                for (var tmp : tmpInst.use()) tmp.weight += tmpWeight;
                for (var tmp : tmpInst.def()) tmp.weight += tmpWeight;
            }
        }
    }

    public void Build() {
        for (RISCVBasicBlock Blockb = curFunc.EntranceBlock; Blockb != null;
             Blockb = Blockb.nextBlock) {
            HashSet<RISCVRegister> live = new LinkedHashSet<>(Blockb.LiveOut);
            for (RISCVInstruction InstI = Blockb.TailInst; InstI != null; InstI = InstI.preInst) {
                if (InstI instanceof RISCVmvInst) {
                    live.removeAll(InstI.use());
                    for (var tmpn : InstI.def()) tmpn.moveList.add((RISCVmvInst) InstI);
                    for (var tmpn : InstI.use()) tmpn.moveList.add((RISCVmvInst) InstI);
                    worklistMoves.add((RISCVmvInst) InstI);
                }
                live.addAll(InstI.def());
                live.add(curRISCVModule.getPhyReg("zero"));
                for (var tmpd : InstI.def())
                    for (var tmpl : live) {
                        AddEdge(tmpl, tmpd);
                    }
                live.removeAll(InstI.def());
                live.addAll(InstI.use());
            }
        }
    }

    public void AddEdge(RISCVRegister u, RISCVRegister v) {
        if (u != v && !adjSet.contains(new Edge(u, v))) {
            adjSet.add(new Edge(u, v));
            adjSet.add(new Edge(v, u));
            if (!precolored.contains(u)) {
                u.adjList.add(v);
                u.degree++;
            }
            if (!precolored.contains(v)) {
                v.adjList.add(u);
                v.degree++;
            }
        }
    }

    public void MakeWorklist() {
        for (var n : initialed) {
            //    initialed.remove(n);
            if (n.degree >= K) {
                spillWorklist.add(n);
            } else if (MoveRelated(n)) {
                freezeWorklist.add(n);
            } else {
                simplifyWorklist.add(n);
            }
        }
    }

    public HashSet<RISCVRegister> Adjacent(RISCVRegister n) {
        HashSet<RISCVRegister> res = new LinkedHashSet<>(n.adjList);
        res.removeAll(selectStack);
        res.removeAll(coalescedNodes);
        return res;
    }

    public HashSet<RISCVmvInst> NodeMoves(RISCVRegister n) {
        HashSet<RISCVmvInst> res = new LinkedHashSet<>(activeMoves);
        res.addAll(worklistMoves);
        res.retainAll(n.moveList);
        return res;
    }

    public boolean MoveRelated(RISCVRegister n) {
        return !NodeMoves(n).isEmpty();
    }

    public void Simplify() {
        RISCVRegister n = simplifyWorklist.iterator().next();
        simplifyWorklist.remove(n);
        selectStack.push(n);
        for (RISCVRegister m : Adjacent(n)) {
            DecrementDegree(m);
        }
    }

    public void DecrementDegree(RISCVRegister m) {
        int d = m.degree;
        m.degree = d - 1;
        if (d == K) {
            HashSet<RISCVRegister> tmp = new LinkedHashSet<>(Adjacent(m));
            tmp.add(m);
            EnableMoves(tmp);

            spillWorklist.remove(m);
            if (MoveRelated(m)) freezeWorklist.add(m);
            else simplifyWorklist.add(m);
        }
    }

    public void EnableMoves(HashSet<RISCVRegister> nodes) {
        for (var n : nodes) {
            for (var m : NodeMoves(n))
                if (activeMoves.contains(m)) {
                    activeMoves.remove(m);
                    worklistMoves.add(m);
                }
        }
    }

    public void Coalesce() {
        RISCVmvInst m = worklistMoves.iterator().next();
        RISCVRegister x = GetAlias(m.rd);
        RISCVRegister y = GetAlias(m.rs1);
        RISCVRegister u, v;
        if (precolored.contains(y)) {
            u = y;
            v = x;
        } else {
            u = x;
            v = y;
        }
        worklistMoves.remove(m);
        if (u == v) {
            coalescedMoves.add(m);
            AddWorkList(u);
        } else if (precolored.contains(v) || adjSet.contains(new Edge(u, v))) {
            constrainedMoves.add(m);
            AddWorkList(u);
            AddWorkList(v);
        } else if ((precolored.contains(u) && ForAllCondition1(u, v)) ||
                (!precolored.contains(u) && Conservative(u, v))) {
            coalescedMoves.add(m);
            Combine(u, v);
            AddWorkList(u);
        } else {
            activeMoves.add(m);
        }
    }

    public boolean ForAllCondition1(RISCVRegister u, RISCVRegister v) {
        for (var t : Adjacent(v))
            if (!(t.degree < K || precolored.contains(t) || adjSet.contains(new Edge(t, u))))
                return false;
        return true;
    }

    public void AddWorkList(RISCVRegister u) {
        if ((!precolored.contains(u)) && (!MoveRelated(u)) && u.degree < K) {
            freezeWorklist.remove(u);
            simplifyWorklist.add(u);
        }
    }

    public boolean Conservative(RISCVRegister u, RISCVRegister v) {
        HashSet<RISCVRegister> Adjecentu = new LinkedHashSet<>(Adjacent(u));
        HashSet<RISCVRegister> nodes = new LinkedHashSet<>(Adjacent(v));
        nodes.addAll(Adjecentu);

        int k = 0;
        for (var n : nodes) {
            if (n.degree >= K) k++;
        }
        return k < K;
    }

    public RISCVRegister GetAlias(RISCVRegister n) {
        if (coalescedNodes.contains(n)) {
            n.alias = GetAlias(n.alias);
            return n.alias;
        }
        return n;
    }


    public void Combine(RISCVRegister u, RISCVRegister v) {
        if (freezeWorklist.contains(v)) {
            freezeWorklist.remove(v);
        } else {
            spillWorklist.remove(v);
        }
        coalescedNodes.add(v);
        v.alias = u;
        u.moveList.addAll(v.moveList);

        HashSet<RISCVRegister> tmp = new LinkedHashSet<>();
        tmp.add(v);
        EnableMoves(tmp);

        for (var t : Adjacent(v)) {
            AddEdge(t, u);
            DecrementDegree(t);
        }
        if (u.degree >= K && freezeWorklist.contains(u)) {
            freezeWorklist.remove(u);
            spillWorklist.add(u);
        }
    }

    public void Freeze() {
        RISCVRegister u = freezeWorklist.iterator().next();
        freezeWorklist.remove(u);
        simplifyWorklist.add(u);
        FreezeMoves(u);
    }

    public void FreezeMoves(RISCVRegister u) {
        for (var m : NodeMoves(u)) {
            RISCVRegister x = m.rd;
            RISCVRegister y = m.rs1;
            RISCVRegister v;
            if (GetAlias(x) == GetAlias(y)) {
                v = GetAlias(x);
            } else {
                v = GetAlias(y);
            }
            activeMoves.remove(m);
            frozenMoves.add(m);

            if (v.degree < K && NodeMoves(v).isEmpty()) {
                freezeWorklist.remove(v);
                simplifyWorklist.add(v);
            }
        }
    }

    public void SelectSpill() {
        RISCVRegister m = null;
        double cost = 1e9;
        boolean changed = false;
        for (RISCVRegister tmp : spillWorklist) {
            if (!SpillTemp.contains(tmp) && tmp.weight / tmp.degree < cost) {
                changed = true;
                m = tmp;
                cost = tmp.weight / tmp.degree;
            } else if (!changed) {
                m = tmp;
            }
        }


        spillWorklist.remove(m);
        simplifyWorklist.add(m);
        FreezeMoves(m);
    }

    public void AssignColors() {
        while (!selectStack.isEmpty()) {
            RISCVRegister n = selectStack.pop();
            ArrayList<RISCVPhyReg> okColors = new ArrayList<>(curRISCVModule.okPhyRegList);
            for (var w : n.adjList) {
                if (coloredNodes.contains(GetAlias(w)) || precolored.contains(GetAlias(w))) {
                    okColors.remove(GetAlias(w).color);
                }
            }
            if (okColors.isEmpty()) {
                spilledNodes.add(n);
            } else {
                coloredNodes.add(n);
                n.color = okColors.get(0);
                curFunc.usedPhyReg.add(n.color);
            }
        }
        for (var n : coalescedNodes) {
            n.color = GetAlias(n).color;
            curFunc.usedPhyReg.add(n.color);
        }
    }

    public void RewriteProgram() {
        for (var v : spilledNodes) {
            v.StackOffset = curFunc.GCStackNum; //-4*(14+StackOffset) (s0)
            curFunc.GCStackNum++;
        }

        for (RISCVBasicBlock tmpBlock = curFunc.EntranceBlock; tmpBlock != null;
             tmpBlock = tmpBlock.nextBlock) {
            for (RISCVInstruction tmpInst = tmpBlock.HeadInst; tmpInst != null;
                 tmpInst = tmpInst.nextInst) {
                if (!tmpInst.def().isEmpty() && tmpInst.def().size() == 1) {
                    RISCVRegister rd = tmpInst.def().iterator().next();
                    if (rd instanceof RISCVVirtualReg) {
                        GetAlias(rd);
                    }
                }
            }
        }

        for (RISCVBasicBlock tmpBlock = curFunc.EntranceBlock; tmpBlock != null;
             tmpBlock = tmpBlock.nextBlock) {
            for (RISCVInstruction tmpInst = tmpBlock.HeadInst; tmpInst != null;
                 tmpInst = tmpInst.nextInst) {
                for (var tmpuse : tmpInst.use()) {
                    if (tmpuse.StackOffset >= 0) {
                        if (!tmpInst.def().isEmpty() && tmpInst.def().contains(tmpuse)) {
                            //need load & store before use
                            RISCVVirtualReg tmpVirtualReg =
                                    new RISCVVirtualReg(RISCVModule.VirtualRegCnt++);
                            SpillTemp.add(tmpVirtualReg);
                            tmpInst.replaceUse(tmpuse, tmpVirtualReg);
                            tmpInst.addInstPre(tmpBlock,
                                    new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                            tmpVirtualReg,
                                            curRISCVModule.getPhyReg("s0"),
                                            new RISCVImm(-4 * (tmpuse.StackOffset + 14))));
                            tmpInst.addInstNxt(tmpBlock,
                                    new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                            tmpVirtualReg,
                                            curRISCVModule.getPhyReg("s0"),
                                            new RISCVImm(-4 * (tmpuse.StackOffset + 14))));
                        } else {
                            if (tmpInst instanceof RISCVmvInst && ((RISCVmvInst) tmpInst).rs1 == tmpuse &&
                                    ((RISCVmvInst) tmpInst).rd.StackOffset < 0) {// mv -> load
                                RISCVInstruction replaceInst = new RISCVlInst(
                                        RISCVInstruction.RISCVWidthENUMType.w,
                                        ((RISCVmvInst) tmpInst).rd,
                                        curRISCVModule.getPhyReg("s0"),
                                        new RISCVImm(-4 * (tmpuse.StackOffset + 14)));
                                tmpInst.replaceInst(tmpBlock, replaceInst);
                                tmpInst = replaceInst;
                            } else {
                                //need load before use
                                RISCVVirtualReg tmpVirtualReg =
                                        new RISCVVirtualReg(RISCVModule.VirtualRegCnt++);
                                SpillTemp.add(tmpVirtualReg);
                                tmpInst.replaceUse(tmpuse, tmpVirtualReg);
                                tmpInst.addInstPre(tmpBlock,
                                        new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                tmpVirtualReg,
                                                curRISCVModule.getPhyReg("s0"),
                                                new RISCVImm(-4 * (tmpuse.StackOffset + 14))));
                            }
                        }
                    }
                }

                for (var tmpdef : tmpInst.def()) {
                    if (tmpdef.StackOffset >= 0) {
                        if (!tmpInst.use().contains(tmpdef)) {
                            if (tmpInst instanceof RISCVmvInst && ((RISCVmvInst) tmpInst).rd == tmpdef &&
                                    ((RISCVmvInst) tmpInst).rs1.StackOffset < 0) {// mv -> store
                                RISCVInstruction replaceInst = new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                        ((RISCVmvInst) tmpInst).rs1,
                                        curRISCVModule.getPhyReg("s0"),
                                        new RISCVImm(-4 * (tmpdef.StackOffset + 14)));
                                tmpInst.replaceInst(tmpBlock, replaceInst);
                                tmpInst = replaceInst;
                            } else {
                                //need store after use
                                RISCVVirtualReg tmpVirtualReg =
                                        new RISCVVirtualReg(RISCVModule.VirtualRegCnt++);
                                SpillTemp.add(tmpVirtualReg);
                                tmpInst.replaceUse(tmpdef, tmpVirtualReg);
                                tmpInst.addInstNxt(tmpBlock,
                                        new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                tmpVirtualReg,
                                                curRISCVModule.getPhyReg("s0"),
                                                new RISCVImm(-4 * (tmpdef.StackOffset + 14))));
                            }
                        }
                    }
                }
            }
        }
    }
}