package RISCV.Inst;

import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVsetzInst extends RISCVInstruction {

    RISCVCompareENUMType CompType;
    public RISCVRegister rd, rs;


    public RISCVsetzInst(RISCVCompareENUMType tmpType, RISCVRegister tmprd, RISCVRegister tmprs) {
        super();
        CompType = tmpType;
        rd = tmprd;
        rs = tmprs;
        if(rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
        if(rs instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rs);
    }

    @Override
    public void replaceReg(RISCVModule curModule) {
        for(int i = 0;i < UsedVirtualReg.size();++i){
            if(rd == UsedVirtualReg.get(i)) rd = curModule.getPhyReg("s"+i);
            if(rs == UsedVirtualReg.get(i)) rs = curModule.getPhyReg("s"+i);
        }
    }

    @Override
    public String toString() {
        //        seqz,snez,sltz,sgtz
        return "s" + CompType.name() + "z " + rd.toString() + "," + rs.toString();
    }
}
