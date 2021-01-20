package AST;

import Util.*;

public class StringTypeNode extends TypeNode{
    public StringTypeNode(position pos){
        super("string",0,pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
