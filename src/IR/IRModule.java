package IR;

import AST.ASTTypeNode.ArrayTypeNode;
import AST.ASTTypeNode.ClassTypeNode;
import AST.ASTTypeNode.NonArrayTypeNode;
import AST.ASTTypeNode.TypeNode;
import Backend.IRVisitor;
import IR.Operand.GlobalVariables;
import IR.Operand.Parameter;
import IR.Operand.Register;
import IR.Operand.StringConstant;
import IR.TypeSystem.*;

import java.util.LinkedHashMap;
import java.util.Map;

public class IRModule {
    public Map<String, IRFunction> IRFunctionTable;
    //public Map<String, IRTypeSystem> IRTypeTable;
    public Map<String, GlobalVariables> IRGlobalVarTable;
    public Map<String, GlobalVariables> IRConstStringTable;
    public Map<String, StructureType> IRClassTable;
    public Map<String, Register> IRGlobbalRegisterTable;

    public IRModule(){
        IRFunctionTable = new LinkedHashMap<>();
       // IRTypeTable = new LinkedHashMap<>();
        IRGlobalVarTable = new LinkedHashMap<>();
        IRConstStringTable = new LinkedHashMap<>();
        IRClassTable = new LinkedHashMap<>();
        IRGlobbalRegisterTable = new LinkedHashMap<>();

        FunctionType tmpFuncType;
        IRFunction tmpFunc;

        //void print(string str);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"print");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str"));
        IRFunctionTable.put("print",tmpFunc);

        //void println(string str);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"println");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str"));
        IRFunctionTable.put("println",tmpFunc);

        //函数：void printInt(int n);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"printInt");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"n"));
        IRFunctionTable.put("printInt",tmpFunc);

        //函数：void printlnInt(int n);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"printlnInt");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"n"));
        IRFunctionTable.put("printlnInt",tmpFunc);

        //函数：string getString();
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"getString");
        IRFunctionTable.put("getString",tmpFunc);

        //函数：int getInt();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"getInt");
        IRFunctionTable.put("getInt",tmpFunc);

        //函数：string toString(int i);
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"toString");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"i"));
        IRFunctionTable.put("toString",tmpFunc);

        //----------------------string---------------------------
        //int length(); <StringIdentifier>.length();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_length");
        IRFunctionTable.put("__string_length",tmpFunc);

        //函数：string substring(int left, int right); 使用：<StringIdentifier>.substring(left, right);
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_substring");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"left"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"right"));
        IRFunctionTable.put("__string_substring",tmpFunc);

        //函数：int parseInt();  使用：<StringIdentifier>.parseInt();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_parseInt");
        IRFunctionTable.put("__string_parseInt",tmpFunc);

        //函数：int ord(int pos); 使用：<StringIdentifier>.ord(pos);
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_ord");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"pos"));
        IRFunctionTable.put("__string_ord",tmpFunc);


        //<array>.size();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__array_size");
        IRFunctionTable.put("__array_size",tmpFunc);


        //initialize the function"__init__" to store global variables
        tmpFuncType = new FunctionType(new VoidType());
        tmpFunc = new IRFunction(tmpFuncType,"__init__");
        IRFunctionTable.put("__init__",tmpFunc);

        //+ of string type (str1+str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_add");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRFunctionTable.put("__string_add",tmpFunc);

        //> of string type (str1>str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_sgt");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRFunctionTable.put("__string_sgt",tmpFunc);

        //< of string type (str1<str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_slt");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRFunctionTable.put("__string_slt",tmpFunc);

        //>= of string type (str1>=str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_sge");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRFunctionTable.put("__string_sge",tmpFunc);

        //<= of string type (str1<=str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_sle");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRFunctionTable.put("__string_sle",tmpFunc);

        //== of string type (str1==str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_eq");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRFunctionTable.put("__string_eq",tmpFunc);

        //!= of string type (str1!=str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_ne");
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        IRFunctionTable.put("__string_ne",tmpFunc);

        //malloc ( int size)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__malloc_foo");
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"size"));
        IRFunctionTable.put("__malloc_foo",tmpFunc);
    }

    public IRTypeSystem getIRType(TypeNode tmpSemaTypeNode) {///???string--maybe correct
        if (tmpSemaTypeNode instanceof ArrayTypeNode) {
            IRTypeSystem tmpBaseType = getIRType(((ArrayTypeNode) tmpSemaTypeNode).baseType);
            for (int i = 0; i < ((ArrayTypeNode) tmpSemaTypeNode).dimension; ++i)
                tmpBaseType = new PointerType(tmpBaseType);
            return tmpBaseType;
        }
        if (tmpSemaTypeNode instanceof ClassTypeNode) {
            if(tmpSemaTypeNode.Typename.equals("string"))
                return new PointerType(new IntegerType(IntegerType.IRBitWidth.i8));
            //return new PointerType(IRTypeTable.get(((ClassTypeNode) tmpSemaTypeNode).ClassName));
            return new PointerType(IRClassTable.get(((ClassTypeNode) tmpSemaTypeNode).ClassName));
        }
        if (tmpSemaTypeNode instanceof NonArrayTypeNode) {
            if (tmpSemaTypeNode.Typename.equals("int")) return new IntegerType(IntegerType.IRBitWidth.i32);
            if (tmpSemaTypeNode.Typename.equals("bool")) return new IntegerType(IntegerType.IRBitWidth.i1);
        }
        return new VoidType();
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
                    tmpIRType, "const_string_no"+IRConstStringTable.size());
            tmpGlobalVariables.VariablesInitExpr = new StringConstant(tmpIRType,RealString);
            IRConstStringTable.put(RealString,tmpGlobalVariables);
            IRGlobalVarTable.put("const_string_no"+IRConstStringTable.size(),tmpGlobalVariables);
            return tmpGlobalVariables;
        }
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }
}
