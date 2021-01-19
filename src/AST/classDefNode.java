package AST;

import Util.position;

import java.util.ArrayList;

public class classDefNode extends StmtNode {
    public ArrayList<varDefStmtNode> varDefs;
    public ArrayList<funcDefNode> funcDefs;

    public String className;

    public classDefNode(String name, position pos) {
        super(pos);
        this.className = name;
        this.varDefs = new ArrayList<>();
        this.funcDefs = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
