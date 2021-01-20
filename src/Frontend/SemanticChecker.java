package Frontend;

import AST.*;
import Util.*;
import Util.error.semanticError;

import java.util.HashMap;
import java.util.Map;

public class SemanticChecker implements ASTVisitor {
    private Scope currentScope;
    private globalScope gScope;
    private String currentClassType;
    private String currentFuncType;

    @Override
    public void visit(RootNode it) {
        //(1) create global scope
        gScope = new globalScope(null);
        currentScope = gScope;

        //(2) class
        for(classDefNode tmpNode : it.classDefs){
            tmpNode.accept(this);
            TypeNode tmpTypeNode = new ClassTypeNode(tmpNode.className,tmpNode.pos);
            if(gScope.checkVarName(tmpNode.className)){
                throw new semanticError("The class name is existed.", tmpNode.pos);
            }
            gScope.types.put(tmpNode.className, tmpTypeNode);
        }

        //(3) function
        for(funcDefNode tmpNode : it.funcDefs){
            tmpNode.accept(this);
            funcDefNode tmpfuncDefNode = new funcDefNode(tmpNode.funcName,tmpNode.funcType, tmpNode.pos);
            if(gScope.checkFuncName(tmpNode.funcName)){
                throw new semanticError("The function's name exists.", tmpNode.pos);
            }
            gScope.declared_func.put(tmpNode.funcName,tmpfuncDefNode);
        }

        //(4) variables
        for(varDefStmtNode tmpNode : it.varDefs){
            tmpNode.accept(this);

            varDefStmtNode tmpvarDefStmtNode = new varDefStmtNode(tmpNode.varTypeNode,tmpNode.pos);
            if(gScope.checkVarNameList(tmpvarDefStmtNode) ){
                throw new semanticError("The variable's name exists.", tmpNode.pos);
            }
            if(!gScope.checkVarTypeList(tmpvarDefStmtNode)){
                throw new semanticError("The variable's type doesn't exists.", tmpNode.pos);
            }
            gScope.addVarList(tmpvarDefStmtNode);
        }

        // check int main()
        if(!gScope.checkMainFunction()){
            throw new semanticError("The main() function doesn't exists.",new position(0,0));
        }
        if(!gScope.checkMainType()){
            throw new semanticError("The main() function doesn't have the correct type.", new position(0,0));
        }
        if(!gScope.checkMainPar()){
            throw new semanticError("The main() function doesn't have the correct par.", new position(0,0));
        }
    }

    @Override
    public void visit(varDefStmtNode it) {
        //check var type
        if(!gScope.checkVarType(it.varTypeNode.getTypeName())){
            throw new semanticError("The var type doesn't exist.", it.pos);
        }
        if(it.varTypeNode.getTypeName().equals("void")){
            throw new semanticError("The var type can not be void", it.pos);
        }
        it.varTypeNode.accept(this);
        if (!it.stmts.isEmpty()) {
            for (singlevarDefStmtNode stmt : it.stmts)
                stmt.accept(this);
        }
    }

    @Override
    public void visit(singlevarDefStmtNode it) {
        if (it.varexpr != null)
            it.varexpr.accept(this);
        currentScope.defineVariable(it.varname, it.typeNode, it.pos);
    }

    @Override
    public void visit(classDefNode it){
        it.classDefScope = new classScope(gScope, it.className);

        //(1) functions
        for(funcDefNode tmpNode : it.funcDefs){
            tmpNode.accept(this);
            funcDefNode tmpfuncDefNode = new funcDefNode(tmpNode.funcName, tmpNode.funcType, tmpNode.pos);
            if(it.classDefScope.checkFuncName(tmpNode.funcName)){
                throw new semanticError("The function's name exists.", tmpNode.pos);
            }
            if(it.className.equals(tmpNode.funcName)){
                throw new semanticError("The constructor definition is not correct.", tmpNode.pos);
            }
            it.classDefScope.funcs.put(tmpNode.funcName,tmpfuncDefNode);
        }

        //(2) variables
        for(varDefStmtNode tmpNode : it.varDefs){
            tmpNode.accept(this);

            varDefStmtNode tmpvarDefStmtNode = new varDefStmtNode(tmpNode.varTypeNode,tmpNode.pos);
            if(gScope.checkVarNameList(tmpvarDefStmtNode) ){
                throw new semanticError("The variable's name exists.", tmpNode.pos);
            }
            if(it.classDefScope.checkVarNameList(tmpvarDefStmtNode) ){
                throw new semanticError("The variable's name exists.", tmpNode.pos);
            }
            if(!gScope.checkVarType(tmpvarDefStmtNode.varTypeNode.getTypeName())){
                throw new semanticError("The variable's type doesn't exists.", tmpNode.pos);
            }
            it.classDefScope.addVarList(tmpvarDefStmtNode);
        }

        //(3) constructor
        if(it.tmpconsDefs.size() > 1){
            throw new semanticError("The class has more than one constructor.", it.pos);
        }
        for(constructorDefNode tmpNode : it.tmpconsDefs){
            tmpNode.accept(this);

            constructorDefNode tmpconsDefNode = new constructorDefNode(it.className, tmpNode.pos);
            if(!tmpNode.FuncName.equals(it.className)){
                throw new semanticError("The type of constructor function is incorrect.", tmpNode.pos);
            }
            it.classDefScope.consDef = tmpconsDefNode;
        }

        if(it.classDefScope.consDef.parDefs.size() != 0){
            throw new semanticError("The construction function should not have par.", it.pos);
        }

    }

    @Override
    public void visit(FuncTypeNode it){
        currentFuncType = gScope.getTypeFromName(it.name, it.pos);
    }

    @Override
    public void visit(funcDefNode it){
        currentFuncType = gScope.getTypeFromName(it.name,it.pos);
        for(varDefStmtNode varnode : it.varDefs) varnode.accept(this);
        for();
        currentFuncType = null;
    }

    @Override
    public void visit(returnStmtNode it) {/////////////////////////////////////////////////////
        if (it.value != null) {
            it.value.accept(this);
            if (!it.value.type.isInt)//////////////////////////////////////////////////////////////
                throw new semanticError("Semantic Error: type not match. It should be int",
                        it.value.pos);
        }
    }

    @Override
    public void visit(blockStmtNode it) {
        if (!it.stmts.isEmpty()) {
            currentScope = new Scope(currentScope);
            for (StmtNode stmt : it.stmts) stmt.accept(this);
            currentScope = currentScope.parentScope();
        }
    }

    @Override
    public void visit(exprStmtNode it) {
        it.expr.accept(this);
    }

    @Override
    public void visit(ifStmtNode it) {
        it.condition.accept(this);
        if (!it.condition.type.isBool)
            throw new semanticError("Semantic Error: type not match. It should be bool",
                    it.condition.pos);
        it.thenStmt.accept(this);
        if (it.elseStmt != null) it.elseStmt.accept(this);
    }

    @Override
    public void visit(assignExprNode it) {
        it.rhs.accept(this);
        it.lhs.accept(this);
        if (it.rhs.type != it.lhs.type)
            throw new semanticError("Semantic Error: type not match. ", it.pos);
        if (!it.lhs.isAssignable())
            throw new semanticError("Semantic Error: not assignable", it.lhs.pos);
    }

    @Override
    public void visit(binaryExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        if (!it.lhs.type.isInt)
            throw new semanticError("Semantic error: type not match. It should be int",
                    it.lhs.pos);
        if (!it.rhs.type.isInt)
            throw new semanticError("Semantic error: type not match. It should be int",
                    it.rhs.pos);
    }

    @Override
    public void visit(constExprNode it) {}

    @Override
    public void visit(cmpExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        if (it.rhs.type != it.lhs.type)
            throw new semanticError("Semantic Error: type not match. ", it.pos);
    }

    @Override
    public void visit(varExprNode it) {
        if (!currentScope.containsVariable(it.name, true))
            throw new semanticError("Semantic Error: variable not defined. ", it.pos);
    }
}
