package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
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
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) {
         //   rd.NeedLoad =false;
            UsedVirtualReg.add(rd);
        }
        if ((rs instanceof RISCVVirtualReg)||(rs instanceof RISCVGlobalReg)) UsedVirtualReg.add(rs);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
        if(rs == reg1) rs = reg2;
    }

    @Override
    public String toString() {
        //        seqz,snez,sltz,sgtz
        return "s" + CompType.name() + "z " + rd.toString() + "," + rs.toString();
    }
}
