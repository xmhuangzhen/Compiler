package AST;

import Util.*;

import java.util.ArrayList;

public class FunccalExprNode extends ExprNode{
    public ExprNode funcName;
    public ArrayList<ExprNode> pars;

    public FunccalExprNode(String Text, ExprNode tmpFuncName, position pos){
        super(Text,null,pos);
        this.funcName = tmpFuncName;
        this.pars = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
