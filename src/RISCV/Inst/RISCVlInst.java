package RISCV.Inst;

import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVlInst extends RISCVInstruction{

    public RISCVWidthENUMType WidthType;
    public RISCVRegister rd,rs1;
    public RISCVImm offset;


    public RISCVlInst(RISCVWidthENUMType tmpType, RISCVRegister tmprd, RISCVRegister tmprs1,
                      RISCVImm tmpoffset){
        super();
        WidthType = tmpType;
        rd = tmprd;
        rs1 = tmprs1;
        offset = tmpoffset;
        if(rd instanceof  RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
        if(rs1 instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rs1);
    }

    @Override
    public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
        if(rs1 == reg1) rs1 = reg2;
    }


    @Override
    public String toString() {
        if(rs1 instanceof RISCVPhyReg){
            return "mv "+ rd.toString()+","+rs1.toString();
        }
        StringBuilder tmpString = new StringBuilder();
        tmpString.append("l"+WidthType.name()+" "+rd.toString()+","+rs1.toString());
        if(offset.ImmVal != 0) tmpString.append("("+offset+")");
        return tmpString.toString();
    }
}
