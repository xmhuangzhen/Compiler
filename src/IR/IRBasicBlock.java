package IR;

import IR.Instruction.IRInstruction;
import IR.Operand.Register;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class IRBasicBlock {
    public String BasicBlockName;
    public IRFunction BasicBlockFunction;
    public ArrayList<IRBasicBlock> prevBasicBlocks;
    public ArrayList<IRBasicBlock> nextBasicBlocks;
    public ArrayList<IRInstruction> BasicBlockInstructions;
    public Map<String, Register> BasicBlockRegister;

    public IRBasicBlock(IRFunction tmpFunction, String tmpName){
        BasicBlockFunction = tmpFunction;
        BasicBlockName = tmpName;
        BasicBlockInstructions = new ArrayList<>();
        prevBasicBlocks = new ArrayList<>();
        nextBasicBlocks = new ArrayList<>();
        BasicBlockRegister = new LinkedHashMap<>();
    }

    public void addBasicBlockInst(IRInstruction tmpInst){
        BasicBlockInstructions.add(tmpInst);
    }

    public void addBasicBlockRegister(String RegisterName, Register tmpRegister){
        if(!BasicBlockRegister.containsKey(RegisterName))
            BasicBlockRegister.put(RegisterName,tmpRegister);
        else
            BasicBlockRegister.replace(RegisterName,tmpRegister);
    }
}
