package AST;

import Util.*;

public class MemberAccExprNode extends ExprNode{
    public ExprNode expr;
    public String Identifier;

    public MemberAccExprNode(String text, TypeNode type, position pos){
        super(text, type, pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
