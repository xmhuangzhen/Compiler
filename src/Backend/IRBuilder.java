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
import IR.TypeSystem.IRTypeSystem;
import IR.TypeSystem.IntegerType;
import IR.TypeSystem.PointerType;
import IR.TypeSystem.StructureType;
import Util.Scope;
import Util.globalScope;

public class IRBuilder implements ASTVisitor {
    public globalScope gScope;
    public Scope currentScope;
    public IRBasicBlock currentBasicBlock;
    public IRModule currentModule;
    public IRFunction currentFunction;
    public String currentClassName;

    public IRBuilder(globalScope tmpScope){
        gScope = tmpScope;
        currentScope = gScope;
        currentModule = new IRModule();
        currentBasicBlock = null;
        currentFunction = null;
    }

    @Override
    public void visit(RootNode it) {
        //(1) class def (add class functions to module)
        for(var tmpProgramDefs: it.ProgramDefs)
            if(tmpProgramDefs instanceof classDefNode){
                if(((classDefNode) tmpProgramDefs).consDef != null){
                    //todo
                }
            }
        //todo
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
        if(currentScope == gScope){
            //global variables
            GlobalVariables tmpResult = new GlobalVariables(tmpIRType,it.varname,it.varexpr.ExprResult);
            if(it.varexpr != null){
                it.varexpr.accept(this);
                tmpResult.VariablesInitExpr = it.varexpr.ExprResult;
                currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                        tmpResult.VariablesInitExpr,tmpResult));
            }
            currentModule.addGlobalVariable(tmpResult);
            it.thisOperand = tmpResult;
        } else {
            //local variables
            if(currentFunction != null){
                //in function
                Register tmpResult = new Register(new PointerType(tmpIRType),it.varname);
                if(it.varexpr != null){
                    it.varexpr.accept(this);
                    currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                            it.varexpr.ExprResult,tmpResult));
                }
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
        //todo
    }

    @Override
    public void visit(funcDefNode it) {
        //todo
    }

    @Override
    public void visit(constructorDefNode it) {
        //todo
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
        it.thenStmt.accept(this);

        //visit else
        if(it.elseStmt != null){
            currentBasicBlock = IfElseBlock;
            it.elseStmt.accept(this);
        }

        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,IfDestBlock,null));
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
            it.condExpr.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    it.condExpr.ExprResult, ForBodyBlock, ForDestBlock));
        }

        //visit body
        currentBasicBlock = ForBodyBlock;
        it.stmt.accept(this);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,ForStepBlock,null));

        //visit step
        if(it.stepExpr != null){
            currentBasicBlock = ForStepBlock;
            it.stepExpr.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null,ForBodyBlock,null));
        }

        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,ForDestBlock,null));
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
        it.condExpr.accept(this);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                it.condExpr.ExprResult, WhileBodyBlock,WhileDestBlock));

        //visit body
        currentBasicBlock = WhileBodyBlock;
        it.stmt.accept(this);
        currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                null,WhileCondBlock,WhileDestBlock));
    }

    @Override
    public void visit(continueStmtNode it) {
        if(it.destASTNode instanceof ForStmtNode)
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null,((ForStmtNode) it.destASTNode).stepBasicBlock,null));
        else if(it.destASTNode instanceof WhileStmtNode)
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null,((WhileStmtNode) it.destASTNode).condBasicBlock,null));
        else throw new RuntimeException();
    }

    @Override
    public void visit(breakStmtNode it) {
        if(it.destASTNode instanceof ForStmtNode)
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null, ((ForStmtNode) it.destASTNode).destBasicBlock ,null));
        else if(it.destASTNode instanceof WhileStmtNode)
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,
                    null,((WhileStmtNode) it.destASTNode).destBasicBlock, null));
        else throw new RuntimeException();
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
                currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                        binaryOpInstruction.BinaryOperandENUM.add,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            } else if(it.lhs.ExprType.Typename.equals("string")){
                tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),RegisterName);
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_add");
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
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_sgt");
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
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_slt");
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
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_sge");
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
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_sle");
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
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_eq");
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
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_ne");
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
            it.rhs.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,null,
                    AndandDestBlock,null));
            phiBlock2 = currentBasicBlock;

            currentBasicBlock = AndandDestBlock;
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
            it.rhs.accept(this);
            currentBasicBlock.addBasicBlockInst(new brInstruction(currentBasicBlock,null,
                    OrorDestBlock,null));
            phiBlock2 = currentBasicBlock;

            currentBasicBlock = OrorDestBlock;
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
        currentBasicBlock.addBasicBlockRegister(RegisterName,tmpResult);
    }

    @Override
    public void visit(constExprNode it) { }

    @Override
    public void visit(NewExprNode it) {
        if(it.exprTypeNode instanceof ArrayTypeNode){
            IRTypeSystem tmpIRType = currentModule.getIRType(((ArrayTypeNode) it.exprTypeNode).baseType);
            for(int i = 0;i < ((ArrayTypeNode) it.exprTypeNode).dimension;++i)
                tmpIRType = new PointerType(tmpIRType);
            /////////////////////todo

            Register tmpResult = new Register(tmpIRType, "new");
            it.ExprResult = tmpResult;
            currentBasicBlock.addBasicBlockRegister("new",tmpResult);
        } else if(it.exprTypeNode instanceof ClassTypeNode){
            //call malloc function
            Register tmpMallocResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"Malloc_Result");
            IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__malloc_foo");
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
            currentBasicBlock.addBasicBlockRegister("new",tmpResult);

            //call constructor
            String tmpClassName = ((ClassTypeNode) it.exprTypeNode).ClassName;
            if(gScope.declared_class.get(tmpClassName).consDef != null){
                tmpFunction = currentModule.IRGlobalFunctionTable.get(tmpClassName + "." + tmpClassName);
                tmpcallInst = new callInstruction(currentBasicBlock,null,tmpFunction);
                tmpcallInst.CallParameters.add(tmpResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
            }
        } else {
            throw new RuntimeException();
        }
    }

    @Override
    public void visit(ThisExprNode it) {
        IRTypeSystem CurrentClassType = currentModule.getIRType(it.ExprType);
        it.ExprResult = new Register(CurrentClassType,"this");
        //whether ptr?
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
            currentBasicBlock.addBasicBlockRegister("PreAdd",tmpResult);
        } else if(it.op.equals("--")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"PreSub");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub,it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32,1),tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult,it.expr.ExprResult));
            it.ExprResult = tmpResult;
            currentBasicBlock.addBasicBlockRegister("PreSub",tmpResult);
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
                currentBasicBlock.addBasicBlockRegister("minus",tmpResult);
            }
        } else if(it.op.equals("!")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "not");
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,
                    new BooleanConstant(true), it.expr.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
            currentBasicBlock.addBasicBlockRegister("not",tmpResult);
        } else if(it.op.equals("~")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "notb");
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,
                    new IntegerConstant(IntegerType.IRBitWidth.i32,-1), it.expr.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
            currentBasicBlock.addBasicBlockRegister("notb",tmpResult);
        } else {
            throw new RuntimeException();
        }
    }

    @Override
    public void visit(FunccalExprNode it) {
        it.funcName.accept(this);
        for(var tmp : it.pars) tmp.accept(this);

        if(it.funcName instanceof MemberAccExprNode){
            if(it.ExprType instanceof ClassTypeNode){
                String tmpFuncNameInString = ((ClassTypeNode) it.ExprType).ClassName + "." + ((MemberAccExprNode) it.funcName).Identifier;
                IRFunction tmpIRFunction = currentModule.IRFunctionTable.get(tmpFuncNameInString);
                funcDefNode tmpFuncDefNode = gScope.getfuncDefNode(tmpFuncNameInString,true);
                IRTypeSystem tmpFuncIRType = currentModule.getIRType(tmpFuncDefNode.funcType);
                Register tmpResult = null;
                if(!tmpFuncIRType.toString().equals("void")){
                    tmpResult = new Register(tmpFuncIRType,"funccal");
                }
                callInstruction tmpCallInst = new callInstruction(currentBasicBlock,tmpResult,tmpIRFunction);
                for(var tmp : it.pars){
                    tmpCallInst.CallParameters.add(tmp.ExprResult);
                }
                currentBasicBlock.addBasicBlockInst(tmpCallInst);
            } else if(((MemberAccExprNode) it.funcName).Identifier.equals("size")){
                //array.size()

                //turn the funcName into the correct type
                IROperand tmpFuncResult = it.funcName.ExprResult;
                if(!(tmpFuncResult.thisType instanceof PointerType)){
                    Register tmpCastResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),"FuncName_bitcast");
                    currentBasicBlock.addBasicBlockInst(new bitcastInstruction(currentBasicBlock,it.funcName.ExprResult,
                            new PointerType(new IntegerType(IntegerType.IRBitWidth.i32)),tmpCastResult));
                    tmpFuncResult = tmpCastResult;
                    currentBasicBlock.addBasicBlockRegister("FuncName_bitcast",tmpCastResult);
                }

                //get the element ptr
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"array_size");
                getElementPtrInstruction tmpGetElementPtr = new getElementPtrInstruction(currentBasicBlock,tmpFuncResult,tmpResult);
                tmpGetElementPtr.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32,-1));
                currentBasicBlock.addBasicBlockInst(tmpGetElementPtr);
            } else {
                throw new RuntimeException();
            }
        } else if(it.funcName instanceof IdExprNode){
            //function which is not in class
            String tmpFuncNameInString = ((IdExprNode) it.funcName).Identifier;
            IRFunction tmpIRFunction = currentModule.IRGlobalFunctionTable.get(tmpFuncNameInString);
            funcDefNode tmpFuncDefNode = gScope.getfuncDefNode(tmpFuncNameInString,true);
            IRTypeSystem tmpFuncIRType = currentModule.getIRType(tmpFuncDefNode.funcType);
            Register tmpResult = null;
            if(!tmpFuncIRType.toString().equals("void")){
                tmpResult = new Register(tmpFuncIRType,"funccal");
            }
            callInstruction tmpCallInst = new callInstruction(currentBasicBlock,tmpResult,tmpIRFunction);
            for(var tmp : it.pars){
                tmpCallInst.CallParameters.add(tmp.ExprResult);
            }
            currentBasicBlock.addBasicBlockInst(tmpCallInst);
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
            currentBasicBlock.addBasicBlockRegister("SelfAdd",tmpResult);
        } else if(it.op.equals("--")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "SelfSub");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub, it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, 1), tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult, it.expr.ExprResult));
            it.ExprResult = tmpResult;
            currentBasicBlock.addBasicBlockRegister("SelfSub",tmpResult);
        }
    }

    @Override
    public void visit(MemberAccExprNode it) {
        it.expr.accept(this);

        //(1) get the Class Type of the Member
        IRTypeSystem tmpIRType = currentModule.getIRType(it.ExprType);
        if(!(tmpIRType instanceof StructureType))
            throw new RuntimeException();

        //(2) get the Identifier in the Class
        IRTypeSystem tmpMemberIRType = null;
        int tmpMemberIndex = 0;
        for(var tmp : ((StructureType) tmpIRType).StructureMember){
            if(tmp.toString().equals(it.Identifier)){
                tmpMemberIRType = tmp;
                break;
            }
            ++tmpMemberIndex;
        }

        //(3) do the getElementPtr inst
        String RegisterName = "memacc_result";
        Register tmpResult = new Register(tmpMemberIRType,RegisterName);
        getElementPtrInstruction tmpgetElementPtrInst = new getElementPtrInstruction(currentBasicBlock,it.expr.ExprResult,tmpResult);
        tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32,0));
        tmpgetElementPtrInst.GetElementPtrIdx.add(new IntegerConstant(IntegerType.IRBitWidth.i32,tmpMemberIndex));
        currentBasicBlock.addBasicBlockInst(tmpgetElementPtrInst);
        it.ExprResult = tmpResult;
        currentBasicBlock.addBasicBlockRegister(RegisterName,tmpResult);
    }

    @Override
    public void visit(IdExprNode it) {
        //no Identifier in class
        it.ExprResult = currentBasicBlock.BasicBlockRegister.get(it.Identifier);
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
