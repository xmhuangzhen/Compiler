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
                ConstructCFG();
                modified |= FuncSimplification();
            }
        return modified;
    }

    public void ConstructCFG(){
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
        while (true) {
            ConstructCFG();
            boolean tmpmodified = deleteUnusedBlock();
            if(!tmpmodified) break;
            else thismodified = true;
        }
        return thismodified;
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
            } else {
                if (curBlock.CFGPredecessor.size() == 1) {
                    IRBasicBlock preBlock = curBlock.CFGPredecessor.get(0);
                    if (preBlock.CFGSuccessor.size() == 1) {
                        if (preBlock.CFGSuccessor.get(0) != curBlock) {
                            throw new RuntimeException();
                        }
                       // if(preBlock.HeadInst )
                        if(curBlock != curFunc.thisReturnBlock) {
      //                      System.out.println(preBlock.TailInst);
  /*                          preBlock.TailInst.removeInst();
                            preBlock.TailInst.nextIRInstruction = curBlock.HeadInst;
                            curBlock.HeadInst.preIRInstruction = preBlock.TailInst;
                            preBlock.nextBasicBlocks = curBlock.nextBasicBlocks;
                            curBlock.nextBasicBlocks.prevBasicBlocks = preBlock;
                            for(IRBasicBlock tmpBlcok = curBlock.nextBasicBlocks;
                            tmpBlcok != null; tmpBlcok = tmpBlcok.nextBasicBlocks)
                                tmpBlcok.replacePhiInstBlock(curBlock, preBlock);
                            for(IRInstruction tmpInst = curBlock.HeadInst;
                            tmpInst != null; tmpInst = tmpInst.nextIRInstruction)
                                tmpInst.thisBasicBlock = preBlock;
                            thismodified = true;
*/                        }
                    }
                }
            }
        }
        return thismodified;
    }
}