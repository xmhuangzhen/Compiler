package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVliInst extends RISCVInstruction{

    public RISCVRegister rd;
    public RISCVImm imm;


    public RISCVliInst(RISCVRegister tmprd, RISCVImm tmpimm){
        super();
        rd = tmprd;
        imm = tmpimm;
        if (rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
    }

    @Override
    public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
    }


    @Override
    public String toString() {
        return "li "+rd.toString()+","+imm.toString();
    }
}
