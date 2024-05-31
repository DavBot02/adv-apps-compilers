%{
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token HELLO GOODBYE TIME IP RECIPE NUM_FACT

%%

chatbot : greeting
        | farewell
        | query
        | ip
        | recipe
        | num_fact
        ; 

greeting : HELLO { printf("Chatbot: Hello! How can I help you today?\n"); }
         ;

farewell : GOODBYE { printf("Chatbot: Goodbye! Have a great day!\n"); }
         ;

query : TIME { 
            time_t now = time(NULL);
            struct tm *local = localtime(&now);
            printf("Chatbot: The current time is %02d:%02d.\n", local->tm_hour, local->tm_min);
         }
       ;
ip : IP { system("python3 main.py get_ip"); }
   ;

recipe : RECIPE { system("python3 main.py get_recipe"); }
   ;

num_fact : NUM_FACT { system("python3 main.py get_number_fact"); }
   ;

%%

int main() {
    printf("Chatbot: Hi! You can greet me, ask for the time, or say goodbye.\n");
    while (yyparse() == 0) {
        // Loop until end of input
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Chatbot: I didn't understand that.\n");
}