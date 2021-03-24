package RISCV.Inst;

import RISCV.RISCVBasicBlock;
import RISCV.RISCVModule;

public class RISCVJumpInst extends RISCVInstruction{

    public RISCVBasicBlock JumpToBlock;

    public RISCVJumpInst(RISCVBasicBlock tmpBlock){
        super();
        JumpToBlock = tmpBlock;
    }

    @Override
    public void replaceReg(RISCVModule curModule) {
    }


    @Override
    public String toString() {
        return "j "+JumpToBlock.toString();
    }
}
