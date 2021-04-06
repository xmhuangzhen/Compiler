package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;

public class binaryOpInstruction extends IRInstruction{
    public enum BinaryOperandENUM{
        add,sub,mul,sdiv,srem
    }

    public BinaryOperandENUM BinaryOperandType;
    public IROperand BinaryOp1, BinaryOp2;
    public Register BinaryResult;

    public binaryOpInstruction(IRBasicBlock tmpBasicBlock, BinaryOperandENUM tmpOperandType,
                               IROperand tmpOp1, IROperand tmpOp2, Register tmpResult) {
        super(tmpBasicBlock);
        BinaryOperandType = tmpOperandType;
        BinaryOp1 = tmpOp1;
        BinaryOp2 = tmpOp2;
        BinaryResult = tmpResult;
        BinaryOp1.AddRegisterUseInInstruction(this);
        BinaryOp2.AddRegisterUseInInstruction(this);
        BinaryResult.Defs=this;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(originObject == BinaryOp1){
            BinaryOp1.DeleteRegisterUseInInstruction(this);
            BinaryOp1 = newObject;
            BinaryOp1.AddRegisterUseInInstruction(this);
        }
        if(originObject == BinaryOp2){
            BinaryOp2.DeleteRegisterUseInInstruction(this);
            BinaryOp2 = newObject;
            BinaryOp2.AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public String toString() {
        //<result> = add <ty> <op1>, <op2>          ; yields ty:result
        return  BinaryResult.RegisterName + " = " + BinaryOperandType.name()
                + " " + BinaryResult.thisType.toString() + " "
                + BinaryOp1.toString() + ", "
                + BinaryOp2.toString();
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}
