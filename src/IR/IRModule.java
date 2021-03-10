package IR;

import AST.ASTTypeNode.ArrayTypeNode;
import AST.ASTTypeNode.ClassTypeNode;
import AST.ASTTypeNode.NonArrayTypeNode;
import AST.ASTTypeNode.TypeNode;
import IR.Operand.GlobalVariables;
import IR.Operand.Parameter;
import IR.Operand.StringConstant;
import IR.TypeSystem.*;

import java.util.LinkedHashMap;
import java.util.Map;

public class IRModule {
    public Map<String, IRFunction> IRGlobalFunctionTable;
    public Map<String, IRFunction> IRFunctionTable;
    public Map<String, IRTypeSystem> IRTypeTable;
    public Map<String, GlobalVariables> IRGlobalVarTable;
    public Map<String, GlobalVariables> IRConstStringTable;
    public Map<String, StructureType> IRClassTable;

    public IRModule(){
        IRGlobalFunctionTable = new LinkedHashMap<>();
        IRFunctionTable = new LinkedHashMap<>();
        IRTypeTable = new LinkedHashMap<>();
        IRGlobalVarTable = new LinkedHashMap<>();
        IRConstStringTable = new LinkedHashMap<>();
        IRClassTable = new LinkedHashMap<>();

        FunctionType tmpFuncType;
        IRFunction tmpFunc;

        //void print(string str);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"print");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str"));
        IRGlobalFunctionTable.put("print",tmpFunc);

        //void println(string str);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"println");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str"));
        IRGlobalFunctionTable.put("println",tmpFunc);

        //函数：void printInt(int n);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"printInt");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"n"));
        IRGlobalFunctionTable.put("printInt",tmpFunc);

        //函数：void printlnInt(int n);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"printlnInt");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"n"));
        IRGlobalFunctionTable.put("printlnInt",tmpFunc);

        //函数：string getString();
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"getString");
        IRGlobalFunctionTable.put("getString",tmpFunc);

        //函数：int getInt();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"getInt");
        IRGlobalFunctionTable.put("getInt",tmpFunc);

        //函数：string toString(int i);
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"printlnInt");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"i"));
        IRGlobalFunctionTable.put("printlnInt",tmpFunc);

        //----------------------string---------------------------
        //int length(); <StringIdentifier>.length();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_length");
        IRGlobalFunctionTable.put("__string_length",tmpFunc);

        //函数：string substring(int left, int right); 使用：<StringIdentifier>.substring(left, right);
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_substring");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"left"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"right"));
        IRGlobalFunctionTable.put("__string_substring",tmpFunc);

        //函数：int parseInt();  使用：<StringIdentifier>.parseInt();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_parseInt");
        IRGlobalFunctionTable.put("__string_parseInt",tmpFunc);

        //函数：int ord(int pos); 使用：<StringIdentifier>.ord(pos);
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_ord");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"pos"));
        IRGlobalFunctionTable.put("__string_ord",tmpFunc);


        //<array>.size();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__array_size");
        IRGlobalFunctionTable.put("__array_size",tmpFunc);


        //initialize the function"__init__" to store global variables
        tmpFuncType = new FunctionType(new VoidType());
        tmpFunc = new IRFunction(tmpFuncType,"__init__");
        IRGlobalFunctionTable.put("__init__",tmpFunc);

        //+ of string type (str1+str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_add");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRGlobalFunctionTable.put("__string_add",tmpFunc);

        //> of string type (str1>str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_sgt");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRGlobalFunctionTable.put("__string_sgt",tmpFunc);

        //< of string type (str1<str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_slt");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRGlobalFunctionTable.put("__string_slt",tmpFunc);

        //>= of string type (str1>=str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_sge");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRGlobalFunctionTable.put("__string_sge",tmpFunc);

        //<= of string type (str1<=str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_sle");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRGlobalFunctionTable.put("__string_sle",tmpFunc);

        //== of string type (str1==str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_eq");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRGlobalFunctionTable.put("__string_eq",tmpFunc);

        //!= of string type (str1!=str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_ne");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRGlobalFunctionTable.put("__string_ne",tmpFunc);

        //malloc ( int size)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__malloc_foo");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"size"));
        IRGlobalFunctionTable.put("__malloc_foo",tmpFunc);
    }

    public IRTypeSystem getIRType(TypeNode tmpSemaTypeNode) {///???string
        if (tmpSemaTypeNode instanceof ArrayTypeNode) {
            IRTypeSystem tmpBaseType = getIRType(((ArrayTypeNode) tmpSemaTypeNode).baseType);
            for (int i = 0; i < ((ArrayTypeNode) tmpSemaTypeNode).dimension; ++i)
                tmpBaseType = new PointerType(tmpBaseType);
            return tmpBaseType;
        }
        if (tmpSemaTypeNode instanceof ClassTypeNode) {
            if(tmpSemaTypeNode.Typename.equals("string"))
                return new PointerType(new IntegerType(IntegerType.IRBitWidth.i8));
            return new PointerType(IRTypeTable.get(((ClassTypeNode) tmpSemaTypeNode).ClassName));
        }
        if (tmpSemaTypeNode instanceof NonArrayTypeNode) {
            if (tmpSemaTypeNode.Typename.equals("int")) return new IntegerType(IntegerType.IRBitWidth.i32);
            if (tmpSemaTypeNode.Typename.equals("bool")) return new IntegerType(IntegerType.IRBitWidth.i1);
        }
        return new VoidType();
    }

    public void addGlobalVariable(GlobalVariables tmpGlobalVar){
        IRGlobalVarTable.put(tmpGlobalVar.VariablesName, tmpGlobalVar);
    }

    public void addGlobalFunctionTable(IRFunction tmpFunction){
        IRGlobalFunctionTable.put(tmpFunction.thisFunctionName, tmpFunction);
    }

    public GlobalVariables addConstString(String tmpString){
        String RealString = tmpString;
        RealString = RealString.replace("\\n","\n");
        RealString = RealString.replace("\\t","\t");
        RealString = RealString.replace("\\\\","\\");
        RealString = RealString.replace("\\\"","\"");
        RealString = RealString + "\0";
        if(IRConstStringTable.containsKey(RealString))
            return IRConstStringTable.get(RealString);
        else{
            IRTypeSystem tmpIRType = new ArrayType(new IntegerType(IntegerType.IRBitWidth.i8),RealString.length());
            GlobalVariables tmpGlobalVariables = new GlobalVariables(
                    tmpIRType, "const_string_no"+IRConstStringTable.size(),
                    new StringConstant(tmpIRType,RealString));
            IRConstStringTable.put(RealString,tmpGlobalVariables);
            IRGlobalVarTable.put("const_string_no"+IRConstStringTable.size(),tmpGlobalVariables);
            return tmpGlobalVariables;
        }
    }
}
