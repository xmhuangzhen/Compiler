package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVlaInst extends RISCVInstruction{

    public RISCVRegister rd;
    public RISCVRegister addr;


    public RISCVlaInst(RISCVRegister tmprd, RISCVRegister tmpaddr){
        super();
        rd = tmprd;
        addr = tmpaddr;
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) UsedVirtualReg.add(rd);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
    }


    @Override
    public String toString() {
        return "la "+rd.toString()+","+addr.toString();
    }
}
