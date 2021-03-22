package RISCV.Inst;

import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;

import java.util.ArrayList;

public class RISCVliInst extends RISCVInstruction{

    public RISCVRegister rd;
    public RISCVImm imm;


    public RISCVliInst(RISCVRegister tmprd, RISCVImm tmpimm){
        super();
        rd = tmprd;
        imm = tmpimm;
        if(rd instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rd);
    }

    @Override
    public String toString() {
        return "li "+rd.toString()+","+imm.toString();
    }
}
