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
// First lexical analysis (reads from input1.txt)
FILE *fp1 = fopen("input1.txt", "r");
if (!fp1) {
printf("Error: Could not open input.txt\n");
return 1;
}
yyin=fp1;
yylex();
printf("\nSwitching input to ’input2.txt’...\n");
printf("\nStarting second lex operation from ’input.txt’:\n");
FILE *fp2 = fopen("input2.txt", "r");
if (!fp2) {
printf("Error: Cannot open file2.txt\n");
return 1;
}
printf("\nSwitching to file2.txt...\n");
yyin=fp2; // Set input to input2.txt
yylex(); // Process input2.txt
printf("\nEnd of second lex operation.\n");

fclose(fp2); // Close the file
return 0;
}
