package AST;

import Util.*;

public class ArrayTypeNode extends TypeNode {
    private String baseType;
    private int dimension;

    //int size()

    public ArrayTypeNode(String baseType, int dimension, position pos){
        super (baseType,0, pos);
        this.baseType = baseType;
        this.dimension = dimension;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
