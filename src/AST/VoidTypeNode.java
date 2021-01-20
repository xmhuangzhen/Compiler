package AST;

import Util.*;

public class VoidTypeNode extends TypeNode{
    public VoidTypeNode(position pos) {
        super("void",0,pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
