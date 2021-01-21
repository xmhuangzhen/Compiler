package AST;

import Util.*;

public class ThisExprNode extends ExprNode{
    public ThisExprNode(String Text,position pos){
        super(Text,null,pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
