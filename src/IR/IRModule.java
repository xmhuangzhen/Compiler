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
    public Map<String, GlobalVariables> IRGlobalVarTable;
    public Map<String, GlobalVariables> IRConstStringTable;
    public Map<String, StructureType> IRClassTable;

    public IRModule(){
        IRFunctionTable = new LinkedHashMap<>();
        IRGlobalVarTable = new LinkedHashMap<>();
        IRConstStringTable = new LinkedHashMap<>();
        IRClassTable = new LinkedHashMap<>();

        FunctionType tmpFuncType;
        IRFunction tmpFunc;

        //void print(string str);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"print");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str"));
        IRFunctionTable.put("print",tmpFunc);

        //void println(string str);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"println");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str"));
        IRFunctionTable.put("println",tmpFunc);

        //函数：void printInt(int n);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"printInt");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"n"));
        IRFunctionTable.put("printInt",tmpFunc);

        //函数：void printlnInt(int n);
        tmpFuncType = new FunctionType(new VoidType());
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"printlnInt");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"n"));
        IRFunctionTable.put("printlnInt",tmpFunc);

        //函数：string getString();
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"getString");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "getString_return_value");
        IRFunctionTable.put("getString",tmpFunc);

        //函数：int getInt();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"getInt");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "getInt_return_value");
        IRFunctionTable.put("getInt",tmpFunc);

        //函数：string toString(int i);
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"toString");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"i"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "tostring_return_value");
        IRFunctionTable.put("toString",tmpFunc);

        //----------------------string---------------------------
        //int length(); <StringIdentifier>.length();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_length");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_length"+"_return_value");
        IRFunctionTable.put("__string_length",tmpFunc);

        //函数：string substring(int left, int right); 使用：<StringIdentifier>.substring(left, right);
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_substring");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"left"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"right"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_substring"+"_return_value");
        IRFunctionTable.put("__string_substring",tmpFunc);

        //函数：int parseInt();  使用：<StringIdentifier>.parseInt();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_parseInt");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_parseInt"+"_return_value");
        IRFunctionTable.put("__string_parseInt",tmpFunc);

        //函数：int ord(int pos); 使用：<StringIdentifier>.ord(pos);
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__string_ord");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"pos"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_ord"+"_return_value");
        IRFunctionTable.put("__string_ord",tmpFunc);


        //<array>.size();
        tmpFuncType = new FunctionType(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"__array_size");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__array_size"+"_return_value");
        IRFunctionTable.put("__array_size",tmpFunc);

        //initialize the function"__init__" to store global variables
        tmpFuncType = new FunctionType(new VoidType());
        tmpFunc = new IRFunction(tmpFuncType,"__init__");
        tmpFunc.IsBuiltIn = false;
        IRFunctionTable.put("__init__",tmpFunc);

        //+ of string type (str1+str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_add");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_add"+"_return_value");
        IRFunctionTable.put("__string_add",tmpFunc);

        //> of string type (str1>str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_sgt");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_sgt"+"_return_value");
        IRFunctionTable.put("__string_sgt",tmpFunc);

        //< of string type (str1<str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_slt");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_slt"+"_return_value");
        IRFunctionTable.put("__string_slt",tmpFunc);

        //>= of string type (str1>=str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_sge");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_sge"+"_return_value");
        IRFunctionTable.put("__string_sge",tmpFunc);

        //<= of string type (str1<=str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_sle");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_sle"+"_return_value");
        IRFunctionTable.put("__string_sle",tmpFunc);

        //== of string type (str1==str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_eq");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_eq"+"_return_value");
        IRFunctionTable.put("__string_eq",tmpFunc);

        //!= of string type (str1!=str2)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFunc = new IRFunction(tmpFuncType,"__string_ne");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str1"));
        tmpFunc.thisFunctionParameters.add(new Parameter(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"str2"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "__string_ne"+"_return_value");
        IRFunctionTable.put("__string_ne",tmpFunc);

        //byte* malloc(int size)
        tmpFuncType = new FunctionType(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)));
        tmpFuncType.FuncParameter.add(new IntegerType(IntegerType.IRBitWidth.i32));
        tmpFunc = new IRFunction(tmpFuncType,"malloc");
        tmpFunc.IsBuiltIn = true;
        tmpFunc.thisFunctionParameters.add(new Parameter(new IntegerType(IntegerType.IRBitWidth.i32),"size"));
        tmpFunc.thisReturnValue = new Register(new PointerType(tmpFuncType), "malloc"+"_return_value");
        IRFunctionTable.put("malloc",tmpFunc);
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
            String tmpName = ((ClassTypeNode) tmpSemaTypeNode).ClassName;
            StructureType tmpbaseType = IRClassTable.get(tmpName);
            return new PointerType(tmpbaseType);
        }
        if (tmpSemaTypeNode instanceof NonArrayTypeNode) {
            if (tmpSemaTypeNode.Typename.equals("int")) return new IntegerType(IntegerType.IRBitWidth.i32);
            if (tmpSemaTypeNode.Typename.equals("bool")) return new IntegerType(IntegerType.IRBitWidth.i1);
        }
        return new VoidType();
    }

    public GlobalVariables addConstString(String tmpString){
        int StringSize = tmpString.length();
        String RealString = tmpString.substring(1,StringSize-1);
        RealString = RealString.replace("\\n","\n");
        RealString = RealString.replace("\\t","\t");
        RealString = RealString.replace("\\\\","\\");
        RealString = RealString.replace("\\\"","\"");
        //RealString = RealString + "\0";
        if(IRConstStringTable.containsKey(RealString))
            return IRConstStringTable.get(RealString);
        else{
            IRTypeSystem tmpIRType = new ArrayType(new IntegerType(IntegerType.IRBitWidth.i8),RealString.length());
            GlobalVariables tmpGlobalVariables = new GlobalVariables(
                    tmpIRType, "const_string_no"+IRConstStringTable.size());
            tmpGlobalVariables.InitExpr = new StringConstant(tmpIRType,RealString);
            IRConstStringTable.put(RealString,tmpGlobalVariables);
            IRGlobalVarTable.put("const_string_no"+IRConstStringTable.size(),tmpGlobalVariables);
            return tmpGlobalVariables;
        }
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }
}
