
%token NUMBER
%token ID
%token COLON, ASSIGN, SEMIC
%token INTEGER, BOOLEAN
%token FUNCTION

%%

program
: declaration-list
;

declaration-list
: declaration_list declaration
| declaration

declaration
: var-declaration
| function-declaration 

simple-type
: BOOLEAN
| INTEGER
;

array-type
: ARRAY '[' NUMBER ']' simple-type
;

literal-list
: literal
| literal-list COMMA literal
;

literal
: TRUE
| FALSE
| NUMBER
;

var-declaration
: ID COLON simple-type SEMIC
| ID COLON simple-type ASSIGN literal SEMIC
| ID COLON array-type SEMIC
| ID COLON array-type ASSIGN '{' literal-list '}' SEMIC
;

params
: OPENP CLOSEP
| OPENP param-list CLOSEP
;

param-list
: param
| param-list COMMA param  

param
: ID COLON simple-type /* falta parametro do tipo array */
;

function-declaration 
: ID COLON FUNCTION simple-type params ASSIGN block
;

statement-list
: /* */
| statement statement-list
;

block
: OPENBRACE var-declaration-list statement-list  CLOSEBRACE
: OPENBRACE var-declaration-list CLOSEBRACE
: OPENBRACE statement-list  CLOSEBRACE
: OPENBRACE CLOSEBRACE

statement
: IF OPENP expression CLOSEP statement-list SEMIC
| IF OPENP expression CLOSEP statement-list ELSE statement-list SEMIC




