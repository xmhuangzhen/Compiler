package AST.ASTDefNode;

import AST.ASTStmtNode.StmtNode;
import AST.ASTTypeNode.TypeNode;
import AST.ASTVisitor;
import Util.Scope;
import Util.position;

import java.util.ArrayList;
import java.util.HashMap;

public class constructorDefNode extends StmtNode {
    public ArrayList<varDefStmtNode> varDefs;
    public HashMap<String, TypeNode> parDefs;//varname, typenode
    public ArrayList<StmtNode> stmts;
    public String FuncName;
    public Scope funcScope;

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
