package AST;

import Util.position;

public class ForStmtNode extends StmtNode {
    public ExprNode initExpr, condExpr, stepExpr;
    public StmtNode stmt;


    public ForStmtNode(ExprNode tmpinitExpr, ExprNode tmpcondExpr, ExprNode tmpstepExpr, StmtNode tmpstmt, position pos) {
        super(pos);
        this.initExpr = tmpinitExpr;
        this.condExpr = tmpcondExpr;
        this.stepExpr = tmpstepExpr;
        this.stmt = tmpstmt;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
