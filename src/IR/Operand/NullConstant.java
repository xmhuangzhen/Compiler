package IR.Operand;

import IR.TypeSystem.PointerType;
import IR.TypeSystem.VoidType;

public class NullConstant extends Constant{
    public NullConstant(){
        super(new PointerType(new VoidType()));
    }

    @Override
    public String toString() {
        return "null";
    }

    @Override
    public boolean equals(Object obj) {
        return obj instanceof NullConstant;
    }
}
