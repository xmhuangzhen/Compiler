package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

//for SSA Destructor use

public class parallelCopyInstruction extends IRInstruction{

    public HashSet<moveInstruction> PCMoveInst;

    public parallelCopyInstruction(IRBasicBlock tmpBasicBlock) {
        super(tmpBasicBlock);
        PCMoveInst = new LinkedHashSet<>();
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {

    }
    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        return res;
    }

    @Override
    public void accept(IRVisitor it) {

    }
}
