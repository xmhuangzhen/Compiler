package IR;

import IR.Instruction.IRInstruction;

import java.util.ArrayList;

public class IRBasicBlock {
    public String BasicBlockName;
    public IRFunction BasicBlockFunction;
    public ArrayList<IRBasicBlock> prevBasicBlocks;
    public ArrayList<IRBasicBlock> nextBasicBlocks;
    public ArrayList<IRInstruction> BasicBlockInstructions;


    public IRBasicBlock(IRFunction tmpFunction, String tmpName){
        BasicBlockFunction = tmpFunction;
        BasicBlockName = tmpName;
        BasicBlockInstructions = new ArrayList<>();
        prevBasicBlocks = new ArrayList<>();
        nextBasicBlocks = new ArrayList<>();
    }

    public void addBasicBlockInst(IRInstruction tmpInst){
        BasicBlockInstructions.add(tmpInst);
    }
}
