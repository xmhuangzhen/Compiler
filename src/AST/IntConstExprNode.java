package AST;

import Util.*;

public class IntConstExprNode extends constExprNode{
    public long val;

    public IntConstExprNode(String Text, position pos){
        super(Text,pos);
        val = Long.parseLong(Text);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
