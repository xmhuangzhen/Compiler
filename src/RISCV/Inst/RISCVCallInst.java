package RISCV.Inst;

import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;

import java.util.HashSet;

import static RISCV.RISCVModule.RISCVCallerPhyRegName;
import static RISCV.RISCVModule.getPhyReg;

public class RISCVCallInst extends RISCVInstruction{

    public RISCVFunction callFunction;

    public RISCVCallInst(RISCVFunction tmpFunc){
        super();
        callFunction = tmpFunc;
        for(int i = 0;
            i < Integer.min(8,callFunction.thisIRFunc.thisFunctionParameters.size()); ++i){
            use.add(getPhyReg("a"+i));
        }
        for(String tmpName : RISCVCallerPhyRegName){
            def.add(getPhyReg(tmpName));
        }
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
    }

    @Override
    public void ComputeGenAndKill(HashSet<RISCVRegister> BlockGen, HashSet<RISCVRegister> BlockKill) {

        for(int i = 0;
            i < Integer.min(8,callFunction.thisIRFunc.thisFunctionParameters.size()); ++i){
            if(!BlockKill.contains(getPhyReg("a"+i)))
            BlockGen.add(getPhyReg("a"+i));
        }
        for(String tmpName : RISCVCallerPhyRegName){
            BlockKill.add(getPhyReg(tmpName));
        }
    }

    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {

    }

    @Override
    public String toString() {
        return "call " + callFunction.toString();
    }
}
