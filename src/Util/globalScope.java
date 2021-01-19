package Util;

import AST.FuncTypeNode;
import AST.NonArrayTypeNode;
import AST.TypeNode;
import AST.funcDefNode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class globalScope extends Scope {
    public Map<TypeNode, Type> types;
    public Map<funcDefNode, String> func;
    public ArrayList<String> declared;

    public globalScope(Scope parentScope) {
        super(parentScope);

        types = new HashMap<>();
        position pos = new position(0,0);

        //(1) put basic types -- int bool void string null
        types.put(new NonArrayTypeNode("int",pos), new IntType());
        types.put(new NonArrayTypeNode("bool",pos), new BoolType());
        types.put(new NonArrayTypeNode("void",pos), new VoidType());
        types.put(new NonArrayTypeNode("string",pos), new StringType());
        types.put(new NonArrayTypeNode("null",pos), new NullType());

        declared.add("int");
        declared.add("bool");
        declared.add("void");
        declared.add("string");
        declared.add("null");

        //(2) put basic func -- print ; println ; printInt ; printlnInt ; getString ; getInt ; toString
        funcDefNode tmpfuncDefNode;

        //函数：void print(string str); 作用：向标准输出流中输出字符串str。
        tmpfuncDefNode = new funcDefNode("print", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.put("str",new StringType());
        func.put(tmpfuncDefNode, "print");
        declared.add("print");

        //函数：void println(string str); 作用：向标准输出流中输出字符串str，并且在行尾处输出一个换行符。
        tmpfuncDefNode = new funcDefNode("println", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.put("str",new StringType());
        func.put(tmpfuncDefNode, "println");
        declared.add("println");

        //函数：void printInt(int n); 作用：向标准输出流中输出数字n。
        tmpfuncDefNode = new funcDefNode("printInt", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.put("n",new IntType());
        func.put(tmpfuncDefNode, "printInt");
        declared.add("printInt");

        //函数：void printlnInt(int n); 作用：向标准输出流中输出数字n，并且在行尾处输出一个换行符。
        tmpfuncDefNode = new funcDefNode("printlnInt", new FuncTypeNode("void", pos),pos);
        tmpfuncDefNode.parDefs.put("n",new IntType());
        func.put(tmpfuncDefNode, "printlnInt");
        declared.add("printlnInt");

        //函数：string getString(); 作用：从标准输入流中读取一行并且返回。
        tmpfuncDefNode = new funcDefNode("getString", new FuncTypeNode("string", pos),pos);
        func.put(tmpfuncDefNode, "getString");
        declared.add("getString");

        //函数：int getInt(); 作用：从标准输入流中读取一个整数，遇到空格、回车符、制表符作为分隔，返回这个整数。
        tmpfuncDefNode = new funcDefNode("getInt", new FuncTypeNode("int", pos),pos);
        func.put(tmpfuncDefNode, "getInt");
        declared.add("getInt");

        //函数：string toString(int i); 作用：把整数i转换为字符串。
        tmpfuncDefNode = new funcDefNode("toString", new FuncTypeNode("string", pos),pos);
        tmpfuncDefNode.parDefs.put("i",new IntType());
        func.put(tmpfuncDefNode, "toString");
        declared.add("toString");
    }
/*
    public void addType(String name, Type t, position pos) {
        if (types.containsKey(name))
            throw new semanticError("multiple definition of " + name, pos);
        types.put(new TypeNode(name,pos), t);
    }
*/
    public boolean checkName(String name){
        return declared.contains(name);
    }

    /*
    public Type getTypeFromName(String name, position pos) {
        if (types.containsKey(new NonArrayTypeNode(name,pos))) return types.get(name);
        throw new semanticError("no such type: " + name, pos);
    }*/
}
