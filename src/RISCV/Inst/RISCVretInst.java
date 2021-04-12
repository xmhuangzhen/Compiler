package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVModule;

import java.util.HashSet;
import java.util.LinkedHashSet;

public class RISCVretInst extends RISCVInstruction{

    public RISCVretInst(){
        super();
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
    }



    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {

    }

    @Override
    public HashSet<RISCVRegister> use() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
        return res;
    }

    @Override
    public HashSet<RISCVRegister> def() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
        return res;
    }



    @Override
    public String toString() {
        return "ret";
    }
}
