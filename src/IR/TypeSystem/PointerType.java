package IR.TypeSystem;

import IR.Operand.IROperand;
import IR.Operand.NullConstant;

public class PointerType extends IRTypeSystem{

    public IRTypeSystem baseType;

    public PointerType(IRTypeSystem tmpBaseType){
        baseType = tmpBaseType;
    }

    @Override
    public long getTypeSize() {
        return 4;
    }

    @Override
    public IROperand getValue() {
        return new NullConstant();
    }

    @Override
    public String toString() {
        return baseType.toString()+"*";
    }
}
