package RISCV.Inst;

import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;

public class RISCVCallInst extends RISCVInstruction{

    public RISCVFunction callFunction;

    public RISCVCallInst(RISCVFunction tmpFunc){
        super();
        callFunction = tmpFunc;
    }

    @Override
    public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2) {
    }

    @Override
    public String toString() {
        return "call " + callFunction.toString();
    }
}
