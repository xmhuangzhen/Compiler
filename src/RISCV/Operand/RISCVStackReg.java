package RISCV.Operand;

public class RISCVStackReg extends RISCVRegister{

    public int Index;

    public RISCVStackReg(int tmpIndex) {
        super("stack_"+tmpIndex);
        Index = tmpIndex;
    }

    @Override
    public String toString() {
        return RegisterName;
    }
}
