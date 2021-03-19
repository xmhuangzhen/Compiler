package RISCV.Inst;

import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVRegister;

public class RISCVLUIInst extends RISCVInstruction{

    public RISCVRegister rd;
    public RISCVImm imm;

    @Override
    public String toString() {
        return "lui "+rd.toString()+","+imm.toString();
    }
}
