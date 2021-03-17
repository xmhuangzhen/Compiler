package IR.Operand;

import IR.TypeSystem.IRTypeSystem;

public class Register extends IROperand{
    public String RegisterName;

    public Register(IRTypeSystem tmpType, String tmpName) {
        super(tmpType);
        RegisterName = tmpName;
    }

    @Override
    public boolean isConstant() {
        return false;
    }

    @Override
    public String toString() {
        return "%" + RegisterName;
    }
}
