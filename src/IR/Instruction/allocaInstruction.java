package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;
import IR.TypeSystem.IRTypeSystem;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class allocaInstruction extends IRInstruction{
    public Register AllocaResult;
    public IRTypeSystem AllocaType;

    public allocaInstruction(IRBasicBlock tmpBasicBlock, Register tmpResult, IRTypeSystem tmpType) {
        super(tmpBasicBlock);
        AllocaResult = tmpResult;
        AllocaType = tmpType;
//        AllocaResult.AddRegisterUseInInstruction(this);
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newOperand) {
    }

    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        return res;
    }

    @Override
    public String toString() {
        //<result> = alloca [inalloca] <type> [, <ty> <NumElements>] [, align <alignment>] [, addrspace(<num>)]     ; yields type addrspace(num)*:result
        return AllocaResult.toString() + " = alloca " + AllocaType.toString();
    }


    public void accept(IRVisitor it){
        it.visit(this);
    }
}
