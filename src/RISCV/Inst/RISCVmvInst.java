package RISCV.Inst;

import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVmvInst extends RISCVInstruction{

    public RISCVRegister rd,rs1;

    public RISCVmvInst(RISCVRegister tmprd, RISCVRegister tmprs1){
        super();
        rd = tmprd;
        rs1 = tmprs1;
        if(rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
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
        return "mv "+rd.toString()+","+rs1.toString();
    }
}
