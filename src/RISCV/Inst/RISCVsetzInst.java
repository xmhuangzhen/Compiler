package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;

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

        if(!(rd instanceof RISCVGlobalReg))
            def.add(rd);
        if(!(rs instanceof RISCVGlobalReg))
            use.add(rs);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
        if(rs == reg1) rs = reg2;
    }

    @Override
    public void ComputeGenAndKill(HashSet<RISCVRegister> BlockGen,
                                  HashSet<RISCVRegister> BlockKill) {
        if(!(rs instanceof RISCVGlobalReg) && !BlockKill.contains(rs)) BlockGen.add(rs);
        if(!(rd instanceof RISCVGlobalReg)) BlockKill.add(rd);
    }

    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {
        if(rd != null && rd == reg1 && def.contains(rd)){
            def.remove(rd);
            rd = reg2;
            def.add(rd);
        }
        if(rs != null && rs == reg1 && use.contains(rs)) {
            use.remove(rs);
            rs = reg2;
            use.add(rs);
        }
    }

    @Override
    public String toString() {
        //        seqz,snez,sltz,sgtz
        return "s" + CompType.name() + "z " + rd.toString() + "," + rs.toString();
    }
}
