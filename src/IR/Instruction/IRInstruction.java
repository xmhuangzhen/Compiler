package IR.Instruction;

import Backend.IRVisitor;
import IR.*;

abstract public class IRInstruction {
    public IRBasicBlock thisBasicBlock;
    public IRInstruction preIRInstruction;
    public IRInstruction nextIRInstruction;

    public IRInstruction(IRBasicBlock tmpBasicBlock){
        thisBasicBlock = tmpBasicBlock;
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }
}
