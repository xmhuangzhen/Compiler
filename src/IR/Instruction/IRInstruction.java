package IR.Instruction;

import IR.*;

abstract public class IRInstruction {
    public IRBasicBlock thisBasicBlock;
    public IRInstruction preIRInstruction;
    public IRInstruction nextIRInstruction;

    public IRInstruction(IRBasicBlock tmpBasicBlock){
        thisBasicBlock = tmpBasicBlock;
    }

}
