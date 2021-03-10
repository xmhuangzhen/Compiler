package IR.Instruction;

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
    }

    @Override
    public String toString() {
        //<result> = shl <ty> <op1>, <op2>           ; yields ty:result
        return  bitwiseBinaryResult.RegisterName + " = " + bitwiseBinaryOperandType.name()
                + " " + bitwiseBinaryResult.thisType.toString() + " "
                + bitwiseBinaryOp1.toString() + ", "
                + bitwiseBinaryOp2.toString();
    }
}
