package RISCV.Operand;

import RISCV.RISCVFunction;

public class RISCVStackReg extends RISCVRegister{

    public int Index;
    public RISCVFunction thisFunc;
    public boolean IsCallInst;

    public RISCVStackReg(RISCVFunction tmpFunc, boolean tmpIsCall) {
        super("stack_"+ tmpFunc.StackNum);
        thisFunc = tmpFunc;
        Index = tmpFunc.StackNum;
        tmpFunc.StackNum++;
        IsCallInst = tmpIsCall;
    }

    @Override
    public String toString() {
        if(IsCallInst)
            return Integer.toString(4*Index+thisFunc.RealStackSize())+"(sp)";
        else
            return -12-4*Index+"(s0)";
    }
}
