package AST;

import Util.Scope;
import Util.position;

import java.util.ArrayList;

public class funcDefNode extends StmtNode {
    public ArrayList<singlevarDefStmtNode> parDefs; //varname, vartype
    public ArrayList<StmtNode> stmts;
    public String funcName;
    public TypeNode funcType;
    public Scope funcScope;

    public funcDefNode(String funcName, TypeNode funcType, position pos) {
        super(pos);
        this.funcName = funcName;
        this.funcType = funcType;
        this.parDefs = new ArrayList<>();
        this.stmts = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
