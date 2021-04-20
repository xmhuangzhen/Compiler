package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Parameter;
import IR.Operand.Register;
import IR.TypeSystem.PointerType;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class getElementPtrInstruction extends IRInstruction{

    public Register GetElementPtrResult;
    public IROperand GetElementPtrPtr;
    public ArrayList<IROperand> GetElementPtrIdx;


    public getElementPtrInstruction(IRBasicBlock tmpBasicBlock, IROperand tmpPtr, Register tmpResult) {
        super(tmpBasicBlock);
        GetElementPtrPtr = tmpPtr;
        GetElementPtrResult = tmpResult;
        GetElementPtrIdx = new ArrayList<>();
        if (GetElementPtrPtr instanceof Register || GetElementPtrPtr instanceof Parameter)
            GetElementPtrPtr.AddRegisterUseInInstruction(this);
        GetElementPtrResult.Defs.add(this);
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(GetElementPtrPtr == originObject){
            GetElementPtrPtr.DeleteRegisterUseInInstruction(this);
            GetElementPtrPtr = newObject;
            GetElementPtrPtr.NeedPtr = originObject.NeedPtr;
            GetElementPtrPtr.AddRegisterUseInInstruction(this);
        }
        for(int i = 0;i < GetElementPtrIdx.size();++i)
            if(GetElementPtrIdx.get(i) == originObject){
                GetElementPtrIdx.get(i).DeleteRegisterUseInInstruction(this);
                newObject.NeedPtr = originObject.NeedPtr;
                GetElementPtrIdx.set(i,newObject);
                GetElementPtrIdx.get(i).AddRegisterUseInInstruction(this);
            }
    }

    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        if(GetElementPtrPtr instanceof Register || GetElementPtrPtr instanceof Parameter)
            res.add(GetElementPtrPtr);
        for(int i = 0;i < GetElementPtrIdx.size();++i)
            if(GetElementPtrIdx.get(i) instanceof Register || GetElementPtrIdx.get(i) instanceof Parameter)
                res.add(GetElementPtrIdx.get(i));
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        res.add(GetElementPtrResult);
        return res;
    }

    @Override
    public void refreshRegisterUse() {
        if (GetElementPtrPtr instanceof Register || GetElementPtrPtr instanceof Parameter)
            GetElementPtrPtr.AddRegisterUseInInstruction(this);
        GetElementPtrResult.Defs.add(this);
        for(int i = 0;i < GetElementPtrIdx.size();++i){
            if(GetElementPtrIdx.get(i) instanceof Register || GetElementPtrIdx.get(i) instanceof Parameter)
                GetElementPtrIdx.get(i).AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public String toString() {
        //<result> = getelementptr <ty>, <ty>* <ptrval>{, [inrange] <ty> <idx>}*
        String tmpBaseTypeName, tmpPointerTypeName;
        if(GetElementPtrPtr.thisType instanceof PointerType){
            tmpBaseTypeName = ((PointerType) GetElementPtrPtr.thisType).baseType.toString();
            tmpPointerTypeName = GetElementPtrPtr.thisType.toString();
        } else {
            tmpBaseTypeName = GetElementPtrPtr.thisType.toString();
            tmpPointerTypeName = tmpBaseTypeName + "*";
        //    throw new RuntimeException("Attention! GEP ptr is not PointerType!"+tmpBaseTypeName);
        }

        StringBuilder GetElementPtrName = new StringBuilder();
        GetElementPtrName.append(GetElementPtrResult.toString() + " = getelementptr ");
        GetElementPtrName.append(tmpBaseTypeName +", " + tmpPointerTypeName + " ");
        GetElementPtrName.append(GetElementPtrPtr.toString());

        for(int i = 0;i < GetElementPtrIdx.size();++i){
            GetElementPtrName.append(", " + GetElementPtrIdx.get(i).thisType.toString() +
                    " " + GetElementPtrIdx.get(i).toString());
        }
        return GetElementPtrName.toString();
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}
