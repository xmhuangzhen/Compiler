package AST.ASTExprNode;

import AST.ASTVisitor;
import Util.position;

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
