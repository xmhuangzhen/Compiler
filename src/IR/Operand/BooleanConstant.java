package IR.Operand;

import IR.Instruction.IRInstruction;
import IR.TypeSystem.IntegerType;

public class BooleanConstant extends Constant{
    public boolean value;

    public BooleanConstant(boolean tmpvalue){
        super(new IntegerType(IntegerType.IRBitWidth.i1));
        value = tmpvalue;
    }

    @Override
    public String toString(){
        return String.valueOf(value);
    }

    @Override
    public boolean equals(Object rhs){
        if(rhs instanceof BooleanConstant)
            return value == ((BooleanConstant) rhs).value;
        return false;
    }
}
