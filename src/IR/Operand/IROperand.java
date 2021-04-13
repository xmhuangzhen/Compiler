package IR.Operand;

import IR.Instruction.IRInstruction;
import IR.TypeSystem.IRTypeSystem;

import java.util.HashSet;
import java.util.LinkedHashSet;

abstract public class IROperand{
    public IRTypeSystem thisType;
    public boolean NeedPtr;

    //for SSA use
    public IRInstruction Defs;
    public HashSet<IRInstruction> use;

    public IROperand(IRTypeSystem tmpType){
        super();
        thisType = tmpType;
        NeedPtr = false;
        Defs = null;
        use = new LinkedHashSet<>();
    }

    public void AddRegisterUseInInstruction(IRInstruction tmpInst){
        use.add(tmpInst);
    }


    public void ReplaceRegisterUse(IROperand tmpObject){
        HashSet<IRInstruction> tmpUse = new LinkedHashSet<>(use);
        for(IRInstruction tmpInst : tmpUse){
            tmpInst.replaceUse(this, tmpObject);
        }
        use.clear();
    }

    public void DeleteRegisterUseInInstruction(IRInstruction tmpInst){
        if(use.contains(tmpInst)){
            use.remove(tmpInst);
        }
    }

    abstract public boolean isConstant();
}
