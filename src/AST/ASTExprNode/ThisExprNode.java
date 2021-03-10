package AST.ASTExprNode;

import AST.ASTVisitor;
import Util.position;

public class ThisExprNode extends ExprNode{
    public ThisExprNode(String Text,position pos){
        super(Text,null,pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
