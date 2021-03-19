package AST.ASTStmtNode;

import AST.ASTNode;
import AST.ASTVisitor;
import Util.position;


public class breakStmtNode extends StmtNode {

    public ASTNode destASTNode;

    public breakStmtNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
