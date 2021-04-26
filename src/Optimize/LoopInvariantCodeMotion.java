package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.*;
import IR.Operand.IROperand;
import IR.Operand.Register;
import org.antlr.v4.runtime.misc.Pair;

import java.util.*;

//https://www.cs.cornell.edu/courses/cs6120/2019fa/blog/loop-reduction/
//http://www.cs.toronto.edu/~pekhimenko/courses/cscd70-w18/docs/Lecture%205%20[LICM%20and%20Strength%20Reduction]%2002.08.2018.pdf

public class LoopInvariantCodeMotion extends Pass {

    public IRFunction curFunc;
    public HashMap<IROperand, HashSet<IRInstruction>> reachDefMap;
    public HashMap<IRBasicBlock, ArrayList<IRBasicBlock>> allTails;//head,tail
    public HashMap<IRBasicBlock, HashSet<IRBasicBlock>> allLoops;
    public ArrayList<IRBasicBlock> curLoopBlockStack;
    public HashSet<IRBasicBlock> Visited;
    public Queue<IRBasicBlock> que;
    public int cnt;

    public LoopInvariantCodeMotion(IRModule tmpModule) {
        super(tmpModule);
        allTails = new HashMap<>();
        allLoops = new HashMap<>();
        reachDefMap = new HashMap<>();
        Visited = new HashSet<>();
        curLoopBlockStack = new ArrayList<>();
        que = new LinkedList<>();
    }

    @Override
    public boolean run() {
        DominatorTreeConstructor tmpDTC =
                new DominatorTreeConstructor(curIRModule);
        tmpDTC.run();

        allTails.clear();
        allLoops.clear();
        boolean modified = false;
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                curFunc = tmpFunc;

                //(1) finding loops
                FindingLoops();

                //(2) reaching definitions
                ReachingDefinitions();

                modified |= LCIMInLoop();
            }
        return modified;
    }

    public void FindingLoops() {
        for (IRBasicBlock curBlock = curFunc.thisEntranceBlock;
             curBlock != null; curBlock = curBlock.nextBasicBlocks) {
            curBlock.DominatorChildren.clear();
        }

        for (IRBasicBlock curBlock = curFunc.thisEntranceBlock;
             curBlock != null; curBlock = curBlock.nextBasicBlocks) {
            if (curBlock.DominatorTreeImmediateDominator != null)
                curBlock.DominatorTreeImmediateDominator.DominatorChildren.add(curBlock);
        }

        for (IRBasicBlock blockHead = curFunc.thisEntranceBlock;
             blockHead != null; blockHead = blockHead.nextBasicBlocks) {
            allTails.put(blockHead, new ArrayList<>());
            curLoopBlockStack.clear();
            getLoop(blockHead, blockHead);

            allLoops.put(blockHead, new HashSet<>());
            Visited.clear();
            que.clear();
            ArrayList<IRBasicBlock> blockTail = allTails.get(blockHead);
            if (!blockTail.isEmpty()) {
                for (var tmpBlock : blockTail) {
                    que.offer(tmpBlock);
                    Visited.add(tmpBlock);
                }
                Visited.add(blockHead);
                while (!que.isEmpty()) {
                    IRBasicBlock tmpBlock = que.poll();
                    for (var preBlock : tmpBlock.CFGPredecessor)
                        if (!Visited.contains(preBlock)) {
                            que.offer(preBlock);
                            Visited.add(preBlock);
                        }
                }
                allLoops.get(blockHead).addAll(Visited);
            }
        }
    }


    public boolean IsDom(IRBasicBlock curBlock, IRBasicBlock sucBlock) {
        //check whether sucBlock is the ancestor of curblock
        IRBasicBlock tmpBlock = curBlock;
        while (tmpBlock != null) {
            if (tmpBlock == sucBlock)
                return true;
            tmpBlock = tmpBlock.DominatorTreeImmediateDominator;
        }
        return false;
    }

    public void getLoop(IRBasicBlock curBlock, IRBasicBlock HeadBlock) {
        curLoopBlockStack.add(curBlock);
        if (curBlock.CFGSuccessor.contains(HeadBlock)) {
            allTails.get(HeadBlock).add(curBlock);
            curLoopBlockStack.remove(curBlock);
            return;
        }
        for (var tmpBlock : curBlock.DominatorChildren) {
            getLoop(tmpBlock, HeadBlock);
        }
        curLoopBlockStack.remove(curBlock);
    }

    public void ReachingDefinitions() {
        reachDefMap.clear();
        for (IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;
             tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
            for (IRInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                for (var tmpDef : tmpInst.getdef()) {
                    if (!reachDefMap.containsKey(tmpDef))
                        reachDefMap.put(tmpDef, new HashSet<>());
                    reachDefMap.get(tmpDef).add(tmpInst);
                }
            }
        }
    }

    public boolean LCIMInLoop() {
        boolean changed = false;
        for (IRBasicBlock preBlock = curFunc.thisEntranceBlock;
             preBlock != null; preBlock = preBlock.nextBasicBlocks) {
            if (preBlock.TailInst instanceof brInstruction &&
                    ((brInstruction) preBlock.TailInst).brCond == null) {// can be the preheader
                IRBasicBlock LoopHead = ((brInstruction) preBlock.TailInst).brIfTrue;
                if (!allLoops.containsKey(LoopHead) || allLoops.get(LoopHead).isEmpty()) continue;

                //check no call
                boolean LoopHasCall = false;
                HashSet<IRBasicBlock> LoopBlock = allLoops.get(LoopHead);

                for (IRBasicBlock tmpBlock : LoopBlock) {
                    LoopBlock.add(tmpBlock);
                    for (IRInstruction tmpInst = tmpBlock.HeadInst;
                         tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                        if (tmpInst instanceof callInstruction) {
                            LoopHasCall = true;
                            break;
                        }
                    }
                    if (LoopHasCall) break;
                }
                if (LoopHasCall) continue;

                boolean canLoop = true;
                for (IRBasicBlock tmpBlock : LoopBlock) {
                    if (!IsDom(tmpBlock, preBlock)) {
                        canLoop = false;
                        break;
                    }
                }
                if (!canLoop) continue;

                for (IRBasicBlock tmpBlock : LoopBlock) {
                    for (IRInstruction curInst = tmpBlock.HeadInst; curInst != null; ) {
                        IRInstruction tmpInst = curInst;
                        curInst = curInst.nextIRInstruction;
                        if (tmpInst instanceof binaryOpInstruction) {
                            boolean AllUseDontChange = true;
                            for (var tmp : tmpInst.getuse()) {
                                if (reachDefMap.containsKey(tmp)) {
                                    for (var tmpUseDef : reachDefMap.get(tmp)) {
                                        if (LoopBlock.contains(tmpUseDef.thisBasicBlock)) {
                                            AllUseDontChange = false;
                                            break;
                                        }
                                    }
                                }
                            }
                            if (AllUseDontChange) {
                                tmpInst.removeInst();
                                preBlock.addBasicBlockInstPreInst(preBlock.TailInst,
                                        new binaryOpInstruction(preBlock,
                                                ((binaryOpInstruction) tmpInst).BinaryOperandType,
                                                ((binaryOpInstruction) tmpInst).BinaryOp1,
                                                ((binaryOpInstruction) tmpInst).BinaryOp2,
                                                ((binaryOpInstruction) tmpInst).BinaryResult));
                                changed = true;
                            }
                        } else if (tmpInst instanceof icmpInstruction) {
                            boolean AllUseDontChange = true;
//                                    System.out.println(tmpInst);
                            for (var tmp : tmpInst.getuse()) {
                                if (reachDefMap.containsKey(tmp)) {
                                    for (var tmpUseDef : reachDefMap.get(tmp)) {
                                        if (LoopBlock.contains(tmpUseDef.thisBasicBlock)) {
                                            AllUseDontChange = false;
                                            break;
                                        }
                                    }
                                }
                            }
                            if (AllUseDontChange) {
//                                        System.out.println("2");
                                tmpInst.removeInst();
                                preBlock.addBasicBlockInstPreInst(preBlock.TailInst,
                                        new icmpInstruction(preBlock,
                                                ((icmpInstruction) tmpInst).IcmpOperandType,
                                                ((icmpInstruction) tmpInst).IcmpType,
                                                ((icmpInstruction) tmpInst).IcmpOp1,
                                                ((icmpInstruction) tmpInst).IcmpOp2,
                                                ((icmpInstruction) tmpInst).IcmpResult));
                                changed = true;
                            }
                        }
                    }
                }
            }
        }
        return changed;
    }
}