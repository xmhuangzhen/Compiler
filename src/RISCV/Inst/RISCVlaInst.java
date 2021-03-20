package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVRegister;

public class RISCVlaInst extends RISCVInstruction{
    //load addr

    public RISCVRegister rd;
    public RISCVGlobalReg addr;

    public RISCVlaInst(RISCVRegister tmprd, RISCVGlobalReg tmpaddr){
        rd = tmprd;
        addr = tmpaddr;
    }

    @Override
    public String toString() {
        return "la "+rd.toString()+","+addr.toString();
    }
}
