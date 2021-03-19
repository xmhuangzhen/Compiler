package RISCV;

import RISCV.Inst.RISCVInstruction;

import java.util.ArrayList;

public class RISCVBasicBlock {

    public String BlockName;
    public ArrayList<RISCVInstruction> InstructionList;
    public RISCVInstruction HeadInst, TailInst;
    //public RISCVBasicBlock nextBlock;

    public RISCVBasicBlock(String tmpName){
        BlockName = tmpName;
        InstructionList = new ArrayList<>();
        HeadInst = null;
        TailInst = null;
    }

    public void addInstruction(RISCVInstruction tmpInst){
        if(HeadInst == null){
            HeadInst = tmpInst;
            TailInst = tmpInst;
        } else {
            TailInst.nextInst = tmpInst;
            tmpInst.preInst = TailInst;
            TailInst = tmpInst;
        }
    }

    @Override
    public String toString() {
        return BlockName;
    }
}
