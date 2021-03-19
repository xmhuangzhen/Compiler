package AST.ASTDefNode;

import AST.ASTTypeNode.TypeNode;
import AST.ASTVisitor;
import AST.ProgramUnitNode;
import Util.position;

import java.util.ArrayList;

public class varDefStmtNode extends ProgramUnitNode {
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
