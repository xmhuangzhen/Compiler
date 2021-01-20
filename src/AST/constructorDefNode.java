package AST;

import Util.position;

import java.util.ArrayList;
import java.util.HashMap;

public class constructorDefNode extends StmtNode {
    public ArrayList<varDefStmtNode> varDefs;
    public HashMap<String, String> parDefs;//varname, type
    public ArrayList<StmtNode> stmts;
    public String FuncName;

    public constructorDefNode(String FuncName, position pos) {
        super(pos);
        this.varDefs = new ArrayList<>();
        this.parDefs = new HashMap<>();
        this.stmts = new ArrayList<>();
        this.FuncName = FuncName;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
