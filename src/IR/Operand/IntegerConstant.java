package IR.Operand;

import IR.TypeSystem.IntegerType;

public class IntegerConstant extends Constant{
    public long value;

    public IntegerConstant(IntegerType.IRBitWidth tmpBitWidth, long tmpvalue){
        super(new IntegerType(tmpBitWidth));
        value = tmpvalue;
    }

    @Override
    public String toString(){
        return String.valueOf(value);
    }

    @Override
    public boolean equals(Object rhs){
        if(rhs instanceof IntegerConstant)
            return value == ((IntegerConstant) rhs).value;
        return false;
    }
}
