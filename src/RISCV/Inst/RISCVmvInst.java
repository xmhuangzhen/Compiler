package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class RISCVmvInst extends RISCVInstruction{

    public RISCVRegister rd,rs1;

    public RISCVmvInst(RISCVRegister tmprd, RISCVRegister tmprs1){
        super();
        rd = tmprd;
        rs1 = tmprs1;
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) {
            UsedVirtualReg.add(rd);
        }
        if ((rs1 instanceof RISCVVirtualReg)||(rs1 instanceof RISCVGlobalReg))
            UsedVirtualReg.add(rs1);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
        if(rs1 == reg1) rs1 = reg2;
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
        if(!(rs1 instanceof RISCVGlobalReg))
        return "mv "+rd.toString()+","+rs1.toString();
        else{
//            System.out.println("HERE!"+","+rs1.RegisterName);
            return null;
        }
    }
}
