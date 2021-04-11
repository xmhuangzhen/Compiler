package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;

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

        if(!(rd instanceof RISCVGlobalReg))
            def.add(rd);
        if(!(rs1 instanceof RISCVGlobalReg))
            use.add(rs1);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if (rd == reg1) rd = reg2;
        if (rs1 == reg1) rs1 = reg2;
    }

    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {
        if(rd != null && rd == reg1 && def.contains(rd)){
            def.remove(rd);
            rd = reg2;
            def.add(rd);
        }
        if(rs1 != null && rs1 == reg1 && use.contains(rs1)) {
            use.remove(rs1);
            rs1 = reg2;
            use.add(rs1);
        }
    }

    @Override
    public void ComputeGenAndKill(HashSet<RISCVRegister> BlockGen, HashSet<RISCVRegister> BlockKill) {
        if(!(rs1 instanceof RISCVGlobalReg) && !BlockKill.contains(rs1)) BlockGen.add(rs1);
        if(!(rd instanceof RISCVGlobalReg)) BlockKill.add(rd);
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
