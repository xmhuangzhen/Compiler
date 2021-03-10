package AST.ASTExprNode;

import Util.position;

abstract public class constExprNode extends ExprNode {
    String value;

    public constExprNode(String Text, position pos) {
        super(Text,null,pos);
    }
}
