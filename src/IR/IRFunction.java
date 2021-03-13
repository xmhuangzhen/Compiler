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

    public Register thisReturnValue;
    public IRBasicBlock thisLastBasicBlock;

    public IRBasicBlock thisEntranceBlock;
    public IRBasicBlock thisReturnBlock;

    public IRFunction(FunctionType tmpFunctionType, String tmpFunctionName){
        thisFunctionType = tmpFunctionType;
        thisFunctionName = tmpFunctionName;
        thisFunctionBasicBlocks = new ArrayList<>();
        thisFunctionParameters = new ArrayList<>();
        thisEntranceBlock = new IRBasicBlock(this,tmpFunctionName+"_entrance_block");
        thisReturnBlock = new IRBasicBlock(this,tmpFunctionName+"_return_block");

    }

    public void addVariableinFunc(Register tmpVar){
        thisFunctionVariableTable.put(tmpVar.RegisterName,tmpVar);
    }
}
