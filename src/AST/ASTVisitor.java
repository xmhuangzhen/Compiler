package AST;

public interface ASTVisitor {
    void visit(RootNode it);

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
    void visit(cmpExprNode it);
    void visit(varExprNode it);
}
