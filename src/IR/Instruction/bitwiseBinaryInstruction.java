package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;

public class bitwiseBinaryInstruction extends IRInstruction{
    public enum BitwiseBinaryOperandType{
        shl, ashr, and, or, xor
    }

    public BitwiseBinaryOperandType bitwiseBinaryOperandType;
    public IROperand bitwiseBinaryOp1, bitwiseBinaryOp2;
    public Register bitwiseBinaryResult;

    public bitwiseBinaryInstruction(IRBasicBlock tmpBasicBlock, BitwiseBinaryOperandType tmpOperandType,
                                    IROperand tmpOp1, IROperand tmpOp2, Register tmpResult) {
        super(tmpBasicBlock);
        bitwiseBinaryOperandType = tmpOperandType;
        bitwiseBinaryOp1 = tmpOp1;
        bitwiseBinaryOp2 = tmpOp2;
        bitwiseBinaryResult = tmpResult;
        if (bitwiseBinaryOp1 instanceof Register)
            bitwiseBinaryOp1.AddRegisterUseInInstruction(this);
        if (bitwiseBinaryOp2 instanceof Register)
            bitwiseBinaryOp2.AddRegisterUseInInstruction(this);
        bitwiseBinaryResult.Defs = this;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(originObject == bitwiseBinaryOp1){
            bitwiseBinaryOp1.DeleteRegisterUseInInstruction(this);
            bitwiseBinaryOp1 = newObject;
            bitwiseBinaryOp1.NeedPtr = originObject.NeedPtr;
            bitwiseBinaryOp1.AddRegisterUseInInstruction(this);
        }
        if(originObject == bitwiseBinaryOp2){
            bitwiseBinaryOp2.DeleteRegisterUseInInstruction(this);
            bitwiseBinaryOp2 = newObject;
            bitwiseBinaryOp2.NeedPtr = originObject.NeedPtr;
            bitwiseBinaryOp2.AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public String toString() {
        //<result> = shl <ty> <op1>, <op2>           ; yields ty:result
        return  bitwiseBinaryResult.RegisterName + " = " + bitwiseBinaryOperandType.name()
                + " " + bitwiseBinaryResult.thisType.toString() + " "
                + bitwiseBinaryOp1.toString() + ", "
                + bitwiseBinaryOp2.toString();
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}
