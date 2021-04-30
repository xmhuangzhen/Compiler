package RISCV;

import IR.IRFunction;
import RISCV.Operand.RISCVAddrImm;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVRelocationImm;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;

public class RISCVFunction {

    public IRFunction thisIRFunc;
    public String FunctionName;
    public boolean IsBuiltIn;
    public Map<RISCVRegister, RISCVAddrImm> GEPAddrMap;
    public int MaxParaCall;

    //for Naive Reg Allocator use
    public int NaiveStackNum;
    public int NaiveStackCounting;

    public RISCVBasicBlock EntranceBlock = null, LastBlock = null;
    public RISCVBasicBlock TailCallEntryBlock;

    //for graph coloring use
    public int GCStackNum;

    public HashSet<RISCVPhyReg> usedPhyReg;

    public ArrayList<RISCVBasicBlock> DFSOrder;

    public RISCVFunction(IRFunction tmpFunc){
        thisIRFunc = tmpFunc;
        FunctionName = tmpFunc.thisFunctionName;
        IsBuiltIn = tmpFunc.IsBuiltIn;
        NaiveStackNum = 0;
        NaiveStackCounting = 0;
        GEPAddrMap = new LinkedHashMap<>();
        MaxParaCall = 0;

        //DFSOrder = new ArrayList<>();
        GCStackNum = 0;

        usedPhyReg = new HashSet<>();
        DFSOrder = new ArrayList<>();
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

    //ra,s0-s11,maxparacall
    public int GCRealStackSize(){
        return 4*GCStackNum + (16-(4*GCStackNum%16))+
                4*16+4*MaxParaCall;
    }

    public void getDFSOrder(){
        DFSOrder.clear();
        runDFS(EntranceBlock);
    }

    public void runDFS(RISCVBasicBlock curBlock){
        if(DFSOrder.contains(curBlock)) return;
        DFSOrder.add(curBlock);
        for(int i = curBlock.successor.size()-1; i >= 0;--i)
            runDFS(curBlock.successor.get(i));
    }

    @Override
    public String toString() {
        return FunctionName;
    }
}
