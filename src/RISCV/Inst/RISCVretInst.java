package RISCV.Inst;

import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.HashSet;

public class RISCVretInst extends RISCVInstruction{

    public RISCVretInst(){
        super();
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
        return "ret";
    }
}
