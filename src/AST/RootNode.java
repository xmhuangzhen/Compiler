package AST;
import Util.position;

import java.util.ArrayList;


public class RootNode extends ASTNode {
    public ArrayList<classDefNode> classDefs;
    public ArrayList<varDefStmtNode> varDefs;
    public ArrayList<funcDefNode> funcDefs;

    public RootNode(position pos) {
        super(pos);
        classDefs = new ArrayList<>();
        varDefs = new ArrayList<>();
        funcDefs = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}