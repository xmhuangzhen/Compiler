package AST;

import Util.FuncType;
import Util.position;

public class FuncTypeNode extends TypeNode{
    FuncType functype;

    public FuncTypeNode(String name,position pos){
        super(pos);
        this.functype = new FuncType(name);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
