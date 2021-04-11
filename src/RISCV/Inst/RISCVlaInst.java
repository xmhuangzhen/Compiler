package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;

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
        if(!(rd instanceof RISCVGlobalReg))
            def.add(rd);
        if(!(addr instanceof RISCVGlobalReg))
            use.add(addr);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
    }

    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {
        if(rd != null && rd == reg1 && def.contains(rd)){
            def.remove(rd);
            rd = reg2;
            def.add(rd);
        }
        if(addr != null && addr == reg1 && use.contains(addr)) {
            use.remove(addr);
            addr = reg2;
            use.add(addr);
        }
    }

    @Override
    public void ComputeGenAndKill(HashSet<RISCVRegister> BlockGen, HashSet<RISCVRegister> BlockKill) {
        if(!(addr instanceof RISCVGlobalReg) && !BlockKill.contains(addr))
            BlockGen.add(addr);
        if(!(rd instanceof RISCVGlobalReg)) BlockKill.add(rd);
    }

    @Override
    public String toString() {
        return "la "+rd.toString()+","+addr.toString();
    }
}
