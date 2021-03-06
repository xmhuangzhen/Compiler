package AST.ASTTypeNode;

import AST.ASTNode;
import Util.position;

abstract public class TypeNode extends ASTNode {
    //int bool string null void class

    public String Typename;
    public long size;

    public TypeNode(String Typename, long size, position pos){
        super(pos);
        this.Typename = Typename;
        this.size = size;
    }

    public String getTypeName(){
        return Typename;
    }

    public long getSize(){
        return size;
    }

    @Override public String toString(){
        return Typename;
    }

    @Override public boolean equals(Object obj){
        if(obj instanceof TypeNode){
            return toString().equals(obj.toString());
        }
        else {
            return false;
        }
    }

}
