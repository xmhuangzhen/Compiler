package AST;

import Util.*;

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
