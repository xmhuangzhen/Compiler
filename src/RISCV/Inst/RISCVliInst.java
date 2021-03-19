package RISCV.Inst;

import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVRegister;

public class RISCVliInst extends RISCVInstruction{

    public RISCVRegister rd;
    public RISCVImm imm;

    public RISCVliInst(RISCVRegister tmprd, RISCVImm tmpimm){
        rd = tmprd;
        imm = tmpimm;
    }

    @Override
    public String toString() {
        return "li "+rd.toString()+","+imm.toString();
    }
}
