package RISCV.Inst;

import RISCV.RISCVModule;

public class RISCVretInst extends RISCVInstruction{

    public RISCVretInst(){
        super();
    }

    @Override
    public void replaceReg(RISCVModule curModule) {
    }

    @Override
    public String toString() {
        return "ret";
    }
}
