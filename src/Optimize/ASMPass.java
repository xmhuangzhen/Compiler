package Optimize;

import RISCV.Inst.RISCVsInst;
import RISCV.RISCVModule;

abstract public class ASMPass {
    public RISCVModule curRISCVModule;

    public ASMPass(RISCVModule tmpModule){
        curRISCVModule = tmpModule;
    }

    abstract public boolean run();
}
