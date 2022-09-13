%{
#include <stdio.h>

int yyerror(const char *s);
int yylex (void);
%}

%token TOK_PRINT TOK_IDENT
%token TOK_INTEGER TOK_FLOAT
%token TOK_LITERAL
%start program

%%

program : stmts {}
        ;

stmts : stmt stmts
      | stmt
	  ;

stmt : atribuicao
     | TOK_PRINT aritmetica
     ;

atribuicao : TOK_IDENT '=' aritmetica
           ;

aritmetica : aritmetica '+' term
           | term
		   ;

term : term '*' factor
     | factor
	 ;

factor : '(' aritmetica ')'
       | TOK_IDENT
	   | TOK_INTEGER
	   | TOK_FLOAT
	   ;


%%

int yyerror(const char *s) {
	printf("Erro: %s\n", s);
	return 1;
}


