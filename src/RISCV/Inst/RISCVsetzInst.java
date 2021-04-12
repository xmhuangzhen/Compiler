package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class RISCVsetzInst extends RISCVInstruction {

    RISCVCompareENUMType CompType;
    public RISCVRegister rd, rs;


    public RISCVsetzInst(RISCVCompareENUMType tmpType, RISCVRegister tmprd,
                         RISCVRegister tmprs) {
        super();
        CompType = tmpType;
        rd = tmprd;
        rs = tmprs;
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) {
            UsedVirtualReg.add(rd);
        }
        if ((rs instanceof RISCVVirtualReg)||(rs instanceof RISCVGlobalReg))
            UsedVirtualReg.add(rs);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
        if(rs == reg1) rs = reg2;
    }



    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {
        if(rd != null && rd == reg1){
            rd = reg2;
        }
        if(rs != null && rs == reg1) {
            rs = reg2;
        }
    }

    @Override
    public HashSet<RISCVRegister> use() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
        if(!(rs instanceof RISCVGlobalReg)) res.add(rs);
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
        //        seqz,snez,sltz,sgtz
        return "s" + CompType.name() + "z " + rd.toString() + "," + rs.toString();
    }
}
