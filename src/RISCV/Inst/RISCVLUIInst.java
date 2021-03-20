package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVRegister;

public class RISCVLUIInst extends RISCVInstruction {

    public RISCVRegister rd;
    public RISCVImm globalReg;

    public RISCVLUIInst(RISCVRegister tmprd, RISCVImm tmpGlobalReg) {
        rd = tmprd;
        globalReg = tmpGlobalReg;
    }

    @Override
    public String toString() {
        return "lui " + rd.toString() + "," + globalReg.toString();
    }
}