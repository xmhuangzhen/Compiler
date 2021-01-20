package AST;

import Util.position;

public class singlevarDefStmtNode extends StmtNode {
    public String varname;
    public ExprNode varexpr;
    public TypeNode typeNode;

    public singlevarDefStmtNode(String name, ExprNode init, position pos) {
        super(pos);
        this.varname = name;
        this.varexpr = init;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
