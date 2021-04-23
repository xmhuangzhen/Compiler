package RISCV;

import IR.IRBasicBlock;
import RISCV.Inst.RISCVInstruction;
import RISCV.Operand.RISCVRegister;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class RISCVBasicBlock {

    public String BlockName;
    public IRBasicBlock thisIRBasicBlock;
    public RISCVInstruction HeadInst, TailInst;
    public RISCVBasicBlock nextBlock;

    public boolean DFSVisited;

    //for DFS use
    public ArrayList<RISCVBasicBlock> predecessor;
    public ArrayList<RISCVBasicBlock> successor;

    //for Liveness Analysis use
    public HashSet<RISCVRegister> LiveOut;
    public HashSet<RISCVRegister> LiveIn;


    public RISCVBasicBlock(IRBasicBlock tmpBlock,String tmpName){
        thisIRBasicBlock = tmpBlock;
        BlockName = tmpName;
        HeadInst = null;
        TailInst = null;

        predecessor = new ArrayList<>();
        successor = new ArrayList<>();

        LiveOut = new HashSet<>();
        LiveIn = new HashSet<>();
    }

    public void removeLastInst(){
        if(TailInst == null) throw new RuntimeException();
        TailInst = TailInst.preInst;
        if(TailInst != null) {
//            System.out.println(TailInst);
            TailInst.nextInst.preInst = null;
            TailInst.nextInst = null;
        } else {
            HeadInst = null;
        }
    }

    public void addInstruction(RISCVInstruction tmpInst){
        if(HeadInst == null){
            HeadInst = tmpInst;
            TailInst = tmpInst;
        } else {
            tmpInst.preInst = TailInst;
            TailInst.nextInst = tmpInst;
            TailInst = tmpInst;
        }
    }

    @Override
    public String toString() {
        return BlockName;
    }
}
