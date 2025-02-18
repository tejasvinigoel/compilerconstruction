%{
#include<stdio.h>
%}
%%
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+ { printf("valid email.. username: %s\n", yytext); }
(.)* {printf("invalid\n");}
. ECHO;
\n return 1;
%%



int main()
{
printf("Enter a string :");
yylex();
return 0;
}
