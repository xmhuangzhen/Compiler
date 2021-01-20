package AST;

import Util.position;

import java.util.ArrayList;

public class varDefStmtNode extends StmtNode {
    public ArrayList<singlevarDefStmtNode> stmts;
    public TypeNode varTypeNode;

    public varDefStmtNode(TypeNode typeNode, position pos) {
        super(pos);
        this.stmts = new ArrayList<>();
        this.varTypeNode = typeNode;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
