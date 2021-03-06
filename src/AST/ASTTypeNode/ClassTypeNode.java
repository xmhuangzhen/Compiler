package AST.ASTTypeNode;

import AST.ASTVisitor;
import Util.position;

public class ClassTypeNode extends TypeNode{

    public String ClassName;

    public ClassTypeNode(String TypeName, position pos){
        super(TypeName, 0, pos);
        ClassName = TypeName;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
