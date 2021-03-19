package RISCV.Inst;

import RISCV.Operand.RISCVRegister;

public class RISCVmvInst extends RISCVInstruction{
    public RISCVRegister rd,rs1;

    public RISCVmvInst(RISCVRegister tmprd, RISCVRegister tmprs1){
        rd = tmprd;
        rs1 = tmprs1;
    }

    @Override
    public String toString() {
        return "mv "+rd.toString()+","+rs1.toString();
    }
}
