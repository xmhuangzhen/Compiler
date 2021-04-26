package IR.Instruction;

import Backend.IRVisitor;
import IR.*;
import IR.Operand.IROperand;

import java.util.HashMap;
import java.util.HashSet;

public abstract class IRInstruction {
    public IRBasicBlock thisBasicBlock;
    public IRInstruction preIRInstruction;
    public IRInstruction nextIRInstruction;

    public boolean HasSideEffect;// IO;return;call;store to memory

    public IRInstruction(IRBasicBlock tmpBasicBlock){
        thisBasicBlock = tmpBasicBlock;
        HasSideEffect = false;

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
        for(var tmp : getuse()){
            tmp.DeleteRegisterUseInInstruction(this);
        }
        for(var tmp : getdef()){
            tmp.Defs.remove(this);
            tmp.DeleteRegisterUseInInstruction(this);
        }

        if(preIRInstruction == null && nextIRInstruction == null){
            thisBasicBlock.HeadInst = null;
            thisBasicBlock.TailInst = null;
        }
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

    abstract public HashSet<IROperand> getuse();

    abstract public HashSet<IROperand> getdef();

    //for Register Use Refresher use
    abstract public void refreshRegisterUse();

    abstract public void accept(IRVisitor it);
}
