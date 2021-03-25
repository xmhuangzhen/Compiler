package RISCV.Operand;

import RISCV.RISCVFunction;

public class RISCVDirectStackReg extends RISCVRegister{

    public int offset;

    public RISCVDirectStackReg(String tmpName, int tmpOffset) {
        super(tmpOffset+"("+tmpName+")");
        offset = tmpOffset;
    }

    @Override
    public String toString() {
        return RegisterName;
    }
}

