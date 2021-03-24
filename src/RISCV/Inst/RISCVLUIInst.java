package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVLUIInst extends RISCVInstruction {

    public RISCVRegister rd;
    public RISCVImm globalReg;

    public RISCVLUIInst(RISCVRegister tmprd, RISCVImm tmpGlobalReg) {
        super();
        rd = tmprd;
        globalReg = tmpGlobalReg;
        if(rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
    }

    @Override
    public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
    }


    @Override
    public String toString() {
        return "lui " + rd.toString() + "," + globalReg.toString();
    }
}