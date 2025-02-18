%{
#include <stdio.h>
int npink=0;
int npin=0;
int nink=0;
%}
%%
pink {npink++; }
pin {npin++; }
ink {nink++; }
\n return;
%%
main()
{
yylex();
printf("number of occurrences of PINK %d\n", npink);
printf("number of occurrences of PIN %d\n", npin);
printf("number of occurrences of INK %d\n", nink);
}
