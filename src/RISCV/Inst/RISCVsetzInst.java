package RISCV.Inst;

import RISCV.Operand.RISCVRegister;

public class RISCVsetzInst extends RISCVInstruction {

    RISCVCompareENUMType CompType;
    public RISCVRegister rd, rs;

    public RISCVsetzInst(RISCVCompareENUMType tmpType, RISCVRegister tmprd, RISCVRegister tmprs) {
        CompType = tmpType;
        rd = tmprd;
        rs = tmprs;
    }

    @Override
    public String toString() {
        //        seqz,snez,sltz,sgtz
        return "s" + CompType.name() + "z " + rd.toString() + "," + rs.toString();
    }
}
