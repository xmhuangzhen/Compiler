package AST;

import Util.*;
import java.util.ArrayList;


public class classDefNode extends ProgramUnitNode {
    public ArrayList<funcDefNode> funcDefs; //funcname funcDefNode
    public ArrayList<constructorDefNode> tmpconsDefs; //funcname funcDefNode
    public ArrayList<varDefStmtNode> varDefs; //varname varDefStmtNode
    public constructorDefNode consDef;

    public classScope classDefScope;

    public String className;

    public classDefNode(String ClassName, position pos) {
        super(pos);
        this.className = ClassName;
        this.varDefs = new ArrayList<>();
        this.funcDefs = new ArrayList<>();
        this.tmpconsDefs = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

}
