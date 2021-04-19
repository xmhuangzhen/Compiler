package IR.Operand;

import IR.Instruction.IRInstruction;
import IR.TypeSystem.IRTypeSystem;

import java.util.HashSet;
import java.util.LinkedHashSet;

abstract public class IROperand {
    public IRTypeSystem thisType;
    public boolean NeedPtr;

    //for SSA use
    public HashSet<IRInstruction> Defs;
    public HashSet<IRInstruction> use;

    public IROperand(IRTypeSystem tmpType) {
        super();
        thisType = tmpType;
        NeedPtr = false;
        Defs = new LinkedHashSet<>();
        use = new HashSet<>();
    }

    public void AddRegisterUseInInstruction(IRInstruction tmpInst) {
        if (!use.contains(tmpInst)) use.add(tmpInst);
    }

    public void ReplaceRegisterUse(IROperand tmpObject) {
        HashSet<IRInstruction> tmpUse = new HashSet<>(use);
        for (IRInstruction tmpInst : tmpUse) {
            tmpInst.replaceUse(this, tmpObject);
        }
        use.clear();
    }

    public void DeleteRegisterUseInInstruction(IRInstruction tmpInst) {
        if (use.contains(tmpInst)) {
            use.remove(tmpInst);
        }
    }

    abstract public boolean isConstant();
}
