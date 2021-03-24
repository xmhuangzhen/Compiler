package RISCV.Inst;

import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

public class RISCVretInst extends RISCVInstruction{

    public RISCVretInst(){
        super();
    }

    @Override
    public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2) {
    }

    @Override
    public String toString() {
        return "ret";
    }
}
