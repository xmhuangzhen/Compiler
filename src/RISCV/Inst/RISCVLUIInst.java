package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVLUIInst extends RISCVInstruction {

    public RISCVRegister rd;
    public RISCVImm globalReg;

    public RISCVLUIInst(RISCVRegister tmprd, RISCVImm tmpGlobalReg) {
        super();
        rd = tmprd;
        globalReg = tmpGlobalReg;
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
        return "lui " + rd.toString() + "," + globalReg.toString();
    }
}