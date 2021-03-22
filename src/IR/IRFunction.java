package IR;

import Backend.IRVisitor;
import IR.Operand.Parameter;
import IR.Operand.Register;
import IR.TypeSystem.FunctionType;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class IRFunction {
    public FunctionType thisFunctionType;
    public String thisFunctionName;
    public boolean IsBuiltIn;

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
        IsBuiltIn = false;

        thisFunctionBasicBlocks = new ArrayList<>();
        thisFunctionParameters = new ArrayList<>();
        thisFunctionVariableTable = new LinkedHashMap<>();
        thisEntranceBlock = new IRBasicBlock(this,tmpFunctionName+"_entrance_block");
        thisReturnBlock = new IRBasicBlock(this,tmpFunctionName+"_return_block");
        thisLastBasicBlock = new IRBasicBlock(this,tmpFunctionName+"_last_block");
        thisEntranceBlock.nextBasicBlocks = thisLastBasicBlock;
        thisLastBasicBlock.nextBasicBlocks = thisReturnBlock;
        thisReturnBlock.prevBasicBlocks = thisLastBasicBlock;
        thisLastBasicBlock.prevBasicBlocks = thisEntranceBlock;
    }

    public void addVariableinFunc(Register tmpVar){
        thisFunctionVariableTable.put(tmpVar.RegisterName,tmpVar);
    }

    public void addFunctionBasicBlock(IRBasicBlock tmpBasicBlock){
        //always add before the LastBlock
        IRBasicBlock tmpPreBlock = thisLastBasicBlock.prevBasicBlocks;
        tmpBasicBlock.prevBasicBlocks = tmpPreBlock;
        tmpBasicBlock.nextBasicBlocks = thisLastBasicBlock;
        tmpPreBlock.nextBasicBlocks = tmpBasicBlock;
        thisLastBasicBlock.prevBasicBlocks = tmpBasicBlock;
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }//for IRPrinter

    //for IRPrinter use
    @Override
    public String toString() {
        StringBuilder tmpString = new StringBuilder("define ");
        tmpString.append(thisFunctionType.toString()+" @"+thisFunctionName);
        tmpString.append("(");
        for(int i = 0;i < thisFunctionParameters.size();++i){
            if(i != 0) tmpString.append(", ");
            tmpString.append(thisFunctionParameters.get(i).thisType.toString());
        }
        tmpString.append(")");
        return tmpString.toString();
    }
}
