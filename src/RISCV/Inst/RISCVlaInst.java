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
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) UsedVirtualReg.add(rd);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
    }


    @Override
    public String toString() {
        if(addr instanceof RISCVGlobalReg)
            return "la "+rd.toString()+","+addr.toString();
        return "lw "+rd.toString()+","+addr.toString();
    }
}
