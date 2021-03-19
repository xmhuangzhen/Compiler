package AST;

import AST.ASTStmtNode.StmtNode;
import Util.position;

public class ProgramUnitNode extends StmtNode {
    public ProgramUnitNode(position pos){
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
