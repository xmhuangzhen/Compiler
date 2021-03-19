package RISCV;

import java.util.ArrayList;

public class RISCVFunction {


    public String FunctionName;
    public RISCVBasicBlock EntranceBlock = null;
    public ArrayList<RISCVBasicBlock> BasicBlockList;

    public RISCVFunction(String tmpName){
        FunctionName = tmpName;
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
