package AST.ASTExprNode;

import AST.ASTVisitor;
import IR.Operand.IROperand;
import Util.position;

public class IdExprNode extends ExprNode{
    public String Identifier;

    public IdExprNode (String Text,position pos){
        super(Text,null,pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
