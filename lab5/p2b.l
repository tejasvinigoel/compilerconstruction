%{
#include <stdio.h>
int s_comment=0;
int m_comment=0;
%}
%x COMMENT
%%
"//"(.)* {s_comment++; }
"/*" { BEGIN(COMMENT); } /* Enter COMMENT state */
<COMMENT>. { }
<COMMENT>"*/" { m_comment++; BEGIN(0); } /* Exit COMMENT state */
<COMMENT>\n { /* Handle new lines inside comments */ }
.|\n {fprintf(yyout,"%s",yytext);}
%%
int main() {
yyin=fopen("input.c", "r");
yyout=fopen("output.c","w");
yylex();
printf("No. of Single-line comments = %d\n", s_comment);
printf("No. of Multi-line comments = %d\n", m_comment);
return 0;
}
