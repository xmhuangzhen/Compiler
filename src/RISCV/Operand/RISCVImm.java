package RISCV.Operand;

public class RISCVImm extends RISCVOperand{

    public int ImmVal;

    public RISCVImm(int tmpval){
        ImmVal = tmpval;
    }

    @Override
    public String toString() {
        return Integer.toString(ImmVal);
    }
}
