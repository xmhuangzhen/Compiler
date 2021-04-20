package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Parameter;
import IR.Operand.Register;
import IR.TypeSystem.IRTypeSystem;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class allocaInstruction extends IRInstruction{
    public IROperand AllocaResult;
    public IRTypeSystem AllocaType;

    public String AllocaName;

    public allocaInstruction(IRBasicBlock tmpBasicBlock, IROperand tmpResult, IRTypeSystem tmpType) {
        super(tmpBasicBlock);
        AllocaResult = tmpResult;
        AllocaType = tmpType;
        if(tmpResult instanceof Register) AllocaName = ((Register) tmpResult).RegisterName;
        else if(tmpResult instanceof Parameter) AllocaName = ((Parameter) tmpResult).ParameterName;
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
    public void refreshRegisterUse() {

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
