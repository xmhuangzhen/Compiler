package RISCV.Operand;

public class RISCVGlobalReg extends RISCVRegister{

    public RISCVGlobalReg(String tmpName) {
        super(tmpName);
    }

    @Override
    public String toString() {
        return RegisterName;
    }
}
