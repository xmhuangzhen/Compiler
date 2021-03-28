package RISCV;

import IR.IRFunction;
import RISCV.Operand.RISCVAddrImm;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVRelocationImm;

import java.util.LinkedHashMap;
import java.util.Map;

public class RISCVFunction {

    public IRFunction thisIRFunc;
    public String FunctionName;
    public boolean IsBuiltIn;
    public int StackNum;
    public Map<RISCVRegister, RISCVAddrImm> GEPAddrMap;

    public RISCVBasicBlock EntranceBlock = null, LastBlock = null;

    public RISCVFunction(IRFunction tmpFunc){
        thisIRFunc = tmpFunc;
        FunctionName = tmpFunc.thisFunctionName;
        IsBuiltIn = tmpFunc.IsBuiltIn;
        StackNum = 0;
        GEPAddrMap = new LinkedHashMap<>();
    }

    public void addBlock(RISCVBasicBlock tmpBlock){
        if(EntranceBlock == null) {
            EntranceBlock = tmpBlock;
            LastBlock = tmpBlock;
        } else {
            LastBlock.nextBlock = tmpBlock;
            LastBlock = tmpBlock;
        }
    }

    public int RealStackSize(){
        return 4*StackNum + (16-(4*StackNum%16))+4*16;
    }

    @Override
    public String toString() {
        return FunctionName;
    }
}
