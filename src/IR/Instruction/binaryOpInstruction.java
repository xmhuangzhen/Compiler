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
