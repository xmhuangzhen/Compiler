package RISCV.Operand;

public class RISCVRegister extends RISCVOperand{

    public String RegisterName;
    public boolean NeedLoad;

    public RISCVRegister(String tmpName){
        RegisterName = tmpName;
        NeedLoad = true;
    }
}
