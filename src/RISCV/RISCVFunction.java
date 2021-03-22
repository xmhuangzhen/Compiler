package RISCV;

import IR.IRFunction;

public class RISCVFunction {

    public IRFunction thisIRFunc;
    public String FunctionName;
    public boolean IsBuiltIn;

    public RISCVBasicBlock EntranceBlock = null, LastBlock = null;

    public RISCVFunction(IRFunction tmpFunc){
        thisIRFunc = tmpFunc;
        FunctionName = tmpFunc.thisFunctionName;
        IsBuiltIn = tmpFunc.IsBuiltIn;
    }

    public void addBlock(RISCVBasicBlock tmpBlock){
        if(EntranceBlock == null) {
            EntranceBlock = tmpBlock;
            LastBlock = tmpBlock;
        } else {
            LastBlock.nextBlock = tmpBlock;
            LastBlock = tmpBlock;
        }
    }

    @Override
    public String toString() {
        return FunctionName;
    }
}
