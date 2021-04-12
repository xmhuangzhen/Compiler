package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

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
    }


    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if (rd == reg1) rd = reg2;
        if (addr == reg1) addr = reg2;
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
        if(!(rd instanceof RISCVGlobalReg)) res.add(rd);
        if(!(addr instanceof RISCVGlobalReg)) res.add(addr);
        return res;
    }

    @Override
    public HashSet<RISCVRegister> def() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
        return res;
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
