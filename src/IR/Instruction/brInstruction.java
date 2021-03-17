package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;

public class brInstruction extends IRInstruction{
    public IROperand brCond;
    public IRBasicBlock brIfTrue;
    public IRBasicBlock brIfFalse;

    public brInstruction(IRBasicBlock tmpBasicBlock, IROperand tmpbrCond, IRBasicBlock tmpbrIfTrue,
                         IRBasicBlock tmpbrIfFalse) {
        super(tmpBasicBlock);
        brCond = tmpbrCond;
        brIfTrue = tmpbrIfTrue;
        brIfFalse = tmpbrIfFalse;
    }

    @Override
    public String toString() {
        //br i1 <cond>, label <iftrue>, label <iffalse>
        //br label <dest>          ; Unconditional branch
        if(brCond == null) return "br label " + brIfTrue.toString(); // = jump
        else return "br i1 " + brCond.toString() + ", label " + brIfTrue.toString() +
                 ", label " + brIfFalse.toString();
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}