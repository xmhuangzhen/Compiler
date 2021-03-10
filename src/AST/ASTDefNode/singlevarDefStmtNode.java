package AST.ASTDefNode;

import AST.ASTExprNode.ExprNode;
import AST.ASTStmtNode.StmtNode;
import AST.ASTTypeNode.TypeNode;
import AST.ASTVisitor;
import IR.Operand.IROperand;
import Util.position;

public class singlevarDefStmtNode extends StmtNode {
    public String varname;
    public ExprNode varexpr;
    public TypeNode typeNode;

    public IROperand thisOperand;

    public singlevarDefStmtNode(String name, ExprNode init, TypeNode typeNode, position pos) {
        super(pos);
        this.varname = name;
        this.varexpr = init;
        this.typeNode = typeNode;
        thisOperand = null;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
