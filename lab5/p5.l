%{
#include <stdio.h>
%}
%%
[a-z]+ {
printf("Lower case detected:\n");
ECHO;
printf("\nBegin yyterminate\n");
yyterminate();
printf("End of yyterminate\n"); // This will not execute
}
[a-zA-Z]+ {
printf("Mixed case detected:\n");
ECHO;
}
%%
int main() {
yylex();
printf("Lexing complete. Exiting...\n");
return 0;
}
