package AST;

import Util.position;

public abstract class ExprNode extends ASTNode {
    public String ExprType;

    public ExprNode(String exprTypeName, position pos) {
        super(pos);
        this.ExprType = exprTypeName;
    }

    public boolean isAssignable() {
        return false;
    }
}
