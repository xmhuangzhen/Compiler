package IR.Operand;

import Backend.IRVisitor;
import IR.TypeSystem.IRTypeSystem;

public class GlobalVariables extends IROperand{
    public String VariablesName;
    public IROperand VariablesInitExpr;

    public GlobalVariables(IRTypeSystem tmpType, String tmpName) {
        super(tmpType);
        VariablesName = tmpName;
    }

    @Override
    public boolean isConstant() {
        return false;
    }

    @Override
    public String toString() {
        return "@" + VariablesName;
    }

}
