%{
#include <stdio.h>
%}
%%
[0-9]+ {
if (yyleng > 3) {
printf("Matched number: %s\n", yytext);
yyless(3); // Keep only the first 3 digits
printf("First 3 digits: %s\n", yytext);
printf("Rest of the number will be rescanned.\n");
} else {
printf("the last match: %s\n", yytext);
}
}
. ;
\n return 0;
%%
int main() {
printf("Enter a string: ");
yylex();
return 0;
}
