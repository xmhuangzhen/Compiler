package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;
import IR.TypeSystem.PointerType;

import java.util.ArrayList;

public class getElementPtrInstruction extends IRInstruction{

    public Register GetElementPtrResult;
    public IROperand GetElementPtrPtr;
    public ArrayList<IROperand> GetElementPtrIdx;


    public getElementPtrInstruction(IRBasicBlock tmpBasicBlock, IROperand tmpPtr, Register tmpResult) {
        super(tmpBasicBlock);
        GetElementPtrPtr = tmpPtr;
        GetElementPtrResult = tmpResult;
        GetElementPtrIdx = new ArrayList<>();
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
            throw new RuntimeException("Attention! GEP ptr is not PointerType!");
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
