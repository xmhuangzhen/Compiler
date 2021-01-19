package AST;

import Util.position;

abstract public class TypeNode extends ASTNode {
    String name;
    public TypeNode(String name, position pos) {
        super(pos);
        this.name = name;
    }

}
