package IR.Operand;

import IR.TypeSystem.IRTypeSystem;

abstract public class IROperand{
    public IRTypeSystem thisType;
    public boolean NeedPtr;

    public IROperand(IRTypeSystem tmpType){
        thisType = tmpType;
        NeedPtr = false;
    }

    abstract public boolean isConstant();


}
