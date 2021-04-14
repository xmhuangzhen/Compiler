package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;
import IR.TypeSystem.IRTypeSystem;

import java.util.HashSet;
import java.util.LinkedHashSet;

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
        if (IcmpOp1 instanceof Register)
            IcmpOp1.AddRegisterUseInInstruction(this);
        if (IcmpOp2 instanceof Register)
            IcmpOp2.AddRegisterUseInInstruction(this);
        IcmpResult.Defs = this;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if (originObject == IcmpOp1) {
            IcmpOp1.DeleteRegisterUseInInstruction(this);
            IcmpOp1 = newObject;
            IcmpOp1.NeedPtr = originObject.NeedPtr;
            IcmpOp1.AddRegisterUseInInstruction(this);
        }
        if (originObject == IcmpOp2) {
            IcmpOp2.DeleteRegisterUseInInstruction(this);
            IcmpOp2 = newObject;
            IcmpOp2.NeedPtr = originObject.NeedPtr;
            IcmpOp2.AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        if(IcmpOp1 instanceof Register) res.add(IcmpOp1);
        if(IcmpOp2 instanceof Register) res.add(IcmpOp2);
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        res.add(IcmpResult);
        return res;
    }


    @Override
    public String toString() {
        //<result> = icmp <cond> <ty> <op1>, <op2>   ; yields i1 or <N x i1>:result
        return IcmpResult.toString() + " = icmp " + IcmpOperandType.name() + " " + IcmpType.toString()
                + " " + IcmpOp1.toString() + ", " + IcmpOp2.toString();
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}
