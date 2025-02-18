%{
#include <stdio.h>
#include <ctype.h>
%}
%%
"un" {printf("The unput char is = %s\n", yytext);}
[a-z]+ {printf("Lower case token is = %s\n", yytext);
unput('n');
unput('u');
printf("The token after unput is = %s\n", yytext);
}
[a-zA-Z]+ {printf("\nMixed token is = ");
ECHO;
}
. {}
\n return 0;
%%
int main() {
printf("Enter a string: ");
yylex();
return 0;
}
