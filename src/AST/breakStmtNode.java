package AST;

import Util.position;


public class breakStmtNode extends ASTNode {

    public breakStmtNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
