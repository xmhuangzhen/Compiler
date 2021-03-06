package AST.ASTTypeNode;

import AST.ASTVisitor;
import Util.position;

public class NonArrayTypeNode extends TypeNode {

    public NonArrayTypeNode(String name, position pos){
        super(name, 0, pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
