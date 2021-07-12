package Optimize;

import Backend.IRBuilder;
import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.*;
import IR.TypeSystem.IntegerType;

import java.util.*;

public class PolyhedralModel extends Pass {

    public IRFunction curFunc;
    public HashMap<IROperand, HashSet<IRInstruction>> reachDefMap;
    public HashMap<IRBasicBlock, ArrayList<IRBasicBlock>> allTails;//head,tail
    public HashMap<IRBasicBlock, HashSet<IRBasicBlock>> allLoops;
    public ArrayList<IRBasicBlock> curLoopBlockStack;
    public HashSet<IRBasicBlock> Visited;
    public Queue<IRBasicBlock> que;
    public ArrayList<IROperand> tmpInitVar;
    public ArrayList<IROperand> tmpNumInitVar;
//    public boolean PhiVarInLoopBlock;
    public HashSet<IRBasicBlock> tmpLoopBlock;
    public HashSet<IRBasicBlock> VisitedInitBlock;
    public HashSet<IROperand> tmpCondVar;
    public HashSet<IRBasicBlock> tmpcondBlock;
    public IRBasicBlock tmpstepBlock;

    public Constraint tmpCons;

    public int tmpStepVal, tmpCoeff;

    public PolyhedralModel(IRModule tmpModule) {
        super(tmpModule);
        allTails = new HashMap<>();
        allLoops = new HashMap<>();
        reachDefMap = new HashMap<>();
        Visited = new HashSet<>();
        curLoopBlockStack = new ArrayList<>();
        que = new LinkedList<>();
        tmpInitVar = new ArrayList<>();
        tmpNumInitVar = new ArrayList<>();
        VisitedInitBlock = new HashSet<>();
        tmpCondVar = new HashSet<>();
        tmpcondBlock = new HashSet<>();
    }

    @Override
    public boolean run() {
        DominatorTreeConstructor tmpDTC =
                new DominatorTreeConstructor(curIRModule);
        tmpDTC.run();

        allTails.clear();
        allLoops.clear();
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                curFunc = tmpFunc;
                FindingLoops();
                ReachingDefinitions();
                GetPolyderalModel();
            }
        return false;
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

    public boolean SearchPhiOperand(IROperand curOperand, IROperand curReg) {
        if (curOperand == curReg) {
            return true;
        }
        for (IRInstruction tmpDefInst : curOperand.Defs) {
            if (tmpLoopBlock.contains(tmpDefInst.thisBasicBlock) &&
                    tmpDefInst.thisBasicBlock.PolyBBType != IRBasicBlock.PolyBBENUMType.step_stmt) {
                return false;
            }
        }
        for (IRInstruction tmpDefInst : curOperand.Defs)
            if (tmpLoopBlock.contains(tmpDefInst.thisBasicBlock)) {
                for (IROperand tmpUseReg : tmpDefInst.getuse()) {
                    if (!SearchPhiOperand(tmpUseReg, curReg)) return false;
                }
            }
        return true;
    }

    public void GetNestedLoop(Loop curLoop) {
        curLoop.BodyBlock.addAll(curLoop.LoopBlock);
        for (IRBasicBlock initBlock : curLoop.LoopBlock) {
            if (!Visited.contains(initBlock)) {
                if (initBlock.TailInst instanceof brInstruction &&
                        ((brInstruction) initBlock.TailInst).brCond == null &&
                        initBlock.PolyBBType == IRBasicBlock.PolyBBENUMType.init_stmt &&
                        !VisitedInitBlock.contains(initBlock)) {
                    VisitedInitBlock.add(initBlock);

                    IRBasicBlock LoopHead = ((brInstruction) initBlock.TailInst).brIfTrue;
                    if (!allLoops.containsKey(LoopHead) || allLoops.get(LoopHead).isEmpty()) continue;
                    tmpLoopBlock = allLoops.get(LoopHead);

                    if (/*LoopHasCall() ||*/ (!canLoop(initBlock))) continue;
                    if (!IsPolyhedralModel(initBlock)) continue;

                    tmpcondBlock.clear();
                    for (IRBasicBlock tmpBlock : tmpLoopBlock) {
                        if (tmpBlock.LoopPos == initBlock.LoopPos) {
                            if (tmpBlock.PolyBBType == IRBasicBlock.PolyBBENUMType.cond_stmt)
                                tmpcondBlock.add(tmpBlock);
                            if (tmpBlock.PolyBBType == IRBasicBlock.PolyBBENUMType.step_stmt)
                                tmpstepBlock = tmpBlock;
                        }
                    }

                    Loop tmpLoop = new Loop(curLoop.Depth + 1, curLoop);
                    tmpLoop.RootLoop = curLoop.RootLoop;
                    tmpLoop.LoopBlock.addAll(tmpLoopBlock);
                    tmpLoop.initBlock = initBlock;
                    tmpLoop.InitVar.addAll(tmpInitVar);
                    tmpLoop.condBlock.addAll(tmpcondBlock);
                    tmpLoop.stepBlock = tmpstepBlock;
                    curLoop.ChildLoop.add(tmpLoop);
                    GetNestedLoop(tmpLoop);
                }
            }
        }
        Visited.addAll(curLoop.LoopBlock);
        for (Loop tmpLoop : curLoop.ChildLoop) {
            curLoop.BodyBlock.removeAll(tmpLoop.LoopBlock);
            curLoop.BodyBlock.remove(tmpLoop.initBlock);
        }
    }


    public boolean LoopHasCall() {
        for (IRBasicBlock tmpBlock : tmpLoopBlock) {
          //  tmpLoopBlock.add(tmpBlock);
            for (IRInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                if (tmpInst instanceof callInstruction) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean canLoop(IRBasicBlock initBlock) {
        for (IRBasicBlock tmpBlock : tmpLoopBlock) {
            if (!IsDom(tmpBlock, initBlock)) {
                return false;
            }
        }
        return true;
    }

    public boolean GetStepVal(IROperand curOperand, IROperand curReg, int curCoeff) {
        if (curOperand.Defs.size() != 1) return false;
        IRInstruction tmpInst0 = curOperand.Defs.iterator().next();
        if(tmpInst0 instanceof binaryOpInstruction) {
            binaryOpInstruction tmpInst = (binaryOpInstruction) tmpInst0;
            if (tmpInst.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.add) {
                //op1
                if (tmpInst.BinaryOp1 instanceof IntegerConstant) {
                    tmpStepVal += curCoeff * ((IntegerConstant) tmpInst.BinaryOp1).value;
                } else if (tmpInst.BinaryOp1 == curReg) {
                    tmpCoeff += curCoeff;
                } else if (tmpInst.BinaryOp1 instanceof Register || tmpInst.BinaryOp1 instanceof Parameter) {
                    if (!GetStepVal(tmpInst.BinaryOp1, curReg, curCoeff)) return false;
                }
                //op2
                if (tmpInst.BinaryOp2 instanceof IntegerConstant) {
                    tmpStepVal += curCoeff * ((IntegerConstant) tmpInst.BinaryOp2).value;
                } else if (tmpInst.BinaryOp2 == curReg) {
                    tmpCoeff += curCoeff;
                } else if (tmpInst.BinaryOp2 instanceof Register || tmpInst.BinaryOp2 instanceof Parameter) {
                    if (!GetStepVal(tmpInst.BinaryOp2, curReg, curCoeff)) return false;
                }
                return true;
            } else if (tmpInst.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.sub) {
                //op1
                if (tmpInst.BinaryOp1 instanceof IntegerConstant) {
                    tmpStepVal += curCoeff * ((IntegerConstant) tmpInst.BinaryOp1).value;
                } else if (tmpInst.BinaryOp1 == curReg) {
                    tmpCoeff += curCoeff;
                } else if (tmpInst.BinaryOp1 instanceof Register || tmpInst.BinaryOp1 instanceof Parameter) {
                    if (!GetStepVal(tmpInst.BinaryOp1, curReg, curCoeff)) return false;
                }
                //op2
                if (tmpInst.BinaryOp2 instanceof IntegerConstant) {
                    tmpStepVal -= curCoeff * ((IntegerConstant) tmpInst.BinaryOp2).value;
                } else if (tmpInst.BinaryOp2 == curReg) {
                    tmpCoeff -= curCoeff;
                } else if (tmpInst.BinaryOp2 instanceof Register || tmpInst.BinaryOp2 instanceof Parameter) {
                    if (!GetStepVal(tmpInst.BinaryOp2, curReg, -curCoeff)) return false;
                }
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    public boolean IsPolyhedralModel(IRBasicBlock initBlock) {
        tmpcondBlock.clear();
        for (IRBasicBlock tmpBlock : tmpLoopBlock) {
            if (tmpBlock.LoopPos == initBlock.LoopPos) {
                if (tmpBlock.PolyBBType == IRBasicBlock.PolyBBENUMType.cond_stmt)
                    tmpcondBlock.add(tmpBlock);
                if (tmpBlock.PolyBBType == IRBasicBlock.PolyBBENUMType.step_stmt)
                    tmpstepBlock = tmpBlock;
            }
        }

        tmpInitVar.clear();
        for (IROperand DefsOperandInBB : initBlock.DefsInBB) {
            //(1)def only once in block
            int renameCnt = 0;
            IROperand curReg = null;
            IRInstruction curInst = null;
            for (IROperand tmpRenameReg : DefsOperandInBB.RenameReg) {
                for (IRInstruction tmpInst : tmpRenameReg.Defs) {
                    if (tmpLoopBlock.contains(tmpInst.thisBasicBlock)) {
                        renameCnt++;
                        curReg = tmpRenameReg;
                        curInst = tmpInst;
                    }
                }
            }
            if (renameCnt > 1) return false;
            curReg.defInstInLoop = curInst;

            //(2) check phi inst
            if (curInst instanceof phiInstruction) {
                int phiInBB = 0, pos = 0;
                for (int i = 0; i < ((phiInstruction) curInst).PhiLabel.size(); ++i) {
                    IRBasicBlock tmpBlock = ((phiInstruction) curInst).PhiLabel.get(i);
                    if (tmpLoopBlock.contains(tmpBlock)) {
                        phiInBB++;
                        pos = i;
                    }
                }
                if (phiInBB > 1) return false;

                if (phiInBB == 1) {
                    IROperand tmpOperand = ((phiInstruction) curInst).PhiValue.get(pos);
                    if (!SearchPhiOperand(tmpOperand, curReg)) return false;

                    //check step_block only has +/- inst for Initvar
                    //only consider i = constant + i +/- constant
                    tmpStepVal = 0;
                    tmpCoeff = 0;
                    if(!GetStepVal(tmpOperand,curReg,1))return false;
                    if(tmpCoeff != 1) return false;
                    curReg.stepval = tmpStepVal;
                }

            }
            tmpInitVar.add(curReg);
            System.out.println(curReg+","+curReg.stepval);
        }
        return true;
    }

    public void NestedSpread(Loop curLoop){
        curLoop.NestedInitBlock.add(curLoop.initBlock);
        curLoop.NestedInitVar.addAll(curLoop.InitVar);
        curLoop.condNestedBlock.addAll(curLoop.condBlock);
        for(Loop tmpLoop : curLoop.ChildLoop){
            tmpLoop.NestedInitVar.addAll(curLoop.NestedInitVar);
            tmpLoop.NestedInitBlock.addAll(curLoop.NestedInitBlock);
            tmpLoop.condNestedBlock.addAll(curLoop.condBlock);
            NestedSpread(tmpLoop);
        }
    }

    public void GetCons(IROperand tmpOperand, Loop tmpRootLoop, int curCoeff){
        if(tmpOperand instanceof IntegerConstant){
            tmpCons.constant += curCoeff*((IntegerConstant) tmpOperand).value;
            return;
        }
        if(tmpOperand.Defs.size()!=1) return;
        IRInstruction tmpInst = tmpOperand.Defs.iterator().next();
        IRBasicBlock tmpBlock = tmpInst.thisBasicBlock;
        if(!tmpRootLoop.LoopBlock.contains(tmpBlock)) {
            tmpCons.ConsVar.add(tmpOperand);
            tmpCons.ConsCoeff.add(curCoeff);
            return;
        }
        if(tmpInst instanceof binaryOpInstruction){
            binaryOpInstruction tmpInst1 = (binaryOpInstruction) tmpInst;
            if(tmpInst1.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.add){
                GetCons(tmpInst1.BinaryOp1, tmpRootLoop, curCoeff);
                GetCons(tmpInst1.BinaryOp2, tmpRootLoop, curCoeff);
                return;
            } else if(tmpInst1.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.sub){
                GetCons(tmpInst1.BinaryOp1, tmpRootLoop, curCoeff);
                GetCons(tmpInst1.BinaryOp2, tmpRootLoop, -curCoeff);
                return;
            } else if(tmpInst1.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.mul){
                if(tmpInst1.BinaryOp1 instanceof IntegerConstant){
                    GetCons(tmpInst1.BinaryOp2,tmpRootLoop,
                            curCoeff*((int)((IntegerConstant) tmpInst1.BinaryOp1).value));
                    return;
                }
                if(tmpInst1.BinaryOp2 instanceof IntegerConstant){
                    GetCons(tmpInst1.BinaryOp1,tmpRootLoop,
                            curCoeff*((int)((IntegerConstant) tmpInst1.BinaryOp2).value));
                    return;
                }
            }
        }
        tmpCons.ConsVar.add(tmpOperand);
        tmpCons.ConsCoeff.add(curCoeff);
    }

    public boolean AnalyzeInitBlock(Loop curLoop){
        for(IROperand tmpOperand : curLoop.InitVar){
            IRInstruction tmpInst = tmpOperand.defInstInLoop;
            if(tmpInst instanceof phiInstruction){
                IROperand tmpPhiVal=null;
                for(int i = 0;i < ((phiInstruction) tmpInst).PhiLabel.size();++i){
                    if(((phiInstruction) tmpInst).PhiLabel.get(i) == curLoop.initBlock){
                        tmpPhiVal = ((phiInstruction) tmpInst).PhiValue.get(i);
                        break;
                    }
                }
                if(tmpPhiVal != null){
                    //tmpOperand = tmpPhiVal
                    if(tmpOperand.stepval>0) {
                        //tmpOperand >= tmpPhiVal --> -tmpOperand + tmpPhiVal <= 0
                        tmpCons = new Constraint();
                        tmpCons.ConsVar.add(tmpOperand);
                        tmpCons.ConsCoeff.add(-1);
                        GetCons(tmpPhiVal, curLoop.RootLoop, 1);
                        curLoop.cons.add(tmpCons);
                    } else {
                        //tmpOperand <= tmpPhiVal --> tmpOperand - tmpPhiVal <= 0
                        tmpCons = new Constraint();
                        tmpCons.ConsVar.add(tmpOperand);
                        tmpCons.ConsCoeff.add(1);
                        GetCons(tmpPhiVal, curLoop.RootLoop, -1);
                        curLoop.cons.add(tmpCons);
                    }
                }
            } else {
                return false;
                //TODO-7
            }
        }

        for(Loop tmpLoop : curLoop.ChildLoop){
            tmpLoop.cons.addAll(curLoop.cons);
            if(!AnalyzeInitBlock(tmpLoop))
                return false;
        }
        return true;
    }

    public boolean getCondVarInInst(IROperand curOperand,Loop curLoop) {
        if (curOperand.Defs.size() != 1) throw new RuntimeException();
        IRInstruction tmpInst = curOperand.Defs.iterator().next();
        if (tmpInst instanceof icmpInstruction) {
            if (((icmpInstruction) tmpInst).IcmpOperandType == icmpInstruction.IcmpOperandENUM.eq ||
                    ((icmpInstruction) tmpInst).IcmpOperandType == icmpInstruction.IcmpOperandENUM.ne)
                return false;
            if (((icmpInstruction) tmpInst).IcmpOperandType == icmpInstruction.IcmpOperandENUM.slt){
                //lhs < rhs --> lhs <= rhs - 1 --> lhs - rhs + 1 <= 0
                tmpCons = new Constraint();
                tmpCons.constant = 1;
                GetCons(((icmpInstruction) tmpInst).IcmpOp1,curLoop.RootLoop,1);
                GetCons(((icmpInstruction) tmpInst).IcmpOp2,curLoop.RootLoop,-1);
                curLoop.cons.add(tmpCons);
                return true;
            } else if (((icmpInstruction) tmpInst).IcmpOperandType == icmpInstruction.IcmpOperandENUM.sle){
                //lhs <= rhs --> lhs - rhs <= 0
                tmpCons = new Constraint();
                GetCons(((icmpInstruction) tmpInst).IcmpOp1,curLoop.RootLoop,1);
                GetCons(((icmpInstruction) tmpInst).IcmpOp2,curLoop.RootLoop,-1);
                curLoop.cons.add(tmpCons);
                return true;
            } else if (((icmpInstruction) tmpInst).IcmpOperandType == icmpInstruction.IcmpOperandENUM.sgt){
                //lhs > rhs --> lhs - 1 >= rhs  --> -lhs + rhs + 1 <= 0
                tmpCons = new Constraint();
                tmpCons.constant = 1;
                GetCons(((icmpInstruction) tmpInst).IcmpOp1,curLoop.RootLoop,-1);
                GetCons(((icmpInstruction) tmpInst).IcmpOp2,curLoop.RootLoop,1);
                curLoop.cons.add(tmpCons);
                return true;
            } else if (((icmpInstruction) tmpInst).IcmpOperandType == icmpInstruction.IcmpOperandENUM.sge){
                //lhs >= rhs --> -lhs + rhs <= 0
                tmpCons = new Constraint();
                GetCons(((icmpInstruction) tmpInst).IcmpOp1,curLoop.RootLoop,-1);
                GetCons(((icmpInstruction) tmpInst).IcmpOp2,curLoop.RootLoop,1);
                curLoop.cons.add(tmpCons);
                return true;
            }
            //TODO-8
        } else {
            return false;
        }
        return true;
    }

    public boolean getCondVarInLoop(Loop curLoop){
        tmpLoopBlock.clear();
        tmpLoopBlock.addAll(curLoop.condNestedBlock);
        Visited.clear();
        //TODO-5

        tmpCondVar.clear();

        for(IRBasicBlock tmpBlock : curLoop.condNestedBlock) {
            if(tmpBlock.TailInst instanceof brInstruction &&
            ((brInstruction) tmpBlock.TailInst).brCond != null) {
                if(!getCondVarInInst(((brInstruction) tmpBlock.TailInst).brCond, curLoop))
                    return false;
            }
            else{
//                System.out.println(tmpBlock.TailInst);
  //              return false;
            }
        }
        for(Loop tmpLoop : curLoop.ChildLoop){
            if(!getCondVarInLoop(tmpLoop))
                return false;
        }
        return true;
    }

    public boolean GetLoopDomain(Loop curLoop){
        NestedSpread(curLoop);
        if(!AnalyzeInitBlock(curLoop)) return false;
        if(!getCondVarInLoop(curLoop)) return false;
        return true;
    }

    public void TransferToMatrix(Loop curLoop){
        //(1) get consVar
        for(Constraint tmpCons : curLoop.cons){
            for(IROperand tmpOperand : tmpCons.ConsVar){
                if(!curLoop.consVar.contains(tmpOperand)){
                    curLoop.consVar.add(tmpOperand);
                }
            }
        }
        curLoop.consVar.add(new IntegerConstant(IntegerType.IRBitWidth.i8,1));
        curLoop.num_var = curLoop.consVar.size();

        //(2) get consMatrix
        curLoop.num_cons = curLoop.cons.size();
        ArrayList<Integer> tmpConsRow;
        for(int i = 0;i < curLoop.num_cons;++i){
            tmpCons = curLoop.cons.get(i);
            tmpConsRow = new ArrayList<>();
            for(int j = 0;j < curLoop.num_var;++j)
                tmpConsRow.add(0);
            for(int j = 0;j < tmpCons.ConsVar.size();++j){
                int pos;
                for(pos = 0; pos < curLoop.num_var;++pos){
                    if(curLoop.consVar.get(pos) == tmpCons.ConsVar.get(j))
                        break;
                }
                int repVal = tmpConsRow.get(pos) + tmpCons.ConsCoeff.get(j);
                tmpConsRow.set(pos,repVal);
            }
            tmpConsRow.set(curLoop.num_var-1,tmpCons.constant);
            curLoop.consMatrix.add(tmpConsRow);
        }
        for(Loop tmpLoop : curLoop.ChildLoop)
            TransferToMatrix(tmpLoop);
    }

    public void PrintMatrix(Loop curLoop){
        StringBuilder tmpString = new StringBuilder();
        for (int i = 0; i < curLoop.Depth; ++i) tmpString.append(" ");
        System.out.println(tmpString.toString() + curLoop.Depth + " : ");
        for(Constraint tmpCons : curLoop.cons){
            System.out.print(tmpString.toString()+tmpString.toString());
            for(int i = 0;i < tmpCons.ConsCoeff.size();++i){
                System.out.print(tmpCons.ConsCoeff.get(i)+"*"+tmpCons.ConsVar.get(i) + "+");
            }
            System.out.println(tmpCons.constant+"<=0");
        }

        for(int i = 0;i < curLoop.num_cons;++i){
            for(int j = 0;j < curLoop.num_var;++j){
                System.out.print(curLoop.consMatrix.get(i).get(j)+"\t");
            }
            System.out.print("\t\t");
            if(i < curLoop.num_var)System.out.println(curLoop.consVar.get(i));
        }

        for(int i = curLoop.num_cons;i < curLoop.num_var;++i){
            for(int j = 0;j < curLoop.num_var;++j){
                System.out.print("\t");
            }
            System.out.print("\t\t");
            System.out.println(curLoop.consVar.get(i));
        }

        for (Loop tmpLoop : curLoop.ChildLoop)
            PrintMatrix(tmpLoop);
    }

    public void GetPolyderalModel() {
        for (IRBasicBlock initBlock = curFunc.thisEntranceBlock;
             initBlock != null; initBlock = initBlock.nextBasicBlocks) {
            if (initBlock.TailInst instanceof brInstruction &&
                    ((brInstruction) initBlock.TailInst).brCond == null &&
//                    initBlock.PolyBBType == IRBasicBlock.PolyBBENUMType.init_stmt &&
                    !VisitedInitBlock.contains(initBlock)) {
                VisitedInitBlock.add(initBlock);

                IRBasicBlock LoopHead = ((brInstruction) initBlock.TailInst).brIfTrue;
                if (!allLoops.containsKey(LoopHead) || allLoops.get(LoopHead).isEmpty()) continue;
                tmpLoopBlock = allLoops.get(LoopHead);

                //TODO-1 does not support call inst
//System.out.println("1");
                if (/*LoopHasCall() || */(!canLoop(initBlock))) continue;
  //              System.out.println("2");
                if (!IsPolyhedralModel(initBlock)) continue;
    //            System.out.println("3");

                //TODO-2 linear condition check
                //TODO-4 cannot support no init_stmt

                Loop curLoop = new Loop(1, null);
                curLoop.RootLoop = curLoop;
                curLoop.LoopBlock.addAll(tmpLoopBlock);
                curLoop.initBlock = initBlock;
                curLoop.InitVar.addAll(tmpInitVar);
                curLoop.condBlock.addAll(tmpcondBlock);
                curLoop.stepBlock = tmpstepBlock;
                Visited.clear();
                GetNestedLoop(curLoop);
                if(!GetLoopDomain(curLoop))
                    continue;
                TransferToMatrix(curLoop);
                PrintMatrix(curLoop);
            }
        }
    }
}