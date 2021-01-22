package Frontend;

import AST.*;
import Util.Scope;
import Util.classScope;
import Util.error.semanticError;
import Util.globalScope;
import Util.position;


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
                ClassTypeNode tmpTypeNode = new ClassTypeNode(tmpNode.className,tmpNode.pos);
                if(gScope.checkVarName(tmpNode.className)){
                    throw new semanticError("The class name is existed.", tmpNode.pos);
                }
                gScope.types.put(tmpNode.className, tmpTypeNode);
                gScope.declared_class.put(tmpNode.className,tmpNode);
            }

        //(3) function
        for(ProgramUnitNode tmpProgNode : it.ProgramDefs)
            if(tmpProgNode instanceof funcDefNode){
                funcDefNode tmpNode = (funcDefNode) tmpProgNode;
                funcDefNode tmpfuncDefNode = new funcDefNode(tmpNode.funcName,tmpNode.funcType, tmpNode.pos);
                if(gScope.checkFuncName(tmpNode.funcName)){
                    throw new semanticError("The function's name exists.", tmpNode.pos);
                }
//                throw new semanticError(Long.toString(tmpfuncDefNode.parDefs.size()),it.pos);
//                tmpfuncDefNode.parDefs.size() = it.ProgramDefs.

                gScope.declared_func.put(tmpNode.funcName,tmpfuncDefNode);
                gScope.funcs.put(tmpNode.funcName, tmpfuncDefNode);
            }

        //(4) variables
        for(ProgramUnitNode tmpProgNode : it.ProgramDefs) {
            tmpProgNode.accept(this);
            if (tmpProgNode instanceof varDefStmtNode) {
                varDefStmtNode tmpNode = (varDefStmtNode) tmpProgNode;

                varDefStmtNode tmpvarDefStmtNode = new varDefStmtNode(tmpNode.varTypeNode, tmpNode.pos);
                if (gScope.checkVarNameList(tmpvarDefStmtNode)) {
                    throw new semanticError("The variable's name exists.", tmpNode.pos);
                }
                if (!gScope.checkVarTypeList(tmpvarDefStmtNode)) {
                    throw new semanticError("The variable's type doesn't exists.", tmpNode.pos);
                }
                gScope.addVarList(tmpvarDefStmtNode);
            } else if(tmpProgNode instanceof funcDefNode){
                gScope.declared_func.replace((((funcDefNode) tmpProgNode).funcName),(funcDefNode) tmpProgNode);
                gScope.funcs.replace((((funcDefNode) tmpProgNode).funcName),(funcDefNode) tmpProgNode);
            //    throw new semanticError("["+Long.toString(((funcDefNode) tmpProgNode).parDefs.size())+"]",it.pos);
            } else if(tmpProgNode instanceof classDefNode){
                gScope.declared_class.put(((classDefNode) tmpProgNode).className,(classDefNode) tmpProgNode);
            }
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

        currentScope = currentScope.parentScope();
    }

    @Override
    public void visit(FuncTypeNode it){
        if(!gScope.checkVarType(it.getTypeName())){
            throw new semanticError("The function doesn't have correct type name", it.pos);
        }
    }

    @Override
    public void visit(funcDefNode it){
        currentScope = new Scope(currentScope);
        currentScope.inFunc = true;
        currentScope.FuncReturnType = it.funcType;

        it.funcType.accept(this);

        //////////////////////////////////////////////////

        for(var parNode : it.parDefs){
            parNode.accept(this);
            if(!gScope.checkVarType(parNode.typeNode.getTypeName())){
                throw new semanticError("The variable's type doesn't exists.", parNode.pos);
            }
    //        it.parDefs.add(parNode);
//            currentScope.defineVariable(parNode.varname,parNode.typeNode, parNode.pos);
        }


        for(var tmpstmt : it.stmts){
            tmpstmt.accept(this);
        //    it.stmts.add(tmpstmt);
        }

        it.funcScope = currentScope;
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
        if(!gScope.checkVarType(it.getTypeName())){
            throw new semanticError("ClassTypeNode type doesn't exist",it.pos);
        }
    }


    @Override
    public void visit(returnStmtNode it) {
        if(!currentScope.inFunc){
            throw new semanticError("return is wrong. it doesn't in function scope", it.pos);
        }
        if (it.value != null) {
            it.value.accept(this);
            if (!it.value.ExprType.getTypeName().equals(currentScope.FuncReturnType.getTypeName()))
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
        if (!it.condition.ExprType.getTypeName().equals("bool"))
            throw new semanticError("Semantic Error: type not match. It should be bool"+"["+it.condition.ExprText+"]"
                    +"{"+it.condition.ExprType.getTypeName()+"}",
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
            if (!it.condExpr.ExprType.getTypeName().equals("bool"))
                throw new semanticError("Semantic Error: type not match. It should be bool, conExpr",
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
        if (!it.condExpr.ExprType.getTypeName().equals("bool"))
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
                if(!tmpNode.ExprType.getTypeName().equals("int")){
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
            if(!it.expr.ExprType.getTypeName().equals("int")) throw new semanticError("++/-- type isn't int.",it.pos);
            if(!it.expr.IsLvalue) throw new semanticError("++/-- is not lvalue.", it.pos);
            it.IsLvalue = true;
            it.ExprType = new NonArrayTypeNode("int",it.pos);
        } else if(it.op.equals("+") || it.op.equals("-")){
            if(!it.expr.ExprType.getTypeName().equals("int")) throw new semanticError("+/- type isn't int.",it.pos);
            it.ExprType = new NonArrayTypeNode("int",it.pos);
        } else if(it.op.equals("!")){
            if(!it.expr.ExprType.getTypeName().equals("int") && !it.expr.ExprType.getTypeName().equals("bool"))
                throw new semanticError("! type isn't int/bool.",it.pos);
            it.ExprType = new NonArrayTypeNode("bool",it.pos);
        } else if(it.op.equals("~")){
            if(!it.expr.ExprType.getTypeName().equals("int"))
                throw new semanticError("~ type isn't int.",it.pos);
            it.ExprType = new NonArrayTypeNode("int",it.pos);
        } else {
            throw new semanticError("UnaryExprNode type is not correct.", it.pos);
        }
    }

    @Override
    public void visit(FunccalExprNode it){
        //(1) check func name
        ExprNode funcName = it.funcName;

        if(funcName instanceof MemberAccExprNode){
            funcName.accept(this);
            ////////////////////////////////////////////
        } else if(funcName instanceof IdExprNode){
            funcName.accept(this);
            if(!currentScope.containsFuncName(((IdExprNode) funcName).Identifier,true)
            && !gScope.checkFuncName(((IdExprNode) funcName).Identifier)){
                throw new semanticError("FuncName doesn't exist",it.pos);
            }
        } else {
            throw new semanticError("Func cal name error."+it.ExprText, it.pos);
        }

        //(2) check par
        for(var ParNode : it.pars) ParNode.accept(this);

        funcDefNode tmpfuncDefNode = null;
        if(funcName instanceof MemberAccExprNode){///////////////////////////
           // throw new semanticError("["+it.funcName.ExprText+","
            // +((MemberAccExprNode)it.funcName).ExprType.getTypeName()+"]", it.pos);
            classDefNode tmpclassDefNode = gScope.declared_class.get(((MemberAccExprNode)funcName).expr.ExprType.getTypeName());
            classScope tmpScope = tmpclassDefNode.classDefScope;

            tmpfuncDefNode = tmpScope.getfuncDefNode(((MemberAccExprNode)funcName).Identifier,true);
        } else {
            String tmpIden = ((IdExprNode) funcName).Identifier;
            if(gScope.containsFuncName(tmpIden,true)) {
                tmpfuncDefNode = gScope.declared_func.get(tmpIden);
         //   throw new semanticError("Here.\n"+tmpIden+"["+tmpfuncDefNode.parDefs.size()+"]\n",it.pos);
            }
            else {
                tmpfuncDefNode = gScope.declared_func.get(((IdExprNode) funcName).Identifier);
           // throw new semanticError("Here",it.pos);
            }
        }

        if(tmpfuncDefNode == null) throw new semanticError("The func name doesn't exist.",it.pos);

        if(tmpfuncDefNode.parDefs.size() != it.pars.size()){
            throw new semanticError("par size is not correct\n"+
                    tmpfuncDefNode.funcType.getTypeName()+
                    "[in declare,"+tmpfuncDefNode.parDefs.size()+it.pars.size(), it.pos);
        }

        int parSize = it.pars.size();
        for(int i = 0;i < parSize ;++i){
            ExprNode CallPar = it.pars.get(i);
            singlevarDefStmtNode FuncPar = tmpfuncDefNode.parDefs.get(i);
            TypeNode CallType = CallPar.ExprType;
            TypeNode FuncParType = FuncPar.typeNode;
            if(!CallType.getTypeName().equals(FuncParType.getTypeName()) &&
                    !CallType.getTypeName().equals("null"))
                throw new semanticError("par type error",it.pos);
        }
        it.ExprType = tmpfuncDefNode.funcType;
    }

    @Override
    public void visit(SelfExprNode it){
        it.expr.accept(this);

        if(!it.expr.ExprType.getTypeName().equals("int")) throw new semanticError("++/-- type should be int", it.pos);
        if(!it.expr.IsLvalue) throw new semanticError("++/-- should be lvalue.", it.pos);
        it.ExprType = new NonArrayTypeNode("int",it.pos);
    }

    @Override
    public void visit(MemberAccExprNode it){
        it.expr.accept(this);

        String tmpIdentifier = it.Identifier;
        TypeNode tmpTypeNode = it.expr.ExprType;

        if(tmpTypeNode instanceof ArrayTypeNode){
            it.ExprType = new FuncTypeNode(tmpIdentifier, it.pos);/////////////////////////////
        } else if(tmpTypeNode instanceof ClassTypeNode) {
            ClassTypeNode tmpClassTypeNode = (ClassTypeNode) tmpTypeNode;
            classDefNode tmpclassDefNode = gScope.declared_class.get(tmpClassTypeNode.getTypeName());
            classScope tmpScope = tmpclassDefNode.classDefScope;

            if (tmpScope.containsFuncName(tmpIdentifier,true)) {
                it.ExprType = new FuncTypeNode(tmpIdentifier, it.pos);
            } else if (tmpScope.containsVariable(tmpIdentifier,true)) {
                it.IsLvalue = true;
                it.ExprType = tmpClassTypeNode;
            } else {
                throw new semanticError("MemacccNode has wrong in classType."+tmpclassDefNode.className, it.pos);
            }
        } else if(tmpTypeNode instanceof NonArrayTypeNode){
            throw new semanticError("MAN shouldn't be non array "+"["+it.ExprText+"]"
                    +(gScope.types.get("string") instanceof ClassTypeNode),it.pos);
        } else{
            throw new semanticError("MemberAccNode has wrong type."+
                    "["+it.ExprText+"]"+"{"+tmpTypeNode.getTypeName()+"}",it.pos);
        }
    }

    @Override
    public void visit(IdExprNode it) {
        String tmpIdentifier = it.Identifier;

        if(currentScope.containsVariable(tmpIdentifier,true)) {
            it.IsLvalue = true;
            it.ExprType = currentScope.getVariableTypeNode(tmpIdentifier, true);
            if (it.ExprType == null) {
                throw new semanticError("current scope doesn't exist",it.pos);
//                it.ExprType = gScope.getTypeNodeFromName(tmpIdentifier, it.pos);
            }
//            if(it.ExprType.getTypeName().equals("string")){
  //              throw new semanticError("it is string"+(it.ExprType instanceof ClassTypeNode)+"{"+it.ExprText+"}",it.pos);
    //        }
        } else if(gScope.checkVarName(tmpIdentifier)){
            it.IsLvalue = true;
            it.ExprType = gScope.getTypeNodeFromName(tmpIdentifier, it.pos);
            if(it.ExprType == null)throw new semanticError("gscope doesn't have it.",it.pos);
        } else if(currentScope.containsFuncName(tmpIdentifier,true)){
            it.ExprType = currentScope.getFuncTypeNode(tmpIdentifier,true);
            if (it.ExprType == null) {
                it.ExprType = gScope.getTypeNodeFromFuncName(tmpIdentifier, it.pos);
            }
        } else if(gScope.checkFuncName(tmpIdentifier)){
            it.ExprType = gScope.getTypeNodeFromFuncName(tmpIdentifier,it.pos);
        } else {
            throw new semanticError("IdExprNode type wrong" +"["+ tmpIdentifier+"]"+it.ExprText,it.pos);
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
    public void visit(assignExprNode it) {
        it.rhs.accept(this);
        it.lhs.accept(this);
        String lhsTypeName = it.lhs.ExprType.getTypeName();
        String rhsTypeName = it.rhs.ExprType.getTypeName();

        if(!lhsTypeName.equals(rhsTypeName))
            throw new semanticError("BinaryNode should be equal",it.pos);

        if(it.lhs instanceof ArraydefExprNode){
            ArraydefExprNode lArraydefExprNode = (ArraydefExprNode) it.lhs;
            if(it.rhs instanceof ArraydefExprNode){
                ArraydefExprNode rArraydefExprNode = (ArraydefExprNode) it.rhs;
                if(lArraydefExprNode.dim != rArraydefExprNode.dim)
                    throw new semanticError(Long.toString(lArraydefExprNode.dim)+"!="
                    +Long.toString(rArraydefExprNode.dim),it.pos);
            } else {
                if(lArraydefExprNode.dim != 1)
                    throw new semanticError("Binary Node type error."+lArraydefExprNode.dim ,it.pos);
            }
        }
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

    @Override
    public void visit(constExprNode it){

    }

    @Override
    public void visit(ArraydefExprNode it) {
        it.arr.accept(this);
        it.index.accept(this);

        if (!(it.arr instanceof ArraydefExprNode)) {
            TypeNode tmpNode = currentScope.getVariableTypeNode(it.arr.ExprText,true);
            if(tmpNode instanceof ArrayTypeNode){
                it.dim = ((ArrayTypeNode) tmpNode).dimension;
            } else {
                throw new semanticError("ArrayDefExprNode of type is not array/",it.pos);
            }
        } else{
            it.dim = ((ArraydefExprNode) it.arr).dim-1;
        }
        if(!it.index.ExprType.getTypeName().equals("int"))
            throw new semanticError("ArraydefExprNode of index is not int type", it.pos);
        it.IsLvalue = true;
        it.ExprType = it.arr.ExprType;
    }
}
