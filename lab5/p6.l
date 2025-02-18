%{
#include <stdio.h>
%}
%%
[a-z]+ { printf("\nLower case token found= ");
ECHO;
return 0;
}
[A-Z][a-zA-Z]* { ECHO; }
%%
int main() {
// First lexical analysis (reads from standard input)
printf("Starting first lex operation (taking input from terminal):\n");
printf("**********************************\n");
printf("Enter a string : ");
yylex();
printf("\nEnd of first yylex operation.\n");
printf("**********************************");
// Open a new file for second lexical analysis
FILE *fp = fopen("input.txt", "r");
if (!fp) {
printf("Error: Could not open input.txt\n");
return 1;
}
printf("\nSwitching input to ’input.txt’...\n");
yyrestart(fp); // Restart lexer with new input file
printf("\nStarting second lex operation from ’input.txt’:\n");
yylex(); // Process the file
printf("\nEnd of second lex operation.\n");
fclose(fp); // Close the file 7

return 0;
}
