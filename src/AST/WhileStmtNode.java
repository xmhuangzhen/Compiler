package AST;

import Util.position;

public class WhileStmtNode extends StmtNode {
    public ExprNode condExpr;
    public StmtNode stmt;


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
