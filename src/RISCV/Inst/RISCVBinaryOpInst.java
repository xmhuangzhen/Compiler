package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVBinaryOpInst extends RISCVInstruction{

    public RISCVBinaryENUMType RISCVBinaryType;
    public RISCVRegister rd,rs1,rs2;
    public RISCVImm imm;


    public RISCVBinaryOpInst(RISCVBinaryENUMType tmpType, RISCVRegister tmprd, RISCVRegister tmprs1,
                             RISCVRegister tmprs2, RISCVImm tmpimm) {
        super();
        RISCVBinaryType = tmpType;
        rd = tmprd;
        rs1 = tmprs1;
        rs2 = tmprs2;
        imm = tmpimm;
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) {
            rd.NeedLoad = false;
            UsedVirtualReg.add(rd);
        }
        if ((rs1 instanceof RISCVVirtualReg)||(rs1 instanceof RISCVGlobalReg)) UsedVirtualReg.add(rs1);
        if ((rs2 instanceof RISCVVirtualReg)||(rs2 instanceof RISCVGlobalReg)) UsedVirtualReg.add(rs2);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
        if(rs1 == reg1) rs1 = reg2;
        if(rs2 == reg1) rs2 = reg2;
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
