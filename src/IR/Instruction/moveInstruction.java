package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;

public class moveInstruction extends IRInstruction{
    public IROperand rd,rs;

    public moveInstruction(IRBasicBlock tmpBasicBlock, IROperand tmprd,
                           IROperand tmprs) {
        super(tmpBasicBlock);
        rd = tmprd;
        rs = tmprs;
        if (rs != null && rs instanceof Register)
            rs.AddRegisterUseInInstruction(this);
        rd.Defs = this;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(originObject == rs){
            rs.DeleteRegisterUseInInstruction(this);
            rs = newObject;
            rs.AddRegisterUseInInstruction(this);
        }
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
