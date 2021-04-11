package RISCV.Inst;

import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVModule;

import java.util.HashSet;

public class RISCVJumpInst extends RISCVInstruction{

    public RISCVBasicBlock JumpToBlock;

    public RISCVJumpInst(RISCVBasicBlock tmpBlock){
        super();
        JumpToBlock = tmpBlock;
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
    }

    @Override
    public void ComputeGenAndKill(HashSet<RISCVRegister> BlockGen, HashSet<RISCVRegister> BlockKill) {

    }

    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {

    }

    @Override
    public String toString() {
        return "j "+JumpToBlock.toString();
    }
}
