package IR.Operand;

import IR.TypeSystem.IRTypeSystem;

abstract public class IROperand{
    public IRTypeSystem thisType;

    public IROperand(IRTypeSystem tmpType){
        thisType = tmpType;
    }

    abstract public boolean isConstant();


}
