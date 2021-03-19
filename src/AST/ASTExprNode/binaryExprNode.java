package AST.ASTExprNode;

import AST.ASTVisitor;
import Util.position;

public class binaryExprNode extends ExprNode {
    public ExprNode lhs, rhs;
    public String op;

    public binaryExprNode(String Text,String tmpop, position pos) {
        super(Text,null,pos);
        this.op = tmpop;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
