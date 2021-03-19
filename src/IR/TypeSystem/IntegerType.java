package IR.TypeSystem;

import IR.Operand.BooleanConstant;
import IR.Operand.IROperand;
import IR.Operand.IntegerConstant;

public class IntegerType extends IRTypeSystem{
    public enum IRBitWidth{
        i1,i8,i32
    }

    public IRBitWidth BitWidth;

    public IntegerType(IRBitWidth tmpBitWidth){
        BitWidth = tmpBitWidth;
    }

    @Override
    public long getTypeSize() {
        if(BitWidth == IRBitWidth.i32) return 4;
        else return 1;
    }

    @Override
    public IROperand getValue() {
        if(BitWidth == IRBitWidth.i1) return new BooleanConstant(false);
        else return new IntegerConstant(BitWidth,0);
    }

    @Override
    public String toString(){
        if(BitWidth == IRBitWidth.i1) return "i1";
        if(BitWidth == IRBitWidth.i8) return "i8";
        return "i32";
    }
}
