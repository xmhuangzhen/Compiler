package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;

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

    public boolean FuncSimplification() {
        boolean thismodified = false;
        while (true) {
            boolean tmpmodified = deleteUnusedBlock();
            tmpmodified |= deleteUnusedBranch();
            tmpmodified |= deleteUnusedPhiInst();
            if (!tmpmodified) break;
            else thismodified = true;
        }
        return thismodified;
    }

    public boolean deleteUnusedBlock() {
        for (IRBasicBlock curBlock = curFunc.thisEntranceBlock;
             curBlock != null; curBlock = curBlock.nextBasicBlocks) {
            if (curBlock.DFN == 0) {
                for (IRBasicBlock SucBlock : curBlock.CFGSuccessor)
                    SucBlock.removePhiInstBlock(curBlock);
                curFunc.removeBasicBlock(curBlock);
            } else {
                if (curBlock.CFGPredecessor.size() == 1) {
                    IRBasicBlock preBlock = curBlock.CFGPredecessor.get(0);
                    if (preBlock.CFGSuccessor.size() == 1) {
                        if (preBlock.CFGSuccessor.get(0) != curBlock) {
                            throw new RuntimeException();
                        }
                        //todo
                    }
                }
            }
        }
        return false;
    }

    public boolean deleteUnusedBranch() {
        //todo
        return false;
    }

    public boolean deleteUnusedPhiInst() {
        //todo
        return false;
    }
}