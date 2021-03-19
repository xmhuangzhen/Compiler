package RISCV.Operand;

public class RISCVPhyReg extends RISCVRegister{

    public RISCVPhyReg(String tmpName) {
        super(tmpName);
    }

    @Override
    public String toString() {
        return RegisterName;
    }
}
