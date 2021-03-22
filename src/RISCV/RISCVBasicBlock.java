package RISCV;

import IR.IRBasicBlock;
import RISCV.Inst.RISCVInstruction;

import java.util.ArrayList;

public class RISCVBasicBlock {

    public String BlockName;
    public IRBasicBlock thisIRBasicBlock;
    public ArrayList<RISCVInstruction> InstructionList;
    public RISCVInstruction HeadInst, TailInst;
    public RISCVBasicBlock nextBlock;

    public RISCVBasicBlock(IRBasicBlock tmpBlock,String tmpName){
        thisIRBasicBlock = tmpBlock;
        BlockName = tmpName;
        HeadInst = null;
        TailInst = null;
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
