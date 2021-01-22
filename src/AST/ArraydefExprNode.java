package AST;

import Util.*;

public class ArraydefExprNode extends ExprNode{

    public ExprNode arr,index;
    public int dim;

    public ArraydefExprNode(String Text, position pos){
        super(Text,null,pos);
        if(arr instanceof ArraydefExprNode) this.dim = ((ArraydefExprNode) arr).dim - 1;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
