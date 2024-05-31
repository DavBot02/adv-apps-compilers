%{
#include "y.tab.h"
%}

%%

hi                                      { return HELLO; }
hello                                   { return HELLO; }
hey                                     { return HELLO; }
goodbye                                 { return GOODBYE; }
bye                                     { return GOODBYE; }
time                                    { return TIME; }
what[' ']is[' ']the[' ']time            { return TIME; }
what[' ']time[' ']is[' ']it             { return TIME; }
what[' ']is[' ']my[' ']ip               { return IP; }
ip[' ']address                          { return IP; }
give[' ']me[' ']a[' ']recipe            { return RECIPE; }
recipe                                  { return RECIPE; }
give[' ']me[' ']a[' ']number[' ']fact   { return NUM_FACT; }
number[' ']fact                         { return NUM_FACT; }
\n                                      { return 0; }  /* End of input on newline */
.                                       { return yytext[0]; }

%%

int yywrap() {
    return 1;
}