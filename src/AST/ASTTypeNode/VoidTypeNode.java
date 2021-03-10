package AST.ASTTypeNode;

import AST.ASTVisitor;
import Util.position;

public class VoidTypeNode extends TypeNode {

    public VoidTypeNode(String name, position pos){
        super(name, 0, pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
