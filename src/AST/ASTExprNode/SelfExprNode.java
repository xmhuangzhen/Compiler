package AST.ASTExprNode;

import AST.ASTTypeNode.TypeNode;
import AST.ASTVisitor;
import Util.position;

public class SelfExprNode extends ExprNode{
    public String op;
    public ExprNode expr;

    public SelfExprNode(String text, TypeNode type, String tmpop, position pos){
        super(text, type, pos);
        this.op = tmpop;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
