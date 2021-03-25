package IR.Operand;

import IR.IRFunction;
import IR.TypeSystem.IRTypeSystem;

public class Parameter extends IROperand{
    public String ParameterName;

    public Parameter(IRTypeSystem tmpType, String tmpParameterName) {
        super(tmpType);
        ParameterName = tmpParameterName;
    }

    @Override
    public boolean isConstant() {
        return false;
    }

    @Override
    public String toString() {
        return "%" + ParameterName;
    }
}
