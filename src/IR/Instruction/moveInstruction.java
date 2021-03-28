package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;

public class moveInstruction extends IRInstruction{
    public IROperand rd,rs;

    public moveInstruction(IRBasicBlock tmpBasicBlock, IROperand tmprd,
                           IROperand tmprs) {
        super(tmpBasicBlock);
        rd = tmprd;
        rs = tmprs;
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
