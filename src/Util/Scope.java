package Util;

import Util.error.semanticError;

import AST.*;

import java.util.Map;
import java.util.HashMap;


public class Scope {
    private Map<String, TypeNode> members;// varname Typenode
    public Map<String, funcDefNode> funcs;// funcname, funcdefnode
    private Scope parentScope;
    public boolean inFunc, inLoop;
    public TypeNode FuncReturnType;

    public Scope(Scope parentScope) {
        this.members = new HashMap<>();
        this.parentScope = parentScope;
        this.inFunc = false;
        this.inLoop = false;
    }

    public Scope parentScope() {
        return parentScope;
    }

    public void defineVariable(String name, TypeNode typeNode, position pos) {
        if (members.containsKey(name))
            throw new semanticError("Semantic Error: variable redefine", pos);
        members.put(name, typeNode);
    }

    public boolean containsVariable(String name, boolean lookUpon) {
        if (members.containsKey(name)) return true;
        else if (parentScope != null && lookUpon)
            return parentScope.containsVariable(name, true);
        else return false;
    }

    public boolean checkVarNameList(varDefStmtNode tmpvarDefStmtNode){
        for(singlevarDefStmtNode tmpNode : tmpvarDefStmtNode.stmts){
            if(containsVariable(tmpNode.varname,true))
                return true;
        }
        return false;
    }

    public boolean checkFuncName(String name){
        return funcs.containsKey(name);
    }

    public void addVarList(varDefStmtNode tmpvarDefStmtNode) {
        for (singlevarDefStmtNode tmpNode : tmpvarDefStmtNode.stmts) {
            defineVariable(tmpNode.varname,tmpNode.typeNode,tmpNode.pos);
        }
    }

/*
    public String getType(String name, boolean lookUpon) {
        if (members.containsKey(name)) return members.get(name);
        else if (parentScope != null && lookUpon)
            return parentScope.getType(name, true);
        return null;
    }
*/
}
