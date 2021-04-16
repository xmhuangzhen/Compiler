package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;

import java.util.HashSet;
import java.util.LinkedHashSet;

public class loadInstruction extends IRInstruction{
    public Register LoadResult;
    public IROperand LoadPointer;

    public loadInstruction(IRBasicBlock tmpBasicBlock, Register tmpResult, IROperand tmpPointer) {
        super(tmpBasicBlock);
        LoadResult = tmpResult;
        LoadPointer = tmpPointer;
        if (LoadPointer instanceof Register)
            LoadPointer.AddRegisterUseInInstruction(this);
        LoadResult.Defs = this;

    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(LoadPointer == originObject){
            LoadPointer.DeleteRegisterUseInInstruction(this);
            LoadPointer = newObject;
            LoadPointer.NeedPtr = originObject.NeedPtr;
            LoadPointer.AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        if(LoadPointer instanceof Register) res.add(LoadPointer);
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        res.add(LoadResult);
        return res;
    }

    @Override
    public String toString() {
        return LoadResult.toString() + " = load " + LoadResult.thisType.toString()
                +", " + LoadPointer.thisType.toString() + " "+ LoadPointer.toString();
    }
    public void accept(IRVisitor it){
        it.visit(this);
    }

}
