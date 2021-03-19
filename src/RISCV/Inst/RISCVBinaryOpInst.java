package RISCV.Inst;

import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVRegister;

public class RISCVBinaryOpInst extends RISCVInstruction{
    public RISCVBinaryENUMType RISCVBinaryType;
    public RISCVRegister rd,rs1,rs2;
    public RISCVImm imm;

    public RISCVBinaryOpInst(RISCVBinaryENUMType tmpType, RISCVRegister tmprd, RISCVRegister tmprs1,
                             RISCVRegister tmprs2, RISCVImm tmpimm){
        RISCVBinaryType = tmpType;
        rd = tmprd;
        rs1 = tmprs1;
        rs2 = tmprs2;
        imm = tmpimm;
    }

    @Override
    public String toString() {
        StringBuilder tmpString = new StringBuilder(RISCVBinaryType.name());
        if(imm == null){
            tmpString.append(" ");
            tmpString.append(rd.toString()).append(",").append(rs1.toString()).append(",");
            tmpString.append(rs2.toString());
        } else {
            tmpString.append("i ");
            tmpString.append(rd.toString()).append(",").append(rs1.toString()).append(",");
            tmpString.append(imm);
        }
        return tmpString.toString();
    }
}
