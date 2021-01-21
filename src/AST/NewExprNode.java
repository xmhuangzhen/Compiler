package AST;

import Util.*;

import java.util.ArrayList;

public class NewExprNode extends ExprNode{
    public ArrayList<ExprNode> exprDim;
    public int dim;
    public boolean IsWrong;
    public String exprText;
    public TypeNode exprTypeNode;

    public NewExprNode(String tmpexprText, TypeNode tmpTypeNode, position pos){
        super(tmpexprText, tmpTypeNode.getTypeName(), pos);
        this.exprText = tmpexprText;
        this.exprTypeNode = tmpTypeNode;
        this.IsWrong = false;
        this.dim = 0;
        this.exprDim = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
