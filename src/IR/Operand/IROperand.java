package IR.Operand;

import Backend.IRObject;
import IR.Instruction.IRInstruction;
import IR.TypeSystem.IRTypeSystem;

abstract public class IROperand extends IRObject {
    public IRTypeSystem thisType;
    public boolean NeedPtr;

    //for SSA use
    public IRInstruction Defs;

    public IROperand(IRTypeSystem tmpType){
        super();
        thisType = tmpType;
        NeedPtr = false;
        Defs = null;
    }

    abstract public boolean isConstant();
}
