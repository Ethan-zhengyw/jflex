%{
#include "calculator.tab.h"
%}

%%

"("     { return BRACKET_L; }
")"     { return BRACKET_R; }

"not"   { return NOT; }

"+"     { return ADD; }
"-"     { return SUB; }

"*"     { return MUL; }
"/"     { return DIV; }

"<="    { return LE; }
">="    { return GE; }
"=="    { return EQ; }
"!="    { return NE; }
"<"     { return LT; }
">"     { return GT; }

"and"   { return AND; }
"or"    { return OR; }
"xor"   { return XOR; }

"?"     { return QUEST; }
":"     { return COLON; }

"True"  { return TRUE; }
"False" { return FALSE; }
[0-9]+("."[0-9]+)?  { yylval.d = atof(yytext); return NUMBER; }

\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { printf("Mystery character %c\n", *yytext); }

%%
