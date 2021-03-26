package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVlInst extends RISCVInstruction{

    public RISCVWidthENUMType WidthType;
    public RISCVRegister rd,rs1;
    public RISCVImm offset;
    public RISCVRegister baseOffset;


    public RISCVlInst(RISCVWidthENUMType tmpType, RISCVRegister tmprd, RISCVRegister tmprs1,
                      RISCVImm tmpoffset,RISCVRegister tmpbaseOffset){
        super();
        WidthType = tmpType;
        rd = tmprd;
        rs1 = tmprs1;
        offset = tmpoffset;
        baseOffset = tmpbaseOffset;
        if (rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
        if (rs1 instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rs1);
        if(baseOffset instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) baseOffset);
    }

    @Override
    public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
        if(rs1 == reg1) rs1 = reg2;
        if(baseOffset == reg1) baseOffset = reg2;
    }


    @Override
    public String toString() {
        if((rd instanceof RISCVPhyReg) && (rs1 instanceof RISCVPhyReg)){
            return "mv "+ rd.toString()+","+rs1.toString();
        }
        StringBuilder tmpString = new StringBuilder();
        tmpString.append("l"+WidthType.name()+" "+rd.toString()+",");
        if(offset instanceof RISCVRelocationImm){
            tmpString.append(offset.toString());
            if(baseOffset != null) tmpString.append("("+baseOffset.toString()+")");

        } else {
            if(rs1 != null)tmpString.append(rs1.toString());
            if (offset.ImmVal != 0) tmpString.append("(" + offset + ")");
        }
        return tmpString.toString();
    }
}
