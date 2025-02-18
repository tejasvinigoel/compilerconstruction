%{
#include <stdio.h>
%}
%%
"BITS" {printf("First match: %s\n", yytext); yymore(); } // Match "part1" and append
"Pilani" {printf("Combined: %s\n", yytext); } // Match "part2" and print the combined text
. { } // Ignore other characters
\n return 0;
%%
int main() {
printf("Enter a string: ");
yylex();
return 0;
}
