package Frontend;

import AST.ASTNode;
import Parser.MxStarBaseVisitor;
import Parser.MxStarParser;
import AST.*;
import Util.Scope;
import Util.position;
import Util.globalScope;
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
        ctx.classDef().forEach(cd -> root.strDefs.add((structDefNode) visit(cd)));
        return root;
    }

    @Override
    public ASTNode visitVarDef(MxStarParser.VarDefContext ctx) {
        varDefStmtNode node = new varDefStmtNode(new position(ctx));
        if(!ctx.singlevarDef().isEmpty()) {
            for(ParserRuleContext stmt: ctx.singlevarDef()){
                singlevarDefStmtNode tmp = (singlevarDefStmtNode) visit(stmt);
                if(tmp != null) node.stmts.add(tmp);
            }
        }
        return node;
    }

    @Override
    public ASTNode visitSinglevarDef(MxStarParser.SinglevarDefContext ctx) {
        String name = ctx.Identifier().toString();
        ExprNode expr = null;
        if(ctx.expression() != null )
            expr = (ExprNode) visit(ctx.expression());
        return new singlevarDefStmtNode(name,expr, gScope.getTypeFromName(name,new position(ctx)), new position(ctx));
    }

    @Override
    public ASTNode visitClassDef(MxStarParser.ClassDefContext ctx) {
        String name = ctx.Identifier().toString();
        classDefNode node = new classDefNode(name, gScope.getTypeFromName(name, new position(ctx)), new position(ctx));
        ctx.varDef().forEach(vd -> node.varDefs.add((varDefStmtNode) visit(vd)) );
        ctx.funcDef().forEach(vd -> node.funcDefs.add((funcDefNode) visit(vd)) );
        return node;
    }

    @Override
    public ASTNode visitFuncDef(MxStarParser.FuncDefContext ctx) {
        currentScope = new Scope(currentScope);
        String name = ctx.Identifier().toString();
        funcDefNode node = new funcDefNode(name, gScope.getTypeFromName(name, new position(ctx)), new position(ctx));
        if(!ctx.parDefList().singlevarDef().isEmpty()){
            for(ParserRuleContext par : ctx.parDefList().singlevarDef()){
                singlevarDefStmtNode tmp = (singlevarDefStmtNode) visit(par);
                if(tmp != null) node.parDefs.put(tmp.name, tmp.type);
            }
        }
        return node;
    }

    @Override
    public ASTNode visitFuncType(MxStarParser.FuncTypeContext ctx) {

        return super.visitFuncType(ctx);
    }

    @Override
    public ASTNode visitParDefList(MxStarParser.ParDefListContext ctx) {
        return super.visitParDefList(ctx);
    }

    @Override
    public ASTNode visitArrayType(MxStarParser.ArrayTypeContext ctx) {
        return super.visitArrayType(ctx);
    }

    @Override
    public ASTNode visitNarrayType(MxStarParser.NarrayTypeContext ctx) {
        return super.visitNarrayType(ctx);
    }

    @Override
    public ASTNode visitNarrayTypeInt(MxStarParser.NarrayTypeIntContext ctx) {
        return super.visitNarrayTypeInt(ctx);
    }

    @Override
    public ASTNode visitNarrayTypeBool(MxStarParser.NarrayTypeBoolContext ctx) {
        return super.visitNarrayTypeBool(ctx);
    }

    @Override
    public ASTNode visitNarrayTypeString(MxStarParser.NarrayTypeStringContext ctx) {
        return super.visitNarrayTypeString(ctx);
    }

    @Override
    public ASTNode visitNarrayTypeIdentifier(MxStarParser.NarrayTypeIdentifierContext ctx) {
        return super.visitNarrayTypeIdentifier(ctx);
    }

    @Override
    public ASTNode visitSuite(MxStarParser.SuiteContext ctx) {
        blockStmtNode node = new blockStmtNode(new position(ctx));
        if(!ctx.statement().isEmpty()){
            for(ParserRuleContext stmt : ctx.statement()){
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
        return super.visitForStmt(ctx);
    }

    @Override
    public ASTNode visitWhileStmt(MxStarParser.WhileStmtContext ctx) {
        return super.visitWhileStmt(ctx);
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
        return super.visitBreakStmt(ctx);
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
