package RISCV.Inst;

import RISCV.Operand.*;
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
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) UsedVirtualReg.add(rd);
        if ((rs1 instanceof RISCVVirtualReg)||(rs1 instanceof RISCVGlobalReg)) UsedVirtualReg.add(rs1);
    }


    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if (rd == reg1) rd = reg2;
        if (rs1 == reg1) rs1 = reg2;
    }

    @Override
    public String toString() {
        if ((rs1 instanceof RISCVPhyReg) && (rd instanceof RISCVPhyReg) &&(!(offset instanceof  RISCVRelocationImm))
            && offset.ImmVal == 0) {
            return "mv " + rs1.toString() + "," + rd.toString();
        }
        StringBuilder tmpString = new StringBuilder();
        if(offset instanceof RISCVRelocationImm) {
            tmpString.append("sw "+rd.toString()+","+offset.toString()+"("+rs1.toString()+")");
        } else {
            /*
            tmpString.append("sw " + rd.toString() + "," + rs1.toString());
            if (offset.ImmVal != 0) tmpString.append("(" + offset.toString() + ")");*/
            tmpString.append("sw "+ rd.toString()+","+offset.toString()+"("+rs1.toString()+")");
        }
        return tmpString.toString();
    }
}
