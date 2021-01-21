package AST;

import Util.position;

public abstract class ExprNode extends ASTNode {
    public String ExprText;
    public TypeNode ExprType;
    public boolean IsLvalue;

    public ExprNode(String text, TypeNode type, position pos) {
        super(pos);
        this.ExprText = text;
        this.ExprType = type;
        this.IsLvalue = false;
    }

    public boolean isAssignable() {
        return false;
    }
}
