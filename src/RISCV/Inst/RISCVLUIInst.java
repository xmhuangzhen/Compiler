package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class RISCVLUIInst extends RISCVInstruction {

    public RISCVRegister rd;
    public RISCVRelocationImm globalRelocationImm;

    public RISCVLUIInst(RISCVRegister tmprd, RISCVRelocationImm tmpRelocationImm) {
        super();
        rd = tmprd;
        globalRelocationImm = tmpRelocationImm;
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) UsedVirtualReg.add(rd);

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
    }

    @Override
    public HashSet<RISCVRegister> use() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
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
        return "lui "+ rd.toString()+","+globalRelocationImm.toString();
    }
}