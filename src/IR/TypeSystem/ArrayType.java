package IR.TypeSystem;

import IR.Operand.IROperand;

public class ArrayType extends IRTypeSystem{

    public IRTypeSystem baseType;
    public int ArraySize;

    public ArrayType(IRTypeSystem tmpbaseType, int tmpArraySize){
        baseType = tmpbaseType;
        ArraySize = tmpArraySize;
    }

    @Override
    public int getTypeSize() {
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
