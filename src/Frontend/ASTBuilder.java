package Frontend;

import AST.*;
import Parser.MxStarBaseVisitor;
import Parser.MxStarParser;
import Util.Scope;
import Util.globalScope;
import Util.position;
import org.antlr.v4.runtime.ParserRuleContext;

public class ASTBuilder extends MxStarBaseVisitor<ASTNode> {
    private globalScope gScope;
    private Scope currentScope;


    public ASTBuilder(globalScope gScope) {
        this.gScope = gScope;
    }


    @Override
    public ASTNode visitProgram(MxStarParser.ProgramContext ctx) {
        RootNode root = new RootNode(new position(ctx));
        ctx.programUnit().forEach(cd -> root.ProgramDefs.add((ProgramUnitNode) visit(cd)));
        return root;
    }

    @Override
    public ASTNode visitProgramUnit(MxStarParser.ProgramUnitContext ctx){
        ProgramUnitNode node;
        if(ctx.classDef() != null) node = (classDefNode) visit(ctx.classDef());
        else if(ctx.funcDef() != null) node = (funcDefNode) visit(ctx.funcDef());
        else node = (varDefStmtNode) visit(ctx.varDef());
        return node;
    }

    @Override
    public ASTNode visitVarDef(MxStarParser.VarDefContext ctx) {
        TypeNode varTypeNode = (TypeNode) visit(ctx.typedef());
        varDefStmtNode node = new varDefStmtNode(varTypeNode, new position(ctx));

        if(!ctx.singlevarDef().isEmpty()) {
            for(ParserRuleContext stmt: ctx.singlevarDef()){
                singlevarDefStmtNode tmp = (singlevarDefStmtNode) visit(stmt);
                tmp.typeNode = varTypeNode;
                node.stmts.add(tmp);
            }
        }
        return node;
    }

    @Override
    public ASTNode visitSinglevarDef(MxStarParser.SinglevarDefContext ctx) {
        String varname = ctx.Identifier().toString();
        ExprNode expr = null;
        if(ctx.expression() != null ) expr = (ExprNode) visit(ctx.expression());
        return new singlevarDefStmtNode(varname, expr, null, new position(ctx));
    }

    @Override
    public ASTNode visitClassDef(MxStarParser.ClassDefContext ctx) {
        String className = ctx.Identifier().toString();
        classDefNode node = new classDefNode(className, new position(ctx));

        for(var vd : ctx.varDef()){
            varDefStmtNode tmpvarDefStmtNode = (varDefStmtNode) visit(vd);
            node.varDefs.add(tmpvarDefStmtNode);
        }

        for(var vd : ctx.funcDef()){
            funcDefNode tmpfuncDefNode = (funcDefNode) visit(vd);
            node.funcDefs.add(tmpfuncDefNode);
        }

        for(var vd : ctx.constructorDef()){
            constructorDefNode tmpconsDefNode = (constructorDefNode) visit(vd);
            node.tmpconsDefs.add(tmpconsDefNode);
            node.consDef = tmpconsDefNode;
        }
        return node;
    }

    @Override
    public ASTNode visitFuncDef(MxStarParser.FuncDefContext ctx) {
        currentScope = new Scope(currentScope);
        String FuncName = ctx.Identifier().toString();
        FuncTypeNode tmpFuncTypeNode = (FuncTypeNode) visit(ctx.funcType());

        funcDefNode node = new funcDefNode(FuncName, tmpFuncTypeNode, new position(ctx));
        if(!ctx.parDefList().parVarDef().isEmpty()){
            for(var par : ctx.parDefList().parVarDef()){
                singlevarDefStmtNode tmp = (singlevarDefStmtNode) visit(par);
                if(tmp != null) node.parDefs.add(tmp);
            }
        }

        for(var stmt : ctx.suite().statement()){
            StmtNode tmpStmtNode = (StmtNode) visit(stmt);
            node.stmts.add(tmpStmtNode);
        }
        return node;
    }

    @Override
    public ASTNode visitFuncType(MxStarParser.FuncTypeContext ctx) {
        FuncTypeNode tmpNode;
        if(ctx.typedef() != null){
            tmpNode = (FuncTypeNode) visit(ctx.typedef());
        } else {
            tmpNode = new FuncTypeNode("void", new position(ctx));
        }
        return tmpNode;
    }

    @Override
    public ASTNode visitParDefList(MxStarParser.ParDefListContext ctx) {
        varDefStmtNode node = new varDefStmtNode(null,new position(ctx));
        for(var tmpNode : ctx.parVarDef()){
            singlevarDefStmtNode parNode = (singlevarDefStmtNode) visit(tmpNode);
            node.stmts.add(parNode);
        }
        return node;
    }

    @Override
    public ASTNode visitArrayType(MxStarParser.ArrayTypeContext ctx) {
        TypeNode tmpNode = (TypeNode) visit(ctx.typedef());
        ArrayTypeNode node = new ArrayTypeNode(tmpNode, new position(ctx));
        return node;
    }

    @Override
    public ASTNode visitNarrayType(MxStarParser.NarrayTypeContext ctx) {
        NonArrayTypeNode node = new NonArrayTypeNode(ctx.nonarraytypedef().getText(), new position(ctx));
        return node;
    }

    @Override
    public ASTNode visitSuite(MxStarParser.SuiteContext ctx) {///////////////////
        blockStmtNode node = new blockStmtNode(new position(ctx));
        if(!ctx.statement().isEmpty()){
            for(var stmt : ctx.statement()){
                StmtNode tmp = (StmtNode) visit(stmt);
                if(tmp != null) node.stmts.add(tmp);
            }
        }
        return node;
    }

    @Override
    public ASTNode visitBlock(MxStarParser.BlockContext ctx) {
        return visit(ctx.suite());
    }

    @Override
    public ASTNode visitVardefStmt(MxStarParser.VardefStmtContext ctx) {
        return visit(ctx.varDef());
    }

    @Override
    public ASTNode visitIfStmt(MxStarParser.IfStmtContext ctx) {
        StmtNode thenStmt = (StmtNode) visit(ctx.trueStmt);
        StmtNode elseStmt = null;
        ExprNode condition = (ExprNode) visit(ctx.expression());
        if(ctx.falseStmt != null) elseStmt = (StmtNode) visit(ctx.falseStmt);
        return new ifStmtNode(condition, thenStmt, elseStmt, new position(ctx));
    }

    @Override
    public ASTNode visitForStmt(MxStarParser.ForStmtContext ctx) {
        ExprNode tmpinitExpr = null;
        if(ctx.initexp != null) tmpinitExpr = (ExprNode) visit(ctx.initexp);
        ExprNode tmpcondExpr = null;
        if(ctx.condexp != null) tmpcondExpr = (ExprNode) visit(ctx.condexp);
        ExprNode tmpstepExpr = null;
        if(ctx.stepexp != null) tmpstepExpr = (ExprNode) visit(ctx.stepexp);
        StmtNode tmpstmt = null;
        if(ctx.statement() != null) tmpstmt = (StmtNode) visit(ctx.statement());
        return new ForStmtNode(tmpinitExpr, tmpcondExpr, tmpstepExpr, tmpstmt, new position(ctx));
    }

    @Override
    public ASTNode visitWhileStmt(MxStarParser.WhileStmtContext ctx) {
        ExprNode tmpcondExpr = (ExprNode) visit(ctx.expression());
        StmtNode tmpstmt = null;
        if(ctx.statement() != null) tmpstmt = (StmtNode) visit(ctx.statement());
        return new WhileStmtNode(tmpcondExpr, tmpstmt, new position(ctx));
    }

    @Override
    public ASTNode visitReturnStmt(MxStarParser.ReturnStmtContext ctx) {
        ExprNode value = null;
        if(ctx.expression() != null) value = (ExprNode) visit(ctx.expression());
        return new returnStmtNode(value, new position(ctx));
    }

    @Override
    public ASTNode visitContinueStmt(MxStarParser.ContinueStmtContext ctx) {
        return new continueStmtNode(new position(ctx));
    }

    @Override
    public ASTNode visitBreakStmt(MxStarParser.BreakStmtContext ctx) {
        return new breakStmtNode(new position(ctx));
    }

    @Override
    public ASTNode visitPureExprStmt(MxStarParser.PureExprStmtContext ctx) {
        ExprNode tmpNode = (ExprNode) visit(ctx.expression());
        return new exprStmtNode(tmpNode,new position(ctx));
    }

    @Override
    public ASTNode visitEmptyStmt(MxStarParser.EmptyStmtContext ctx) {
        return null;
    }

    //---new---
    @Override
    public ASTNode visitNewExpr(MxStarParser.NewExprContext ctx) {
        NewExprNode node = (NewExprNode) visit(ctx.newType());
        return node;
    }

    @Override
    public ASTNode visitNewtypeWrong(MxStarParser.NewtypeWrongContext ctx){
        NewExprNode node = new NewExprNode(null,null,null);
        node.IsWrong = true;
        return node;
    }

    @Override
    public ASTNode visitNewtypearray(MxStarParser.NewtypearrayContext ctx) {
        TypeNode typeNode = (TypeNode) visit(ctx.nonarraytypedef());
        NewExprNode node = new NewExprNode(ctx.expression().toString(),typeNode,new position(ctx));
        int dimension = 0;
        for(var ch : ctx.children){
            if(ch.getText().equals("[")) dimension++;
        }
        node.dim = dimension;

        for(var expr : ctx.expression()){
            ExprNode tmpNode = (ExprNode) visit(expr);
            node.exprDim.add(tmpNode);
        }
        return node;
    }

    @Override
    public ASTNode visitNewtypeobject(MxStarParser.NewtypeobjectContext ctx) {
        TypeNode typeNode = (TypeNode) visit(ctx.nonarraytypedef());
        NewExprNode node = new NewExprNode(ctx.getText(),typeNode,new position(ctx));
        return node;
    }

    @Override
    public ASTNode visitNewtypenonarray(MxStarParser.NewtypenonarrayContext ctx) {
        TypeNode typeNode = (TypeNode) visit(ctx.nonarraytypedef());
        NewExprNode node = new NewExprNode(ctx.getText(),typeNode,new position(ctx));
        return node;
    }

    //---expr---
    @Override
    public ASTNode visitThisExpr(MxStarParser.ThisExprContext ctx) {
        ThisExprNode node = new ThisExprNode(ctx.getText(),new position(ctx));
        return node;
    }

    @Override
    public ASTNode visitUnaryExpr(MxStarParser.UnaryExprContext ctx) {
        UnaryExprNode node = new UnaryExprNode(ctx.getText(),null,ctx.op.getText(),new position(ctx));
        node.expr = (ExprNode) visit(ctx.expression());
        return node;
    }

    @Override
    public ASTNode visitFunccal(MxStarParser.FunccalContext ctx) {
        ExprNode tmpExprNode = (ExprNode) visit(ctx.expression());
        FunccalExprNode node = new FunccalExprNode(ctx.getText(), tmpExprNode,new position(ctx));
        if(ctx.exprList() != null){
            for(var expr : ctx.exprList().expression()){
                ExprNode tmpNode = (ExprNode) visit(expr);
                node.pars.add(tmpNode);
            }
        }
        return node;
    }

    @Override
    public ASTNode visitExprList(MxStarParser.ExprListContext ctx){
        return null;
    }

    @Override
    public ASTNode visitSelfExpr(MxStarParser.SelfExprContext ctx) {
        SelfExprNode node = new SelfExprNode(ctx.getText(),null,ctx.op.toString(),new position(ctx));
        node.expr = (ExprNode) visit(ctx.expression());
        return node;
    }

    @Override
    public ASTNode visitMemberAcc(MxStarParser.MemberAccContext ctx) {
        MemberAccExprNode node = new MemberAccExprNode(ctx.getText(),null,new position(ctx));
        node.expr = (ExprNode) visit(ctx.expression());
        node.Identifier = ctx.Identifier().getText();
        return node;
    }

    @Override
    public ASTNode visitSubExpr(MxStarParser.SubExprContext ctx) {
        return visit(ctx.expression());
    }

    @Override
    public ASTNode visitIdExpr(MxStarParser.IdExprContext ctx){
        IdExprNode node = new IdExprNode(ctx.getText(),new position(ctx));
        node.Identifier = ctx.Identifier().getText();
        return node;
    }

    @Override
    public ASTNode visitConstExpr(MxStarParser.ConstExprContext ctx){
        return visit(ctx.literal());
    }

    @Override
    public ASTNode visitBinaryExpr(MxStarParser.BinaryExprContext ctx) {
        binaryExprNode node = new binaryExprNode(ctx.getText(),ctx.op.getText(),new position(ctx));
        node.lhs = (ExprNode) visit(ctx.exprl);
        node.rhs = (ExprNode) visit(ctx.exprr);
        return node;
    }

    @Override
    public ASTNode visitAssignExpr(MxStarParser.AssignExprContext ctx) {
        assignExprNode node = new assignExprNode(ctx.getText(),new position(ctx));
        node.lhs = (ExprNode) visit(ctx.exprl);
        node.rhs = (ExprNode) visit(ctx.exprr);
        return node;
    }

    @Override
    public ASTNode visitLiteral(MxStarParser.LiteralContext ctx) {
        String value = ctx.getText();
        constExprNode node;
        position pos = new position(ctx);
        if(ctx.BoolConstant() != null) node = new BoolConstExprNode(value,pos);
        else if(ctx.StringConstant() != null) node = new StringConstExprNode(value,pos);
        else if(ctx.DecimalInteger() != null) node = new IntConstExprNode(value,pos);
        else node = new NullConstExprNode(value,pos);
        return node;
    }

    @Override
    public ASTNode visitArraydef(MxStarParser.ArraydefContext ctx){
        return null;
    }


}
