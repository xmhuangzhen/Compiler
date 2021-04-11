package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;

public class RISCVLUIInst extends RISCVInstruction {

    public RISCVRegister rd;
    public RISCVRelocationImm globalRelocationImm;

    public RISCVLUIInst(RISCVRegister tmprd, RISCVRelocationImm tmpRelocationImm) {
        super();
        rd = tmprd;
        globalRelocationImm = tmpRelocationImm;
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) UsedVirtualReg.add(rd);

        if(!(rd instanceof RISCVGlobalReg))
            def.add(rd);
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
    }


    @Override
    public void ComputeGenAndKill(HashSet<RISCVRegister> BlockGen, HashSet<RISCVRegister> BlockKill) {
        if(!(rd instanceof RISCVGlobalReg)) BlockKill.add(rd);
    }

    @Override
    public String toString() {
        return "lui "+ rd.toString()+","+globalRelocationImm.toString();
    }
}