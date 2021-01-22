package AST;

import Util.*;

public class ArrayTypeNode extends TypeNode {
    public TypeNode baseType;
    public int dimension;
    public funcDefNode funcintsize;

    //int size()

    public ArrayTypeNode(TypeNode tmpTypeNode, position pos){
        super (tmpTypeNode.getTypeName(),0, pos);
        if(tmpTypeNode instanceof ArrayTypeNode){
            this.baseType =((ArrayTypeNode) tmpTypeNode).baseType;
            this.dimension = ((ArrayTypeNode) tmpTypeNode).dimension+1;
        } else {
            this.baseType = tmpTypeNode;
            this.dimension = 1;
        }
        funcintsize = new funcDefNode("size",new NonArrayTypeNode("int",pos),pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }


    @Override
    public String toString(){
        return "ArrayTypeNode # " + baseType.getTypeName() + dimension;
    }
}
