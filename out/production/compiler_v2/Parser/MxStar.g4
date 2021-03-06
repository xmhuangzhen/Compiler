grammar MxStar;

program: (programUnit)* EOF;

programUnit: varDef | classDef | funcDef;

varDef : typedef singlevarDef (',' singlevarDef)* ';';

singlevarDef : Identifier ('=' expression)? ;

classDef : Class Identifier '{' (funcDef | varDef | constructorDef)* '}' ';' ;

constructorDef : Identifier '(' parDefList? ')' suite;

funcDef : funcType Identifier '(' parDefList? ')' suite ;

funcType: Void | typedef ;

parDefList : parVarDef (',' parVarDef)* ;

parVarDef : typedef Identifier ;

typedef
    : typedef '['']'      #arrayType
    | nonarraytypedef     #narrayType
;

nonarraytypedef :
    Int
    | Bool
    | String
    | Identifier
;

suite : '{' statement* '}';

statement
    : suite                                                 #block
    | varDef                                                #vardefStmt
    | If '(' expression ')' trueStmt=statement
        (Else falseStmt=statement)?                         #ifStmt
    | For '(' initexp = expression? ';' condexp = expression?
        ';' stepexp = expression? ')' statement             #forStmt
    | While '(' expression ')' statement                    #whileStmt
    | Return expression? ';'                                #returnStmt
    | Continue ';'                                          #continueStmt
    | Break ';'                                             #breakStmt
    | expression ';'                                        #pureExprStmt
    | ';'                                                   #emptyStmt
    ;

expression
    : '('expression')'                                           #subExpr
    | <assoc=right> New  newType                        #newExpr
    | expression '.' Identifier                     #memberAcc
    | expression '(' exprList? ')'                     #funccal
    | arr=expression '[' index = expression ']'         #arraydefExpr
    | expression op=('++' | '--')                           #selfExpr
    | <assoc=right> op=('++' | '--') expression             #unaryExpr
    | <assoc=right> op=('!' | '~') expression               #unaryExpr
    | <assoc=right> op=('+' | '-') expression               #unaryExpr
    | exprl=expression op=('*' | '/' | '%') exprr=expression            #binaryExpr
    | exprl=expression op=('+' | '-') exprr=expression                  #binaryExpr
    | exprl=expression op=('<<' | '>>') exprr=expression                  #binaryExpr
    | exprl=expression op=('>' | '<' | '>=' | '<=' | '==' | '!=' ) exprr=expression               #binaryExpr
    | exprl=expression op='&' exprr=expression                #binaryExpr
    | exprl=expression op='|' exprr=expression                #binaryExpr
    | exprl=expression op='^' exprr=expression                #binaryExpr
    | exprl=expression op='&&' exprr=expression                #binaryExpr
    | exprl=expression op='||' exprr=expression                #binaryExpr
    | <assoc=right> exprl=expression '=' exprr=expression               #assignExpr
    | This                                                  #thisExpr
    | literal                                               #constExpr
    | Identifier                                            #idExpr
    ;

exprList : expression (',' expression)* ;

literal
    : DecimalInteger
    | StringConstant
    | NullConstant
    | BoolConstant
    ;

newType
    : nonarraytypedef ('[' expression ']')*('['']')+('['expression']')+('['expression?']')* #newtypeWrong
    | nonarraytypedef ('[' expression? ']')+                #newtypearray
    | nonarraytypedef '(' ')'                               #newtypeobject
    | nonarraytypedef                                       #newtypenonarray
;

BoolConstant : True | False;
DecimalInteger : [1-9] [0-9]* | '0' ;
StringConstant :  '"' ('\\n' | '\\\\' | '\\"' | .)*? '"' ;
NullConstant : Null ;

Class : 'class';
Void : 'void';
This : 'this';
New : 'new';



Int : 'int';
Bool : 'bool';
String : 'string';
Null : 'null';
True : 'true';
False : 'false';

If : 'if';
Else : 'else';
For : 'for';
While : 'while';
Return : 'return';
Continue : 'continue';
Break : 'break';

Identifier : [a-zA-Z] [a-zA-Z_0-9]* ;

Whitespace : [ \t]+ -> skip ;

Newline : ('\r' '\n'? | '\n') -> skip ;

BlockComment : '/*' .*? '*/' -> skip ;

LineComment : '//' ~[\r\n]* -> skip ;