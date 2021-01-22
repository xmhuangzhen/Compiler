package Util;

import AST.*;
import Util.error.*;

import java.util.HashMap;
import java.util.Map;

public class globalScope extends Scope {
    public Map<String, TypeNode> types;//typename, typenode
    public Map<String, funcDefNode> declared_func;// funcname, funcdefnode
    public Map<String, classDefNode> declared_class; //classname, classdefnode
    public Map<String, TypeNode> declared_var;// varname , typenode

    public globalScope(Scope parentScope) {
        super(parentScope);

        types = new HashMap<>();
        declared_var = new HashMap<>();
        declared_func = new HashMap<>();
        declared_class = new HashMap<>();
        position pos = new position(0,0);

        //(1) put basic types -- int bool void string null
        types.put("int",new NonArrayTypeNode("int",pos));
        types.put("bool",new NonArrayTypeNode("bool",pos));
        types.put("void",new NonArrayTypeNode("void",pos));
        types.put("string",new ClassTypeNode("string",pos));
        types.put("null", new NonArrayTypeNode("null",pos));

        //(2) put basic func -- print ; println ; printInt ; printlnInt ; getString ; getInt ; toString
        funcDefNode tmpfuncDefNode;

        //函数：void print(string str); 作用：向标准输出流中输出字符串str。
        tmpfuncDefNode = new funcDefNode("print", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.add(new singlevarDefStmtNode("str",null,new ClassTypeNode("string",pos),pos));
        declared_func.put("print",tmpfuncDefNode);

        //函数：void println(string str); 作用：向标准输出流中输出字符串str，并且在行尾处输出一个换行符。
        tmpfuncDefNode = new funcDefNode("println", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.add(new singlevarDefStmtNode("str",null,new ClassTypeNode("string",pos),pos));
        declared_func.put("println",tmpfuncDefNode);

        //函数：void printInt(int n); 作用：向标准输出流中输出数字n。
        tmpfuncDefNode = new funcDefNode("printInt", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.add(new singlevarDefStmtNode("n",null,new NonArrayTypeNode("int",pos),pos));
        declared_func.put("printInt",tmpfuncDefNode);

        //函数：void printlnInt(int n); 作用：向标准输出流中输出数字n，并且在行尾处输出一个换行符。
        tmpfuncDefNode = new funcDefNode("printlnInt", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.add(new singlevarDefStmtNode("n",null,new NonArrayTypeNode("int",pos),pos));
        declared_func.put("printlnInt",tmpfuncDefNode);

        //函数：string getString(); 作用：从标准输入流中读取一行并且返回。
        tmpfuncDefNode = new funcDefNode("getString", new FuncTypeNode("string", pos),pos);
        declared_func.put("getString",tmpfuncDefNode);

        //函数：int getInt(); 作用：从标准输入流中读取一个整数，遇到空格、回车符、制表符作为分隔，返回这个整数。
        tmpfuncDefNode = new funcDefNode("getInt", new FuncTypeNode("int", pos),pos);
        declared_func.put("getInt",tmpfuncDefNode);

        //函数：string toString(int i); 作用：把整数i转换为字符串。
        tmpfuncDefNode = new funcDefNode("toString", new FuncTypeNode("string", pos),pos);
        tmpfuncDefNode.parDefs.add(new singlevarDefStmtNode("i",null,new NonArrayTypeNode("int",pos),pos));
        declared_func.put("toString",tmpfuncDefNode);

        //(3) put string class
        classDefNode tmpclassDefNode = new classDefNode("string", pos);
        tmpclassDefNode.classDefScope = new classScope(this,"string");

        //函数：int length();
        //使用：<StringIdentifier>.length();
        tmpfuncDefNode = new funcDefNode("length", new FuncTypeNode("int", pos),pos);
        tmpclassDefNode.funcDefs.add(tmpfuncDefNode);
        tmpclassDefNode.classDefScope.funcs.put("length",tmpfuncDefNode);

        //函数：string substring(int left, int right);
        //使用：<StringIdentifier>.substring(left, right);
        tmpfuncDefNode = new funcDefNode("substring", new FuncTypeNode("string", pos),pos);
        tmpfuncDefNode.parDefs.add(new singlevarDefStmtNode("left",null,new NonArrayTypeNode("int",pos),pos));
        tmpfuncDefNode.parDefs.add(new singlevarDefStmtNode("right",null,new NonArrayTypeNode("int",pos),pos));
        tmpclassDefNode.funcDefs.add(tmpfuncDefNode);
        tmpclassDefNode.classDefScope.funcs.put("substring",tmpfuncDefNode);

        //函数：int parseInt();
        //使用：<StringIdentifier>.parseInt();
        //作用：返回一个整数，这个整数应该是该字符串的最长前缀。如果该字符串没有一个前缀是整数，结果未定义。如果该整数超界，结果也未定义。
        tmpfuncDefNode = new funcDefNode("parseInt", new FuncTypeNode("int", pos),pos);
        tmpclassDefNode.funcDefs.add(tmpfuncDefNode);
        tmpclassDefNode.classDefScope.funcs.put("parseInt",tmpfuncDefNode);


        //函数：int ord(int pos);
        //使用：<StringIdentifier>.ord(pos);
        //作用：返回字符串中的第pos位上的字符的ASCII码。下标从0开始编号。
        tmpfuncDefNode = new funcDefNode("ord", new FuncTypeNode("int", pos),pos);
        tmpfuncDefNode.parDefs.add(new singlevarDefStmtNode("pos",null,new NonArrayTypeNode("int",pos),pos));
        tmpclassDefNode.funcDefs.add(tmpfuncDefNode);
        tmpclassDefNode.classDefScope.funcs.put("ord",tmpfuncDefNode);


        //常量字符串不具有内建方法，使用内建方法的常量字符串未定义。

        declared_class.put("string",tmpclassDefNode);
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
        return declared_func.get("main").funcType.getTypeName().equals("int");
    }

    public boolean checkMainPar(){
        funcDefNode tmpNode = declared_func.get("main");
        return tmpNode.parDefs.size() == 0;
    }

    public TypeNode getTypeNodeFromName(String name, position pos) {
        if (declared_var.containsKey(name)) return declared_var.get(name);
        throw new semanticError("no such type: " + name, pos);
    }
    public TypeNode getTypeNodeFromFuncName(String name, position pos) {
        if (declared_func.containsKey(name)) return declared_func.get(name).funcType;
        throw new semanticError("no such type: " + name, pos);
    }


    public void defineVariable(String name, TypeNode typeNode, position pos) {
        if (declared_var.containsKey(name))
            throw new semanticError("Semantic Error: variable redefine: "+name, pos);
        declared_var.put(name, typeNode);
    }

    public boolean containsVariable(String name, boolean lookUpon) {
        if (declared_var != null && declared_var.containsKey(name)) return true;
        else return false;
    }

    public TypeNode getVariableTypeNode(String name, boolean lookUpon) {
        if (declared_var != null && declared_var.containsKey(name)) return declared_var.get(name);
        else return null;
    }

    public boolean containsFuncName(String name, boolean lookUpon) {
        if (declared_func != null && declared_func.containsKey(name)) return true;
        else return false;
    }

    public TypeNode getFuncTypeNode(String name, boolean lookUpon) {
        if (declared_func != null && declared_func.containsKey(name)) return declared_func.get(name).funcType;
        else return null;
    }

    public funcDefNode getfuncDefNode(String name, boolean lookUpon) {
        if (declared_func != null && declared_func.containsKey(name)) return declared_func.get(name);
        else return null;
    }



}
