package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.IRFunction;
import IR.Operand.IROperand;
import IR.Operand.Parameter;
import IR.Operand.Register;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class callInstruction extends IRInstruction{
    public IRFunction CallFunction;
    public ArrayList<IROperand> CallParameters;
    public Register CallResult;

    public callInstruction(IRBasicBlock tmpBasicBlock, Register tmpResult,
                           IRFunction tmpFunction) {
        super(tmpBasicBlock);
        CallFunction = tmpFunction;
        CallResult = tmpResult;
        CallParameters = new ArrayList<>();
        if(CallResult != null) CallResult.Defs.add(this);

        HasSideEffect = true;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        for(int i = 0;i < CallParameters.size();++i)
            if(CallParameters.get(i) == originObject){
                CallParameters.get(i).DeleteRegisterUseInInstruction(this);
                newObject.NeedPtr = originObject.NeedPtr;
                CallParameters.set(i,newObject);
                CallParameters.get(i).AddRegisterUseInInstruction(this);
            }
    }

    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        for(int i = 0;i < CallParameters.size();++i)
            if(CallParameters.get(i) instanceof Register || CallParameters.get(i) instanceof Parameter)
                res.add(CallParameters.get(i));
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        if(CallResult != null) res.add(CallResult);
        return res;
    }

    @Override
    public void refreshRegisterUse() {
        if(CallResult != null) CallResult.Defs.add(this);
        for(var tmpPar : CallParameters)
            if(tmpPar instanceof Register || tmpPar instanceof Parameter)
                tmpPar.AddRegisterUseInInstruction(this);
    }

    @Override
    public String toString() {
        StringBuilder CallName = new StringBuilder();
        if(CallResult != null) CallName.append(CallResult.toString()+" = ");
        CallName.append("call " + CallFunction.thisFunctionType.FuncReturnType.toString() + " ");
        CallName.append("@" + CallFunction.thisFunctionName + "(");
        for(int i = 0;i < CallParameters.size();++i){
            if(i != 0) CallName.append(", ");
            CallName.append( CallParameters.get(i).thisType.toString() +
                    " " + CallParameters.get(i).toString());
        }
        CallName.append(")");
        return CallName.toString();
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}
