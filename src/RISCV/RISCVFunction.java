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
    public int MaxParaCall;

    //for Naive Reg Allocator use
    public int NaiveStackNum;
    public int NaiveStackCounting;

    public RISCVBasicBlock EntranceBlock = null, LastBlock = null;


    //for graph coloring use
    public int GCStackNum;

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

    @Override
    public String toString() {
        return FunctionName;
    }
}
