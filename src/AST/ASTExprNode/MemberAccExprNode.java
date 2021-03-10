package AST.ASTExprNode;

import AST.ASTTypeNode.TypeNode;
import AST.ASTVisitor;
import Util.position;

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
