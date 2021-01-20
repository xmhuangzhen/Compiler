package AST;

import Util.*;

public class FuncTypeNode extends TypeNode{
    String FuncTypeName;

    public FuncTypeNode(String tmpTypeName , position pos){
        super(tmpTypeName, 0, pos);
        this.FuncTypeName = tmpTypeName;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
