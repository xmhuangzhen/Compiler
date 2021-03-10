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

        if(it.op.equals("*")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"mul");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.mul,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("/")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"sdiv");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sdiv,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("%")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"srem");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.srem,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("-")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"sub");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("<<")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"shl");
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.shl,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals(">>")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"ashr");
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.ashr,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("&")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"and");
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.and,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("|")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"or");
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.or,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("^")){
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"ashr");
            currentBasicBlock.addBasicBlockInst(new bitwiseBinaryInstruction(currentBasicBlock,
                    bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("+")){
            if(it.lhs.ExprType.Typename.equals("int")){
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"add");
                currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                        binaryOpInstruction.BinaryOperandENUM.add,it.lhs.ExprResult,it.rhs.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            } else if(it.lhs.ExprType.Typename.equals("string")){
                Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"add");
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_add");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
                it.ExprResult = tmpResult;
            } else {
                throw new RuntimeException();
            }
        } else if(it.op.equals(">")){
            if(it.lhs.ExprType.Typename.equals("int")){
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),"sgt");
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sgt, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult,it.rhs.ExprResult,tmpResult));
                it.ExprResult = tmpResult;
            } else if(it.lhs.ExprType.Typename.equals("string")){
                Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"sgt");
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_sgt");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
                it.ExprResult = tmpResult;
            } else {
                throw new RuntimeException();
            }
        } else if(it.op.equals("<")){
            if(it.lhs.ExprType.Typename.equals("int")){
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),"slt");
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.slt, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult,it.rhs.ExprResult,tmpResult));
                it.ExprResult = tmpResult;
            } else if(it.lhs.ExprType.Typename.equals("string")){
                Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"slt");
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_slt");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
                it.ExprResult = tmpResult;
            } else {
                throw new RuntimeException();
            }
        } else if(it.op.equals(">=")){
            if(it.lhs.ExprType.Typename.equals("int")){
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),"sge");
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sge, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult,it.rhs.ExprResult,tmpResult));
                it.ExprResult = tmpResult;
            } else if(it.lhs.ExprType.Typename.equals("string")){
                Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"sge");
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_sge");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
                it.ExprResult = tmpResult;
            } else {
                throw new RuntimeException();
            }
        } else if(it.op.equals("<=")){
            if(it.lhs.ExprType.Typename.equals("int")){
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),"sle");
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.sle, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult,it.rhs.ExprResult,tmpResult));
                it.ExprResult = tmpResult;
            } else if(it.lhs.ExprType.Typename.equals("string")){
                Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"sle");
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_sle");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
                it.ExprResult = tmpResult;
            } else {
                throw new RuntimeException();
            }
        } else if(it.op.equals("==")){
            if(it.lhs.ExprType.Typename.equals("int")) {
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "eq");
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            } else if(it.lhs.ExprType.Typename.equals("bool")){
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "eq");
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i1),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            } else if(it.lhs.ExprType.Typename.equals("string")){
                Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"eq");
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_eq");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
                it.ExprResult = tmpResult;
            } else if(it.lhs.ExprType.Typename.equals("null")){
                if(it.rhs.ExprType.Typename.equals("null")){
                    it.ExprResult = new BooleanConstant(true);
                } else {
                    //todo
                }
            }
        } else if(it.op.equals("!=")){
            if(it.lhs.ExprType.Typename.equals("int")) {
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "ne");
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i32),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            } else if(it.lhs.ExprType.Typename.equals("bool")){
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "ne");
                currentBasicBlock.addBasicBlockInst(new icmpInstruction(currentBasicBlock,
                        icmpInstruction.IcmpOperandENUM.eq, new IntegerType(IntegerType.IRBitWidth.i1),
                        it.lhs.ExprResult, it.rhs.ExprResult, tmpResult));
                it.ExprResult = tmpResult;
            } else if(it.lhs.ExprType.Typename.equals("string")){
                Register tmpResult = new Register(new PointerType(new IntegerType(IntegerType.IRBitWidth.i8)),"ne");
                IRFunction tmpFunction = currentModule.IRGlobalFunctionTable.get("__string_ne");
                callInstruction tmpcallInst = new callInstruction(currentBasicBlock,tmpResult,tmpFunction);
                tmpcallInst.CallParameters.add(it.lhs.ExprResult);
                tmpcallInst.CallParameters.add(it.rhs.ExprResult);
                currentBasicBlock.addBasicBlockInst(tmpcallInst);
                it.ExprResult = tmpResult;
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
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),"Andand");
            phiInstruction tmpphiInst = new phiInstruction(currentBasicBlock,tmpResult);
            tmpphiInst.PhiLabel.add(phiBlock1); tmpphiInst.PhiValue.add(new BooleanConstant(false));
            tmpphiInst.PhiLabel.add(phiBlock2); tmpphiInst.PhiValue.add(it.rhs.ExprResult);
            currentBasicBlock.addBasicBlockInst(tmpphiInst);

            it.ExprResult = tmpResult;
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
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1),"Oror");
            phiInstruction tmpphiInst = new phiInstruction(currentBasicBlock,tmpResult);
            tmpphiInst.PhiLabel.add(phiBlock1); tmpphiInst.PhiValue.add(new BooleanConstant(true));
            tmpphiInst.PhiLabel.add(phiBlock2); tmpphiInst.PhiValue.add(it.rhs.ExprResult);
            currentBasicBlock.addBasicBlockInst(tmpphiInst);

            it.ExprResult = tmpResult;

        } else {
            throw new RuntimeException();
        }
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
        //todo
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
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"PreAdd");
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
                Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"Negation");
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
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i1), "not");
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

    }

    @Override
    public void visit(SelfExprNode it) {
        it.expr.accept(this);
        if(it.op.equals("++")){ //a++
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32),"PreAdd");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.add,it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32,1),tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult,it.expr.ExprResult));
            it.ExprResult = tmpResult;
        } else if(it.op.equals("--")) {
            Register tmpResult = new Register(new IntegerType(IntegerType.IRBitWidth.i32), "PreAdd");
            currentBasicBlock.addBasicBlockInst(new binaryOpInstruction(currentBasicBlock,
                    binaryOpInstruction.BinaryOperandENUM.sub, it.expr.ExprResult,
                    new IntegerConstant(IntegerType.IRBitWidth.i32, 1), tmpResult));
            currentBasicBlock.addBasicBlockInst(new storeInstruction(currentBasicBlock,
                    tmpResult, it.expr.ExprResult));
            it.ExprResult = tmpResult;
        }
    }

    @Override
    public void visit(MemberAccExprNode it) {
        it.expr.accept(this);
        IRTypeSystem tmpIRType = currentModule.getIRType(it.ExprType);
        if(!(tmpIRType instanceof StructureType))
            throw new RuntimeException();

        int pos = 0;
        for(var tmp : ((StructureType) tmpIRType).StructureMember){
            if(tmp.toString().equals(it.Identifier)){
                break;
            }
        }


        //todo
    }

    @Override
    public void visit(IdExprNode it) {
            //todo

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
