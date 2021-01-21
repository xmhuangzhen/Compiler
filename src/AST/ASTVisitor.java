package AST;

public interface ASTVisitor {
    void visit(RootNode it);
    void visit(ProgramUnitNode it);

    void visit(varDefStmtNode it);
    void visit(singlevarDefStmtNode it);
    void visit(classDefNode it);
    void visit(funcDefNode it);
    void visit(constructorDefNode it);

    void visit(FuncTypeNode it);
    void visit(NonArrayTypeNode it);
    void visit(ClassTypeNode it);
    void visit(ArrayTypeNode it);
    void visit(VoidTypeNode it);


    void visit(returnStmtNode it);
    void visit(blockStmtNode it);
    void visit(exprStmtNode it);
    void visit(ifStmtNode it);
    void visit(ForStmtNode it);
    void visit(WhileStmtNode it);
    void visit(continueStmtNode it);
    void visit(breakStmtNode it);

    void visit(assignExprNode it);
    void visit(binaryExprNode it);
    void visit(constExprNode it);
    void visit(NewExprNode it);
    void visit(ThisExprNode it);
    void visit(UnaryExprNode it);
    void visit(FunccalExprNode it);
    void visit(SelfExprNode it);
    void visit(MemberAccExprNode it);
    void visit(IdExprNode it);
    void visit(BoolConstExprNode it);
    void visit(NullConstExprNode it);
    void visit(IntConstExprNode it);
    void visit(StringConstExprNode it);
    void visit(ArraydefExprNode it);
}
