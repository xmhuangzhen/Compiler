// Generated from D:/compiler_v1/src/Parser\MxStar.g4 by ANTLR 4.9
package Parser;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MxStarParser}.
 */
public interface MxStarListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MxStarParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(MxStarParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(MxStarParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#programUnit}.
	 * @param ctx the parse tree
	 */
	void enterProgramUnit(MxStarParser.ProgramUnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#programUnit}.
	 * @param ctx the parse tree
	 */
	void exitProgramUnit(MxStarParser.ProgramUnitContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#varDef}.
	 * @param ctx the parse tree
	 */
	void enterVarDef(MxStarParser.VarDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#varDef}.
	 * @param ctx the parse tree
	 */
	void exitVarDef(MxStarParser.VarDefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#singlevarDef}.
	 * @param ctx the parse tree
	 */
	void enterSinglevarDef(MxStarParser.SinglevarDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#singlevarDef}.
	 * @param ctx the parse tree
	 */
	void exitSinglevarDef(MxStarParser.SinglevarDefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#classDef}.
	 * @param ctx the parse tree
	 */
	void enterClassDef(MxStarParser.ClassDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#classDef}.
	 * @param ctx the parse tree
	 */
	void exitClassDef(MxStarParser.ClassDefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#constructorDef}.
	 * @param ctx the parse tree
	 */
	void enterConstructorDef(MxStarParser.ConstructorDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#constructorDef}.
	 * @param ctx the parse tree
	 */
	void exitConstructorDef(MxStarParser.ConstructorDefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#funcDef}.
	 * @param ctx the parse tree
	 */
	void enterFuncDef(MxStarParser.FuncDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#funcDef}.
	 * @param ctx the parse tree
	 */
	void exitFuncDef(MxStarParser.FuncDefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#funcType}.
	 * @param ctx the parse tree
	 */
	void enterFuncType(MxStarParser.FuncTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#funcType}.
	 * @param ctx the parse tree
	 */
	void exitFuncType(MxStarParser.FuncTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#parDefList}.
	 * @param ctx the parse tree
	 */
	void enterParDefList(MxStarParser.ParDefListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#parDefList}.
	 * @param ctx the parse tree
	 */
	void exitParDefList(MxStarParser.ParDefListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#parVarDef}.
	 * @param ctx the parse tree
	 */
	void enterParVarDef(MxStarParser.ParVarDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#parVarDef}.
	 * @param ctx the parse tree
	 */
	void exitParVarDef(MxStarParser.ParVarDefContext ctx);
	/**
	 * Enter a parse tree produced by the {@code arrayType}
	 * labeled alternative in {@link MxStarParser#typedef}.
	 * @param ctx the parse tree
	 */
	void enterArrayType(MxStarParser.ArrayTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code arrayType}
	 * labeled alternative in {@link MxStarParser#typedef}.
	 * @param ctx the parse tree
	 */
	void exitArrayType(MxStarParser.ArrayTypeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code narrayType}
	 * labeled alternative in {@link MxStarParser#typedef}.
	 * @param ctx the parse tree
	 */
	void enterNarrayType(MxStarParser.NarrayTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code narrayType}
	 * labeled alternative in {@link MxStarParser#typedef}.
	 * @param ctx the parse tree
	 */
	void exitNarrayType(MxStarParser.NarrayTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#nonarraytypedef}.
	 * @param ctx the parse tree
	 */
	void enterNonarraytypedef(MxStarParser.NonarraytypedefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#nonarraytypedef}.
	 * @param ctx the parse tree
	 */
	void exitNonarraytypedef(MxStarParser.NonarraytypedefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#suite}.
	 * @param ctx the parse tree
	 */
	void enterSuite(MxStarParser.SuiteContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#suite}.
	 * @param ctx the parse tree
	 */
	void exitSuite(MxStarParser.SuiteContext ctx);
	/**
	 * Enter a parse tree produced by the {@code block}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBlock(MxStarParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by the {@code block}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBlock(MxStarParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by the {@code vardefStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterVardefStmt(MxStarParser.VardefStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code vardefStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitVardefStmt(MxStarParser.VardefStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ifStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterIfStmt(MxStarParser.IfStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ifStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitIfStmt(MxStarParser.IfStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code forStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterForStmt(MxStarParser.ForStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code forStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitForStmt(MxStarParser.ForStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code whileStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStmt(MxStarParser.WhileStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code whileStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStmt(MxStarParser.WhileStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code returnStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterReturnStmt(MxStarParser.ReturnStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code returnStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitReturnStmt(MxStarParser.ReturnStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code continueStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterContinueStmt(MxStarParser.ContinueStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code continueStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitContinueStmt(MxStarParser.ContinueStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code breakStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBreakStmt(MxStarParser.BreakStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code breakStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBreakStmt(MxStarParser.BreakStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code pureExprStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterPureExprStmt(MxStarParser.PureExprStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code pureExprStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitPureExprStmt(MxStarParser.PureExprStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code emptyStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterEmptyStmt(MxStarParser.EmptyStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code emptyStmt}
	 * labeled alternative in {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitEmptyStmt(MxStarParser.EmptyStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterNewExpr(MxStarParser.NewExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitNewExpr(MxStarParser.NewExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code thisExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterThisExpr(MxStarParser.ThisExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code thisExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitThisExpr(MxStarParser.ThisExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code unaryExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterUnaryExpr(MxStarParser.UnaryExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code unaryExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitUnaryExpr(MxStarParser.UnaryExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code funccal}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterFunccal(MxStarParser.FunccalContext ctx);
	/**
	 * Exit a parse tree produced by the {@code funccal}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitFunccal(MxStarParser.FunccalContext ctx);
	/**
	 * Enter a parse tree produced by the {@code memberAcc}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterMemberAcc(MxStarParser.MemberAccContext ctx);
	/**
	 * Exit a parse tree produced by the {@code memberAcc}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitMemberAcc(MxStarParser.MemberAccContext ctx);
	/**
	 * Enter a parse tree produced by the {@code selfExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterSelfExpr(MxStarParser.SelfExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code selfExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitSelfExpr(MxStarParser.SelfExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code binaryExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterBinaryExpr(MxStarParser.BinaryExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code binaryExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitBinaryExpr(MxStarParser.BinaryExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code subExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterSubExpr(MxStarParser.SubExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code subExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitSubExpr(MxStarParser.SubExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code assignExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterAssignExpr(MxStarParser.AssignExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code assignExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitAssignExpr(MxStarParser.AssignExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code arraydefExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterArraydefExpr(MxStarParser.ArraydefExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code arraydefExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitArraydefExpr(MxStarParser.ArraydefExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code constExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterConstExpr(MxStarParser.ConstExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code constExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitConstExpr(MxStarParser.ConstExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterIdExpr(MxStarParser.IdExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitIdExpr(MxStarParser.IdExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#exprList}.
	 * @param ctx the parse tree
	 */
	void enterExprList(MxStarParser.ExprListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#exprList}.
	 * @param ctx the parse tree
	 */
	void exitExprList(MxStarParser.ExprListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#literal}.
	 * @param ctx the parse tree
	 */
	void enterLiteral(MxStarParser.LiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#literal}.
	 * @param ctx the parse tree
	 */
	void exitLiteral(MxStarParser.LiteralContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newtypeWrong}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 */
	void enterNewtypeWrong(MxStarParser.NewtypeWrongContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newtypeWrong}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 */
	void exitNewtypeWrong(MxStarParser.NewtypeWrongContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newtypearray}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 */
	void enterNewtypearray(MxStarParser.NewtypearrayContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newtypearray}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 */
	void exitNewtypearray(MxStarParser.NewtypearrayContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newtypeobject}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 */
	void enterNewtypeobject(MxStarParser.NewtypeobjectContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newtypeobject}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 */
	void exitNewtypeobject(MxStarParser.NewtypeobjectContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newtypenonarray}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 */
	void enterNewtypenonarray(MxStarParser.NewtypenonarrayContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newtypenonarray}
	 * labeled alternative in {@link MxStarParser#newType}.
	 * @param ctx the parse tree
	 */
	void exitNewtypenonarray(MxStarParser.NewtypenonarrayContext ctx);
}