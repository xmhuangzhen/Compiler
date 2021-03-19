package IR.TypeSystem;

import IR.Operand.IROperand;

import java.util.ArrayList;

public class FunctionType extends IRTypeSystem{

    public IRTypeSystem FuncReturnType;
    public ArrayList<IRTypeSystem> FuncParameter;

    public FunctionType(IRTypeSystem tmpType){
        FuncReturnType = tmpType;
        FuncParameter = new ArrayList<>();
    }

    @Override
    public long getTypeSize(){
        return 0;
    }

    @Override
    public IROperand getValue(){
        return null;
    }

    @Override
    public String toString(){
        StringBuilder resTypeName = new StringBuilder();
        resTypeName.append("ReturnType : "+FuncReturnType.toString());
        resTypeName.append("\n"+"Parameter : ");
        for(var tmpPara : FuncParameter)  resTypeName.append(tmpPara.toString()+" ");
        return resTypeName.toString();
    }

}
