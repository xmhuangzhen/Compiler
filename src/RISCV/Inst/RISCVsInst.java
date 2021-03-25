package RISCV.Inst;

import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVsInst extends RISCVInstruction {

    public RISCVWidthENUMType WidthType;
    public RISCVRegister rd, rs1;
    public RISCVImm offset;

    //save rd(value) to rs1+offset


    public RISCVsInst(RISCVWidthENUMType tmpType, RISCVRegister tmprd,
                      RISCVRegister tmprs1, RISCVImm tmpoffset) {
        super();
        WidthType = tmpType;
        rd = tmprd;
        rs1 = tmprs1;
        offset = tmpoffset;
        if (rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
        if (rs1 instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rs1);
    }


    @Override
    public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2) {
        if (rd == reg1) rd = reg2;
        if (rs1 == reg1) rs1 = reg2;
    }

    @Override
    public String toString() {
        if ((rs1 instanceof RISCVPhyReg) && (rd instanceof RISCVPhyReg)) {
            return "mv " + rs1.toString() + "," + rd.toString();
        }
        StringBuilder tmpString = new StringBuilder("sw" +/*WidthType.name()+*/" " + rd.toString() + "," + rs1.toString());
        if (offset.ImmVal != 0) tmpString.append("(" + offset.toString() + ")");
        return tmpString.toString();
    }
}
