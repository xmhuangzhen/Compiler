package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;

import java.util.ArrayList;

public class RISCVlaInst extends RISCVInstruction{
    //load addr

    public RISCVRegister rd;
    public RISCVGlobalReg addr;


    public RISCVlaInst(RISCVRegister tmprd, RISCVGlobalReg tmpaddr){
        super();
        rd = tmprd;
        addr = tmpaddr;
        if(rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
    }

    @Override
    public String toString() {
        return "la "+rd.toString()+","+addr.toString();
    }
}
