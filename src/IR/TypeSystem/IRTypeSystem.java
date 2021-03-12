package IR.TypeSystem;

import IR.Operand.IROperand;

abstract public class IRTypeSystem {

    abstract public long getTypeSize();

    abstract public IROperand getValue();

    abstract public String toString();

    @Override
    public boolean equals(Object rhs){
        if(rhs instanceof IRTypeSystem)
            return toString().equals(rhs.toString());
        return false;
    }
}
