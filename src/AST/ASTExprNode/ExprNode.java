package AST.ASTExprNode;

import AST.ASTNode;
import AST.ASTTypeNode.TypeNode;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import Util.position;

public abstract class ExprNode extends ASTNode {
    public String ExprText;
    public TypeNode ExprType;
    public boolean IsLvalue;

    public IROperand ExprResult;
    public IROperand ExprLResult;


    public IRBasicBlock thenBlock, elseBlock;

    public ExprNode(String text, TypeNode type, position pos) {
        super(pos);
        this.ExprText = text;
        this.ExprType = type;
        this.IsLvalue = false;
        this.ExprResult = null;
        this.ExprLResult = null;

        thenBlock = null;
        elseBlock = null;
    }
}
