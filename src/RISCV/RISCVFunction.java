package RISCV;

import IR.IRFunction;

public class RISCVFunction {

    public IRFunction thisIRFunc;
    public String FunctionName;
    public boolean IsBuiltIn;
    public int StackNum;

    public RISCVBasicBlock EntranceBlock = null, LastBlock = null;

    public RISCVFunction(IRFunction tmpFunc){
        thisIRFunc = tmpFunc;
        FunctionName = tmpFunc.thisFunctionName;
        IsBuiltIn = tmpFunc.IsBuiltIn;
        StackNum = 0;
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

    public int RealStackSize(){
        return 4*StackNum + (16-(4*StackNum%16));
    }

    @Override
    public String toString() {
        return FunctionName;
    }
}
