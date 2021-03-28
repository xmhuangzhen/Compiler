package RISCV.Operand;

public class RISCVAddrImm extends RISCVImm{

    public RISCVRegister baseReg;

    public RISCVAddrImm(RISCVRegister tmpbaseReg,int tmpoffset) {
        super(tmpoffset);
        baseReg = tmpbaseReg;
    }

    @Override
    public String toString() {
        return ImmVal+"("+baseReg.toString()+")";
    }
}
