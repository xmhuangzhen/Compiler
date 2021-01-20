package AST;

import Util.*;

public class ClassTypeNode extends TypeNode{

    String ClassName;

    public ClassTypeNode(String TypeName, position pos){
        super(TypeName, 0, pos);
        ClassName = TypeName;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
