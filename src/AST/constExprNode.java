package AST;

import Util.*;

public class constExprNode extends ExprNode {
    String value;

    public constExprNode(String Text, position pos) {
        super(Text,null,pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
