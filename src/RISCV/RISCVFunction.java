package RISCV;

import IR.IRFunction;

import java.util.ArrayList;

public class RISCVFunction {

    public IRFunction thisIRFunc;
    public String FunctionName;
    public RISCVBasicBlock EntranceBlock = null;
    public ArrayList<RISCVBasicBlock> BasicBlockList;

    public RISCVFunction(IRFunction tmpFunc){
        thisIRFunc = tmpFunc;
        FunctionName = tmpFunc.thisFunctionName;
        BasicBlockList = new ArrayList<>();
    }

    public void addBlock(RISCVBasicBlock tmpBlock){
        BasicBlockList.add(tmpBlock);
        if(EntranceBlock == null) EntranceBlock = tmpBlock;

    }

    @Override
    public String toString() {
        return FunctionName;
    }
}
