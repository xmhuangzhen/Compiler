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
        ctx.classDef().forEach(cd -> root.classDefs.add(( classDefNode)  visit(cd)));
        ctx.funcDef().forEach(cd -> root.funcDefs.add((funcDefNode) visit(cd)));
        ctx.varDef().forEach(cd -> root.varDefs.add((varDefStmtNode) visit(cd)));
        return root;
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
        return super.visitPureExprStmt(ctx);
    }

    @Override
    public ASTNode visitEmptyStmt(MxStarParser.EmptyStmtContext ctx) {
        return null;
    }

    @Override
    public ASTNode visitNewExpr(MxStarParser.NewExprContext ctx) {
        return super.visitNewExpr(ctx);
    }

    @Override
    public ASTNode visitThisExpr(MxStarParser.ThisExprContext ctx) {
        return super.visitThisExpr(ctx);
    }

    @Override
    public ASTNode visitUnaryExpr(MxStarParser.UnaryExprContext ctx) {
        return super.visitUnaryExpr(ctx);
    }

    @Override
    public ASTNode visitFunccal(MxStarParser.FunccalContext ctx) {
        return super.visitFunccal(ctx);
    }

    @Override
    public ASTNode visitSelfExpr(MxStarParser.SelfExprContext ctx) {
        return super.visitSelfExpr(ctx);
    }

    @Override
    public ASTNode visitMemberAcc(MxStarParser.MemberAccContext ctx) {
        return super.visitMemberAcc(ctx);
    }

    @Override
    public ASTNode visitAtomExpr(MxStarParser.AtomExprContext ctx) {
        return super.visitAtomExpr(ctx);
    }

    @Override
    public ASTNode visitBinaryExpr(MxStarParser.BinaryExprContext ctx) {
        return super.visitBinaryExpr(ctx);
    }

    @Override
    public ASTNode visitArraydef(MxStarParser.ArraydefContext ctx) {
        return super.visitArraydef(ctx);
    }

    @Override
    public ASTNode visitAssignExpr(MxStarParser.AssignExprContext ctx) {
        return super.visitAssignExpr(ctx);
    }

    @Override
    public ASTNode visitPrimary(MxStarParser.PrimaryContext ctx) {
        return super.visitPrimary(ctx);
    }

    @Override
    public ASTNode visitLiteral(MxStarParser.LiteralContext ctx) {
        return super.visitLiteral(ctx);
    }

    @Override
    public ASTNode visitNonarraynewtype(MxStarParser.NonarraynewtypeContext ctx) {
        return super.visitNonarraynewtype(ctx);
    }

    @Override
    public ASTNode visitNewtypeobject(MxStarParser.NewtypeobjectContext ctx) {
        return super.visitNewtypeobject(ctx);
    }

    @Override
    public ASTNode visitNewtypearray(MxStarParser.NewtypearrayContext ctx) {
        return super.visitNewtypearray(ctx);
    }

}
