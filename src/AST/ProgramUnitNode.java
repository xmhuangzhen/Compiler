package AST;

import Util.*;

public class ProgramUnitNode extends StmtNode{
    public ProgramUnitNode(position pos){
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
