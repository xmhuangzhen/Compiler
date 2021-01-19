package AST;

import Util.position;
import Util.Type;

import java.util.ArrayList;
import java.util.HashMap;

public class funcDefNode extends StmtNode {
    public ArrayList<varDefStmtNode> varDefs;
    public HashMap<String, Type> parDefs;
    public ArrayList<StmtNode> stmts;
    public String funcName;
    public TypeNode funcType;

    public funcDefNode(String name, TypeNode funcType, position pos) {
        super(pos);
        this.funcName = name;
        this.funcType = funcType;
        this.varDefs = new ArrayList<>();
        this.parDefs = new HashMap<>();
        this.stmts = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
