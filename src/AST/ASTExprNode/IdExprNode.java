package AST.ASTExprNode;

import AST.ASTVisitor;
import IR.Operand.IROperand;
import Util.position;

public class IdExprNode extends ExprNode{
    public String Identifier;
    public IROperand IdAllocaAddr;
    public boolean IsInClass;
    public boolean IsGlobal;

    public IdExprNode (String Text,position pos){
        super(Text,null,pos);
        IsInClass = false;
        IsGlobal = false;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
