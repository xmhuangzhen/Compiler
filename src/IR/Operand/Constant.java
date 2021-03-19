package IR.Operand;

import IR.TypeSystem.IRTypeSystem;

abstract public class Constant extends IROperand{

    public Constant(IRTypeSystem tmpType){
        super(tmpType);
    }

    @Override
    public boolean isConstant() {
        return true;
    }


}
