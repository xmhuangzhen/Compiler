package AST.ASTStmtNode;

import AST.ASTNode;
import AST.ASTVisitor;
import Util.position;


public class continueStmtNode extends StmtNode {

    public ASTNode destASTNode;

    public continueStmtNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
