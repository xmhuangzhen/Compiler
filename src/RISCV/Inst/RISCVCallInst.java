package RISCV.Inst;

import RISCV.RISCVFunction;
import RISCV.RISCVModule;

public class RISCVCallInst extends RISCVInstruction{

    public RISCVFunction callFunction;

    public RISCVCallInst(RISCVFunction tmpFunc){
        super();
        callFunction = tmpFunc;
    }

    @Override
    public void replaceReg(RISCVModule curModule) {
    }

    @Override
    public String toString() {
        return "call " + callFunction.toString();
    }
}
