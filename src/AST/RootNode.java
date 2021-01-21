package AST;

import Util.*;

import java.util.ArrayList;

public class RootNode extends ASTNode {
    public ArrayList<ProgramUnitNode> ProgramDefs;

    public RootNode(position pos) {
        super(pos);
        ProgramDefs = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}