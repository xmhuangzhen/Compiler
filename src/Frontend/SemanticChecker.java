package Frontend;

import AST.*;
import Util.*;
import Util.error.*;


public class SemanticChecker implements ASTVisitor {
    private Scope currentScope;
    private globalScope gScope;

    @Override
    public void visit(RootNode it) {
        //(1) create global scope
        gScope = new globalScope(null);
        currentScope = gScope;

        //(2) class
        for(ProgramUnitNode tmpProgNode : it.ProgramDefs)
            if(tmpProgNode instanceof classDefNode){
                classDefNode tmpNode = (classDefNode) tmpProgNode;
                TypeNode tmpTypeNode = new ClassTypeNode(tmpNode.className,tmpNode.pos);
                if(gScope.checkVarName(tmpNode.className)){
                    throw new semanticError("The class name is existed.", tmpNode.pos);
                }
                gScope.types.put(tmpNode.className, tmpTypeNode);
            }

        //(3) function
        for(ProgramUnitNode tmpProgNode : it.ProgramDefs)
            if(tmpProgNode instanceof funcDefNode){
                funcDefNode tmpNode = (funcDefNode) tmpProgNode;
                funcDefNode tmpfuncDefNode = new funcDefNode(tmpNode.funcName,tmpNode.funcType, tmpNode.pos);
                if(gScope.checkFuncName(tmpNode.funcName)){
                    throw new semanticError("The function's name exists.", tmpNode.pos);
                }
                gScope.declared_func.put(tmpNode.funcName,tmpfuncDefNode);
            }

        //(4) variables
        for(ProgramUnitNode tmpProgNode : it.ProgramDefs)
            if(tmpProgNode instanceof varDefStmtNode){
                varDefStmtNode tmpNode = (varDefStmtNode) tmpProgNode;
                tmpNode.accept(this);

                varDefStmtNode tmpvarDefStmtNode = new varDefStmtNode(tmpNode.varTypeNode,tmpNode.pos);
                if(gScope.checkVarNameList(tmpvarDefStmtNode) ){
                    throw new semanticError("The variable's name exists.", tmpNode.pos);
                }
                if(!gScope.checkVarTypeList(tmpvarDefStmtNode)){
                    throw new semanticError("The variable's type doesn't exists.", tmpNode.pos);
                }
                gScope.addVarList(tmpvarDefStmtNode);
            } else if(tmpProgNode instanceof classDefNode){
                classDefNode tmpNode = (classDefNode) tmpProgNode;
                tmpNode.accept(this);
            } else {
                funcDefNode tmpNode = (funcDefNode) tmpProgNode;
                tmpNode.accept(this);
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
    public void visit(ProgramUnitNode it) {

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
        if (!gScope.checkVarType(it.typeNode.getTypeName())){
            throw new semanticError("The var type doesn't exist", it.pos);
        }
        currentScope.defineVariable(it.varname, it.typeNode, it.pos);
    }

    @Override
    public void visit(classDefNode it){
        it.classDefScope = new classScope(gScope, it.className);
        it.classDefScope.inClass = true;
        it.classDefScope.ClassType = new ClassTypeNode(it.className,it.pos);
        currentScope = it.classDefScope;

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

        currentScope = gScope;
    }

    @Override
    public void visit(FuncTypeNode it){
        if(!gScope.checkVarType(it.getTypeName())){
            throw new semanticError("The function doesn't have correct type name", it.pos);
        }
    }

    @Override
    public void visit(funcDefNode it){
        it.funcScope = new Scope(currentScope);
        it.funcScope.inFunc = true;
        it.funcScope.FuncReturnType = it.funcType;
        currentScope = it.funcScope;
        it.funcType.accept(this);

        //////////////////////////////////////////////////
        for(singlevarDefStmtNode parNode : it.parDefs){
            parNode.accept(this);
            if(!gScope.checkVarType(parNode.typeNode.getTypeName())){
                throw new semanticError("The variable's type doesn't exists.", parNode.pos);
            }
            it.parDefs.add(parNode);
            it.funcScope.defineVariable(parNode.varname,parNode.typeNode, parNode.pos);
        }

        for(StmtNode stmt : it.stmts){
            stmt.accept(this);
            it.stmts.add(stmt);
        }

        currentScope = currentScope.parentScope();
    }

    @Override
    public void visit(constructorDefNode it) {

    }

    @Override
    public void visit(ArrayTypeNode it){
        it.baseType.accept(this);
        if(!gScope.checkVarType(it.baseType.getTypeName())){///////////////////
            throw new semanticError("The ArrayTypeNode's type doesn't exist.",it.pos);
        }
    }

    @Override
    public void visit(NonArrayTypeNode it){
        if(!gScope.checkVarType(it.getTypeName())){
            throw new semanticError("The NonarrayTypeNode's type doesn't exist.", it.pos);
        }
    }

    @Override
    public void visit(ClassTypeNode it) {

    }


    @Override
    public void visit(returnStmtNode it) {
        if(!currentScope.inFunc){
            throw new semanticError("return is wrong. it doesn't in function scope", it.pos);
        }

        if (it.value != null) {
            it.value.accept(this);
            if (!it.value.ExprType.equals(currentScope.FuncReturnType.getTypeName()))
                throw new semanticError("Semantic Error: return type not match.", it.value.pos);
        } else{
            if(!currentScope.FuncReturnType.getTypeName().equals("void")){
                throw new semanticError("There should be a return value.", it.pos);
            }
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
        if (!it.condition.ExprType.equals("bool"))
            throw new semanticError("Semantic Error: type not match. It should be bool",
                    it.condition.pos);

        currentScope = new Scope(currentScope);
        it.thenStmt.accept(this);
        currentScope = currentScope.parentScope();

        if (it.elseStmt != null) {
            currentScope = new Scope(currentScope);
            it.elseStmt.accept(this);
            currentScope = currentScope.parentScope();
        }
    }

    @Override
    public void visit(ForStmtNode it){
        if(it.initExpr != null){
            it.initExpr.accept(this);
        }

        if(it.condExpr != null){
            it.condExpr.accept(this);
            if (!it.condExpr.ExprType.equals("bool"))
                throw new semanticError("Semantic Error: type not match. It should be bool",
                        it.condExpr.pos);
        }

        if(it.stepExpr != null){
            it.stepExpr.accept(this);
        }

        if (it.stmt != null) {
            currentScope = new Scope(currentScope);
            currentScope.inLoop = true;
            it.stmt.accept(this);
            currentScope = currentScope.parentScope();
        }
    }

    @Override
    public void visit(WhileStmtNode it){
        it.condExpr.accept(this);
        if (!it.condExpr.ExprType.equals("bool"))
            throw new semanticError("Semantic Error: type not match. It should be bool",
                    it.condExpr.pos);

        if (it.stmt != null) {
            currentScope = new Scope(currentScope);
            currentScope.inLoop = true;
            it.stmt.accept(this);
            currentScope = currentScope.parentScope();
        }
    }

    @Override
    public void visit(continueStmtNode it){
        if(!currentScope.inLoop){
            throw new semanticError("continue failed", it.pos);
        }
    }

    @Override
    public void visit(breakStmtNode it){
        if(!currentScope.inLoop){
            throw new semanticError("continue failed", it.pos);
        }
    }

    @Override
    public void visit(NewExprNode it){
        if(it.IsWrong){
            throw new semanticError("new type is wrong.",it.pos);
        }

        it.exprTypeNode.accept(this);

        if(it.exprTypeNode.getTypeName().equals("void")){
            throw new semanticError("expr type cannot be void", it.pos);
        }

        if(it.dim == 0){
            TypeNode tmpTypeNode = it.exprTypeNode;
            if(tmpTypeNode.getTypeName().equals("int") || tmpTypeNode.getTypeName().equals("bool")
                    || tmpTypeNode.getTypeName().equals("string")){
                throw new semanticError("expr type cannot be int/bool/string", it.pos);
            }
            it.IsLvalue = true;
            it.ExprType = tmpTypeNode;
        } else {
            TypeNode tmpTypeNode = it.exprTypeNode;
            for(ExprNode tmpNode : it.exprDim){
                tmpNode.accept(this);
                if(!tmpNode.ExprType.equals("int")){
                    throw new semanticError("expr in new array type can only be int", it.pos);
                }
            }
            it.IsLvalue = true;
            it.ExprType = tmpTypeNode;
        }
    }

    @Override
    public void visit(ThisExprNode it){
        if(currentScope.inClass && currentScope.inFunc){
            it.IsLvalue = true;
            it.ExprType = currentScope.ClassType ;
        } else {
            throw new semanticError("this miss", it.pos);
        }
    }

    @Override
    public void visit(UnaryExprNode it){
        it.expr.accept(this);
        if(it.op.equals("++") || it.op.equals("--")){
            if(!it.ExprType.equals("int")) throw new semanticError("++/-- type isn't int.",it.pos);
            if(!it.IsLvalue) throw new semanticError("++/-- is not lvalue.", it.pos);
            it.IsLvalue = true;
            it.expr.ExprType = new NonArrayTypeNode("int",it.pos);
        } else if(it.op.equals("+") || it.op.equals("-")){
            if(!it.ExprType.equals("int")) throw new semanticError("++/-- type isn't int.",it.pos);
            it.expr.ExprType = new NonArrayTypeNode("int",it.pos);
        } else if(it.op.equals("!")){
            if(!it.ExprType.equals("int")) throw new semanticError("++/-- type isn't int.",it.pos);
            it.expr.ExprType = new NonArrayTypeNode("bool",it.pos);
        } else if(it.op.equals("~")){
            if(!it.ExprType.equals("int")) throw new semanticError("++/-- type isn't int.",it.pos);
            it.expr.ExprType = new NonArrayTypeNode("int",it.pos);
        } else {
            throw new semanticError("UnaryExprNode type is not correct.", it.pos);
        }
    }

    @Override/////////////////////////////////////////////////////////////////////////////
    public void visit(FunccalExprNode it){
//////////////////////////////////////////////////
    }

    @Override
    public void visit(SelfExprNode it){
        it.expr.accept(this);

        if(!it.expr.ExprType.equals("int")) throw new semanticError("++/-- type should be int", it.pos);
        if(!it.expr.IsLvalue) throw new semanticError("++/-- should be lvalue.", it.pos);
        it.ExprType = new NonArrayTypeNode("int",it.pos);
    }

    @Override
    public void visit(MemberAccExprNode it){
        it.expr.accept(this);

        String tmpIdentifier = it.Identifier;
        TypeNode tmpTypeNode = it.expr.ExprType;

        if(tmpTypeNode instanceof ArrayTypeNode){
            if(!tmpIdentifier.equals("size")) throw new semanticError("ArrayTypeNode doesn't have the func.",it.pos);
            it.ExprType = new FuncTypeNode(tmpIdentifier, it.pos);/////////////////////////////
        } else if(tmpTypeNode instanceof ClassTypeNode){
            ClassTypeNode tmpClassTypeNode = (ClassTypeNode) tmpTypeNode;
            classDefNode tmpclassDefNode = gScope.declared_class.get(tmpClassTypeNode.getTypeName());
            if(tmpclassDefNode.funcDefs.contains(tmpIdentifier)){
                it.ExprType = new FuncTypeNode(tmpIdentifier,it.pos);
            } else if(tmpclassDefNode.varDefs.contains(tmpIdentifier)){
                it.IsLvalue = true;
                it.ExprType = tmpClassTypeNode;
            } else throw new semanticError("MemacccNode has wrong in classType.",it.pos);
        } else{
            throw new semanticError("MemberAccNode has wrong type.",it.pos);
        }
    }

    @Override
    public void visit(IdExprNode it){
        String tmpIdentifier = it.Identifier;

        if(!currentScope.containsVariable(tmpIdentifier,true)){
            throw new semanticError("IdExprNode's identifier doesn't exist.",it.pos);
        } else {
            it.IsLvalue = true;
            it.ExprType = gScope.types.get(tmpIdentifier);
        }
    }

    @Override
    public void visit(binaryExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        String lhsTypeName = it.lhs.ExprType.getTypeName();
        String rhsTypeName = it.rhs.ExprType.getTypeName();
        if(it.op.equals("*") || it.op.equals("/") || it.op.equals("%") || it.op.equals("-")
            || it.op.equals("<<") || it.op.equals(">>") || it.op.equals("&") || it.op.equals("|") || it.op.equals("^")){
            //'*' | '/' | '%'    '-' '<<' '>>' '&' '|' '^'
            if(!lhsTypeName.equals("int")) throw new semanticError("BinaryNode lhs should be int.",it.pos);
            if(!rhsTypeName.equals("int")) throw new semanticError("BinaryNode rhs should be int.",it.pos);
            it.ExprType = new NonArrayTypeNode("int",it.pos);
        } else if(it.op.equals("+") || it.op.equals(">") || it.op.equals("<") || it.op.equals(">=") || it.op.equals("<=")){
            //'+'      '>' | '<' | '>=' | '<='
            if(!lhsTypeName.equals(rhsTypeName)) throw new semanticError("BinaryNode should be equal",it.pos);
            if(!lhsTypeName.equals("int") && !lhsTypeName.equals("string"))
                throw new semanticError("BinaryNode of + should be int or string",it.pos);
            if(it.op.equals("+")) it.ExprType = it.lhs.ExprType;
            else it.ExprType = new NonArrayTypeNode("bool",it.pos);
        } else if(it.op.equals("==") || it.op.equals("!=")){
            if(!lhsTypeName.equals(rhsTypeName) && !lhsTypeName.equals("null") && !rhsTypeName.equals("null"))
                throw new semanticError("BinaryNode should be equal",it.pos);
            it.ExprType = new NonArrayTypeNode("bool",it.pos);
        } else if(it.op.equals("&&") || it.op.equals("||")){
            if(!lhsTypeName.equals("bool")) throw new semanticError("BiinaryNode &&/|| lhs should be bool",it.pos);
            if(!rhsTypeName.equals("bool")) throw new semanticError("BiinaryNode &&/|| rhs should be bool",it.pos);
            it.ExprType = new NonArrayTypeNode("bool",it.pos);
        }
    }

    @Override
    public void visit(constExprNode it) {

    }


    @Override
    public void visit(assignExprNode it) {
        it.rhs.accept(this);
        it.lhs.accept(this);
        String lhsTypeName = it.lhs.ExprType.getTypeName();
        String rhsTypeName = it.rhs.ExprType.getTypeName();
        if(!lhsTypeName.equals(rhsTypeName) && !lhsTypeName.equals("null") && !rhsTypeName.equals("null"))
            throw new semanticError("BinaryNode should be equal",it.pos);
        it.ExprType = it.lhs.ExprType;
    }

    @Override
    public void visit(BoolConstExprNode it){
        it.ExprType = new NonArrayTypeNode("bool",it.pos);
    }

    @Override
    public void visit(IntConstExprNode it){
        it.ExprType = new NonArrayTypeNode("int",it.pos);
    }

    @Override
    public void visit(NullConstExprNode it){
        it.ExprType = new NonArrayTypeNode("null",it.pos);
    }

    @Override
    public void visit(StringConstExprNode it){
        it.ExprType = new ClassTypeNode("string",it.pos);
    }

    @Override
    public void visit(VoidTypeNode it){

    }
}
