package Util;

import AST.*;
import Util.error.*;

import java.util.HashMap;
import java.util.Map;

public class globalScope extends Scope {
    public Map<String, TypeNode> types;//typename, typenode
    public Map<String, funcDefNode> declared_func;// funcname, funcdefnode
    public Map<String, TypeNode> declared_var;// varname , typenode

    public globalScope(Scope parentScope) {
        super(parentScope);

        types = new HashMap<>();
        declared_var = new HashMap<>();
        declared_func = new HashMap<>();
        position pos = new position(0,0);

        //(1) put basic types -- int bool void string null
        types.put("int",new NonArrayTypeNode("int",pos));
        types.put("bool",new NonArrayTypeNode("bool",pos));
        types.put("void",new NonArrayTypeNode("void",pos));
        types.put("string",new NonArrayTypeNode("string",pos));
        types.put("null", new NonArrayTypeNode("null",pos));

        //(2) put basic func -- print ; println ; printInt ; printlnInt ; getString ; getInt ; toString
        funcDefNode tmpfuncDefNode;

        //函数：void print(string str); 作用：向标准输出流中输出字符串str。
        tmpfuncDefNode = new funcDefNode("print", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.put("str", "string");
        declared_func.put("print",tmpfuncDefNode);

        //函数：void println(string str); 作用：向标准输出流中输出字符串str，并且在行尾处输出一个换行符。
        tmpfuncDefNode = new funcDefNode("println", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.put("str","string");
        declared_func.put("println",tmpfuncDefNode);

        //函数：void printInt(int n); 作用：向标准输出流中输出数字n。
        tmpfuncDefNode = new funcDefNode("printInt", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.put("n","int");
        declared_func.put("printInt",tmpfuncDefNode);

        //函数：void printlnInt(int n); 作用：向标准输出流中输出数字n，并且在行尾处输出一个换行符。
        tmpfuncDefNode = new funcDefNode("printlnInt", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.put("n","int");
        declared_func.put("printlnInt",tmpfuncDefNode);

        //函数：string getString(); 作用：从标准输入流中读取一行并且返回。
        tmpfuncDefNode = new funcDefNode("getString", new FuncTypeNode("string", pos),pos);
        declared_func.put("getString",tmpfuncDefNode);

        //函数：int getInt(); 作用：从标准输入流中读取一个整数，遇到空格、回车符、制表符作为分隔，返回这个整数。
        tmpfuncDefNode = new funcDefNode("getInt", new FuncTypeNode("int", pos),pos);
        declared_func.put("getInt",tmpfuncDefNode);

        //函数：string toString(int i); 作用：把整数i转换为字符串。
        tmpfuncDefNode = new funcDefNode("toString", new FuncTypeNode("string", pos),pos);
        tmpfuncDefNode.parDefs.put("i","int");
        declared_func.put("toString",tmpfuncDefNode);
    }

    public boolean checkVarName(String varname){
        return declared_var.containsKey(varname);
    }

    public boolean checkVarType(String typename){
        return types.containsKey(typename);
    }

    public boolean checkVarNameList(varDefStmtNode tmpvarDefStmtNode){
        for(singlevarDefStmtNode tmpNode : tmpvarDefStmtNode.stmts){
            if(checkVarName(tmpNode.varname))
                return true;
        }
        return false;
    }

    public boolean checkVarTypeList(varDefStmtNode tmpvarDefStmtNode){
        for(singlevarDefStmtNode tmpNode : tmpvarDefStmtNode.stmts){
            if(!checkVarType(tmpNode.typeNode.getTypeName()))
                return false;
        }
        return true;
    }

    public void addVarList(varDefStmtNode tmpvarDefStmtNode) {
        for (singlevarDefStmtNode tmpNode : tmpvarDefStmtNode.stmts) {
            declared_var.put(tmpNode.varname,tmpNode.typeNode);
        }
    }

    public boolean checkFuncName(String name){
        return declared_func.containsKey(name);
    }

    public boolean checkMainFunction(){
        return declared_func.containsKey("main");
    }

    public boolean checkMainType(){
        return declared_func.equals(new NonArrayTypeNode("int",new position(0,0)));
    }

    public boolean checkMainPar(){
        funcDefNode tmpNode = declared_func.get("main");
        return tmpNode.parDefs.size() == 0;
    }

    public String getTypeFromName(String name, position pos) {
        if (types.containsKey(name)) return types.get(name).getTypeName();
        throw new semanticError("no such type: " + name, pos);
    }
}
