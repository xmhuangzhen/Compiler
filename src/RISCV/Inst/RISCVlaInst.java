package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVlaInst extends RISCVInstruction{
    //load addr

    public RISCVRegister rd;
    public RISCVRegister addr;


    public RISCVlaInst(RISCVRegister tmprd, RISCVRegister tmpaddr){
        super();
        rd = tmprd;
        addr = tmpaddr;
        if(rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
    }

    @Override
    public void replaceReg(RISCVModule curModule) {
        for(int i = 0;i < UsedVirtualReg.size();++i){
            if(rd == UsedVirtualReg.get(i)) rd = curModule.getPhyReg("s"+i);
        }
    }


    @Override
    public String toString() {
        return "la "+rd.toString()+","+addr.toString();
    }
}
