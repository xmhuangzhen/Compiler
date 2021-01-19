package AST;

import Util.position;
import Util.Type;

public class singlevarDefStmtNode extends StmtNode {
    public String name;
    public ExprNode init;
    public Type type;

    public singlevarDefStmtNode(String name, ExprNode init, Type type, position pos) {
        super(pos);
        this.name = name;
        this.init = init;
        this.type = type;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
