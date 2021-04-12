package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;

import java.util.HashSet;
import java.util.LinkedHashSet;

import static RISCV.RISCVModule.RISCVCallerPhyRegName;
import static RISCV.RISCVModule.getPhyReg;

public class RISCVCallInst extends RISCVInstruction{

    public RISCVFunction callFunction;

    public RISCVCallInst(RISCVFunction tmpFunc){
        super();
        callFunction = tmpFunc;
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
        for(int i = 0;
            i < Integer.min(8,callFunction.thisIRFunc.thisFunctionParameters.size()); ++i){
            res.add(getPhyReg("a"+i));
        }
        return res;
    }

    @Override
    public HashSet<RISCVRegister> def() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
        for(String tmpName : RISCVCallerPhyRegName){
            res.add(getPhyReg(tmpName));
        }
        return res;
    }


    @Override
    public String toString() {
        return "call " + callFunction.toString();
    }
}
