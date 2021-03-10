package AST.ASTStmtNode;

import AST.ASTVisitor;
import AST.ASTExprNode.*;
import IR.IRBasicBlock;
import Util.position;

public class WhileStmtNode extends StmtNode {
    public ExprNode condExpr;
    public StmtNode stmt;

    public IRBasicBlock destBasicBlock;
    public IRBasicBlock condBasicBlock;

    public WhileStmtNode(ExprNode tmpcondExpr, StmtNode tmpstmt, position pos) {
        super(pos);
        this.condExpr = tmpcondExpr;
        this.stmt = tmpstmt;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
