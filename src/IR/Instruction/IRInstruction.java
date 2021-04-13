package IR.Instruction;

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

    public void replaceInst(IRInstruction tmpInst){
        tmpInst.nextIRInstruction = nextIRInstruction;
        tmpInst.preIRInstruction = preIRInstruction;

        if(preIRInstruction == null)
            thisBasicBlock.HeadInst = tmpInst;
        else
            preIRInstruction.nextIRInstruction = tmpInst;

        if(nextIRInstruction == null)
            thisBasicBlock.TailInst = tmpInst;
        else
            nextIRInstruction.preIRInstruction = tmpInst;
    }

    public void removeInst(){
        if(preIRInstruction == null && nextIRInstruction == null) return;
        if(preIRInstruction == null)
            thisBasicBlock.HeadInst = nextIRInstruction;
        else
            preIRInstruction.nextIRInstruction = nextIRInstruction;
        if(nextIRInstruction == null)
            thisBasicBlock.TailInst = preIRInstruction;
        else
            nextIRInstruction.preIRInstruction = preIRInstruction;
    }

    //for SSA use
    abstract public void replaceUse(IROperand originObject, IROperand newObject);

    abstract public void accept(IRVisitor it);
}
