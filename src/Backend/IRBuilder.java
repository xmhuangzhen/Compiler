package Backend;

import AST.ASTDefNode.*;
import AST.ASTExprNode.*;
import AST.ASTStmtNode.*;
import AST.ASTTypeNode.*;
import AST.ASTVisitor;
import AST.ProgramUnitNode;
import AST.RootNode;
import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.*;
import IR.TypeSystem.*;
import Util.classScope;
import Util.globalScope;

import java.util.Stack;

public class IRBuilder implements ASTVisitor {
    public globalScope gScope;
    public IRBasicBlock currentBasicBlock;
    public IRModule currentModule;
    public IRFunction currentFunction;
    public String currentClassName;
    public Boolean InFunc;
    public Stack<IRBasicBlock> StackForBreak;
    public Stack<IRBasicBlock> StackForContinue;

    public IRBuilder(globalScope tmpScope){
        gScope = tmpScope;
        currentModule = new IRModule();
        currentBasicBlock = null;
        currentFunction = null;
        InFunc = false;
        StackForBreak = new Stack<>();
        StackForContinue = new Stack<>();
    }

    @Override
    public void visit(RootNode it) {
        //(1) add class functions to module
        for(var tmpProgramDefs: it.ProgramDefs)
            if(tmpProgramDefs instanceof classDefNode) {
                classDefNode tmpClassDefNode = (classDefNode) tmpProgramDefs;

                StructureType tmpThisIRType = new StructureType(tmpClassDefNode.className);
                for(var tmpVar : tmpClassDefNode.varDefs) {
                    for (var tmpSingleVar : tmpVar.stmts) {
                        tmpThisIRType.StructureMemberType.add(currentModule.getIRType(tmpVar.varTypeNode));
                        tmpThisIRType.StructureMemberName.add(tmpSingleVar.varname);
                    }
                }
                currentModule.IRClassTable.put(tmpClassDefNode.className,tmpThisIRType);

                //add constructor (no par)
                FunctionType tmpFuncType = new FunctionType(new VoidType());
                String tmpFuncName = tmpClassDefNode.className + "." + tmpClassDefNode.className;
                IRFunction tmpIRFunction = new IRFunction(tmpFuncType, tmpFuncName);
                currentModule.IRFunctionTable.put(tmpFuncName, tmpIRFunction);

                for (var tmpFunc : tmpClassDefNode.funcDefs) {
                    //add functions in class
                    tmpFuncType = new FunctionType(currentModule.getIRType(tmpFunc.funcType));
                    for (var tmpPar : tmpFunc.parDefs)
                        tmpFuncType.FuncParameter.add(currentModule.getIRType(tmpPar.typeNode));
                    tmpFuncName = tmpClassDefNode.className + "." + tmpFunc.funcName;
                    tmpIRFunction = new IRFunction(tmpFuncType, tmpFuncName);
                    for (var tmpPar : tmpFunc.parDefs) {
                        tmpIRFunction.thisFunctionParameters.add(new Parameter(currentModule.getIRType(tmpPar.typeNode), tmpPar.varname));
                        tmpIRFunction.thisFunctionVariableTable.put(tmpPar.varname, new Register(
                                new PointerType(currentModule.getIRType(tmpPar.typeNode)), tmpPar.varname));
                    }
                    currentModule.IRFunctionTable.put(tmpFuncName, tmpIRFunction);
                }
            }

        //(2) add functions to module
        for(var tmpProgramDefs : it.ProgramDefs){
            if(tmpProgramDefs instanceof funcDefNode){
                funcDefNode tmpFuncDefNode = (funcDefNode) tmpProgramDefs;
                FunctionType tmpFuncType = new FunctionType(currentModule.getIRType(tmpFuncDefNode.funcType));
                for (var tmpPar : tmpFuncDefNode.parDefs)
                    tmpFuncType.FuncParameter.add(currentModule.getIRType(tmpPar.typeNode));
                String tmpFuncName = tmpFuncDefNode.funcName;
                IRFunction tmpIRFunction = new IRFunction(tmpFuncType, tmpFuncName);
                for (var tmpPar : tmpFuncDefNode.parDefs) {
                    tmpIRFunction.thisFunctionParameters.add(new Parameter(currentModule.getIRType(tmpPar.typeNode), tmpPar.varname));
                    tmpIRFunction.thisFunctionVariableTable.put(tmpPar.varname, new Register(
                            new PointerType(currentModule.getIRType(tmpPar.typeNode)),tmpPar.varname));
                }
                currentModule.IRFunctionTable.put(tmpFuncName, tmpIRFunction);
            }
        }

        //(3) declare global variables (declare a function "__init" to save the global variables)
        FunctionType tmpFuncType = new FunctionType(new VoidType());
        String tmpFuncName = "__init";
        IRFunction tmpIRFunction = new IRFunction(tmpFuncType, tmpFuncName);
        currentModule.IRFunctionTable.put(tmpFuncName, tmpIRFunction);

        currentFunction = tmpIRFunction;
        currentBasicBlock = tmpIRFunction.thisEntranceBlock;
        for(var tmpProgramDefs : it.ProgramDefs){
            if(tmpProgramDefs instanceof varDefStmtNode){
                tmpProgramDefs.accept(this);
            }
        }
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,null,
                currentFunction.thisReturnBlock, null));
        currentFunction = null;
        currentBasicBlock = null;

        //(4) visit FuncDefnode &  ClassDefNode
        for(var tmpProgramDefs : it.ProgramDefs){
            if(tmpProgramDefs instanceof classDefNode){
                tmpProgramDefs.accept(this);
            }
        }

        for(var tmpProgramDefs : it.ProgramDefs){
            if(tmpProgramDefs instanceof funcDefNode)
                tmpProgramDefs.accept(this);
        }
    }

    @Override public void visit(ProgramUnitNode it) { }

    @Override
    public void visit(varDefStmtNode it) {
        it.varTypeNode.accept(this);
        for(var tmp : it.stmts)
            tmp.accept(this);
    }

    @Override
    public void visit(singlevarDefStmtNode it) {
        TypeNode tmpSemaTypeNode = it.typeNode;
        IRTypeSystem tmpIRType = currentModule.getIRType(tmpSemaTypeNode);
        if(!InFunc && (currentClassName == null||currentClassName.isEmpty())){
            //global variables
            GlobalVariables tmpResult = new GlobalVariables(new PointerType(tmpIRType),it.varname);
            if(it.varexpr != null){
                it.varexpr.accept(this);
                tmpResult.VariablesInitExpr = it.varexpr.ExprResult;
                currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                        tmpResult.VariablesInitExpr,tmpResult));
            }
            currentModule.IRGlobalVarTable.put(it.varname, tmpResult);
            currentModule.IRGlobbalRegisterTable.put(it.varname,new Register(new PointerType(
                    tmpIRType),it.varname));
            it.thisOperand = tmpResult;
//            throw new RuntimeException();
        } else {
            //local variables
            if(currentFunction != null){
                //in function//////////////////////////////////////////////////////////////
                Register tmpResult = new Register(new PointerType(tmpIRType),it.varname);
                if(it.varexpr != null){
                    it.varexpr.accept(this);
                    currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                            it.varexpr.ExprResult,tmpResult));
                }
//                currentBasicBlock.IRRegisterTable.put(it.varname,tmpResult);
                currentFunction.addVariableinFunc(tmpResult);
                it.thisOperand = tmpResult;
            } else {
                // in class (which variables should be defined at first)
                Register tmpResult = new Register(new PointerType(tmpIRType),currentClassName+"."+it.varname);
                it.thisOperand = tmpResult;
            }
        }
    }

    @Override
    public void visit(classDefNode it) {
        currentClassName = it.className;
        for(var tmp : it.varDefs)
            tmp.accept(this);
        for(var tmp : it.funcDefs)
            tmp.accept(this);
        if(it.consDef != null)
            it.consDef.accept(this);
        currentClassName = null;
    }

    @Override
    public void visit(funcDefNode it) {
        InFunc = true;

        //(1) generate function name
        String tmpFuncName;
        if(currentClassName == null || currentClassName.isEmpty()){
            tmpFuncName = it.funcName;
        } else {
            tmpFuncName = currentClassName + "." + it.funcName;
        }

        //(2) visit par
//        for(var tmp : it.parDefs)
  //          tmp.accept(this);

        //(3) IRFunctionNode has been created in the Program Unit Node, so just use it
        IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncName);
        currentFunction = tmpIRFunction;

        currentFunction.thisReturnValue = new Register(new PointerType(currentModule.getIRType(it.funcType)),
                tmpFuncName+"return_value");
        currentBasicBlock = tmpIRFunction.thisEntranceBlock;

        if(it.funcName.equals("main")){
            Register tmpResult = new Register(new VoidType(),"call_init");
            IRFunction tmpFunc = currentModule.IRFunctionTable.get("__init");
            callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpResult,tmpFunc);
            currentBasicBlock.addBasicBlockInst(tmpCallInst);
        }

        //(4) visit stmts
        for(var tmp : it.stmts)
            tmp.accept(this);

        //(5) goto the last block
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,null,
                currentFunction.thisReturnBlock,null));
        currentBasicBlock = currentFunction.thisReturnBlock;
        currentFunction = null;

        InFunc = false;
    }

    @Override
    public void visit(constructorDefNode it) {
        //the same as the function def but doesn't have pars
        String tmpFuncName = currentClassName + "." + currentClassName;

        IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncName);
        currentFunction = tmpIRFunction;
        currentBasicBlock = tmpIRFunction.thisEntranceBlock;

        for(var tmp : it.stmts) tmp.accept(this);

        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,null,
                currentFunction.thisReturnBlock,null));
        currentBasicBlock = currentFunction.thisReturnBlock;
    }

    @Override public void visit(FuncTypeNode it) { }

    @Override public void visit(NonArrayTypeNode it) { }

    @Override public void visit(ClassTypeNode it) { }

    @Override public void visit(ArrayTypeNode it) { }

    @Override public void visit(VoidTypeNode it) { }

    @Override
    public void visit(returnStmtNode it) {
        if(it.value != null){
            it.value.accept(this);
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    it.value.ExprResult, currentFunction.thisReturnValue));
        }
        //go to the basic block before ret instruction
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,currentFunction.thisLastBasicBlock,null));
    }

    @Override
    public void visit(blockStmtNode it) {
        for(var tmpstmt: it.stmts)
            tmpstmt.accept(this);
    }

    @Override
    public void visit(exprStmtNode it) {
        it.expr.accept(this);
    }

    @Override
    public void visit(ifStmtNode it) {
        //initialize
        IRBasicBlock IfThenBlock = new IRBasicBlock(currentFunction,"if_then_block");
        IRBasicBlock IfElseBlock = null;
        if(it.elseStmt != null)
            IfElseBlock = new IRBasicBlock(currentFunction,"if_else_block");
        IRBasicBlock IfDestBlock = new IRBasicBlock(currentFunction,"if_dest_block");

        //visit condition
        it.condition.thenBasicBlock = IfThenBlock;
        it.condition.elseBasicBlock = IfElseBlock;
        it.condition.accept(this);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                it.condition.ExprResult,it.condition.thenBasicBlock, null));

        //visit then
        currentBasicBlock = IfThenBlock;
        currentFunction.addFunctionBasicBlock(currentBasicBlock);
        it.thenStmt.accept(this);

        //visit else
        if(it.elseStmt != null){
            currentBasicBlock = IfElseBlock;
            currentFunction.addFunctionBasicBlock(currentBasicBlock);
            it.elseStmt.accept(this);
        }

        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,IfDestBlock,null));
        currentFunction.addFunctionBasicBlock(IfDestBlock);
    }

    @Override
    public void visit(ForStmtNode it) {//for(init;cond;step)
        //initialize
        IRBasicBlock ForCondBlock = null;
        if(it.condExpr != null)
            ForCondBlock = new IRBasicBlock(currentFunction,"for_cond_block");
        IRBasicBlock ForStepBlock = null;
        if(it.stepExpr != null)
            ForStepBlock = new IRBasicBlock(currentFunction,"for_step_block");
        IRBasicBlock ForBodyBlock = new IRBasicBlock(currentFunction,"for_body_block");
        IRBasicBlock ForDestBlock = new IRBasicBlock(currentFunction,"for_dest_block");

        //visit init
        if(it.initExpr != null){
            it.initExpr.accept(this);
        }

        //visit condition
        if(it.condExpr != null){
            it.condExpr.thenBasicBlock = ForBodyBlock;
            it.condExpr.elseBasicBlock = ForDestBlock;
            currentBasicBlock = ForCondBlock;
            currentFunction.addFunctionBasicBlock(currentBasicBlock);
            it.condExpr.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.condExpr.ExprResult, ForBodyBlock, ForDestBlock));
        }

        //visit body
        currentBasicBlock = ForBodyBlock;
        currentFunction.addFunctionBasicBlock(currentBasicBlock);

        if(ForStepBlock != null) StackForContinue.push(ForStepBlock);
        else StackForContinue.push(ForBodyBlock);
        StackForBreak.push(ForDestBlock);

        it.stmt.accept(this);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,ForStepBlock,null));

        //visit step
        if(it.stepExpr != null){
            currentBasicBlock = ForStepBlock;
            currentFunction.addFunctionBasicBlock(currentBasicBlock);
            it.stepExpr.accept(this);
            if(ForCondBlock == null)
                currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null,ForBodyBlock,null));
            else
                currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                        null,ForCondBlock,null));
        }

        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,ForDestBlock,null));
        currentFunction.addFunctionBasicBlock(ForDestBlock);
        StackForContinue.pop();
        StackForBreak.pop();
    }

    @Override
    public void visit(WhileStmtNode it) {
        //initialize
        IRBasicBlock WhileCondBlock = new IRBasicBlock(currentFunction,"while_cond_block");
        IRBasicBlock WhileBodyBlock = new IRBasicBlock(currentFunction,"while_body_block");
        IRBasicBlock WhileDestBlock = new IRBasicBlock(currentFunction,"while_dest_block");

        //visit cond
        it.condExpr.thenBasicBlock = WhileBodyBlock;
        it.condExpr.elseBasicBlock = WhileDestBlock;
        currentBasicBlock = WhileCondBlock;
        currentFunction.addFunctionBasicBlock(currentBasicBlock);
        it.condExpr.accept(this);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                it.condExpr.ExprResult, WhileBodyBlock,WhileDestBlock));

        //visit body
        currentBasicBlock = WhileBodyBlock;
        currentFunction.addFunctionBasicBlock(currentBasicBlock);
        StackForBreak.push(WhileDestBlock);
        StackForContinue.push(WhileCondBlock);
        it.stmt.accept(this);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,WhileCondBlock,WhileDestBlock));
        currentFunction.addFunctionBasicBlock(WhileDestBlock);
        StackForBreak.pop();
        StackForContinue.pop();
    }

    @Override
    public void visit(continueStmtNode it) {
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,StackForContinue.peek(),null));
    }

    @Override
    public void visit(breakStmtNode it) {
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,StackForBreak.peek(),null));
    }

    @Override
    public void visit(assignExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        it.ExprResult = it.rhs.ExprResult;
        currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                it.rhs.ExprResult, it.lhs.ExprResult));
    }

    @Override
    public void visit(binaryExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        String RegisterName;
        Register tmpResult = null;

        if(it.op.equals("*")){
            RegisterName = "mul";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),RegisterName);
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.mul,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
        } else if(it.op.equals("/")){
            RegisterName = "sdiv";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),RegisterName);
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sdiv,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
        } else if(it.op.equals("%")){
            RegisterName = "srem";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),RegisterName);
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.srem,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
        } else if(it.op.equals("-")){
            RegisterName = "sub";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),RegisterName);
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
        } else if(it.op.equals("<<")){
            RegisterName = "shl";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),RegisterName);
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.shl,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
        } else if(it.op.equals(">>")){
            RegisterName = "ashr";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),RegisterName);
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.ashr,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
        } else if(it.op.equals("&")){
            RegisterName = "and";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),RegisterName);
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.and,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
        } else if(it.op.equals("|")){
            RegisterName = "or";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),RegisterName);
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.or,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
        } else if(it.op.equals("^")){
            RegisterName = "ashr";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),RegisterName);
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
        } else if(it.op.equals("+")){
            RegisterName = "add";
            if(it.lhs.ExprType.Typename.equals("int")){
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),RegisterName);
                /*if(it.lhs.ExprResult == null){
                    StringBuilder tmpString = new StringBuilder();
                    //tmpString.append(currentFunction);
                    throw new semanticError(currentFunction.thisFunctionName, new position(0,0));
                }*/
                currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                        binaryOpInstruction.BinaryOperandENUM.add,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            } else if(it.lhs.ExprType.Typename.equals("string")){
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),RegisterName);
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_add");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if(it.op.equals(">")){
            RegisterName = "sgt";
            if(it.lhs.ExprType.Typename.equals("int")){
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),RegisterName);
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sgt, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult,it.rhs.ExprResult,tmpResult));
            } else if(it.lhs.ExprType.Typename.equals("string")){
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),RegisterName);
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_sgt");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if(it.op.equals("<")){
            RegisterName = "slt";
            if(it.lhs.ExprType.Typename.equals("int")){
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),RegisterName);
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.slt, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult,it.rhs.ExprResult,tmpResult));
            } else if(it.lhs.ExprType.Typename.equals("string")){
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),RegisterName);
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_slt");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if(it.op.equals(">=")){
            RegisterName = "sge";
            if(it.lhs.ExprType.Typename.equals("int")){
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),RegisterName);
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sge, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult,it.rhs.ExprResult,tmpResult));
            } else if(it.lhs.ExprType.Typename.equals("string")){
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),RegisterName);
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_sge");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if(it.op.equals("<=")){
            RegisterName = "sle";
            if(it.lhs.ExprType.Typename.equals("int")){
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),RegisterName);
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sle, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult,it.rhs.ExprResult,tmpResult));
            } else if(it.lhs.ExprType.Typename.equals("string")){
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),RegisterName);
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_sle");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if(it.op.equals("==")){
            RegisterName = "eq";
            if(it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName);
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if(it.lhs.ExprType.Typename.equals("bool")){
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName);
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i1),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if(it.lhs.ExprType.Typename.equals("string")){
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),RegisterName);
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_eq");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else if(it.lhs.ExprType.Typename.equals("null")){
                if(it.rhs.ExprType.Typename.equals("null")){
                    it.ExprResult = new BooleanConstant(true);
                } else {
                    //todo
                }
            }
        } else if(it.op.equals("!=")){
            RegisterName = "ne";
            if(it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName);
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if(it.lhs.ExprType.Typename.equals("bool")){
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName);
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i1),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if(it.lhs.ExprType.Typename.equals("string")){
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),RegisterName);
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_ne");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else if(it.lhs.ExprType.Typename.equals("null")){
                if(it.rhs.ExprType.Typename.equals("null")){
                    it.ExprResult = new BooleanConstant(false);
                } else {
                    //todo
                }
            }
        } else if(it.op.equals("&&")){ // a && b
            IRBasicBlock AndandBBlock = new IRBasicBlock(currentFunction,"andand_b_block");
            IRBasicBlock AndandDestBlock = new IRBasicBlock(currentFunction,"andand_dest_block");
            IRBasicBlock phiBlock1, phiBlock2;

            it.lhs.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,it.lhs.ExprResult,
                    AndandBBlock,AndandDestBlock));
            phiBlock1 = currentBasicBlock;

            currentBasicBlock = AndandBBlock;
            currentFunction.addFunctionBasicBlock(currentBasicBlock);
            it.rhs.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,null,
                    AndandDestBlock,null));
            phiBlock2 = currentBasicBlock;

            currentBasicBlock = AndandDestBlock;
            currentFunction.addFunctionBasicBlock(currentBasicBlock);
            RegisterName = "Andand";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),RegisterName);
            phiInstruction tmpphiInst = new phiInstruction(currentBasicBlock,tmpResult);
            tmpphiInst.PhiLabel.add(phiBlock1); tmpphiInst.PhiValue.add(new BooleanConstant(false));
            tmpphiInst.PhiLabel.add(phiBlock2); tmpphiInst.PhiValue.add(it.rhs.ExprResult);
            currentBasicBlock.addBasicBlockInst(tmpphiInst);
        } else if(it.op.equals("||")){
            IRBasicBlock OrorBBlock = new IRBasicBlock(currentFunction,"oror_b_block");
            IRBasicBlock OrorDestBlock = new IRBasicBlock(currentFunction,"oror_dest_block");
            IRBasicBlock phiBlock1, phiBlock2;

            it.lhs.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,it.lhs.ExprResult,
                    OrorBBlock,OrorDestBlock));
            phiBlock1 = currentBasicBlock;

            currentBasicBlock = OrorBBlock;
            currentFunction.addFunctionBasicBlock(currentBasicBlock);
            it.rhs.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,null,
                    OrorDestBlock,null));
            phiBlock2 = currentBasicBlock;

            currentBasicBlock = OrorDestBlock;
            currentFunction.addFunctionBasicBlock(currentBasicBlock);
            RegisterName = "Oror";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),RegisterName);
            phiInstruction tmpphiInst = new phiInstruction(currentBasicBlock,tmpResult);
            tmpphiInst.PhiLabel.add(phiBlock1); tmpphiInst.PhiValue.add(new BooleanConstant(true));
            tmpphiInst.PhiLabel.add(phiBlock2); tmpphiInst.PhiValue.add(it.rhs.ExprResult);
            currentBasicBlock.addBasicBlockInst(tmpphiInst);
        } else {
            throw new RuntimeException();
        }
        it.ExprResult = tmpResult;
    }

    @Override
    public void visit(constExprNode it) { }

    public Register NewArrayMalloc(int cur_dim, IRTypeSystem cur_type, NewExprNode it){
        //(1) call malloc function
        Register tmpCallResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),"call_malloc_func");
        IRFunction tmpCallFunc = currentModule.IRFunctionTable.get("__malloc_foo");
        if(tmpCallFunc == null){ throw new RuntimeException(it.ExprText); }
        callInstruction tmpCallInst = new callInstruction(currentBasicBlock,tmpCallResult,tmpCallFunc);
        //CallSize2 = cur_dim -  cur_type.size + 4(the size of PointerType)
        Register tmpCallSize1 = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"call_size_1");
        Register tmpCallSize2 = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"call_size_2");
        currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock, binaryOpInstruction.BinaryOperandENUM.sub,
                it.exprDim.get(cur_dim).ExprResult,new IntegerConstant(IntegerType.IRBitWidth.i32,cur_type.getTypeSize()),tmpCallSize1));
        currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock, binaryOpInstruction.BinaryOperandENUM.add,
                tmpCallSize1,new IntegerConstant(IntegerType.IRBitWidth.i32,4),tmpCallSize2));
        tmpCallInst.CallParameters.add(tmpCallSize2);
        currentBasicBlock.addBasicBlockInst(tmpCallInst);
        Register tmpCallCastResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),"call_malloc_cast");
        currentBasicBlock.addBasicBlockInst(new bitcastInstruction(currentBasicBlock,tmpCallResult,
                new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),tmpCallCastResult));
        currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,it.exprDim.get(cur_dim).ExprResult,tmpCallCastResult));//

        //(2) Malloc by recursion, it likes a loop
        if(cur_dim < it.exprDim.size() - 1){
            IRBasicBlock CondBlock = new IRBasicBlock(currentFunction,"cond_block");
            IRBasicBlock BodyBlock = new IRBasicBlock(currentFunction,"body_block");
            IRBasicBlock DestBlock = new IRBasicBlock(currentFunction,"dest_block");

            Register pre_register = new Register(new PointerType(cur_type),"pre_register");
            currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock,pre_register,tmpCallCastResult));

            //(2.1) condition block
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,null,CondBlock,null));
            currentBasicBlock = CondBlock;
            currentFunction.addFunctionBasicBlock(currentBasicBlock);
            Register now_element = new Register(new PointerType(cur_type),"now_element");
            getElementPtrInstruction tmpGetElementInst = new getElementPtrInstruction(currentBasicBlock,tmpCallCastResult,now_element);
            tmpGetElementInst.GetElementPtrIdx.add(it.exprDim.get(cur_dim).ExprResult);
            currentBasicBlock.addBasicBlockInst(tmpGetElementInst);
            Register cmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),"cmp_result");
            currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock, icmpInstruction.IcmpOperandENUM.ne,
                    new PointerType(cur_type),now_element,pre_register,cmpResult));
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,cmpResult,BodyBlock,DestBlock));

            //(2.2) body block
            currentBasicBlock = BodyBlock;
            currentFunction.addFunctionBasicBlock(currentBasicBlock);
            Register tmp_pre_register = new Register(new PointerType(cur_type),"tmp_pre_register");
            getElementPtrInstruction tmpGetNextElementInst = new getElementPtrInstruction(currentBasicBlock,pre_register,tmp_pre_register);
            tmpGetNextElementInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32,1));
            currentBasicBlock.addBasicBlockInst(tmpGetNextElementInst);
            Register next_register;

            if(cur_type instanceof PointerType)
                next_register = NewArrayMalloc(cur_dim+1,((PointerType) cur_type).baseType,it);
            else
                throw new RuntimeException();

            currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock,next_register,pre_register));
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,null,CondBlock,null));

            //(2.3) dest block
            currentBasicBlock = DestBlock;
            currentFunction.addFunctionBasicBlock(currentBasicBlock);
        }
        return tmpCallCastResult;
    }

    @Override
    public void visit(NewExprNode it) {
        if(it.ExprType instanceof ArrayTypeNode){
            IRTypeSystem tmpIRType = currentModule.getIRType(((ArrayTypeNode) it.ExprType).baseType);
            for(int i = 0;i < ((ArrayTypeNode) it.ExprType).dimension;++i)
                tmpIRType = new PointerType(tmpIRType);
            for(int i = 0;i < it.exprDim.size();++i)
                it.exprDim.get(i).accept(this);
            Register tmpNewArrayResult = NewArrayMalloc(0,tmpIRType,it);
            it.ExprResult = tmpNewArrayResult;
        } else if(it.ExprType instanceof ClassTypeNode){
            //call malloc function
            Register tmpMallocResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"Malloc_Result");
            IRFunction tmpFunction = currentModule.IRFunctionTable.get("__malloc_foo");
            callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpMallocResult,tmpFunction);
            tmpcallInst.CallParameters.add(
                    new IntegerConstant(IntegerType.IRBitWidth.i32,
                            currentModule.IRClassTable.get(it.ExprType.Typename).getTypeSize()));
            currentBasicBlock.addBasicBlockInst(tmpcallInst);

            //cast the result into classptr
            Register tmpResult = new Register(currentModule.getIRType(it.ExprType), "new");//////
            currentBasicBlock.addBasicBlockInst(new bitcastInstruction(currentBasicBlock,tmpMallocResult,
                    currentModule.getIRType(it.ExprType), tmpResult));
            it.ExprResult = tmpResult;

            //call constructor
            String tmpClassName = ((ClassTypeNode) it.ExprType).ClassName;
            if(gScope.declared_class.get(tmpClassName).consDef != null){
                tmpFunction = currentModule.IRFunctionTable.get(tmpClassName + "." + tmpClassName);
                tmpcallInst = new callInstruction(currentBasicBlock,null,tmpFunction);
                tmpcallInst.CallParameters.add(tmpResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            }
        } else {
            throw new RuntimeException(it.ExprType.Typename);
        }
    }

    @Override
    public void visit(ThisExprNode it) {
        IRTypeSystem CurrentClassType = currentModule.getIRType(it.ExprType);
        /*if(CurrentClassType != null){
            StringBuilder tmpString = new StringBuilder();
            tmpString.append(it.ExprType instanceof ClassTypeNode);
            tmpString.append(",");
            tmpString.append(CurrentClassType instanceof PointerType);
            throw new RuntimeException(it.ExprType.Typename+","+CurrentClassType.toString()+","+tmpString.toString());
        }*/
        //CurrentClassType is already a PointerType
        if(CurrentClassType instanceof PointerType)
            it.ExprResult = new Register(((PointerType) CurrentClassType).baseType,"this");
        else
            throw new RuntimeException();
    }

    @Override
    public void visit(UnaryExprNode it) {
        it.expr.accept(this);
        if(it.op.equals("++")){ //++a
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"PreAdd");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.add,it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32,1),tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult,it.expr.ExprResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("--")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"PreSub");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub,it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32,1),tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult,it.expr.ExprResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("+")){
            it.ExprResult = it.expr.ExprResult;
        } else if(it.op.equals("-")){
            if(it.expr.ExprResult.isConstant()){
                if(it.expr.ExprResult instanceof IntegerConstant)
                    it.ExprResult = new IntegerConstant(IntegerType.IRBitWidth.i32,
                            -((IntegerConstant) it.expr.ExprResult).value);
                else
                    throw new RuntimeException();
            } else {
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"minus");
                currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                        binaryOpInstruction.BinaryOperandENUM.sub,
                        new IntegerConstant(IntegerType.IRBitWidth.i32,1),it.expr.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            }
        } else if(it.op.equals("!")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "not");
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,
                    new BooleanConstant(true), it.expr.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("~")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "notb");
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,
                    new IntegerConstant(IntegerType.IRBitWidth.i32,-1), it.expr.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else {
            throw new RuntimeException();
        }
    }

    @Override
    public void visit(FunccalExprNode it) {
        it.funcName.accept(this);
        for(var tmp : it.pars) tmp.accept(this);

        if(it.funcName instanceof MemberAccExprNode){
            TypeNode tmpTypeNode = ((MemberAccExprNode) it.funcName).expr.ExprType;
            if(tmpTypeNode instanceof ClassTypeNode){
                if(tmpTypeNode.Typename.equals("string")){
                    String tmpFuncNameInString = "__string_"+((MemberAccExprNode) it.funcName).Identifier;
                    IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncNameInString);
                    IRTypeSystem tmpFuncIRType = new PointerType(new IntegerType(IntegerType.IRBitWidth.i8));
                    Register tmpResult = null;
                    if (!tmpFuncIRType.toString().equals("void")) {
                        tmpResult = new Register(tmpFuncIRType, "funccal");
                    }
                    callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpResult, tmpIRFunction);
                    for (var tmp : it.pars) {
                        tmpCallInst.CallParameters.add(tmp.ExprResult);
                    }
                    currentBasicBlock.addBasicBlockInst(tmpCallInst);
                    it.ExprResult = tmpResult;
                }else {
                    ClassTypeNode tmpClassTypeNode = (ClassTypeNode) tmpTypeNode;
                    String tmpFuncNameInString = tmpClassTypeNode.ClassName + "." + ((MemberAccExprNode) it.funcName).Identifier;
                    IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncNameInString);
                    classDefNode tmpclassDefNode = gScope.declared_class.get(tmpClassTypeNode.ClassName);
                    classScope tmpclassScope = tmpclassDefNode.classDefScope;
                    funcDefNode tmpFuncDefNode = tmpclassScope.getfuncDefNode(((MemberAccExprNode) it.funcName).Identifier, true);
                    IRTypeSystem tmpFuncIRType = currentModule.getIRType(tmpFuncDefNode.funcType);
                    Register tmpResult = null;
                    if (!tmpFuncIRType.toString().equals("void")) {
                        tmpResult = new Register(tmpFuncIRType, "funccal");
                    }
                    callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpResult, tmpIRFunction);
                    for (var tmp : it.pars) {
                        tmpCallInst.CallParameters.add(tmp.ExprResult);
                    }
                    currentBasicBlock.addBasicBlockInst(tmpCallInst);
                    it.ExprResult = tmpResult;
                }
            } else if(((MemberAccExprNode) it.funcName).Identifier.equals("size")){//to be debugged
                //array.size()

                IROperand tmpFuncResult = it.funcName.ExprResult;
                if(!(tmpFuncResult.thisType instanceof PointerType)){
                    Register tmpCastResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),
                            "FuncName_bitcast");
                    currentBasicBlock.addBasicBlockInst(new bitcastInstruction(currentBasicBlock,it.funcName.ExprResult,
                            new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),tmpCastResult));
                    tmpFuncResult = tmpCastResult;
                }

                //get the element ptr
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"array_size");
                getElementPtrInstruction tmpGetElementPtr = new getElementPtrInstruction(currentBasicBlock,tmpFuncResult,tmpResult);
                tmpGetElementPtr.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32,-1));
                currentBasicBlock.addBasicBlockInst(tmpGetElementPtr);
                it.ExprResult = tmpResult;
            } else {
                throw new RuntimeException(it.ExprType.Typename);
            }
            //StringBuilder tmpString = new StringBuilder();
            //tmpString.append(tmpTypeNode instanceof ClassTypeNode);
            //throw new RuntimeException("Here"+tmpString.toString());
        } else if(it.funcName instanceof IdExprNode){
            //function which is not in class
            //MAYBE IN CLASS!!!
            String tmpFuncNameInString = ((IdExprNode) it.funcName).Identifier;
            if(currentClassName != null && !currentClassName.isEmpty()){
                tmpFuncNameInString = currentClassName + "." + ((IdExprNode) it.funcName).Identifier;
            }
            IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncNameInString);
            /*funcDefNode tmpFuncDefNode = gScope.getfuncDefNode(tmpFuncNameInString,true);

            if(tmpFuncDefNode == null){
                StringBuilder tmpString = new StringBuilder();
                tmpString.append(tmpFuncNameInString);
                throw new RuntimeException(tmpString.toString());
            }*/

            IRTypeSystem tmpFuncIRType = tmpIRFunction.thisFunctionType;
            //currentModule.getIRType(tmpFuncDefNode.funcType);
            Register tmpResult = null;
            if(!tmpFuncIRType.toString().equals("void")){
                tmpResult = new Register(tmpFuncIRType,"funccal");
            }
            callInstruction tmpCallInst = new callInstruction(currentBasicBlock,tmpResult,tmpIRFunction);
            for(var tmp : it.pars){
                tmpCallInst.CallParameters.add(tmp.ExprResult);
            }
            currentBasicBlock.addBasicBlockInst(tmpCallInst);
            it.ExprResult = tmpResult;
        } else {
            throw new RuntimeException();
        }
    }

    @Override
    public void visit(SelfExprNode it) {
        it.expr.accept(this);
        if(it.op.equals("++")){ //a++
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"SelfAdd");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.add,it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32,1),tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult,it.expr.ExprResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("--")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "SelfSub");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub, it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, 1), tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult, it.expr.ExprResult));
            it.ExprResult = tmpResult;
        }
        //throw new RuntimeException(it.op);
    }

    @Override
    public void visit(MemberAccExprNode it) {
        it.expr.accept(this);

        //(1) get the Class Type of the Member
        IRTypeSystem tmpIRType = currentModule.getIRType(it.expr.ExprType);

        tmpIRType = ((PointerType) tmpIRType).baseType;
        if (tmpIRType instanceof StructureType) {
            String tmpName = ((StructureType) tmpIRType).StructureName + "." + it.Identifier;
            if (currentModule.IRFunctionTable.containsKey(tmpName)) {
                IRFunction tmpFunc = currentModule.IRFunctionTable.get(tmpName);
                Register tmpResult = new Register(tmpFunc.thisFunctionType, "memacc_func");
                it.ExprResult = tmpResult;
                //maybe correct
            } else {
                //(2) get the Identifier in the Class
                IRTypeSystem tmpMemberIRType = null;
                int tmpMemberIndex = 0;
                for (int i = 0; i < ((StructureType) tmpIRType).StructureMemberName.size(); ++i) {
                    if (((StructureType) tmpIRType).StructureMemberName.get(i).equals(it.Identifier)) {
                        tmpMemberIRType = ((StructureType) tmpIRType).StructureMemberType.get(i);
                        break;
                    }
                    ++tmpMemberIndex;
                }

                if (tmpMemberIRType == null) {
                    StringBuilder tmpString = new StringBuilder();
                    tmpString.append("{" + it.Identifier + "}");
                    for (int i = 0; i < ((StructureType) tmpIRType).StructureMemberName.size(); ++i) {
                        tmpString.append("," + ((StructureType) tmpIRType).StructureMemberName.get(i));
                    }
                    throw new RuntimeException(tmpString.toString());
                }

                //(3) do the getElementPtr inst
                String RegisterName = "memacc_result";
                Register tmpResult = new Register(new PointerType(tmpMemberIRType), RegisterName);
                getElementPtrInstruction tmpgetElementPtrInst = new getElementPtrInstruction(currentBasicBlock, it.expr.ExprResult, tmpResult);
                tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, 0));
                tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, tmpMemberIndex));
                currentBasicBlock.addBasicBlockInst(tmpgetElementPtrInst);
                it.ExprResult = tmpResult;
            }
        } else if (it.expr.ExprType.Typename.equals("string")) {
            String tmpName = "__string_" + it.Identifier;
            if (currentModule.IRFunctionTable.containsKey(tmpName)) {
                IRFunction tmpFunc = currentModule.IRFunctionTable.get(tmpName);
                Register tmpResult = new Register(tmpFunc.thisFunctionType, "memacc_func");
                it.ExprResult = tmpResult;
                //maybe correct
            } else
                throw new RuntimeException(tmpName+","+it.ExprText);
        } else if(it.expr.ExprType instanceof ArrayTypeNode){
            if(it.Identifier.equals("size")){
                String tmpName = "__array_size";
                if (currentModule.IRFunctionTable.containsKey(tmpName)) {
                    IRFunction tmpFunc = currentModule.IRFunctionTable.get(tmpName);
                    Register tmpResult = new Register(tmpFunc.thisFunctionType, "memacc_func");
                    it.ExprResult = tmpResult;
                    //maybe correct
                } else
                    throw new RuntimeException(tmpName+","+it.ExprText);
            } else throw new RuntimeException(it.ExprText);
        } else
            throw new RuntimeException(it.ExprText);
    }

    @Override
    public void visit(IdExprNode it) {
        //no Identifier in class
        //no !!! maybe in class
        it.ExprResult = new Register(new PointerType( currentModule.getIRType(it.ExprType)), "Id_"+it.ExprText);
        if(it.ExprResult.thisType == null){
            throw new RuntimeException("IdExpr "+it.ExprText);
        }
        //it.ExprResult = currentBasicBlock.GetVarRegister(it.Identifier);
        /*if(it.ExprResult == null){
            if(currentClassName != null && (!currentClassName.isEmpty())){
                it.ExprResult =
            }
        }
        if(it.ExprResult == null)
            it.ExprResult = currentModule.IRGlobbalRegisterTable.get(it.Identifier);
        *//*
        if(it.ExprResult == null) {
            StringBuilder tmpString = new StringBuilder();
            tmpString.append(currentFunction.thisFunctionVariableTable.containsKey(it.Identifier));
            throw new semanticError(currentFunction.thisFunctionName + "." + it.Identifier+"."+tmpString, new position(0, 0));
        }
         */
    }

    @Override
    public void visit(BoolConstExprNode it) {
        it.ExprResult = new BooleanConstant(it.val);
    }

    @Override
    public void visit(NullConstExprNode it) {
        it.ExprResult = new NullConstant();
    }

    @Override
    public void visit(IntConstExprNode it) {
        it.ExprResult = new IntegerConstant(IntegerType.IRBitWidth.i32,it.val);
    }

    @Override
    public void visit(StringConstExprNode it) {
        GlobalVariables tmpVar = currentModule.addConstString(it.val);
        Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"StringConst");
        getElementPtrInstruction tmpgetElementPtrInst = new getElementPtrInstruction(currentBasicBlock, tmpVar,tmpResult);
        tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32,0));
        tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32,0));
        currentBasicBlock.addBasicBlockInst(tmpgetElementPtrInst);
        it.ExprResult = tmpResult;
    }

    @Override
    public void visit(ArraydefExprNode it) {
        it.arr.accept(this);
        it.index.accept(this);

        Register tmpResult = new Register(it.arr.ExprResult.thisType,"getElementPtr");
        getElementPtrInstruction tmpgetElementPtrInst = new getElementPtrInstruction(currentBasicBlock,it.arr.ExprResult,tmpResult);
        tmpgetElementPtrInst.GetElementPtrIdx.add(it.index.ExprResult);
        currentBasicBlock.addBasicBlockInst(tmpgetElementPtrInst);

        it.ExprResult = tmpResult;
    }
}
