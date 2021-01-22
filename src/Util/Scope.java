package Util;

import Util.error.semanticError;

import AST.*;

import java.util.Map;
import java.util.HashMap;


public class Scope {
    public Map<String, TypeNode> members;// varname Typenode
    public Map<String, funcDefNode> funcs;// funcname, funcdefnode
    private Scope parentScope;
    public boolean inFunc, inClass;
    public int inLoop;
    public TypeNode FuncReturnType;
    public TypeNode ClassType;

    public Scope(Scope parentScope) {
        this.members = new HashMap<>();
        this.funcs = new HashMap<>();
        this.parentScope = parentScope;
        this.inFunc = false;
        if(parentScope != null && parentScope.inFunc) {
            this.inFunc = true;
            this.FuncReturnType = parentScope.FuncReturnType;
        }
        this.inLoop = 0;
        if(parentScope != null) this.inLoop = parentScope.inLoop;
        this.inClass = false;
    }

    public Scope parentScope() {
        return parentScope;
    }

    public void defineVariable(String name, TypeNode typeNode, position pos) {
        if (members.containsKey(name))
            throw new semanticError("Semantic Error: variable redefine: "+name, pos);
        members.put(name, typeNode);
    }

    public boolean containsVariable(String name, boolean lookUpon) {
        if (members != null && members.containsKey(name)) return true;
        else if (parentScope != null && lookUpon)
            return parentScope.containsVariable(name, true);
        else return false;
    }

    public TypeNode getVariableTypeNode(String name, boolean lookUpon) {
        if (members != null && members.containsKey(name)) return members.get(name);
        else if (parentScope != null && lookUpon)
            return parentScope.getVariableTypeNode(name, true);
        else return null;
    }

    public boolean containsFuncName(String name, boolean lookUpon) {
        if (funcs != null && funcs.containsKey(name)) return true;
        else if (parentScope != null && lookUpon)
            return parentScope.containsFuncName(name, true);
        else return false;
    }

    public TypeNode getFuncTypeNode(String name, boolean lookUpon) {
        if (funcs != null && funcs.containsKey(name)) return funcs.get(name).funcType;
        else if (parentScope != null && lookUpon)
            return parentScope.getFuncTypeNode(name, true);
        else return null;
    }

    public funcDefNode getfuncDefNode(String name, boolean lookUpon) {
        if (funcs != null && funcs.containsKey(name)) return funcs.get(name);
        else if (parentScope != null && lookUpon)
            return parentScope.getfuncDefNode(name, true);
        else return null;
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


}
