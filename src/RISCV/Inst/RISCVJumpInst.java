package RISCV.Inst;

import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVModule;

public class RISCVJumpInst extends RISCVInstruction{

    public RISCVBasicBlock JumpToBlock;

    public RISCVJumpInst(RISCVBasicBlock tmpBlock){
        super();
        JumpToBlock = tmpBlock;
    }

    @Override
    public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2) {
    }

    @Override
    public String toString() {
        return "j "+JumpToBlock.toString();
    }
}
