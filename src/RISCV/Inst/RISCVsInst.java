package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;

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
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) UsedVirtualReg.add(rd);
        if ((addr instanceof RISCVVirtualReg)||(addr instanceof RISCVGlobalReg)) UsedVirtualReg.add(addr);
    }


    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if (rd == reg1) rd = reg2;
        if (addr == reg1) addr = reg2;
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
