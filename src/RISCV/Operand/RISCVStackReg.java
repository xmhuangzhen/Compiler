package RISCV.Operand;

import RISCV.RISCVFunction;

public class RISCVStackReg extends RISCVRegister{

    public int Index;
    public RISCVFunction thisFunc;
    public RISCVRegister baseReg;
    public RISCVImm Offset;

    public RISCVStackReg(RISCVFunction tmpFunc,RISCVRegister tmpbaseReg,int modified) {
        super("stack_"+ tmpFunc.NaiveStackNum);
        thisFunc = tmpFunc;
        Index = tmpFunc.NaiveStackNum;
        tmpFunc.NaiveStackNum++;
        baseReg = tmpbaseReg;
        Offset = new RISCVImm(modified);
    }

    @Override
    public String toString() {
        return Offset.toString()+"("+baseReg.toString()+")";
    }
}
