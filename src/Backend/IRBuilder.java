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
import IR.IRIdExprAddrMap;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.*;
import IR.TypeSystem.*;
import Util.classScope;
import Util.globalScope;

import java.sql.Struct;
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
    public static int BlockNum, RegNum;

    public IRIdExprAddrMap IdAddrMap;

    public IRBuilder(globalScope tmpScope) {
        gScope = tmpScope;
        currentModule = new IRModule();
        currentBasicBlock = null;
        currentFunction = null;
        InFunc = false;
        StackForBreak = new Stack<>();
        StackForContinue = new Stack<>();
        IdAddrMap = null;
        BlockNum = 0;
        RegNum = 0;
    }

    @Override
    public void visit(RootNode it) {
        //(1) add class functions to module
        for (var tmpProgramDefs : it.ProgramDefs)
            if (tmpProgramDefs instanceof classDefNode) {
                classDefNode tmpClassDefNode = (classDefNode) tmpProgramDefs;

                StructureType tmpThisIRType = new StructureType(tmpClassDefNode.className);
                currentModule.IRClassTable.put(tmpClassDefNode.className, tmpThisIRType);
            }
        for (var tmpProgramDefs : it.ProgramDefs)
            if (tmpProgramDefs instanceof classDefNode) {
                classDefNode tmpClassDefNode = (classDefNode) tmpProgramDefs;

                StructureType tmpThisIRType = currentModule.IRClassTable.get(tmpClassDefNode.className);

                for (var tmpVar : tmpClassDefNode.varDefs) {
                    for (var tmpSingleVar : tmpVar.stmts) {
                        tmpThisIRType.StructureMemberType.add(currentModule.getIRType(tmpVar.varTypeNode));
                        tmpThisIRType.StructureMemberName.add(tmpSingleVar.varname);
                    }
                }
                currentModule.IRClassTable.replace(tmpClassDefNode.className, tmpThisIRType);

                //add constructor (no par)
                FunctionType tmpFuncType = new FunctionType(new VoidType());
                String tmpFuncName = tmpClassDefNode.className + "." + tmpClassDefNode.className;
                IRFunction tmpIRFunction = new IRFunction(tmpFuncType, tmpFuncName);
                if (tmpClassDefNode.consDef == null) tmpIRFunction.IsBuiltIn = true;
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
                    Parameter tmpClassPtr = new Parameter(tmpThisIRType, "this");
                    tmpIRFunction.thisFunctionParameters.add(tmpClassPtr);
                    tmpIRFunction.thisFunctionVariableTable.put("this", new Register(
                            new PointerType(tmpThisIRType), "this"));
                    tmpIRFunction.ClassPtr = tmpClassPtr;
                    currentModule.IRFunctionTable.put(tmpFuncName, tmpIRFunction);
                }
            }

        //(2) add functions to module
        for (var tmpProgramDefs : it.ProgramDefs) {
            if (tmpProgramDefs instanceof funcDefNode) {
                funcDefNode tmpFuncDefNode = (funcDefNode) tmpProgramDefs;
                FunctionType tmpFuncType = new FunctionType(currentModule.getIRType(tmpFuncDefNode.funcType));
                for (var tmpPar : tmpFuncDefNode.parDefs)
                    tmpFuncType.FuncParameter.add(currentModule.getIRType(tmpPar.typeNode));
                String tmpFuncName = tmpFuncDefNode.funcName;
                IRFunction tmpIRFunction = new IRFunction(tmpFuncType, tmpFuncName);
                for (var tmpPar : tmpFuncDefNode.parDefs) {
                    tmpIRFunction.thisFunctionParameters.add(new Parameter(currentModule.getIRType(tmpPar.typeNode), tmpPar.varname));
                    tmpIRFunction.thisFunctionVariableTable.put(tmpPar.varname, new Register(
                            new PointerType(currentModule.getIRType(tmpPar.typeNode)), tmpPar.varname));
                }
                currentModule.IRFunctionTable.put(tmpFuncName, tmpIRFunction);
            }
        }

        //(3) declare global variables (declare a function "__init" to save the global variables)
        IRFunction tmpIRFunction = currentModule.IRFunctionTable.get("__init__");

        currentFunction = tmpIRFunction;
        currentBasicBlock = tmpIRFunction.thisEntranceBlock;
        for (var tmpProgramDefs : it.ProgramDefs) {
            if (tmpProgramDefs instanceof varDefStmtNode) {
                tmpProgramDefs.accept(this);
            }
        }
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null,
                currentFunction.thisReturnBlock, null));
        currentBasicBlock = currentFunction.thisReturnBlock;
        currentBasicBlock.addBasicBlockInst(new retInstruction(currentBasicBlock, new VoidType(), null));

        currentFunction = null;
        currentBasicBlock = null;

        //(4) visit FuncDefnode &  ClassDefNode
        for (var tmpProgramDefs : it.ProgramDefs) {
            if (tmpProgramDefs instanceof classDefNode) {
                tmpProgramDefs.accept(this);
            }
        }

        for (var tmpProgramDefs : it.ProgramDefs) {
            if (tmpProgramDefs instanceof funcDefNode)
                tmpProgramDefs.accept(this);
        }
    }

    @Override
    public void visit(ProgramUnitNode it) {
    }

    @Override
    public void visit(varDefStmtNode it) {
        it.varTypeNode.accept(this);
        for (var tmp : it.stmts)
            tmp.accept(this);
    }

    @Override
    public void visit(singlevarDefStmtNode it) {
        TypeNode tmpSemaTypeNode = it.typeNode;
        IRTypeSystem tmpIRType = currentModule.getIRType(tmpSemaTypeNode);
        if (!InFunc && (currentClassName == null || currentClassName.isEmpty())) {
            //global variables
            GlobalVariables tmpResult = new GlobalVariables(new PointerType(tmpIRType), it.varname);
            if (it.varexpr != null) {
                it.varexpr.accept(this);
                tmpResult.VariablesInitExpr = it.varexpr.ExprResult;
                currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                        tmpResult.VariablesInitExpr, tmpResult));
            }
            currentModule.IRGlobalVarTable.put(it.varname, tmpResult);
            it.thisOperand = tmpResult;
        } else {
            //local variables
            if (currentFunction != null) {
                //in function//////////////////////////////////////////////////////////////
                Register tmpResult = new Register(new PointerType(tmpIRType), it.varname + (RegNum++));
                if (it.varexpr != null) {
                    it.varexpr.accept(this);
                    currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                            it.varexpr.ExprResult, tmpResult));
                }
                currentFunction.addVariableinFunc(tmpResult);
                IdAddrMap.AddrMap.put(it.varname, tmpResult);
                it.thisOperand = tmpResult;
            } else {
                // in class (which variables should be defined at first)
                Register tmpResult = new Register(new PointerType(tmpIRType), currentClassName + "." + it.varname + (RegNum++));
                it.thisOperand = tmpResult;
            }
        }
    }

    @Override
    public void visit(classDefNode it) {
        currentClassName = it.className;
        for (var tmp : it.varDefs)
            tmp.accept(this);
        for (var tmp : it.funcDefs)
            tmp.accept(this);
        if (it.consDef != null)
            it.consDef.accept(this);
        currentClassName = null;
    }

    @Override
    public void visit(funcDefNode it) {
        InFunc = true;
        IdAddrMap = new IRIdExprAddrMap(null);

        //(1) generate function name
        String tmpFuncName;
        if (currentClassName == null || currentClassName.isEmpty()) {
            tmpFuncName = it.funcName;
        } else {
            tmpFuncName = currentClassName + "." + it.funcName;
        }

        //(3) IRFunctionNode has been created in the Program Unit Node, so just use it
        IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncName);
        currentFunction = tmpIRFunction;

        //(2) visit par
        for(int i = 0;i < currentFunction.thisFunctionParameters.size();++i){
            IdAddrMap.AddrMap.put(it.parDefs.get(i).varname, currentFunction.thisFunctionParameters.get(i));
        }


        currentFunction.thisReturnValue = new Register(new PointerType(currentModule.getIRType(it.funcType)),
                tmpFuncName + "return_value" + (RegNum++));
        currentBasicBlock = tmpIRFunction.thisEntranceBlock;

        if (it.funcName.equals("main")) {
            Register tmpResult = new Register(new VoidType(), "call_init" + (RegNum++));
            IRFunction tmpFunc = currentModule.IRFunctionTable.get("__init__");
            callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunc);
            currentBasicBlock.addBasicBlockInst(tmpCallInst);
        }

        //(4) visit stmts
        for (var tmp : it.stmts)
            tmp.accept(this);

        //(5) goto the last block
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null,
                currentFunction.thisReturnBlock, null));

        currentBasicBlock = currentFunction.thisReturnBlock;
        IRTypeSystem tmpType = new VoidType();
        if (currentFunction.thisReturnValue != null) {
            if (currentFunction.thisReturnValue.thisType instanceof PointerType)
                tmpType = ((PointerType) currentFunction.thisReturnValue.thisType).baseType;
            else throw new RuntimeException();
        }
        currentBasicBlock.addBasicBlockInst(new retInstruction(currentBasicBlock,
                tmpType, currentFunction.thisReturnValue));

        IdAddrMap = IdAddrMap.ParentMap;
        currentFunction = null;
        currentBasicBlock = null;
        InFunc = false;
    }

    @Override
    public void visit(constructorDefNode it) {
        //the same as the function def but doesn't have pars
        // and return type is VoidType
        InFunc = true;
        IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
        String tmpFuncName = currentClassName + "." + currentClassName;

        IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncName);
        currentFunction = tmpIRFunction;
        currentBasicBlock = tmpIRFunction.thisEntranceBlock;

        for (var tmp : it.stmts) tmp.accept(this);

        //(5) goto the last block
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null,
                currentFunction.thisReturnBlock, null));
        currentBasicBlock = currentFunction.thisReturnBlock;
        currentBasicBlock.addBasicBlockInst(new retInstruction(currentBasicBlock, new VoidType(), null));

        currentFunction = null;
        currentBasicBlock = null;
        InFunc = false;
        IdAddrMap = IdAddrMap.ParentMap;
    }

    @Override
    public void visit(FuncTypeNode it) {
    }

    @Override
    public void visit(NonArrayTypeNode it) {
    }

    @Override
    public void visit(ClassTypeNode it) {
    }

    @Override
    public void visit(ArrayTypeNode it) {
    }

    @Override
    public void visit(VoidTypeNode it) {
    }

    @Override
    public void visit(returnStmtNode it) {
        if (it.value != null) {
            it.value.accept(this);
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    it.value.ExprResult, currentFunction.thisReturnValue));
        }
        //go to the basic block before ret instruction
//        System.out.println(it.value.ExprText+","+currentBasicBlock.BasicBlockName);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null, currentFunction.thisLastBasicBlock, null));
        currentBasicBlock = currentFunction.thisLastBasicBlock;
    }

    @Override
    public void visit(blockStmtNode it) {
        for (var tmpstmt : it.stmts)
            tmpstmt.accept(this);
    }

    @Override
    public void visit(exprStmtNode it) {
        it.expr.accept(this);
    }

    @Override
    public void visit(ifStmtNode it) {
        //initialize
        IRBasicBlock IfThenBlock = new IRBasicBlock(currentFunction, "if_then_block" + (BlockNum++));
        IRBasicBlock IfElseBlock = null;
        if (it.elseStmt != null) {
            IfElseBlock = new IRBasicBlock(currentFunction, "if_else_block" + (BlockNum++));
        }
        IRBasicBlock IfDestBlock = new IRBasicBlock(currentFunction, "if_dest_block" + (BlockNum++));

        //visit condition
        it.condition.accept(this);
        if (IfElseBlock == null)
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.condition.ExprResult, IfThenBlock, IfDestBlock));
        else
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.condition.ExprResult, IfThenBlock, IfElseBlock));

        //visit then
        currentBasicBlock = IfThenBlock;
        IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
        currentFunction.addFunctionBasicBlock(IfThenBlock);
        if (it.thenStmt != null)
            it.thenStmt.accept(this);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null, IfDestBlock, null));
        IdAddrMap = IdAddrMap.ParentMap;

        //visit else
        if (it.elseStmt != null) {
            currentBasicBlock = IfElseBlock;
            IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
            currentFunction.addFunctionBasicBlock(IfElseBlock);
            it.elseStmt.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null, IfDestBlock, null));
            IdAddrMap = IdAddrMap.ParentMap;
        }

        currentBasicBlock = IfDestBlock;
        currentFunction.addFunctionBasicBlock(IfDestBlock);
    }

    @Override
    public void visit(ForStmtNode it) {//for(init;cond;step)
        //initialize
        IRBasicBlock ForCondBlock = null;
        if (it.condExpr != null) {
            ForCondBlock = new IRBasicBlock(currentFunction, "for_cond_block" + (BlockNum++));
        }
        IRBasicBlock ForStepBlock = null;
        if (it.stepExpr != null) {
            ForStepBlock = new IRBasicBlock(currentFunction, "for_step_block" + (BlockNum++));
        }
        IRBasicBlock ForBodyBlock = new IRBasicBlock(currentFunction, "for_body_block" + (BlockNum++));
        IRBasicBlock ForDestBlock = new IRBasicBlock(currentFunction, "for_dest_block" + (BlockNum++));

        //visit init
        if (it.initExpr != null) {
            it.initExpr.accept(this);
        }

        //visit condition
        if (it.condExpr != null) {
            currentBasicBlock = ForCondBlock;
            IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
            currentFunction.addFunctionBasicBlock(ForCondBlock);
            it.condExpr.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.condExpr.ExprResult, ForBodyBlock, ForDestBlock));
            IdAddrMap = IdAddrMap.ParentMap;
        }

        //visit body
        currentBasicBlock = ForBodyBlock;
        IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
        currentFunction.addFunctionBasicBlock(ForBodyBlock);

        if (ForStepBlock != null) StackForContinue.push(ForStepBlock);
        else StackForContinue.push(ForBodyBlock);
        StackForBreak.push(ForDestBlock);

        if (it.stmt != null) it.stmt.accept(this);

        if (ForStepBlock != null)
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null, ForStepBlock, null));
        else {
            if (ForCondBlock != null)
                currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                        null, ForCondBlock, null));
            else currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null, ForBodyBlock, null));
        }
        IdAddrMap = IdAddrMap.ParentMap;

        //visit step
        if (it.stepExpr != null) {
            currentBasicBlock = ForStepBlock;
            IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
            currentFunction.addFunctionBasicBlock(ForStepBlock);
            it.stepExpr.accept(this);
            if (ForCondBlock == null)
                currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                        null, ForBodyBlock, null));
            else
                currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                        null, ForCondBlock, null));
            IdAddrMap = IdAddrMap.ParentMap;
        }

        currentBasicBlock = ForDestBlock;
        currentFunction.addFunctionBasicBlock(ForDestBlock);
        StackForContinue.pop();
        StackForBreak.pop();
    }

    @Override
    public void visit(WhileStmtNode it) {
        //initialize
        IRBasicBlock WhileCondBlock = new IRBasicBlock(currentFunction, "while_cond_block" + (BlockNum++));
        IRBasicBlock WhileBodyBlock = new IRBasicBlock(currentFunction, "while_body_block" + (BlockNum++));
        IRBasicBlock WhileDestBlock = new IRBasicBlock(currentFunction, "while_dest_block" + (BlockNum++));

        //visit cond
        currentBasicBlock = WhileCondBlock;
        IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
        currentFunction.addFunctionBasicBlock(WhileCondBlock);
        it.condExpr.accept(this);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                it.condExpr.ExprResult, WhileBodyBlock, WhileDestBlock));
        IdAddrMap = IdAddrMap.ParentMap;

        //visit body
        currentBasicBlock = WhileBodyBlock;
        IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
        currentFunction.addFunctionBasicBlock(WhileBodyBlock);
        StackForBreak.push(WhileDestBlock);
        StackForContinue.push(WhileCondBlock);
        if (it.stmt != null)
            it.stmt.accept(this);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null, WhileCondBlock, null));
        StackForBreak.pop();
        StackForContinue.pop();
        IdAddrMap = IdAddrMap.ParentMap;

        currentBasicBlock = WhileDestBlock;
        currentFunction.addFunctionBasicBlock(WhileDestBlock);
    }

    @Override
    public void visit(continueStmtNode it) {
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null, StackForContinue.peek(), null));
    }

    @Override
    public void visit(breakStmtNode it) {
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null, StackForBreak.peek(), null));
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
        if ((!it.op.equals("&&")) && (!it.op.equals("||"))) {
            it.lhs.accept(this);
            it.rhs.accept(this);
        }
        String RegisterName;
        Register tmpResult = null;

        if (it.op.equals("*")) {
            RegisterName = "mul";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.mul, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("/")) {
            RegisterName = "sdiv";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sdiv, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("%")) {
            RegisterName = "srem";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.srem, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("-")) {
            RegisterName = "sub";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("<<")) {
            RegisterName = "shl";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.shl, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals(">>")) {
            RegisterName = "ashr";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.ashr, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("&")) {
            RegisterName = "and";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.and, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("|")) {
            RegisterName = "or";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.or, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("^")) {
            RegisterName = "ashr";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("+")) {
            RegisterName = "add";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                        binaryOpInstruction.BinaryOperandENUM.add, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)), RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_add");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if (it.op.equals(">")) {
            RegisterName = "sgt";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sgt, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)), RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_sgt");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if (it.op.equals("<")) {
            RegisterName = "slt";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.slt, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)), RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_slt");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if (it.op.equals(">=")) {
            RegisterName = "sge";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sge, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)), RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_sge");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if (it.op.equals("<=")) {
            RegisterName = "sle";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sle, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)), RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_sle");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if (it.op.equals("==")) {
            RegisterName = "eq";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("bool")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i1),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)), RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_eq");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else if (it.lhs.ExprType.Typename.equals("null")) {
                if (it.rhs.ExprType.Typename.equals("null")) {
                    it.ExprResult = new BooleanConstant(true);
                } else {
                    //todo
                }
            }
        } else if (it.op.equals("!=")) {
            RegisterName = "ne";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.ne, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("bool")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.ne, new IntegerType(IntegerType.IRBitWidth.i1),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)), RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_ne");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else if (it.lhs.ExprType.Typename.equals("null")) {
                if (it.rhs.ExprType.Typename.equals("null")) {
                    it.ExprResult = new BooleanConstant(false);
                } else {
                    //todo
                }
            }
        } else if (it.op.equals("&&")) { // a && b
            //if(it.lhs.ExprText.equals("a!=b"))
            //  throw new RuntimeException(it.rhs.ExprText);
            IRBasicBlock AndandBBlock = new IRBasicBlock(currentFunction, "andand_b_block" + (BlockNum++));
            IRBasicBlock AndandDestBlock = new IRBasicBlock(currentFunction, "andand_dest_block" + (BlockNum++));
            // IRBasicBlock phiBlock1, phiBlock2;

            it.lhs.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, it.lhs.ExprResult,
                    AndandBBlock, AndandDestBlock));
            // phiBlock1 = currentBasicBlock;

            currentBasicBlock = AndandBBlock;
            currentFunction.addFunctionBasicBlock(AndandBBlock);
            it.rhs.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null,
                    AndandDestBlock, null));

            // phiBlock2 = AndandBBlock;

            currentBasicBlock = AndandDestBlock;
            currentFunction.addFunctionBasicBlock(AndandDestBlock);
            //  RegisterName = "Andand";
            //  tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),RegisterName);
            //  phiInstruction tmpphiInst = new phiInstruction(currentBasicBlock,tmpResult);
            // tmpphiInst.PhiLabel.add(phiBlock1); tmpphiInst.PhiValue.add(new BooleanConstant(false));
            // tmpphiInst.PhiLabel.add(phiBlock2); tmpphiInst.PhiValue.add(it.rhs.ExprResult);
            // currentBasicBlock.addBasicBlockInst(tmpphiInst);
        } else if (it.op.equals("||")) {
            IRBasicBlock OrorBBlock = new IRBasicBlock(currentFunction, "oror_b_block" + (BlockNum++));
            IRBasicBlock OrorDestBlock = new IRBasicBlock(currentFunction, "oror_dest_block" + (BlockNum++));
            // IRBasicBlock phiBlock1, phiBlock2;

            it.lhs.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, it.lhs.ExprResult,
                    OrorBBlock, OrorDestBlock));
            // phiBlock1 = currentBasicBlock;


            currentBasicBlock = OrorBBlock;
            currentFunction.addFunctionBasicBlock(OrorBBlock);
            it.rhs.accept(this);
            // currentBasicBlock = OrorBBlock;//////////////
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null,
                    OrorDestBlock, null));
            // phiBlock2 = currentBasicBlock;

            currentBasicBlock = OrorDestBlock;
            currentFunction.addFunctionBasicBlock(OrorDestBlock);
            // RegisterName = "Oror";
            // tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),RegisterName);
            // phiInstruction tmpphiInst = new phiInstruction(currentBasicBlock,tmpResult);
            // tmpphiInst.PhiLabel.add(phiBlock1); tmpphiInst.PhiValue.add(new BooleanConstant(true));
            // tmpphiInst.PhiLabel.add(phiBlock2); tmpphiInst.PhiValue.add(it.rhs.ExprResult);
            // currentBasicBlock.addBasicBlockInst(tmpphiInst);
        } else {
            throw new RuntimeException();
        }
        it.ExprResult = tmpResult;
    }

    @Override
    public void visit(constExprNode it) {
    }

    public Register NewArrayMalloc(int cur_dim, IRTypeSystem cur_type, NewExprNode it) {
        //(1) call malloc function
        Register tmpCallResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),
                "call_malloc_func" + (RegNum++));
        IRFunction tmpCallFunc = currentModule.IRFunctionTable.get("malloc");
        if (tmpCallFunc == null) {
            throw new RuntimeException(it.ExprText);
        }
        callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpCallResult, tmpCallFunc);
        //CallSize2 = cur_dim -  cur_type.size + 4(the size of PointerType)
        Register tmpCallSize1 = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "call_size_1" + (RegNum++));
        Register tmpCallSize2 = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "call_size_2" + (RegNum++));
        currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock, binaryOpInstruction.BinaryOperandENUM.sub,
                it.exprDim.get(cur_dim).ExprResult, new IntegerConstant(IntegerType.IRBitWidth.i32, cur_type.getTypeSize()), tmpCallSize1));
        currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock, binaryOpInstruction.BinaryOperandENUM.add,
                tmpCallSize1, new IntegerConstant(IntegerType.IRBitWidth.i32, 4), tmpCallSize2));
        tmpCallInst.CallParameters.add(tmpCallSize2);
        currentBasicBlock.addBasicBlockInst(tmpCallInst);
        Register tmpCallCastResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),
                "call_malloc_cast" + (RegNum++));
        currentBasicBlock.addBasicBlockInst(new bitcastInstruction(currentBasicBlock, tmpCallResult,
                new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)), tmpCallCastResult));
        currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock, it.exprDim.get(cur_dim).ExprResult, tmpCallCastResult));//

        //(2) Malloc by recursion, it likes a loop
        if (cur_dim < it.exprDim.size() - 1) {
            IRBasicBlock CondBlock = new IRBasicBlock(currentFunction, "cond_block" + (BlockNum++));
            IRBasicBlock BodyBlock = new IRBasicBlock(currentFunction, "body_block" + (BlockNum++));
            IRBasicBlock DestBlock = new IRBasicBlock(currentFunction, "dest_block" + (BlockNum++));

            Register pre_register = new Register(new PointerType(cur_type), "pre_register");
            currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock, pre_register, tmpCallCastResult));

            //(2.1) condition block
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null, CondBlock, null));
            currentBasicBlock = CondBlock;
            currentFunction.addFunctionBasicBlock(CondBlock);
            Register now_element = new Register(new PointerType(cur_type), "now_element" + (RegNum++));
            getElementPtrInstruction tmpGetElementInst = new getElementPtrInstruction(currentBasicBlock, tmpCallCastResult, now_element);
            tmpGetElementInst.GetElementPtrIdx.add(it.exprDim.get(cur_dim).ExprResult);
            currentBasicBlock.addBasicBlockInst(tmpGetElementInst);
            Register cmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "cmp_result" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock, icmpInstruction.IcmpOperandENUM.ne,
                    new PointerType(cur_type), now_element, pre_register, cmpResult));
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, cmpResult, BodyBlock, DestBlock));

            //(2.2) body block
            currentBasicBlock = BodyBlock;
            currentFunction.addFunctionBasicBlock(BodyBlock);
            Register tmp_pre_register = new Register(new PointerType(cur_type), "tmp_pre_register" + (RegNum++));
            getElementPtrInstruction tmpGetNextElementInst = new getElementPtrInstruction(currentBasicBlock, pre_register, tmp_pre_register);
            tmpGetNextElementInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, 1));
            currentBasicBlock.addBasicBlockInst(tmpGetNextElementInst);
            Register next_register;

            if (cur_type instanceof PointerType)
                next_register = NewArrayMalloc(cur_dim + 1, ((PointerType) cur_type).baseType, it);
            else
                throw new RuntimeException();

            currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock, next_register, pre_register));
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null, CondBlock, null));

            //(2.3) dest block
            currentBasicBlock = DestBlock;
            currentFunction.addFunctionBasicBlock(DestBlock);
        }
        return tmpCallCastResult;
    }

    @Override
    public void visit(NewExprNode it) {
        if (it.ExprType instanceof ArrayTypeNode) {
            IRTypeSystem tmpIRType = currentModule.getIRType(((ArrayTypeNode) it.ExprType).baseType);
            for (int i = 0; i < ((ArrayTypeNode) it.ExprType).dimension; ++i)
                tmpIRType = new PointerType(tmpIRType);
            for (int i = 0; i < it.exprDim.size(); ++i)
                it.exprDim.get(i).accept(this);
            Register tmpNewArrayResult = NewArrayMalloc(0, tmpIRType, it);
            it.ExprResult = tmpNewArrayResult;
        } else if (it.ExprType instanceof ClassTypeNode) {
            //call malloc function
            Register tmpMallocResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),
                    "Malloc_Result" + (RegNum++));
            IRFunction tmpFunction = currentModule.IRFunctionTable.get("malloc");
            callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpMallocResult, tmpFunction);
            tmpcallInst.CallParameters.add(
                    new IntegerConstant(IntegerType.IRBitWidth.i32,
                            currentModule.IRClassTable.get(it.ExprType.Typename).getTypeSize()));
            currentBasicBlock.addBasicBlockInst(tmpcallInst);

            //cast the result into classptr
            Register tmpResult = new Register(currentModule.getIRType(it.ExprType), "new" + (RegNum++));//////
            currentBasicBlock.addBasicBlockInst(new bitcastInstruction(currentBasicBlock, tmpMallocResult,
                    currentModule.getIRType(it.ExprType), tmpResult));
            it.ExprResult = tmpResult;

            //call constructor
            String tmpClassName = ((ClassTypeNode) it.ExprType).ClassName;
            if (gScope.declared_class.get(tmpClassName).consDef != null) {
                tmpFunction = currentModule.IRFunctionTable.get(tmpClassName + "." + tmpClassName);
                tmpcallInst = new callInstruction(currentBasicBlock, null, tmpFunction);
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
        if (CurrentClassType instanceof PointerType)
            it.ExprResult = new Register(CurrentClassType, "this" + (RegNum++));
        else
            throw new RuntimeException();
    }

    @Override
    public void visit(UnaryExprNode it) {
        it.expr.accept(this);
        if (it.op.equals("++")) { //++a
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "PreAdd" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.add, it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, 1), tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult, it.expr.ExprResult));
            it.ExprResult = tmpResult;
        } else if (it.op.equals("--")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "PreSub" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub, it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, 1), tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult, it.expr.ExprResult));
            it.ExprResult = tmpResult;
        } else if (it.op.equals("+")) {
            it.ExprResult = it.expr.ExprResult;
        } else if (it.op.equals("-")) {
            if (it.expr.ExprResult.isConstant()) {
                if (it.expr.ExprResult instanceof IntegerConstant)
                    it.ExprResult = new IntegerConstant(IntegerType.IRBitWidth.i32,
                            -((IntegerConstant) it.expr.ExprResult).value);
                else
                    throw new RuntimeException();
            } else {
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "minus" + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                        binaryOpInstruction.BinaryOperandENUM.sub,
                        new IntegerConstant(IntegerType.IRBitWidth.i32, 1), it.expr.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            }
        } else if (it.op.equals("!")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "not" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,
                    new BooleanConstant(true), it.expr.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if (it.op.equals("~")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "notb" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, -1), it.expr.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else {
            throw new RuntimeException();
        }
    }

    @Override
    public void visit(FunccalExprNode it) {
        it.funcName.accept(this);
        for (var tmp : it.pars) tmp.accept(this);

        if (it.funcName instanceof MemberAccExprNode) {
            TypeNode tmpTypeNode = ((MemberAccExprNode) it.funcName).expr.ExprType;
            if (tmpTypeNode instanceof ClassTypeNode) {
                if (tmpTypeNode.Typename.equals("string")) {
                    String tmpFuncNameInString = "__string_" + ((MemberAccExprNode) it.funcName).Identifier;
                    IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncNameInString);
                    IRTypeSystem tmpFuncIRType = new PointerType(new IntegerType(IntegerType.IRBitWidth.i8));
                    Register tmpResult = null;
                    if (!tmpFuncIRType.toString().equals("void")) {
                        tmpResult = new Register(tmpFuncIRType, "funccal" + (RegNum++));
                    }
                    callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpResult, tmpIRFunction);
                    for (var tmp : it.pars) {
                        tmpCallInst.CallParameters.add(tmp.ExprResult);
                    }
                    currentBasicBlock.addBasicBlockInst(tmpCallInst);
                    it.ExprResult = tmpResult;
                } else {
                    ClassTypeNode tmpClassTypeNode = (ClassTypeNode) tmpTypeNode;
                    String tmpFuncNameInString = tmpClassTypeNode.ClassName + "." + ((MemberAccExprNode) it.funcName).Identifier;
                    IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncNameInString);
                    classDefNode tmpclassDefNode = gScope.declared_class.get(tmpClassTypeNode.ClassName);
                    classScope tmpclassScope = tmpclassDefNode.classDefScope;
                    funcDefNode tmpFuncDefNode = tmpclassScope.getfuncDefNode(((MemberAccExprNode) it.funcName).Identifier, true);
                    IRTypeSystem tmpFuncIRType = currentModule.getIRType(tmpFuncDefNode.funcType);
                    Register tmpResult = null;
                    if (!tmpFuncIRType.toString().equals("void")) {
                        tmpResult = new Register(tmpFuncIRType, "funccal" + (RegNum++));
                    }
                    callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpResult, tmpIRFunction);
                    for (var tmp : it.pars) {
                        tmpCallInst.CallParameters.add(tmp.ExprResult);
                    }
                    currentBasicBlock.addBasicBlockInst(tmpCallInst);
                    it.ExprResult = tmpResult;
                }
            } else if (((MemberAccExprNode) it.funcName).Identifier.equals("size")) {//to be debugged
                //array.size()

                IROperand tmpFuncResult = it.funcName.ExprResult;
                if (!(tmpFuncResult.thisType instanceof PointerType)) {
                    Register tmpCastResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),
                            "FuncName_bitcast" + (RegNum++));
                    currentBasicBlock.addBasicBlockInst(new bitcastInstruction(currentBasicBlock, it.funcName.ExprResult,
                            new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)), tmpCastResult));
                    tmpFuncResult = tmpCastResult;
                }

                //get the element ptr
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "array_size" + (RegNum++));
                getElementPtrInstruction tmpGetElementPtr = new getElementPtrInstruction(currentBasicBlock, tmpFuncResult, tmpResult);
                tmpGetElementPtr.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, -1));
                currentBasicBlock.addBasicBlockInst(tmpGetElementPtr);
                it.ExprResult = tmpResult;
            } else {
                throw new RuntimeException(it.ExprType.Typename);
            }
            //StringBuilder tmpString = new StringBuilder();
            //tmpString.append(tmpTypeNode instanceof ClassTypeNode);
            //throw new RuntimeException("Here"+tmpString.toString());
        } else if (it.funcName instanceof IdExprNode) {
            //function which is not in class
            //MAYBE IN CLASS!!!
            String tmpFuncNameInString = ((IdExprNode) it.funcName).Identifier;
            if (currentClassName != null && !currentClassName.isEmpty()) {
                tmpFuncNameInString = currentClassName + "." + ((IdExprNode) it.funcName).Identifier;
            }
            IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncNameInString);
            if (tmpIRFunction == null)
                tmpIRFunction = currentModule.IRFunctionTable.get(((IdExprNode) it.funcName).Identifier);

            if (tmpIRFunction == null) throw new RuntimeException();

            IRTypeSystem tmpFuncIRType = tmpIRFunction.thisFunctionType;
            //currentModule.getIRType(tmpFuncDefNode.funcType);
            Register tmpResult = null;
            if (!tmpFuncIRType.toString().equals("void")) {
                tmpResult = new Register(tmpFuncIRType, "funccal" + (RegNum++));
            }
            callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpResult, tmpIRFunction);
            for (var tmp : it.pars) {
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
        if (it.op.equals("++")) { //a++
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "SelfAdd" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.add, it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, 1), tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult, it.expr.ExprResult));
            it.ExprResult = tmpResult;
        } else if (it.op.equals("--")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "SelfSub" + (RegNum++));
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

        if (tmpIRType == null)
            throw new RuntimeException("MemberAccExprNode error - 1" + it.ExprText);
        if (!(tmpIRType instanceof PointerType))
            throw new RuntimeException();

        tmpIRType = ((PointerType) tmpIRType).baseType;
        if (tmpIRType instanceof StructureType) {
            String tmpName = ((StructureType) tmpIRType).StructureName + "." + it.Identifier;
            if (currentModule.IRFunctionTable.containsKey(tmpName)) {
                IRFunction tmpFunc = currentModule.IRFunctionTable.get(tmpName);
                Register tmpResult = new Register(tmpFunc.thisFunctionType, "memacc_func" + (RegNum++));
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

                if (tmpMemberIRType == null)
                    throw new RuntimeException();

                //(3) do the getElementPtr inst
                String RegisterName = "memacc_result";
                Register tmpResult = new Register(new PointerType(tmpMemberIRType), RegisterName + (RegNum++));
/*                if(!(it.expr.ExprResult.thisType instanceof PointerType)){
                    StringBuilder tmpString = new StringBuilder();
                    tmpString.append(it.expr.ExprResult.thisType instanceof StructureType);
                    throw new RuntimeException(tmpString.toString());
                }
  */
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
                Register tmpResult = new Register(tmpFunc.thisFunctionType, "memacc_func" + (RegNum++));
                it.ExprResult = tmpResult;
                //maybe correct
            } else
                throw new RuntimeException(tmpName + "," + it.ExprText);
        } else if (it.expr.ExprType instanceof ArrayTypeNode) {
            if (it.Identifier.equals("size")) {
                String tmpName = "__array_size";
                if (currentModule.IRFunctionTable.containsKey(tmpName)) {
                    IRFunction tmpFunc = currentModule.IRFunctionTable.get(tmpName);
                    Register tmpResult = new Register(tmpFunc.thisFunctionType, "memacc_func" + (RegNum++));
                    it.ExprResult = tmpResult;
                    //maybe correct
                } else
                    throw new RuntimeException(tmpName + "," + it.ExprText);
            } else throw new RuntimeException(it.ExprText);
        } else
            throw new RuntimeException(it.ExprText);
    }

    @Override
    public void visit(IdExprNode it) {
        it.ExprResult = null;
        if (IdAddrMap != null && IdAddrMap.CheckIdExprAddr(it.Identifier)) {
            //local var
            IROperand tmpVarAddr = IdAddrMap.GetIdExprAddr(it.Identifier);
            it.ExprResult = tmpVarAddr;
            //        Register tmpResult = new Register(tmpVarAddr.thisType, "Id_"+it.Identifier+(RegNum++));
            //      currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock,tmpResult,tmpVarAddr));
            //    it.ExprResult = tmpResult;
        }
        if (it.ExprResult == null && currentClassName != null) { //class member
            StructureType tmpClassType = currentModule.IRClassTable.get(currentClassName);

            IRTypeSystem tmpMemberIRType = null;
            int tmpMemberIndex = 0;
            for (int i = 0; i < tmpClassType.StructureMemberName.size(); ++i) {
                if (tmpClassType.StructureMemberName.get(i).equals(it.Identifier)) {
                    tmpMemberIRType = tmpClassType.StructureMemberType.get(i);
                    break;
                }
                ++tmpMemberIndex;
            }
            if (tmpMemberIRType != null) {
                Register tmpGEPptr = new Register(new PointerType(tmpClassType), "Id_GEP_ptr" + (RegNum++));
                Register tmpGEPResult = new Register(new PointerType(tmpMemberIRType), "Id_GEP_" + (RegNum++));
                getElementPtrInstruction tmpgetElementPtrInst = new getElementPtrInstruction(currentBasicBlock,
                        tmpGEPptr, tmpGEPResult);
                tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, 0));
                tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, tmpMemberIndex));
                currentBasicBlock.addBasicBlockInst(tmpgetElementPtrInst);

                it.ExprResult = tmpGEPptr;
//                Register tmpGEPLoadResult = new Register(new PointerType(tmpMemberIRType), "Id_GEP_Load" + (RegNum++));
                //              currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock, tmpGEPLoadResult, tmpGEPResult));
                //            it.ExprResult = tmpGEPLoadResult;
            }
        }
        if (it.ExprResult == null) {//global var
            GlobalVariables tmpGlobal = currentModule.IRGlobalVarTable.get(it.Identifier);
            if (tmpGlobal != null) {
/*                Register tmpResult = new Register(new PointerType(tmpGlobal.thisType), "Id_Load" + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock, tmpResult, tmpGlobal));
                it.ExprResult = tmpResult;
*/
                it.ExprResult = tmpGlobal;
            }
        }
//        if(it.ExprResult == null) System.out.println(it.ExprText);
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
        it.ExprResult = new IntegerConstant(IntegerType.IRBitWidth.i32, it.val);
    }

    @Override
    public void visit(StringConstExprNode it) {
        GlobalVariables tmpVar = currentModule.addConstString(it.val);
        Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)), "StringConst" + (RegNum++));
        getElementPtrInstruction tmpgetElementPtrInst = new getElementPtrInstruction(currentBasicBlock, tmpVar, tmpResult);
        tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, 0));
        tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, 0));
        currentBasicBlock.addBasicBlockInst(tmpgetElementPtrInst);
        it.ExprResult = tmpResult;
//        throw new RuntimeException(it.ExprText+","+it.val);
    }

    @Override
    public void visit(ArraydefExprNode it) {
        it.arr.accept(this);
        it.index.accept(this);

        Register tmpResult = new Register(it.arr.ExprResult.thisType, "getElementPtr" + (RegNum++));
        getElementPtrInstruction tmpgetElementPtrInst = new getElementPtrInstruction(currentBasicBlock, it.arr.ExprResult, tmpResult);
        tmpgetElementPtrInst.GetElementPtrIdx.add(it.index.ExprResult);
        currentBasicBlock.addBasicBlockInst(tmpgetElementPtrInst);

        it.ExprResult = tmpResult;
    }
}
