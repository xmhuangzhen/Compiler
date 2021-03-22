package RISCV.Operand;

public class RISCVGlobalReg extends RISCVRegister{

    public boolean isString, isInt, isBool;
    public String ValString;
    public int ValInt;
    public int ValBool;

    public RISCVGlobalReg(String tmpName) {
        super(tmpName);
        isBool = false; isInt = false; isString = false;
    }

    @Override
    public String toString() {
        return RegisterName;
    }
}
