package RISCV.Operand;

public class RISCVRelocationImm extends RISCVImm{

    public enum RelocationENUMType{hi,lo}

    public RISCVGlobalReg relocationGlobalReg;
    public RelocationENUMType RelocationType;

    public RISCVRelocationImm(RISCVGlobalReg tmpGlobalReg, RelocationENUMType tmpType) {
        super(0);
        relocationGlobalReg = tmpGlobalReg;
        RelocationType = tmpType;
    }

    @Override
    public String toString() {
        return "%"+RelocationType.name()+"("+relocationGlobalReg.toString()+")";
    }
}
