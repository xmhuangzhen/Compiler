package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;

public class loadInstruction extends IRInstruction{
    public Register LoadResult;
    public IROperand LoadPointer;

    public loadInstruction(IRBasicBlock tmpBasicBlock, Register tmpResult, IROperand tmpPointer) {
        super(tmpBasicBlock);
        LoadResult = tmpResult;
        LoadPointer = tmpPointer;
        if (LoadPointer instanceof Register)
            LoadPointer.AddRegisterUseInInstruction(this);
        LoadResult.Defs = this;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(LoadPointer == originObject){
            LoadPointer.DeleteRegisterUseInInstruction(this);
            LoadPointer = newObject;
            LoadPointer.AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public String toString() {
        return LoadResult.toString() + " = load " + LoadResult.thisType.toString()
                +", " + LoadPointer.thisType.toString() + " "+ LoadPointer.toString();
    }
    public void accept(IRVisitor it){
        it.visit(this);
    }

}
