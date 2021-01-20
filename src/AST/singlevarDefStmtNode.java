package AST;

import Util.position;

public class singlevarDefStmtNode extends StmtNode {
    public String varname;
    public ExprNode varexpr;
    public TypeNode typeNode;

    public singlevarDefStmtNode(String name, ExprNode init, TypeNode typeNode, position pos) {
        super(pos);
        this.varname = name;
        this.varexpr = init;
        this.typeNode = typeNode;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
