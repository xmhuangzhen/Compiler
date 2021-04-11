package RISCV;

import IR.IRFunction;
import RISCV.Operand.RISCVAddrImm;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVRelocationImm;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class RISCVFunction {

    public IRFunction thisIRFunc;
    public String FunctionName;
    public boolean IsBuiltIn;
    public Map<RISCVRegister, RISCVAddrImm> GEPAddrMap;

    //for Naive Reg Allocator use
    public int NaiveStackNum;
    public int NaiveStackCounting;

    public RISCVBasicBlock EntranceBlock = null, LastBlock = null;

    //for Liveness Analysis use
    public ArrayList<RISCVBasicBlock> DFSOrder;

    //for graph coloring use
    public int GCStackNum;

    public RISCVFunction(IRFunction tmpFunc){
        thisIRFunc = tmpFunc;
        FunctionName = tmpFunc.thisFunctionName;
        IsBuiltIn = tmpFunc.IsBuiltIn;
        NaiveStackNum = 0;
        NaiveStackCounting = 0;
        GEPAddrMap = new LinkedHashMap<>();

        DFSOrder = new ArrayList<>();
        GCStackNum = 0;
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

    //for naive Reg Allocator use
    public int RealStackSize(){
        return 4*NaiveStackCounting + (16-(4*NaiveStackCounting%16))+4*16;
    }

    public int GCRealStackSize(){
        return 4*GCStackNum + (16-(4*GCStackNum%16))+4*16;
    }



    //for Liveness Analysis use
    public void getDFSOrder(){
        for(RISCVBasicBlock tmpBlock = EntranceBlock;
            tmpBlock != null; tmpBlock = tmpBlock.nextBlock)
            tmpBlock.DFSVisited = false;
        DFSOrder.clear();
        DFS(EntranceBlock);
    }

    public void DFS(RISCVBasicBlock curBlock){
        curBlock.DFSVisited = true;
        DFSOrder.add(curBlock);
        for(var tmpBlock : curBlock.successor){
            if(!tmpBlock.DFSVisited){
                DFS(tmpBlock);
            }
        }
    }

    @Override
    public String toString() {
        return FunctionName;
    }
}
