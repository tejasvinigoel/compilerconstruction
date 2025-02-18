%{
#include <stdio.h>
%}
%%
\n return 0;
. {
printf("Read character by the regular expression: %s\n", yytext);
printf("Read character by input(): %c\n", input());
}
%%
int main() {
printf("Enter a string:");
yylex();
return 0;
}
