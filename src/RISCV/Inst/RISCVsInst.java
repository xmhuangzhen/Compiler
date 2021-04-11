package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;

public class RISCVsInst extends RISCVInstruction {

    public RISCVWidthENUMType WidthType;
    public RISCVRegister rd, addr;
    public RISCVImm offset;

    //save rd(value) to addr+offset

    public RISCVsInst(RISCVWidthENUMType tmpType, RISCVRegister tmprd,
                      RISCVRegister tmpaddr, RISCVImm tmpoffset) {
        super();
        WidthType = tmpType;
        rd = tmprd;
        addr = tmpaddr;
        offset = tmpoffset;
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg))
            UsedVirtualReg.add(rd);
        if ((addr instanceof RISCVVirtualReg)||(addr instanceof RISCVGlobalReg))
            UsedVirtualReg.add(addr);

        if(!(rd instanceof RISCVGlobalReg))
            use.add(rd);
        if(!(addr instanceof RISCVGlobalReg))
            use.add(addr);
    }


    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if (rd == reg1) rd = reg2;
        if (addr == reg1) addr = reg2;
    }

    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {
        if(rd != null && rd == reg1 && use.contains(rd)){
            use.remove(rd);
            rd = reg2;
            use.add(rd);
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
        StringBuilder tmpString = new StringBuilder();
        if(offset instanceof RISCVAddrImm) {
            tmpString.append("sw "+rd.toString()+","+offset.ImmVal+"("+addr.toString()+")");
        } else {
            tmpString.append("sw "+ rd.toString()+","+offset.toString()+"("+addr.toString()+")");
        }
        return tmpString.toString();
    }
}
