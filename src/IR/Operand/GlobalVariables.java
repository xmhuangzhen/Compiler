package IR.Operand;

import IR.TypeSystem.IRTypeSystem;

public class GlobalVariables extends IROperand{
    public String VariablesName;
    public IROperand VariablesInitExpr;

    public GlobalVariables(IRTypeSystem tmpType, String tmpName, IROperand tmpInitExpr) {
        super(tmpType);
        VariablesName = tmpName;
        VariablesInitExpr = tmpInitExpr;
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
