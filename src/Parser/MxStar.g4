grammar MxStar;

program: (varDef | classDef | funcDef)* EOF;

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
    | nonarraytypedef   #narrayType
;

nonarraytypedef :
    Int                 #narrayTypeInt
    | Bool              #narrayTypeBool
    | String            #narrayTypeString
    | Identifier        #narrayTypeIdentifier
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
    : primary                                               #atomExpr
    | expression op=('>' | '<' | '>=' | '<=' | '==' | '!=' ) expression               #binaryExpr
    | expression op=('*' | '/' | '%') expression            #binaryExpr
    | expression op=('+' | '-') expression                  #binaryExpr
    | expression op=('<<' | '>>') expression                  #binaryExpr
    | expression op='&&' expression                #binaryExpr
    | expression op='||' expression                #binaryExpr
    | expression op='&' expression                #binaryExpr
    | expression op='|' expression                #binaryExpr
    | expression op='^' expression                #binaryExpr
    | <assoc=right> expression '=' expression               #assignExpr
    | expression op=('++' | '--')                           #selfExpr
    | <assoc=right> op=('++' | '--') expression             #unaryExpr
    | <assoc=right> op=('!' | '~') expression               #unaryExpr
    | <assoc=right> op=('+' | '-') expression               #unaryExpr
    | This                                                  #thisExpr
    | <assoc=right> New  newType #newExpr
    | expression '.' Identifier #memberAcc
    | arr=expression '[' index = expression ']' #arraydef
    | expression '(' parDefList? ')' #funccal
    ;

primary
    : '(' expression ')'
    | Identifier
    | literal
    ;

literal
    : DecimalInteger
    | StringConstant
    | NullConstant
    | BoolConstant
    ;

newType
    : nonarraytypedef #nonarraynewtype
    | nonarraytypedef '(' expression (',' expression)*? ')' #newtypeobject
    | nonarraytypedef ('[' expression? ']')+ #newtypearray
;


Class : 'class';
Void : 'void';
This : 'this';
New : 'new';

Int : 'int';
Bool : 'bool';
String : 'string';
fragment Null : 'null';
fragment True : 'true';
fragment False : 'false';

If : 'if';
Else : 'else';
For : 'for';
While : 'while';
Return : 'return';
Continue : 'continue';
Break : 'break';

Identifier : [a-zA-Z] [a-zA-Z_0-9]* ;

DecimalInteger : [1-9] [0-9]* | '0' ;

StringConstant :  '"' ('\\n' | '\\\\' | '\\"' | .)*? '"' ;

BoolConstant : True | False;

NullConstant : Null ;

Whitespace : [ \t]+ -> skip ;

Newline : ('\r' '\n'? | '\n') -> skip ;

BlockComment : '/*' .*? '*/' -> skip ;

LineComment : '//' ~[\r\n]* -> skip ;