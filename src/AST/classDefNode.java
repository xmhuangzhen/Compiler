package AST;

import Util.position;
import Util.Type;

import java.util.ArrayList;

public class classDefNode extends StmtNode {
    public ArrayList<varDefStmtNode> varDefs;
    public ArrayList<funcDefNode> funcDefs;

    public String name;
    public Type type;

    public classDefNode(String name, Type type, position pos) {
        super(pos);
        this.name = name;
        this.type = type;
        this.varDefs = new ArrayList<>();
        this.funcDefs = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
