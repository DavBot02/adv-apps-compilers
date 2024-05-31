%{
  #include <stdio.h>
%}

%option noyywrap

%%
"i"                     { printf("INT_DECL "); }
"f"                     { printf("FLOAT_DECL "); }
"p"                     { printf("PRINT "); }
[a-zA-Z][a-zA-Z0-9]*    { printf("IDENTIFIER "); }
[0-9]+.[0-9]+           { printf("FLOAT "); }
[0-9]+                  { printf("INT "); }
"//".*                  { printf("COMMENT "); }
"+"                     { printf("PLUS "); }
"-"                     { printf("MINUS "); }
"*"                     { printf("TIMES "); }
"/"                     { printf("DIVIDE "); }
"="                     { printf("ASSIGN "); }
[ \t]+                  /* ignore whitespace */
%%

int main() {
    yylex();
    return 0;
}
///