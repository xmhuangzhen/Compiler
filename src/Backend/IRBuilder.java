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
import Util.globalScope;

import java.util.HashMap;
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
    //    public HashMap<IRBuilder, phiInstruction> LogicalPhiTable;
    public static int BlockNum, RegNum,LoopNum;

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
        LoopNum = 0;
//        LogicalPhiTable = new HashMap<>();
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
                if (tmpClassDefNode.consDef != null) tmpFuncType.FuncParameter.add(tmpThisIRType);
                String tmpFuncName = tmpClassDefNode.className + "." + tmpClassDefNode.className;

                IRFunction tmpIRFunction = new IRFunction(tmpFuncType, tmpFuncName);
                if (tmpClassDefNode.consDef == null) tmpIRFunction.IsBuiltIn = true;
                else {
                    Parameter tmpClassPtr = new Parameter(new PointerType(tmpThisIRType), "this");
                    tmpClassPtr.NeedPtr = true;
                    tmpIRFunction.thisFunctionParameters.add(tmpClassPtr);
                }
                currentModule.IRFunctionTable.put(tmpFuncName, tmpIRFunction);

                for (var tmpFunc : tmpClassDefNode.funcDefs) {
                    //add functions in class
                    tmpFuncType = new FunctionType(currentModule.getIRType(tmpFunc.funcType));
                    tmpFuncType.FuncParameter.add(tmpThisIRType);
                    for (var tmpPar : tmpFunc.parDefs)
                        tmpFuncType.FuncParameter.add(currentModule.getIRType(tmpPar.typeNode));
                    tmpFuncName = tmpClassDefNode.className + "." + tmpFunc.funcName;

                    tmpIRFunction = new IRFunction(tmpFuncType, tmpFuncName);
                    Parameter tmpClassPtr = new Parameter(new PointerType(tmpThisIRType), "this");
                    tmpClassPtr.NeedPtr = true;
                    tmpIRFunction.thisFunctionParameters.add(tmpClassPtr);

                    for (var tmpPar : tmpFunc.parDefs) {
                        tmpIRFunction.thisFunctionParameters.add(new Parameter(
                                currentModule.getIRType(tmpPar.typeNode), tmpPar.varname));
                    }
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
                    tmpIRFunction.thisFunctionParameters.add(
                            new Parameter(
                                    currentModule.getIRType(tmpPar.typeNode), tmpPar.varname));
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
        IRTypeSystem tmpIRType = currentModule.getIRType(it.typeNode);
        if (!InFunc && (currentClassName == null || currentClassName.isEmpty())) {
            //global variables
            GlobalVariables tmpResult = new GlobalVariables(tmpIRType, it.varname);
            if (it.varexpr != null) {
                it.varexpr.accept(this);
                tmpResult.InitExpr = it.varexpr.ExprResult;
                currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                        it.varexpr.ExprResult, tmpResult));
            }
            currentModule.IRGlobalVarTable.put(it.varname, tmpResult);
        } else if (IdAddrMap != null) {
            //local variables
            Register tmpAddr = new Register(new PointerType(tmpIRType), it.varname + "|addr" + (RegNum++));
            if (!IdAddrMap.AddrMap.containsKey(it.varname)) {
                IdAddrMap.AddrMap.put(it.varname, tmpAddr);

                allocaInstruction tmpAllocaInst =
                        new allocaInstruction(currentBasicBlock,
                                tmpAddr, new PointerType(tmpIRType));
                currentBasicBlock.addBasicBlockInst(tmpAllocaInst);
                currentFunction.allocaInstTable.add(tmpAllocaInst);
            }
            if (it.varexpr != null) {
                it.varexpr.accept(this);
                currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                        it.varexpr.ExprResult, tmpAddr));
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
        IdAddrMap = new IRIdExprAddrMap(IdAddrMap);

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
        currentBasicBlock = tmpIRFunction.thisEntranceBlock;

        //(2) visit par
        for (int i = 0; i < currentFunction.thisFunctionParameters.size(); ++i) {
            Parameter tmpPara = currentFunction.thisFunctionParameters.get(i);

            IRTypeSystem tmpIRType = tmpPara.thisType;

            Register tmpReg = new Register(new PointerType(tmpIRType),
                    tmpPara.ParameterName + "|addr" + (RegNum++));
            tmpReg.NeedPtr = tmpPara.NeedPtr;

            allocaInstruction tmpAllocaInst = new allocaInstruction(currentBasicBlock,
                    tmpReg, new PointerType(tmpIRType));
            currentBasicBlock.addBasicBlockInst(tmpAllocaInst);
            currentFunction.allocaInstTable.add(tmpAllocaInst);

            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpPara, tmpReg));
            IdAddrMap.AddrMap.put(tmpPara.ParameterName, tmpReg);
        }

        currentFunction.thisReturnValue = new Register(new PointerType(currentModule.getIRType(it.funcType)),
                tmpFuncName + "return_value" + (RegNum++));

        if (it.funcName.equals("main")) {
            IRFunction tmpFunc = currentModule.IRFunctionTable.get("__init__");
            callInstruction tmpCallInst = new callInstruction(currentBasicBlock, null, tmpFunc);
            currentBasicBlock.addBasicBlockInst(tmpCallInst);
        }

        //(4) visit stmts
        for (var tmp : it.stmts) tmp.accept(this);

        //(5) tail call check (move to opt stage)
        if (currentBasicBlock.TailInst instanceof callInstruction
                && ((callInstruction) currentBasicBlock.TailInst).CallFunction == currentFunction &&
                currentFunction.thisFunctionType.FuncReturnType instanceof VoidType) {
          //  System.out.println(currentBasicBlock.TailInst);
            ((callInstruction) currentBasicBlock.TailInst).IsTailCall = true;
        } else if (currentBasicBlock.TailInst instanceof brInstruction
                && ((brInstruction) currentBasicBlock.TailInst).brCond == null
                && ((brInstruction) currentBasicBlock.TailInst).brIfTrue == currentFunction.thisReturnBlock
                && currentBasicBlock.TailInst.preIRInstruction instanceof moveInstruction
                && ((moveInstruction) currentBasicBlock.TailInst.preIRInstruction).rd == currentFunction.thisReturnValue
                && currentBasicBlock.TailInst.preIRInstruction.preIRInstruction instanceof callInstruction
                && ((callInstruction) currentBasicBlock.TailInst.preIRInstruction.preIRInstruction).CallFunction == currentFunction) {
            ((callInstruction) currentBasicBlock.TailInst.preIRInstruction.preIRInstruction).IsTailCall = true;
        }

        //(6) goto the last block
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null,
                currentFunction.thisReturnBlock, null));


        currentBasicBlock = currentFunction.thisReturnBlock;
        IRTypeSystem tmpType = new VoidType();
        if (currentFunction.thisReturnValue != null) {//only for IRPrinter use
            if (currentFunction.thisReturnValue.thisType instanceof PointerType)
                tmpType = ((PointerType) currentFunction.thisReturnValue.thisType).baseType;
            else
                tmpType = currentFunction.thisReturnValue.thisType;
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

        if (currentFunction.thisFunctionParameters.size() != 1) throw new RuntimeException();
        for (int i = 0; i < currentFunction.thisFunctionParameters.size(); ++i) {
            Parameter tmpPara = currentFunction.thisFunctionParameters.get(i);

            IRTypeSystem tmpIRType = tmpPara.thisType;

            Register tmpReg = new Register(new PointerType(tmpIRType),
                    tmpPara.ParameterName + "|addr" + (RegNum++));
            tmpReg.NeedPtr = tmpPara.NeedPtr;

            allocaInstruction tmpAllocaInst = new allocaInstruction(currentBasicBlock,
                    tmpReg, new PointerType(tmpIRType));
            currentBasicBlock.addBasicBlockInst(tmpAllocaInst);
            currentFunction.allocaInstTable.add(tmpAllocaInst);

            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpPara, tmpReg));
            IdAddrMap.AddrMap.put(tmpPara.ParameterName, tmpReg);
        }

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
            /*
            //Tail Call check (move to opt stage)
            if (currentBasicBlock.TailInst instanceof callInstruction
                    && ((callInstruction) currentBasicBlock.TailInst).CallFunction == currentFunction) {
                ((callInstruction) currentBasicBlock.TailInst).IsTailCall = true;
            }
            */
            currentBasicBlock.addBasicBlockInst(new moveInstruction(currentBasicBlock,
                    currentFunction.thisReturnValue, it.value.ExprResult));
        }
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null, currentFunction.thisReturnBlock, null));
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
        it.condition.thenBlock = IfThenBlock;
        if (IfElseBlock == null) it.condition.elseBlock = IfDestBlock;
        else it.condition.elseBlock = IfElseBlock;
        it.condition.accept(this);
/*        if (IfElseBlock == null)
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.condition.ExprResult, IfThenBlock, IfDestBlock));
        else
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.condition.ExprResult, IfThenBlock, IfElseBlock));
*/
        //visit then
        if (it.thenStmt != null) {
            currentBasicBlock = IfThenBlock;
            IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
            currentFunction.addFunctionBasicBlock(IfThenBlock);
            it.thenStmt.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null, IfDestBlock, null));
            IdAddrMap = IdAddrMap.ParentMap;
        }

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
        LoopNum++;
        IRBasicBlock ForInitBlock = new IRBasicBlock(currentFunction,
                "for_init_block"+(BlockNum++));
        ForInitBlock.PolyBBType = IRBasicBlock.PolyBBENUMType.init_stmt;
        ForInitBlock.LoopPos = LoopNum;
        IRBasicBlock ForCondBlock = (it.condExpr == null) ? null :
                new IRBasicBlock(currentFunction, "for_cond_block" + (BlockNum++));
        ForCondBlock.PolyBBType = IRBasicBlock.PolyBBENUMType.cond_stmt;
        ForCondBlock.LoopPos = LoopNum;
        IRBasicBlock ForStepBlock = (it.stepExpr == null) ? null :
                new IRBasicBlock(currentFunction, "for_step_block" + (BlockNum++));
        ForStepBlock.PolyBBType = IRBasicBlock.PolyBBENUMType.step_stmt;
        ForStepBlock.LoopPos = LoopNum;
        IRBasicBlock ForBodyBlock =
                new IRBasicBlock(currentFunction, "for_body_block" + (BlockNum++));
        IRBasicBlock ForDestBlock = new IRBasicBlock(currentFunction, "for_dest_block" + (BlockNum++));

        //visit init
        if (it.initExpr != null) {
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null,ForInitBlock,null));
            currentBasicBlock = ForInitBlock;
            IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
            currentFunction.addFunctionBasicBlock(ForInitBlock);

            it.initExpr.accept(this);

            IdAddrMap = IdAddrMap.ParentMap;
        }

        //visit condition
        if (it.condExpr != null) {
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null,
                    ForCondBlock, null));
            currentBasicBlock = ForCondBlock;
            IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
            currentFunction.addFunctionBasicBlock(ForCondBlock);

            it.condExpr.thenBlock = ForBodyBlock;
            it.condExpr.elseBlock = ForDestBlock;
            it.condExpr.accept(this);
/*            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.condExpr.ExprResult, ForBodyBlock, ForDestBlock));
  */
            IdAddrMap = IdAddrMap.ParentMap;
        } else {
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null, ForBodyBlock, null));
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

        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null, WhileCondBlock, null));

        //visit cond
        currentBasicBlock = WhileCondBlock;
        currentFunction.addFunctionBasicBlock(WhileCondBlock);

        it.condExpr.thenBlock = WhileBodyBlock;
        it.condExpr.elseBlock = WhileDestBlock;
        it.condExpr.accept(this);
/*        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                it.condExpr.ExprResult, WhileBodyBlock, WhileDestBlock));
*/
        //visit body
        currentBasicBlock = WhileBodyBlock;
        currentFunction.addFunctionBasicBlock(WhileBodyBlock);
        if (it.stmt != null) {
            IdAddrMap = new IRIdExprAddrMap(IdAddrMap);
            StackForBreak.push(WhileDestBlock);
            StackForContinue.push(WhileCondBlock);
            it.stmt.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null, WhileCondBlock, null));
            StackForBreak.pop();
            StackForContinue.pop();
            IdAddrMap = IdAddrMap.ParentMap;
        }

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
        ///////////////////////
        currentBasicBlock.DefsInBB.add(it.lhs.ExprLResult);
        currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                it.rhs.ExprResult, it.lhs.ExprLResult));
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
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.shl,
                    it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals(">>")) {
            RegisterName = "ashr";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.ashr,
                    it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("&")) {
            RegisterName = "and";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.and,
                    it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("|")) {
            RegisterName = "or";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.or,
                    it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("^")) {
            RegisterName = "ashr";
            tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), RegisterName + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,
                    it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
        } else if (it.op.equals("+")) {
            RegisterName = "add";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                        binaryOpInstruction.BinaryOperandENUM.add, it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),
                        RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_add");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                it.lhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                it.rhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if (it.op.equals(">")) {
            RegisterName = "sgt";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sgt, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_sgt");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                it.lhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                it.rhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if (it.op.equals("<")) {
            RegisterName = "slt";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.slt, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_slt");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                it.lhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                it.rhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if (it.op.equals(">=")) {
            RegisterName = "sge";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sge, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_sge");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                it.lhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                it.rhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if (it.op.equals("<=")) {
            RegisterName = "sle";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sle, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_sle");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                it.lhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                it.rhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else {
                throw new RuntimeException();
            }
        } else if (it.op.equals("==")) {
            RegisterName = "eq";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("bool")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i1),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),
                        RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_eq");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                it.lhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                it.rhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else if (it.lhs.ExprType.Typename.equals("null")) {
                if (it.rhs.ExprType.Typename.equals("null")) {
                    it.ExprResult = new BooleanConstant(true);
                } else {
                    tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                            RegisterName + (RegNum++));
                    currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                            icmpInstruction.IcmpOperandENUM.eq,
                            currentModule.getIRType(it.lhs.ExprType),
                            it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
                    it.ExprResult = tmpResult;
                }
            } else if (it.rhs.ExprType.Typename.equals("null")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq,
                        currentModule.getIRType(it.lhs.ExprType),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            }
        } else if (it.op.equals("!=")) {
            RegisterName = "ne";
            if (it.lhs.ExprType.Typename.equals("int")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.ne, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("bool")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.ne, new IntegerType(IntegerType.IRBitWidth.i1),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
            } else if (it.lhs.ExprType.Typename.equals("string")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                IRFunction tmpFunction = currentModule.IRFunctionTable.get("__string_ne");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpResult, tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                it.lhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                it.rhs.ExprResult.AddRegisterUseInInstruction(tmpcallInst);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            } else if (it.lhs.ExprType.Typename.equals("null")) {
                if (it.rhs.ExprType.Typename.equals("null")) {
                    it.ExprResult = new BooleanConstant(false);
                } else {
                    tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                            RegisterName + (RegNum++));
                    currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                            icmpInstruction.IcmpOperandENUM.ne,
                            currentModule.getIRType(it.lhs.ExprType),
                            it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
                    it.ExprResult = tmpResult;
                }
            } else if (it.rhs.ExprType.Typename.equals("null")) {
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.ne,
                        currentModule.getIRType(it.lhs.ExprType),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            }
        } else if (it.op.equals("&&")) { // a && b
            if (it.thenBlock != null) {///////!!!!!!!!!!!! if in cond -- no phiInstruction need!
                IRBasicBlock AndandBBlock = new IRBasicBlock(currentFunction,
                        "andand_bb" + (BlockNum++));
                AndandBBlock.PolyBBType = currentBasicBlock.PolyBBType;
                AndandBBlock.LoopPos = currentBasicBlock.LoopPos;
                it.lhs.thenBlock = AndandBBlock;
                it.lhs.elseBlock = it.elseBlock;
                it.rhs.thenBlock = it.thenBlock;
                it.rhs.elseBlock = it.elseBlock;

                it.lhs.accept(this);

                currentBasicBlock = AndandBBlock;
                currentFunction.addFunctionBasicBlock(AndandBBlock);
                it.rhs.accept(this);

            } else {
                IRBasicBlock AndandBBlock = new IRBasicBlock(currentFunction,
                        "andand_b_block" + (BlockNum++));
                IRBasicBlock AndandDestBlock = new IRBasicBlock(currentFunction,
                        "andand_dest_block" + (BlockNum++));

                IRBasicBlock phiBlock1, phiBlock2;

                it.lhs.accept(this);
                currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, it.lhs.ExprResult,
                        AndandBBlock, AndandDestBlock));
                phiBlock1 = currentBasicBlock;

                currentBasicBlock = AndandBBlock;
                currentFunction.addFunctionBasicBlock(AndandBBlock);
                it.rhs.accept(this);
                currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null,
                        AndandDestBlock, null));
                phiBlock2 = currentBasicBlock;

                currentBasicBlock = AndandDestBlock;
                currentFunction.addFunctionBasicBlock(AndandDestBlock);
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "Andand_" + (RegNum++));
                phiInstruction tmpPhiInst = new phiInstruction(currentBasicBlock, tmpResult);
                tmpPhiInst.PhiValue.add(new BooleanConstant(false));
                tmpPhiInst.PhiLabel.add(phiBlock1);
                tmpPhiInst.PhiValue.add(it.rhs.ExprResult);
                tmpPhiInst.PhiLabel.add(phiBlock2);
                currentBasicBlock.addBasicBlockInst(tmpPhiInst);

                it.ExprResult = tmpResult;
            }
        } else if (it.op.equals("||")) {
            if (it.thenBlock != null) {
                IRBasicBlock OrorBBlock = new IRBasicBlock(currentFunction,
                        "oror_bb" + (BlockNum++));
                OrorBBlock.PolyBBType = currentBasicBlock.PolyBBType;
                OrorBBlock.LoopPos = currentBasicBlock.LoopPos;
                it.lhs.thenBlock = it.thenBlock;
                it.lhs.elseBlock = OrorBBlock;
                it.rhs.thenBlock = it.thenBlock;
                it.rhs.elseBlock = it.elseBlock;

                it.lhs.accept(this);

                currentBasicBlock = OrorBBlock;
                currentFunction.addFunctionBasicBlock(OrorBBlock);
                it.rhs.accept(this);
            } else {
                IRBasicBlock OrorBBlock = new IRBasicBlock(currentFunction,
                        "oror_b_block" + (BlockNum++));
                IRBasicBlock OrorDestBlock = new IRBasicBlock(currentFunction,
                        "oror_dest_block" + (BlockNum++));

                IRBasicBlock phiBlock1, phiBlock2;

                it.lhs.accept(this);
                currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, it.lhs.ExprResult,
                        OrorDestBlock, OrorBBlock));
                phiBlock1 = currentBasicBlock;

                currentBasicBlock = OrorBBlock;
                currentFunction.addFunctionBasicBlock(OrorBBlock);
                it.rhs.accept(this);
                currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null,
                        OrorDestBlock, null));
                phiBlock2 = currentBasicBlock;

                currentBasicBlock = OrorDestBlock;
                currentFunction.addFunctionBasicBlock(OrorDestBlock);
                tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        "Oror_" + (RegNum++));

                phiInstruction tmpPhiInst = new phiInstruction(currentBasicBlock, tmpResult);
                tmpPhiInst.PhiValue.add(new BooleanConstant(true));
                tmpPhiInst.PhiLabel.add(phiBlock1);
                tmpPhiInst.PhiValue.add(it.rhs.ExprResult);
                tmpPhiInst.PhiLabel.add(phiBlock2);
                currentBasicBlock.addBasicBlockInst(tmpPhiInst);

                it.ExprResult = tmpResult;
            }
        } else {
            throw new RuntimeException();
        }
        it.ExprResult = tmpResult;

        if (!it.op.equals("&&") && !it.op.equals("||") && it.thenBlock != null) {
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.ExprResult, it.thenBlock, it.elseBlock));
        }
    }


    public Register NewArrayMalloc(int cur_dim, IRTypeSystem cur_type, NewExprNode it) {
        //CallSize2 = cur_dim*cur_type.size + 4(the size of PointerType)
        Register tmpCallSize1 = new Register(new IntegerType(IntegerType.IRBitWidth.i32),
                "call_size_1" + (RegNum++));
        Register tmpCallSize2 = new Register(new IntegerType(IntegerType.IRBitWidth.i32),
                "call_size_2" + (RegNum++));
        currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                binaryOpInstruction.BinaryOperandENUM.mul,
                it.exprDim.get(cur_dim).ExprResult,
                new IntegerConstant(IntegerType.IRBitWidth.i32, 4), tmpCallSize1));
        currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                binaryOpInstruction.BinaryOperandENUM.add,
                tmpCallSize1, new IntegerConstant(IntegerType.IRBitWidth.i32, 4), tmpCallSize2));

        //(1) malloc cur_dim
        Register tmpCallResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),
                "call_malloc_func" + (RegNum++));
        IRFunction tmpCallFunc = currentModule.IRFunctionTable.get("malloc");
        callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpCallResult, tmpCallFunc);
        tmpCallInst.CallParameters.add(tmpCallSize2);
        tmpCallSize2.AddRegisterUseInInstruction(tmpCallInst);
        currentBasicBlock.addBasicBlockInst(tmpCallInst);

        //store size at first
        tmpCallResult.NeedPtr = true;
        currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                it.exprDim.get(cur_dim).ExprResult, tmpCallResult));

        //get the first element
        Register ArrayTrueAddrtmp = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),
                "call_array_head" + (RegNum++));
        getElementPtrInstruction tmpGEPInst = new getElementPtrInstruction(currentBasicBlock,
                tmpCallResult, ArrayTrueAddrtmp);
        tmpGEPInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, 1));
        currentBasicBlock.addBasicBlockInst(tmpGEPInst);

        Register ArrayTrueAddr = new Register(cur_type, "call_array_head_cast_" + (RegNum++));
        currentBasicBlock.addBasicBlockInst(new bitcastInstruction(currentBasicBlock, ArrayTrueAddrtmp,
                cur_type, ArrayTrueAddr));

        //(2) Malloc by recursion, it likes a loop
        if (cur_dim < it.exprDim.size() - 1) {
            IRBasicBlock CondBlock = new IRBasicBlock(currentFunction, "cond_block" + (BlockNum++));
            IRBasicBlock BodyBlock = new IRBasicBlock(currentFunction, "body_block" + (BlockNum++));
            IRBasicBlock DestBlock = new IRBasicBlock(currentFunction, "dest_block" + (BlockNum++));

            Register NowReg = new Register(cur_type, "Subarray_Cur_Reg" + (RegNum++));
            tmpGEPInst = new getElementPtrInstruction(currentBasicBlock, tmpCallResult, NowReg);
            tmpGEPInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, 1));
            currentBasicBlock.addBasicBlockInst(tmpGEPInst);

            Register EndReg = new Register(cur_type, "SubArray_end_reg" + (RegNum++));
            tmpGEPInst = new getElementPtrInstruction(currentBasicBlock, ArrayTrueAddr, EndReg);
            tmpGEPInst.GetElementPtrIdx.add(it.exprDim.get(cur_dim).ExprResult);
            it.exprDim.get(cur_dim).ExprResult.AddRegisterUseInInstruction(tmpGEPInst);
            currentBasicBlock.addBasicBlockInst(tmpGEPInst);

            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock, null,
                    CondBlock, null));
            currentBasicBlock = CondBlock;
            currentFunction.addFunctionBasicBlock(CondBlock);

            Register CondResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                    "Subarray_Cond_" + (RegNum++));
            icmpInstruction CondInst = new icmpInstruction(currentBasicBlock,
                    icmpInstruction.IcmpOperandENUM.slt, cur_type, NowReg, EndReg, CondResult);
            currentBasicBlock.addBasicBlockInst(CondInst);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    CondResult, BodyBlock, DestBlock));

            currentBasicBlock = BodyBlock;
            currentFunction.addFunctionBasicBlock(BodyBlock);
            if (!(cur_type instanceof PointerType)) throw new RuntimeException();
            Register SubArrayTrueAddr = NewArrayMalloc(cur_dim + 1, ((PointerType) cur_type).baseType, it);
            NowReg.NeedPtr = true;
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock, SubArrayTrueAddr, NowReg));

            Register tmpReg = new Register(cur_type, "Incr_reg" + (RegNum++));
            tmpGEPInst = new getElementPtrInstruction(currentBasicBlock, NowReg, tmpReg);
            tmpGEPInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, 1));
            currentBasicBlock.addBasicBlockInst(tmpGEPInst);

            currentBasicBlock.addBasicBlockInst(new moveInstruction(currentBasicBlock,
                    NowReg, tmpReg));

            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null, CondBlock, null));

            currentBasicBlock = DestBlock;
            currentFunction.addFunctionBasicBlock(DestBlock);
        }
        return ArrayTrueAddr;
    }

    @Override
    public void visit(NewExprNode it) {
        if (it.ExprType instanceof ArrayTypeNode) {
            IRTypeSystem tmpIRType = currentModule.getIRType(((ArrayTypeNode) it.ExprType).baseType);
            for (int i = 0; i < ((ArrayTypeNode) it.ExprType).dimension; ++i)
                tmpIRType = new PointerType(tmpIRType);
            for (int i = 0; i < it.exprDim.size(); ++i)
                it.exprDim.get(i).accept(this);
            it.ExprResult = NewArrayMalloc(0, tmpIRType, it);
        } else if (it.ExprType instanceof ClassTypeNode) {
            //call malloc function
            Register tmpMallocResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),
                    "Malloc_Result" + (RegNum++));
            IRFunction tmpFunction = currentModule.IRFunctionTable.get("malloc");
            callInstruction tmpcallInst = new callInstruction(currentBasicBlock, tmpMallocResult, tmpFunction);
            tmpcallInst.CallParameters.add(new IntegerConstant(IntegerType.IRBitWidth.i32,
                    currentModule.IRClassTable.get(it.ExprType.Typename).getTypeSize()));
            currentBasicBlock.addBasicBlockInst(tmpcallInst);

            Register tmpCastResult = new Register(currentModule.getIRType(it.ExprType),
                    "Malloc_Cast_Result_" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitcastInstruction(currentBasicBlock,
                    tmpMallocResult, currentModule.getIRType(it.ExprType), tmpCastResult));
            it.ExprResult = tmpCastResult;
            it.ExprResult.NeedPtr = true;

            //call constructor
            String tmpClassName = ((ClassTypeNode) it.ExprType).ClassName;
            if (gScope.declared_class.get(tmpClassName).consDef != null) {
                tmpFunction = currentModule.IRFunctionTable.get(tmpClassName + "." + tmpClassName);
                tmpcallInst = new callInstruction(currentBasicBlock, null, tmpFunction);
                tmpcallInst.CallParameters.add(tmpCastResult);
                tmpCastResult.AddRegisterUseInInstruction(tmpcallInst);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            }
        } else {
            throw new RuntimeException(it.ExprType.Typename);
        }
    }

    @Override
    public void visit(ThisExprNode it) {
        IROperand tmpClassPtr = IdAddrMap.GetIdExprAddr("this");
        if (!(tmpClassPtr.thisType instanceof PointerType)) throw new RuntimeException();
        Register tmpResult = new Register(((PointerType) tmpClassPtr.thisType).baseType,
                "CastToResult" + (RegNum++));
        tmpResult.NeedPtr = true;
        tmpClassPtr.NeedPtr = true;
        currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock, tmpResult, tmpClassPtr));
        it.ExprResult = tmpResult;
    }

    @Override
    public void visit(UnaryExprNode it) {
        if (it.op.equals("!") && it.thenBlock != null) {
            it.expr.thenBlock = it.elseBlock;
            it.expr.elseBlock = it.thenBlock;
        }

        it.expr.accept(this);
        if (it.op.equals("++")) { //++a
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),
                    "PreAdd" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.add, it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, 1), tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult, it.expr.ExprLResult));
            it.ExprResult = tmpResult;
            it.ExprLResult = it.expr.ExprLResult;
        } else if (it.op.equals("--")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),
                    "PreSub" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub, it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, 1), tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult, it.expr.ExprLResult));
            it.ExprResult = tmpResult;
            it.ExprLResult = it.expr.ExprLResult;
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
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),
                        "minus" + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                        binaryOpInstruction.BinaryOperandENUM.sub,
                        new IntegerConstant(IntegerType.IRBitWidth.i32, 0),
                        it.expr.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            }
        } else if (it.op.equals("!")) {
            if (it.thenBlock == null) {
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                        "not" + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                        bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,
                        new BooleanConstant(true), it.expr.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            }
        } else if (it.op.equals("~")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),
                    "notb" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, -1),
                    it.expr.ExprResult, tmpResult));
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
                    FunctionType tmpFuncIRType = tmpIRFunction.thisFunctionType;
                    Register tmpResult = null;


                    if (!tmpFuncIRType.equals("void"))
                        tmpResult = new Register(tmpFuncIRType.FuncReturnType, "funccal" + (RegNum++));
                    callInstruction tmpCallInst =
                            new callInstruction(currentBasicBlock, tmpResult, tmpIRFunction);
                    tmpCallInst.CallParameters.add(((MemberAccExprNode) it.funcName).expr.ExprResult);
                    for (var tmp : it.pars) {
                        tmpCallInst.CallParameters.add(tmp.ExprResult);
                        tmp.ExprResult.AddRegisterUseInInstruction(tmpCallInst);
                    }
                    currentBasicBlock.addBasicBlockInst(tmpCallInst);
                    it.ExprResult = tmpResult;
                } else {
                    String tmpClassName = ((ClassTypeNode) tmpTypeNode).ClassName;
                    String tmpFuncName = ((MemberAccExprNode) it.funcName).Identifier;
                    String tmpFuncNameInString = tmpClassName + "." + tmpFuncName;
                    IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncNameInString);
                    IRTypeSystem tmpFuncIRType = tmpIRFunction.thisFunctionType.FuncReturnType;

                    Register tmpResult = null;
                    if (!tmpFuncIRType.equals("void"))
                        tmpResult = new Register(tmpFuncIRType, "funccal" + (RegNum++));

                    callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpResult, tmpIRFunction);
                    tmpCallInst.CallParameters.add(((MemberAccExprNode) it.funcName).expr.ExprResult);
                    for (var tmp : it.pars) {
                        tmpCallInst.CallParameters.add(tmp.ExprResult);
                        tmp.ExprResult.AddRegisterUseInInstruction(tmpCallInst);
                    }
                    currentBasicBlock.addBasicBlockInst(tmpCallInst);
                    it.ExprResult = tmpResult;
                }
            } else if (((MemberAccExprNode) it.funcName).Identifier.equals("size")) {
                //array.size()
                IROperand tmpFuncResult = ((MemberAccExprNode) it.funcName).expr.ExprResult;

                //get the element ptr
                Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),
                        "array_size" + (RegNum++));
                tmpResult.NeedPtr = true;
                getElementPtrInstruction tmpGetElementPtr = new getElementPtrInstruction(currentBasicBlock,
                        tmpFuncResult, tmpResult);
                tmpGetElementPtr.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, -1));
                currentBasicBlock.addBasicBlockInst(tmpGetElementPtr);

                Register tmpLoadResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),
                        "array_size_load" + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock,
                        tmpLoadResult, tmpResult));
                it.ExprResult = tmpLoadResult;
            } else {
                throw new RuntimeException(it.ExprType.Typename);
            }
        } else if (it.funcName instanceof IdExprNode) {
            String tmpFuncNameInString = ((IdExprNode) it.funcName).Identifier;
            if (currentClassName != null && !currentClassName.isEmpty()) {
                tmpFuncNameInString = currentClassName + "." + ((IdExprNode) it.funcName).Identifier;
            }
            boolean IsClassFunction = true;
            IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncNameInString);
            if (tmpIRFunction == null) {
                IsClassFunction = false;
                tmpIRFunction = currentModule.IRFunctionTable.get(((IdExprNode) it.funcName).Identifier);
            }
            if (tmpIRFunction == null) throw new RuntimeException();

            FunctionType tmpFuncIRType = tmpIRFunction.thisFunctionType;
            Register tmpResult = null;
            if (!tmpFuncIRType.equals("void"))
                tmpResult = new Register(tmpFuncIRType.FuncReturnType, "funccal" + (RegNum++));

            callInstruction tmpCallInst = new callInstruction(currentBasicBlock, tmpResult, tmpIRFunction);
            if (currentClassName != null && IsClassFunction) {
                if (currentFunction == null || !IdAddrMap.CheckIdExprAddr("this"))
                    throw new RuntimeException();
                IROperand tmpThisOperand = IdAddrMap.GetIdExprAddr("this");
                tmpThisOperand.NeedPtr = true;
                Register tmpCastResult = new Register(((PointerType) tmpThisOperand.thisType).baseType,
                        "CastToResult" + (RegNum++));
                tmpCastResult.NeedPtr = true;
                currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock,
                        tmpCastResult, tmpThisOperand));
                tmpCallInst.CallParameters.add(tmpCastResult);
                tmpThisOperand.AddRegisterUseInInstruction(tmpCallInst);
            }
            for (var tmp : it.pars) {
                tmpCallInst.CallParameters.add(tmp.ExprResult);
                tmp.ExprResult.AddRegisterUseInInstruction(tmpCallInst);
            }
            currentBasicBlock.addBasicBlockInst(tmpCallInst);
            it.ExprResult = tmpResult;
        } else {
            throw new RuntimeException();
        }
        if (it.thenBlock != null) {
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.ExprResult, it.thenBlock, it.elseBlock));
        }
    }

    @Override
    public void visit(SelfExprNode it) {
        it.expr.accept(this);
        if (it.op.equals("++")) { //a++
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),
                    "SelfAdd" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.add, it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, 1), tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult, it.expr.ExprLResult));
            it.ExprResult = it.expr.ExprResult;

        } else if (it.op.equals("--")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),
                    "SelfSub" + (RegNum++));
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub, it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, 1), tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult, it.expr.ExprLResult));
            it.ExprResult = it.expr.ExprResult;
        }
    }

    @Override
    public void visit(MemberAccExprNode it) {
        it.expr.accept(this);

        //(1) get the Class Type of the Member
        IRTypeSystem tmpIRType = currentModule.getIRType(it.expr.ExprType);
        if (tmpIRType == null || !(tmpIRType instanceof PointerType)) throw new RuntimeException();

        tmpIRType = ((PointerType) tmpIRType).baseType;

        if (tmpIRType instanceof StructureType) {
            String tmpName = ((StructureType) tmpIRType).StructureName + "." + it.Identifier;
            if (currentModule.IRFunctionTable.containsKey(tmpName)) {// it is function
                //do not need to do
            } else {
                IRTypeSystem tmpMemberIRType = null;
                int tmpMemberIndex = 0;
                for (; tmpMemberIndex < ((StructureType) tmpIRType).StructureMemberName.size(); ++tmpMemberIndex)
                    if (((StructureType) tmpIRType).StructureMemberName.get(tmpMemberIndex).equals(it.Identifier)) {
                        tmpMemberIRType = ((StructureType) tmpIRType).StructureMemberType.get(tmpMemberIndex);
                        break;
                    }

                if (tmpMemberIRType == null) throw new RuntimeException();

                //(3) do the getElementPtr inst

                String RegisterName = "memacc_result";
                Register tmpResult = new Register(new PointerType(tmpMemberIRType),
                        RegisterName + (RegNum++));
                if (tmpMemberIRType instanceof PointerType) {
                    tmpResult.NeedPtr = true;
                }

                getElementPtrInstruction tmpgetElementPtrInst =
                        new getElementPtrInstruction(currentBasicBlock, it.expr.ExprResult, tmpResult);
                tmpgetElementPtrInst.GetElementPtrIdx.add(
                        new IntegerConstant(IntegerType.IRBitWidth.i32, 0));
                tmpgetElementPtrInst.GetElementPtrIdx.add(
                        new IntegerConstant(IntegerType.IRBitWidth.i32, tmpMemberIndex));
                currentBasicBlock.addBasicBlockInst(tmpgetElementPtrInst);
                it.ExprLResult = tmpResult;
                if (tmpMemberIRType instanceof PointerType)
                    it.ExprLResult.NeedPtr = true;

                Register tmpLoadResult = new Register(tmpMemberIRType, RegisterName + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock, tmpLoadResult, tmpResult));
                it.ExprResult = tmpLoadResult;
            }
        }
        if (it.thenBlock != null) {
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.ExprResult, it.thenBlock, it.elseBlock));
        }

    }

    @Override
    public void visit(IdExprNode it) {
        if (IdAddrMap != null && IdAddrMap.CheckIdExprAddr(it.Identifier)) {
            //local var
            IROperand tmpVarAddr = IdAddrMap.GetIdExprAddr(it.Identifier);
            if (tmpVarAddr.thisType instanceof PointerType) {
                IRTypeSystem tmpType = ((PointerType) tmpVarAddr.thisType).baseType;

                Register tmpResult = new Register(tmpType, "Id_load" + (RegNum++));
                tmpResult.NeedPtr = tmpVarAddr.NeedPtr;
                currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock,
                        tmpResult, tmpVarAddr));
                it.ExprResult = tmpResult;
                it.ExprLResult = tmpVarAddr;
            }
        }

        if (it.ExprResult == null && currentClassName != null) { //class member
            StructureType tmpClassType = currentModule.IRClassTable.get(currentClassName);
            IRTypeSystem tmpMemberIRType = null;
            int tmpMemberIndex = 0;
            for (; tmpMemberIndex < tmpClassType.StructureMemberName.size(); ++tmpMemberIndex)
                if (tmpClassType.StructureMemberName.get(tmpMemberIndex).equals(it.Identifier)) {
                    tmpMemberIRType = tmpClassType.StructureMemberType.get(tmpMemberIndex);
                    break;
                }
            if (tmpMemberIRType != null && currentFunction != null
                    && IdAddrMap != null && IdAddrMap.CheckIdExprAddr("this")) {
                IROperand tmpThisOperand = IdAddrMap.GetIdExprAddr("this");
                tmpThisOperand.NeedPtr = true;

                if (!(tmpThisOperand.thisType instanceof PointerType)) throw new RuntimeException();
                Register tmpGEPptr = new Register(((PointerType) tmpThisOperand.thisType).baseType,
                        "ClassAddr_turnto_reg_" + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock,
                        tmpGEPptr, tmpThisOperand));

                Register tmpGEPResult = new Register(new PointerType(tmpMemberIRType),
                        "Id_GEP_" + (RegNum++));
                tmpGEPResult.NeedPtr = true;
                getElementPtrInstruction tmpgetElementPtrInst = new getElementPtrInstruction(currentBasicBlock,
                        tmpGEPptr, tmpGEPResult);
                tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32, 0));
                tmpgetElementPtrInst.GetElementPtrIdx.add(
                        new IntegerConstant(IntegerType.IRBitWidth.i32, tmpMemberIndex));
                currentBasicBlock.addBasicBlockInst(tmpgetElementPtrInst);

                it.ExprLResult = tmpGEPResult;

                Register tmpLoadResult = new Register(tmpMemberIRType, "Id_GEP_Load" + (RegNum++));
                currentBasicBlock.addBasicBlockInst(
                        new loadInstruction(currentBasicBlock, tmpLoadResult, tmpGEPResult));
                it.ExprResult = tmpLoadResult;
            }
        }

        if (it.ExprResult == null) {//global var
            GlobalVariables tmpGlobal = currentModule.IRGlobalVarTable.get(it.Identifier);
            if (tmpGlobal != null) {
                Register tmpReg = new Register(tmpGlobal.thisType, it.Identifier + (RegNum++));
                currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock, tmpReg, tmpGlobal));
                it.ExprLResult = tmpGlobal;
                it.ExprResult = tmpReg;
            }
        }
        if (it.thenBlock != null) {
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.ExprResult, it.thenBlock, it.elseBlock));
        }

    }

    @Override
    public void visit(BoolConstExprNode it) {
        it.ExprResult = new BooleanConstant(it.val);
        if (it.thenBlock != null) {
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.ExprResult, it.thenBlock, it.elseBlock));
        }
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
        Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),
                "StringConst" + (RegNum++));
        getElementPtrInstruction tmpgetElementPtrInst =
                new getElementPtrInstruction(currentBasicBlock, tmpVar, tmpResult);
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
        tmpResult.NeedPtr = true;
        getElementPtrInstruction tmpgetElementPtrInst = new getElementPtrInstruction(currentBasicBlock,
                it.arr.ExprResult, tmpResult);
        tmpgetElementPtrInst.GetElementPtrIdx.add(it.index.ExprResult);
        currentBasicBlock.addBasicBlockInst(tmpgetElementPtrInst);

        it.ExprLResult = tmpResult;

        if (!(it.arr.ExprResult.thisType instanceof PointerType))
            throw new RuntimeException(it.ExprText + "," + it.arr.ExprResult.thisType.toString());
        Register tmpLoadResult = new Register(((PointerType) it.arr.ExprResult.thisType).baseType,
                "GEP_Load" + (RegNum++));
        currentBasicBlock.addBasicBlockInst(new loadInstruction(currentBasicBlock, tmpLoadResult, tmpResult));
        it.ExprResult = tmpLoadResult;
        if (it.thenBlock != null) {
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.ExprResult, it.thenBlock, it.elseBlock));
        }
    }
}