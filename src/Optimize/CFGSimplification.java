package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.brInstruction;
import IR.Instruction.moveInstruction;
import IR.Instruction.phiInstruction;
import IR.Operand.BooleanConstant;

public class CFGSimplification extends Pass {

    public boolean modified;
    public IRFunction curFunc;

    public CFGSimplification(IRModule tmpModule) {
        super(tmpModule);
    }

    @Override
    public boolean run() {
        modified = false;
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                curFunc = tmpFunc;
                modified |= FuncSimplification();
            }
        return modified;
    }

    public void ConstructCFG() {
        for (IRBasicBlock tmpIRBasicBlock = curFunc.thisEntranceBlock;
             tmpIRBasicBlock != null;
             tmpIRBasicBlock = tmpIRBasicBlock.nextBasicBlocks) {
            tmpIRBasicBlock.CFGSuccessor.clear();
            tmpIRBasicBlock.CFGPredecessor.clear();
        }
        for (IRBasicBlock tmpIRBasicBlock = curFunc.thisEntranceBlock;
             tmpIRBasicBlock != null;
             tmpIRBasicBlock = tmpIRBasicBlock.nextBasicBlocks) {
            for (IRInstruction tmpInst = tmpIRBasicBlock.HeadInst;
                 tmpInst != null;
                 tmpInst = tmpInst.nextIRInstruction) {
                if (tmpInst instanceof brInstruction) {
                    if (((brInstruction) tmpInst).brIfTrue != null) {
                        tmpIRBasicBlock.CFGSuccessor.add(((brInstruction) tmpInst).brIfTrue);
                        ((brInstruction) tmpInst).brIfTrue.CFGPredecessor.add(tmpIRBasicBlock);
                    }
                    if (((brInstruction) tmpInst).brIfFalse != null) {
                        tmpIRBasicBlock.CFGSuccessor.add(((brInstruction) tmpInst).brIfFalse);
                        ((brInstruction) tmpInst).brIfFalse.CFGPredecessor.add(tmpIRBasicBlock);
                    }
                }
            }
        }
        curFunc.CFGSimpGetDFS();
    }

    public boolean FuncSimplification() {
        boolean thismodified = false;
        resumeBranch();
        int cnt = 100;
        while (true) {
            cnt--;
            if(cnt == 0) break;
            ConstructCFG();
            boolean tmpmodified = deleteUnusedPhiInst();
            tmpmodified |= deleteUnusedBlock();
            if (!tmpmodified) break;
            else thismodified = true;
        }
        return thismodified;
    }

    public void resumeBranch(){
        for (IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;
             tmpBlock.nextBasicBlocks != null; tmpBlock = tmpBlock.nextBasicBlocks) {
            if (!(tmpBlock.TailInst instanceof brInstruction)) {
                tmpBlock.addBasicBlockInst(new brInstruction(tmpBlock,
                        null, tmpBlock.nextBasicBlocks, null));
            }
        }
    }


    public boolean deleteUnusedBlock() {
        boolean thismodified = false;
        for (IRBasicBlock curBlock = curFunc.thisEntranceBlock;
             curBlock != null; curBlock = curBlock.nextBasicBlocks) {
            if (curBlock.DFN == 0) {
                for (IRBasicBlock SucBlock : curBlock.CFGSuccessor)
                    SucBlock.removePhiInstBlock(curBlock);
                curFunc.removeBasicBlock(curBlock);
                thismodified = true;
                return true;
            } else {
                if (curBlock.CFGPredecessor.size() == 1 && curBlock != curFunc.thisReturnBlock &&
                !(curBlock.HeadInst instanceof phiInstruction)) {
                    IRBasicBlock preBlock = curBlock.CFGPredecessor.get(0);
                    if (preBlock.CFGSuccessor.size() == 1 && preBlock != curFunc.thisEntranceBlock) {
                        if (preBlock.CFGSuccessor.get(0) != curBlock)
                            throw new RuntimeException();

                        if(curBlock.HeadInst == curBlock.TailInst && curBlock.CFGSuccessor.size() == 1
                        && curBlock.CFGSuccessor.get(0) == curBlock.nextBasicBlocks
                        && preBlock.TailInst instanceof brInstruction){

                            IRBasicBlock sucBlock = curBlock.CFGSuccessor.get(0);
                            ((brInstruction) preBlock.TailInst).replaceBlock(curBlock,sucBlock);
                            preBlock.CFGSuccessor.remove(curBlock);
                            preBlock.CFGSuccessor.add(sucBlock);
                            sucBlock.CFGPredecessor.remove(curBlock);
                            sucBlock.CFGPredecessor.add(preBlock);
                            curFunc.removeBasicBlock(curBlock);
                            return true;
                        }

                        /*
                        preBlock.TailInst.removeInst();

                        if(preBlock.TailInst != null) {
                            preBlock.TailInst.nextIRInstruction = curBlock.HeadInst;
                            curBlock.HeadInst.preIRInstruction = preBlock.TailInst;
                        }
                        else{
                            preBlock.TailInst = curBlock.HeadInst;
                            preBlock.HeadInst = curBlock.HeadInst;
                        }
                        for (IRInstruction tmpInst = curBlock.HeadInst;
                             tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                            tmpInst.thisBasicBlock = preBlock;
                        }

                        preBlock.TailInst = curBlock.TailInst;
                        preBlock.nextBasicBlocks = curBlock.nextBasicBlocks;
                        if(curBlock.nextBasicBlocks != null)
                            curBlock.nextBasicBlocks.prevBasicBlocks = preBlock;
                        for (IRBasicBlock tmpBlcok = curFunc.thisEntranceBlock;
                             tmpBlcok != null; tmpBlcok = tmpBlcok.nextBasicBlocks)
                            tmpBlcok.replacePhiInstBlock(curBlock, preBlock);
                        return true;
  */                  }
                }
            }
        }
        return thismodified;
    }

    public boolean deleteUnusedPhiInst(){
        boolean thismodified = false;
        for(IRBasicBlock curBlock = curFunc.thisEntranceBlock;
            curBlock != null; curBlock = curBlock.nextBasicBlocks) {
            for (IRInstruction tmpInst = curBlock.HeadInst; tmpInst != null;
                 tmpInst = tmpInst.nextIRInstruction) {
                if (tmpInst instanceof phiInstruction) {
                    if (((phiInstruction) tmpInst).PhiValue.size() == 1) {
                        IRInstruction replaceInst = new moveInstruction(curBlock,
                                ((phiInstruction) tmpInst).PhiResult,
                                ((phiInstruction) tmpInst).PhiValue.get(0));
                        ((phiInstruction) tmpInst).PhiResult.ReplaceRegisterUse(
                                ((phiInstruction) tmpInst).PhiValue.get(0));
                        tmpInst.replaceInst(replaceInst);
                        tmpInst = replaceInst;
                        thismodified = true;
                    }
                } else break;
            }
        }
        return thismodified;
    }
}