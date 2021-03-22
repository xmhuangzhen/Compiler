package IR;

import Backend.IRVisitor;
import IR.Instruction.IRInstruction;
import IR.Operand.IROperand;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class IRBasicBlock {
    public String BasicBlockName;
    public IRFunction BasicBlockFunction;
    public IRBasicBlock prevBasicBlocks;
    public IRBasicBlock nextBasicBlocks;
   // public ArrayList<IRInstruction> BasicBlockInstructions;
    public IRInstruction HeadInst;
    public IRInstruction TailInst;

    public Map<String, IROperand> IRRegisterTable;

    public IRBasicBlock(IRFunction tmpFunction, String tmpName){
        BasicBlockFunction = tmpFunction;
        BasicBlockName = tmpName;
       // BasicBlockInstructions = new ArrayList<>();
        prevBasicBlocks = null;
        nextBasicBlocks = null;
        HeadInst = null;
        TailInst = null;
        IRRegisterTable = new LinkedHashMap<>();
    }

    public void addBasicBlockInst(IRInstruction tmpInst){
        if(HeadInst == null){
            HeadInst = tmpInst;
            TailInst = tmpInst;
        } else {
            tmpInst.preIRInstruction = TailInst;
            TailInst.nextIRInstruction = tmpInst;
            TailInst = tmpInst;
        }
    }

/*    public IROperand GetVarRegister(String tmpName){
        if(IRRegisterTable.containsKey(tmpName))
            return IRRegisterTable.get(tmpName);
        if(BasicBlockFunction != null && BasicBlockFunction.thisFunctionVariableTable.containsKey(tmpName))
            return BasicBlockFunction.thisFunctionVariableTable.get(tmpName);
        return null;
    }*/


    //for IRPrinter use
    @Override
    public String toString() {
        return "%" + BasicBlockName;
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }
}
