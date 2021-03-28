package RISCV.Operand;

import RISCV.RISCVFunction;

public class RISCVStackReg extends RISCVRegister{

    public int Index;
    public RISCVFunction thisFunc;
    public RISCVRegister baseReg;
    public RISCVImm Offset;

    public RISCVStackReg(RISCVFunction tmpFunc,RISCVRegister tmpbaseReg,int modified) {
        super("stack_"+ tmpFunc.StackNum);
        thisFunc = tmpFunc;
        Index = tmpFunc.StackNum;
        tmpFunc.StackNum++;
        baseReg = tmpbaseReg;
        Offset = new RISCVImm(-12-4*Index+modified);
    }

    @Override
    public String toString() {
        return Offset.toString()+"("+baseReg.toString()+")";
    }
}
