package IR.Instruction;

import Backend.IRObject;
import Backend.IRVisitor;
import IR.*;
import IR.Operand.IROperand;

public abstract class IRInstruction {
    public IRBasicBlock thisBasicBlock;
    public IRInstruction preIRInstruction;
    public IRInstruction nextIRInstruction;


    public IRInstruction(IRBasicBlock tmpBasicBlock){
        thisBasicBlock = tmpBasicBlock;
    }

    //for SSA use
    abstract public void replaceUse(IROperand originObject, IROperand newObject);

    abstract public void accept(IRVisitor it);
}
