package AST;

import Util.*;

public class BoolConstExprNode extends constExprNode{
    public boolean val;

    public BoolConstExprNode(String Text, position pos){
        super(Text,pos);
        val = Text.equals("true");
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
