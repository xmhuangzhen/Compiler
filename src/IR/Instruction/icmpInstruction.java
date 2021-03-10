package IR.Instruction;

import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;
import IR.TypeSystem.IRTypeSystem;

public class icmpInstruction extends IRInstruction{
    public enum IcmpOperandENUM{
        eq, ne, sgt, sge, slt, sle
    }

    public Register IcmpResult;
    public IcmpOperandENUM IcmpOperandType;
    public IRTypeSystem IcmpType;
    public IROperand IcmpOp1, IcmpOp2;


    public icmpInstruction(IRBasicBlock tmpBasicBlock, IcmpOperandENUM tmpOperand,
                           IRTypeSystem tmpType, IROperand tmpOp1, IROperand tmpOp2, Register tmpResult) {
        super(tmpBasicBlock);
        IcmpResult = tmpResult;
        IcmpOperandType = tmpOperand;
        IcmpType = tmpType;
        IcmpOp1 = tmpOp1;
        IcmpOp2 = tmpOp2;
    }

    @Override
    public String toString() {
        //<result> = icmp <cond> <ty> <op1>, <op2>   ; yields i1 or <N x i1>:result
        return IcmpResult.toString() + " = icmp " + IcmpOperandType.name() + " " + IcmpType.toString()
                + " " + IcmpOp1.toString() + ", " + IcmpOp2.toString();
    }
}
