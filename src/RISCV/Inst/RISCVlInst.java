package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class RISCVlInst extends RISCVInstruction {

    public RISCVWidthENUMType WidthType;
    public RISCVRegister rd, rs1;
    public RISCVImm offset;

    public RISCVlInst(RISCVWidthENUMType tmpType, RISCVRegister tmprd, RISCVRegister tmprs1,
                      RISCVImm tmpoffset) {
        super();
        WidthType = tmpType;
        rd = tmprd;
        rs1 = tmprs1;
        offset = tmpoffset;
        if ((rd instanceof RISCVVirtualReg) || (rd instanceof RISCVGlobalReg)) UsedVirtualReg.add(rd);
        if ((rs1 instanceof RISCVVirtualReg) || (rs1 instanceof RISCVGlobalReg)) UsedVirtualReg.add(rs1);

    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if (rd == reg1) rd = reg2;
        if (rs1 == reg1) rs1 = reg2;
    }

    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {
        if(rd != null && rd == reg1){
            rd = reg2;
        }
        if(rs1 != null && rs1 == reg1) {
            rs1 = reg2;
        }
    }

    @Override
    public HashSet<RISCVRegister> use() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
        if(!(rs1 instanceof RISCVGlobalReg)) res.add(rs1);
        return res;
    }

    @Override
    public HashSet<RISCVRegister> def() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
        if(!(rd instanceof RISCVGlobalReg)) res.add(rd);
        return res;
    }


    @Override
    public String toString() {

        StringBuilder tmpString = new StringBuilder();
        if (offset instanceof RISCVAddrImm) {
            tmpString.append("lw " + rd.toString() + "," + offset.ImmVal+"("+rs1.toString()+")");
        } else {
            tmpString.append("lw " + rd.toString() + "," + offset.toString() + "(" + rs1.toString() + ")");
        }
        return tmpString.toString();
    }
}
