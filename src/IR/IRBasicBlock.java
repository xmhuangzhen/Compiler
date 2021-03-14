package IR;

import Backend.IRVisitor;
import IR.Instruction.IRInstruction;

import java.util.ArrayList;

public class IRBasicBlock {
    public String BasicBlockName;
    public IRFunction BasicBlockFunction;
    public IRBasicBlock prevBasicBlocks;
    public IRBasicBlock nextBasicBlocks;
    public ArrayList<IRInstruction> BasicBlockInstructions;
    public IRInstruction HeadInst;
    public IRInstruction TailInst;

    public IRBasicBlock(IRFunction tmpFunction, String tmpName){
        BasicBlockFunction = tmpFunction;
        BasicBlockName = tmpName;
        BasicBlockInstructions = new ArrayList<>();
        prevBasicBlocks = null;
        nextBasicBlocks = null;
        HeadInst = null;
        TailInst = null;
    }

    public void addBasicBlockInst(IRInstruction tmpInst){
        BasicBlockInstructions.add(tmpInst);
        if(HeadInst == null){
            HeadInst = tmpInst;
            TailInst = tmpInst;
        } else {
            TailInst.nextIRInstruction = tmpInst;
            tmpInst.preIRInstruction = TailInst;
            TailInst = tmpInst;
        }
    }


    //for IRPrinter use
    @Override
    public String toString() {
        return "%" + BasicBlockName;
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }
}
