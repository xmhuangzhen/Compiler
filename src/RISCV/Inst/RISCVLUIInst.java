package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVLUIInst extends RISCVInstruction {

    public RISCVRegister rd;
    public RISCVRelocationImm globalRelocationImm;

    public RISCVLUIInst(RISCVRegister tmprd, RISCVRelocationImm tmpRelocationImm) {
        super();
        rd = tmprd;
        globalRelocationImm = tmpRelocationImm;
        if (rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
    }

    @Override
    public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
    }


    @Override
    public String toString() {
        return "lui "+ rd.toString()+","+globalRelocationImm.toString();
    }
}