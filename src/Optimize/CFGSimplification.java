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

/*        System.out.println("------------------------");
        System.out.println(curFunc.thisFunctionName);
        for(IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;tmpBlock != null;
        tmpBlock = tmpBlock.nextBasicBlocks){
            System.out.print(tmpBlock.BasicBlockName+":");
            for(var t : tmpBlock.CFGSuccessor)
                System.out.print(t.BasicBlockName+",");
            System.out.print("|||");
            for(var t : tmpBlock.CFGPredecessor)
                System.out.print(t.BasicBlockName+",");
            System.out.println("");
        }
        */
    }

    public boolean FuncSimplification() {
        boolean thismodified = false;
        int cnt = 10;
        while (true) {
            cnt--;
            if(cnt == 0) break;
//            System.out.println("a");
            ConstructCFG();
  //          System.out.println("b");
            boolean tmpmodified = deleteUnusedPhiInst();
    //        System.out.println("c");
            tmpmodified |= deleteUnusedBlock();
      //      System.out.println("d");
            if (!tmpmodified) break;
            else thismodified = true;
        }
/*        ConstructCFG();
        System.out.println("---------");
        for(var t = curFunc.thisEntranceBlock;t != null; t = t.nextBasicBlocks){
            System.out.print(t+":");
            for(var tmp : t.CFGSuccessor)
                System.out.print(tmp+",");
            System.out.println("");
        }
  */      return thismodified;
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