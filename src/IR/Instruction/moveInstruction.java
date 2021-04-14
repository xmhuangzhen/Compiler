package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;

import java.util.HashSet;
import java.util.LinkedHashSet;

public class moveInstruction extends IRInstruction{
    public IROperand rd,rs;

    public moveInstruction(IRBasicBlock tmpBasicBlock, IROperand tmprd,
                           IROperand tmprs) {
        super(tmpBasicBlock);
        rd = tmprd;
        rs = tmprs;
        /*if(rs != null){
            rd.NeedPtr = rs.NeedPtr;
        }*/
        if (rs != null && rs instanceof Register)
            rs.AddRegisterUseInInstruction(this);
        rd.Defs = this;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(originObject == rs){
            rs.DeleteRegisterUseInInstruction(this);
            rs = newObject;
            rs.NeedPtr = originObject.NeedPtr;
            rs.AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        if(rs instanceof Register) res.add(rs);
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        if(rd instanceof Register) res.add(rd);
        return res;
    }

    @Override
    public String toString() {
        return rd + "=" + rs;
    }

    @Override
    public void accept(IRVisitor it) {
        it.visit(this);
    }
}
