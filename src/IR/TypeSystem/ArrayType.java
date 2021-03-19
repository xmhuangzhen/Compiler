package IR.TypeSystem;

import IR.Operand.IROperand;

public class ArrayType extends IRTypeSystem{

    public IRTypeSystem baseType;
    public long ArraySize;

    public ArrayType(IRTypeSystem tmpbaseType, long tmpArraySize){
        baseType = tmpbaseType;
        ArraySize = tmpArraySize;
    }

    @Override
    public long getTypeSize() {
        return baseType.getTypeSize()*ArraySize;
    }

    @Override
    public IROperand getValue() {
        return null;
    }

    @Override
    public String toString() {
        return "["+ArraySize+" x "+baseType.toString()+"]";
    }
}
