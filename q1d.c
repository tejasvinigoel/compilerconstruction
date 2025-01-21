#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#define YES 1
#define NO 0
// Token structure definition
typedef struct {
	char type[10];
	char value[3];
} token;
token newToken(const char *type, const char *value) {
	token t;
	snprintf(t.type, sizeof(t.type), "%s", type);
	snprintf(t.value, sizeof(t.value), "%s", value);
	return t;
}
void retract(char c) {
	ungetc(c, stdin);
}
void fail() {
	printf("Lexical error: invalid operator.\n");
	exit(1);
}
token getRelop() {
	int state = 0;
	char c;
	while (YES) {
		switch (state) {
		case 0:
		c = getchar();
		if (c == '<') state = 1;
		else if (c == '=') state = 5;
		else if (c == '>') state = 6;
		else fail();
		break;
		case 1:
		c=getchar();
		if(c=='=') state=2;
		else if(c=='>') state=3;
		else state=4;
		break;
		case 2:
		return newToken("relop", "LE");
		case 4:
		retract(c);
		return newToken("relop", "LT");
		case 5:
		return newToken("relop", "EQ");
		case 6:
		c=getchar();
		if(c=='=') state=7;
		else state=8;
		break;
		case 7:
		return newToken("relop","GE");
		case 8:
		retract(c);
		return newToken("relop","GT");
		default:
		state = 0;
		break;
		
		}
	}
}
token getAssignop() {
	int state = 0;
	char c;
	while (YES) {
		switch (state) {
		case 0:
		c = getchar();
		if (c == ':') state = 1;
		else if (c == '+') state = 2;
		else if (c == '-') state = 3;
		else if (c == '/') state = 4;
		else if (c == '*') state = 5;
		else if (c == '%') state = 6;
		else fail();
		break;
		case 1:
		c=getchar();
		if(c=='=') return newToken("assop","AS");
		else fail();
		case 2:
		c=getchar();
		if(c=='=') return newToken("assop","PS");
		else fail();
		case 3:
		c=getchar();
		if(c=='=') return newToken("assop","SS");
		else fail();
		case 4:
		c=getchar();
		if(c=='=') return newToken("assop","DS");
		else fail();
		case 5:
		c=getchar();
		if(c=='=') return newToken("assop","MS");
		else fail();
		case 6:
		c=getchar();
		if(c=='=') return newToken("assop","RS");
		else fail();
		
		
		default:
		state = 0;
		break;
		
		}
	}
}
token getArithop() {
	int state = 0;
	char c;
	while (YES) {
		switch (state) {
		case 0:
		c = getchar();
		if (c == '+') state = 1;
		else if (c == '/') state = 2;
		else if (c == '%') state = 3;
		else if (c == '-') state = 4;
		else if (c == '*') state = 5;
		else fail();
		break;
		case 1:
		return newToken("arop", "ADD");
		case 2:
		return newToken("arop", "DIV");
		case 3:
		return newToken("arop", "MOD");
		case 4:
		return newToken("arop", "SUB");
		case 5:
		return newToken("arop", "MUL");
		
		default:
		state = 0;
		break;
		
		}
	}
}

token getSep(){
	char c=getchar();
	return newToken("sep","SP");
}
token findToken(){
	int state=0;
	char c=getchar();
	if(c=='='||c=='>'||c=='<'){
	retract(c);
	return getRelop();
	}else if(c=='('||c==')'||c=='{'||c=='}'||c==','||c==';'){
	retract(c);
	return getSep();
	}else{ //+ -
	char d=getchar();
	if(d=='='){
	retract(d);
	retract(c);
	return getAssignop();
	}else {
	retract(d);
	retract(c);
	return getArithop();}
	}
	
}
int main() {
	token result = findToken();
	printf("Token Type: %s, Token Value: %s\n", result.type, result.value);
	return 0;
}
