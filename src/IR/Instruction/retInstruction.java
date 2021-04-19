package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;
import IR.TypeSystem.IRTypeSystem;
import IR.TypeSystem.VoidType;

import java.util.HashSet;
import java.util.LinkedHashSet;

public class retInstruction extends IRInstruction {

    public IRTypeSystem returnType;
    public IROperand returnValue;

    public retInstruction(IRBasicBlock tmpBasicBlock, IRTypeSystem tmpType, IROperand tmpValue) {
        super(tmpBasicBlock);
        returnType = tmpType;
        returnValue = tmpValue;
        if (returnValue != null && returnValue instanceof Register)
            returnValue.AddRegisterUseInInstruction(this);

        HasSideEffect = true;
    }

    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        if(returnValue != null && returnValue instanceof Register)
            res.add(returnValue);
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        return res;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(returnValue == originObject){
            returnValue.DeleteRegisterUseInInstruction(this);
            returnValue = newObject;
            returnValue.NeedPtr = originObject.NeedPtr;
            returnValue.AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public void refreshRegisterUse() {
        if (returnValue != null && returnValue instanceof Register)
            returnValue.AddRegisterUseInInstruction(this);

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