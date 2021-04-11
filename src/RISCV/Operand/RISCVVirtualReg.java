package RISCV.Operand;

public class RISCVVirtualReg extends RISCVRegister{

    public int index;

    public RISCVVirtualReg(int tmpIndex) {
        super("%"+tmpIndex);
        index = tmpIndex;
    }

    @Override
    public String toString() {
        if(color == null) {
            return RegisterName;
        }
        else {
            return color.RegisterName;
        }
    }
}
