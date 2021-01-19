package AST;

import Util.*;

public class FuncTypeNode extends TypeNode{
    FuncType functype;

    public FuncTypeNode(String name,position pos){
        super(name, pos);
        this.functype = new FuncType(name);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
