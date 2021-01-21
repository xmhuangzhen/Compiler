package AST;

import Util.*;

public class NullConstExprNode extends constExprNode{
    public String val;

    public NullConstExprNode(String Text, position pos){
        super(Text,pos);
        val = Text;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
