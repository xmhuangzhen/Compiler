package AST;

import Util.*;

public class UnaryExprNode extends ExprNode{
    public String op;
    public ExprNode expr;

    public UnaryExprNode(String text, String type, String tmpop, position pos){
        super(text, type, pos);
        this.op = tmpop;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
