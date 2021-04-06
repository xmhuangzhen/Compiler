package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.TypeSystem.IRTypeSystem;
import IR.TypeSystem.VoidType;

public class retInstruction extends IRInstruction {

    public IRTypeSystem returnType;
    public IROperand returnValue;

    public retInstruction(IRBasicBlock tmpBasicBlock, IRTypeSystem tmpType, IROperand tmpValue) {
        super(tmpBasicBlock);
        returnType = tmpType;
        returnValue = tmpValue;
        if (returnValue != null)
            returnValue.AddRegisterUseInInstruction(this);
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(returnValue == originObject){
            returnValue.DeleteRegisterUseInInstruction(this);
            returnValue = newObject;
            returnValue.AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public String toString() {
        if (returnType instanceof VoidType)
            return "ret void";
        return "ret " + returnType.toString() + " " + returnValue.toString();
//                "ret " +"("+ returnType.toString()+")" + " " +"("+ returnValue.toString()+")";
    }

    @Override
    public void accept(IRVisitor it) {
        it.visit(this);
    }

}