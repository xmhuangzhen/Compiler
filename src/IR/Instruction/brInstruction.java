package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;

import java.util.HashSet;
import java.util.LinkedHashSet;

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
        if (brCond != null && brCond instanceof Register)
            brCond.AddRegisterUseInInstruction(this);
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(brCond == originObject){
            brCond.DeleteRegisterUseInInstruction(this);
            brCond = newObject;
            brCond.NeedPtr = originObject.NeedPtr;
            brCond.AddRegisterUseInInstruction(this);
        }
    }

    public void replaceBlock(IRBasicBlock originBlock, IRBasicBlock newBlock) {
        if (brIfTrue == originBlock) {
            brIfTrue = newBlock;
        }
        if (brIfFalse == originBlock) {
            brIfFalse = newBlock;
        }
    }
    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        if(brCond != null && brCond instanceof Register) res.add(brCond);
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        return res;
    }

    @Override
    public String toString() {
        //br i1 <cond>, label <iftrue>, label <iffalse>
        //br label <dest>          ; Unconditional branch
        if(brCond == null) return "br label " + brIfTrue.toString(); // = jump
        else {
            if(brIfFalse == null) throw new RuntimeException(brCond.toString());
            return "br i1 " + brCond.toString() + ", label " + brIfTrue.toString() +
                    ", label " + brIfFalse.toString();
        }
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}
