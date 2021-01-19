package Util;

import Util.error.semanticError;

import java.util.HashMap;

public class Scope {

    private HashMap<String, Type> members;
    private Scope parentScope;


    public Scope(Scope parentScope) {
        members = new HashMap<>();
        this.parentScope = parentScope;
    }

    public Scope parentScope() {
        return parentScope;
    }

    public void defineVariable(String name, Type t, position pos) {
        if (members.containsKey(name))
            throw new semanticError("Semantic Error: variable redefine", pos);
        members.put(name, t);
    }

    public boolean containsVariable(String name, boolean lookUpon) {
        if (members.containsKey(name)) return true;
        else if (parentScope != null && lookUpon)
            return parentScope.containsVariable(name, true);
        else return false;
    }

    public Type getType(String name, boolean lookUpon) {
        if (members.containsKey(name)) return members.get(name);
        else if (parentScope != null && lookUpon)
            return parentScope.getType(name, true);
        return null;
    }

    public void initializeInFunc(){


        //函数：void print(string str);
        //
        //作用：向标准输出流中输出字符串str。
        //
        //函数：void println(string str);
        //
        //作用：向标准输出流中输出字符串str，并且在行尾处输出一个换行符。
        //
        //函数：void printInt(int n);
        //
        //作用：向标准输出流中输出数字n。
        //
        //函数：void printlnInt(int n);
        //
        //作用：向标准输出流中输出数字n，并且在行尾处输出一个换行符。
        //
        //函数：string getString();
        //
        //作用：从标准输入流中读取一行并且返回。
        //
        //函数：int getInt();
        //
        //作用：从标准输入流中读取一个整数，遇到空格、回车符、制表符作为分隔，返回这个整数。
        //
        //函数：string toString(int i);
        //
        //作用：把整数i转换为字符串。
    }
}
