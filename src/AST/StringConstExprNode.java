package AST;

import Util.*;

public class StringConstExprNode extends constExprNode{
    public String val;

    public StringConstExprNode(String Text, position pos){
        super(Text,pos);
        val = Text;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
