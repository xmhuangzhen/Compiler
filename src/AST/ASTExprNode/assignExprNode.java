package AST.ASTExprNode;

import AST.ASTVisitor;
import Util.position;

public class assignExprNode extends ExprNode{
    public ExprNode lhs, rhs;

    public assignExprNode(String Text, position pos) {
        super(Text,null,pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
