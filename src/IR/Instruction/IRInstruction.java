package IR.Instruction;

import Backend.IRVisitor;
import IR.*;

public abstract class IRInstruction {
    public IRBasicBlock thisBasicBlock;
    public IRInstruction preIRInstruction;
    public IRInstruction nextIRInstruction;

    public IRInstruction(IRBasicBlock tmpBasicBlock){
        thisBasicBlock = tmpBasicBlock;
    }

    abstract public void accept(IRVisitor it);
}
