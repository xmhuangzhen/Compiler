package RISCV.Inst;

import RISCV.RISCVBasicBlock;

public class RISCVJumpInst extends RISCVInstruction{

    public RISCVBasicBlock JumpToBlock;

    public RISCVJumpInst(RISCVBasicBlock tmpBlock){
        super();
        JumpToBlock = tmpBlock;
    }

    @Override
    public String toString() {
        return "j "+JumpToBlock.toString();
    }
}
