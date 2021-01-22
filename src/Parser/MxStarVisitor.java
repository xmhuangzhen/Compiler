// Generated from D:/compiler_v1/src/Parser\MxStar.g4 by ANTLR 4.9
package Parser;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link MxStarParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface MxStarVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link MxStarParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(MxStarParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#programUnit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgramUnit(MxStarParser.ProgramUnitContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#varDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVarDef(MxStarParser.VarDefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#singlevarDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSinglevarDef(MxStarParser.SinglevarDefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#classDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassDef(MxStarParser.ClassDefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#constructorDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstructorDef(MxStarParser.ConstructorDefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#funcDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFuncDef(MxStarParser.FuncDefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#funcType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFuncType(MxStarParser.FuncTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#parDefList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParDefList(MxStarParser.ParDefListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#parVarDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParVarDef(MxStarParser.ParVarDefContext ctx);
	/**
	 * Visit a parse tree produced by the {@code arrayType}
	 * labeled alternative in {@link MxStarParser#typedef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArrayType(MxStarParser.ArrayTypeContext ctx);
	/**
	 * Visit a parse tree produced by the {@code narrayType}
	 * labeled alternative in {@link MxStarParser#typedef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNarrayType(MxStarParser.NarrayTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#nonarraytypedef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNonarraytypedef(MxStarParser.NonarraytypedefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#suite}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSuite(MxStarParser.SuiteContext ctx);
	/**
	 * Visit a parse tree produced by the {@code block}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock(MxStarParser.BlockContext ctx);
	/**
	 * Visit a parse tree produced by the {@code vardefStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVardefStmt(MxStarParser.VardefStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ifStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfStmt(MxStarParser.IfStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code forStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForStmt(MxStarParser.ForStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code whileStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWhileStmt(MxStarParser.WhileStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code returnStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturnStmt(MxStarParser.ReturnStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code continueStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContinueStmt(MxStarParser.ContinueStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code breakStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBreakStmt(MxStarParser.BreakStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code pureExprStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPureExprStmt(MxStarParser.PureExprStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code emptyStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEmptyStmt(MxStarParser.EmptyStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewExpr(MxStarParser.NewExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code thisExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitThisExpr(MxStarParser.ThisExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code unaryExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUnaryExpr(MxStarParser.UnaryExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code funccal}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunccal(MxStarParser.FunccalContext ctx);
	/**
	 * Visit a parse tree produced by the {@code memberAcc}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMemberAcc(MxStarParser.MemberAccContext ctx);
	/**
	 * Visit a parse tree produced by the {@code selfExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSelfExpr(MxStarParser.SelfExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code binaryExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBinaryExpr(MxStarParser.BinaryExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code subExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSubExpr(MxStarParser.SubExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code assignExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssignExpr(MxStarParser.AssignExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code arraydefExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArraydefExpr(MxStarParser.ArraydefExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdExpr(MxStarParser.IdExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code constExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstExpr(MxStarParser.ConstExprContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#exprList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprList(MxStarParser.ExprListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#literal}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLiteral(MxStarParser.LiteralContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newtypeWrong}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewtypeWrong(MxStarParser.NewtypeWrongContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newtypearray}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewtypearray(MxStarParser.NewtypearrayContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newtypeobject}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewtypeobject(MxStarParser.NewtypeobjectContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newtypenonarray}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewtypenonarray(MxStarParser.NewtypenonarrayContext ctx);
}