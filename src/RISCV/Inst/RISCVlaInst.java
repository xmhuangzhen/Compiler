package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class RISCVlaInst extends RISCVInstruction{

    public RISCVRegister rd;
    public RISCVRegister addr;


    public RISCVlaInst(RISCVRegister tmprd, RISCVRegister tmpaddr){
        super();
        rd = tmprd;
        addr = tmpaddr;
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) {
            UsedVirtualReg.add(rd);
        }
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
    }

    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {
        if(rd != null && rd == reg1){
            rd = reg2;
        }
        if(addr != null && addr == reg1) {
            addr = reg2;
        }
    }

    @Override
    public HashSet<RISCVRegister> use() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
        if(!(addr instanceof RISCVGlobalReg)) res.add(addr);
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
        return "la "+rd.toString()+","+addr.toString();
    }
}
