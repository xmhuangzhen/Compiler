package AST;

import Util.position;

import java.util.ArrayList;

public class varDefStmtNode extends StmtNode {
    public ArrayList<singlevarDefStmtNode> stmts;

    public varDefStmtNode(position pos) {
        super(pos);
        this.stmts = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
