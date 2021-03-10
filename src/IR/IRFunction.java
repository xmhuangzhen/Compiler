package IR;

import IR.Operand.Parameter;
import IR.Operand.Register;
import IR.TypeSystem.FunctionType;

import java.util.ArrayList;
import java.util.Map;

public class IRFunction {
    public FunctionType thisFunctionType;
    public String thisFunctionName;
    public ArrayList<IRBasicBlock> thisFunctionBasicBlocks;
    public ArrayList<Parameter> thisFunctionParameters;
    public Map<String, Register> thisFunctionVariableTable;

    //about ret instruction
    public Register thisReturnValue;
    public IRBasicBlock thisLastBasicBlock;


    public IRFunction(FunctionType tmpFunctionType, String tmpFunctionName){
        thisFunctionType = tmpFunctionType;
        thisFunctionName = tmpFunctionName;
        thisFunctionBasicBlocks = new ArrayList<>();
        thisFunctionParameters = new ArrayList<>();
    }

    public void addVariableinFunc(Register tmpVar){
        thisFunctionVariableTable.put(tmpVar.RegisterName,tmpVar);
    }
}
