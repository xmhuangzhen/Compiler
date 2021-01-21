package AST;

import Util.*;

public class ArraydefExprNode extends ExprNode{

    public ArraydefExprNode(String Text, position pos){
        super(Text,null,pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
