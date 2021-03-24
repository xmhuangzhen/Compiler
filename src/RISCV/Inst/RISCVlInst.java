package RISCV.Inst;

import RISCV.Operand.RISCVImm;
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
    public void replaceReg(RISCVModule curModule) {
        for(int i = 0;i < UsedVirtualReg.size();++i){
            if(rd == UsedVirtualReg.get(i)) rd = curModule.getPhyReg("s"+i);
            if(rs1 == UsedVirtualReg.get(i)) rs1 = curModule.getPhyReg("s"+i);
        }
    }


    @Override
    public String toString() {
        return "l"+WidthType.name()+" "+rd.toString()+","+rs1.toString()+"("+offset+")";
    }
}
