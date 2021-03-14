package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.Register;
import IR.TypeSystem.IRTypeSystem;

public class allocaInstruction extends IRInstruction{
    public Register AllocaResult;
    public IRTypeSystem AllocaType;

    public allocaInstruction(IRBasicBlock tmpBasicBlock, Register tmpResult, IRTypeSystem tmpType) {
        super(tmpBasicBlock);
        AllocaResult = tmpResult;
        AllocaType = tmpType;
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
