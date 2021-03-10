package IR.TypeSystem;

import IR.Operand.IROperand;

public class VoidType extends IRTypeSystem{
    @Override
    public int getTypeSize(){
        return 0;
    }

    @Override
    public IROperand getValue(){
        return null;
    }

    @Override
    public String toString(){
        return "void";
    }
}
