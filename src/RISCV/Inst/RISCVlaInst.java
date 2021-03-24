package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVlaInst extends RISCVInstruction{
    //load addr

    public RISCVRegister rd;
    public RISCVRegister addr;


    public RISCVlaInst(RISCVRegister tmprd, RISCVRegister tmpaddr){
        super();
        rd = tmprd;
        addr = tmpaddr;
        if(rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
    }

    @Override
    public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
    }


    @Override
    public String toString() {
        return "lw "+rd.toString()+","+addr.toString();
    }
}
