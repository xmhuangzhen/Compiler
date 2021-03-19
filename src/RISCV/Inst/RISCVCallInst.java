package RISCV.Inst;

import RISCV.RISCVFunction;

public class RISCVCallInst extends RISCVInstruction{

    public RISCVFunction callFunction;

    public RISCVCallInst(RISCVFunction tmpFunc){
        callFunction = tmpFunc;
    }

    @Override
    public String toString() {
        return "call " + callFunction.toString();
    }
}
