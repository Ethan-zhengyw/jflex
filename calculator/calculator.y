%{
#include <stdio.h>
extern FILE *yyin;
int _bool;
%}

%union {
    int i;
    double d;
}

%left QUEST COLON
%left AND OR XOR
%left LE GE EQ NE LT GT
%left ADD SUB
%left MUL DIV
%left NOT
%left BRACKET_L BRACKET_R

%token TRUE FALSE
%token NUMBER
%token EOL

%type <d> exp exp_bool exp_math NUMBER TRUE FALSE

%%

statement: 
    | statement exp EOL {
        if (_bool)
            if ($2) printf("True\n"); else printf("False\n");
        else
            printf("%g\n", $2);
      }
    | statement error EOL
    ;

exp: exp_math { _bool = 0; printf("exp_math-->"); }
    | exp_bool { _bool = 1; printf("exp_bool-->");}
    ;

exp_math: NUMBER { printf("NUMBER -%g->", $1);}
    | SUB NUMBER { $$ = -$2; printf("-%g", $2); }
    | exp_bool QUEST exp_math COLON exp_math { $$ = ($1) ? $3 : $5; printf("%g ? %g : %g-->", $1, $3, $5); }
    | exp_math ADD exp_math { $$ = ($1 + $3); printf("ADD-%g, %g->", $1, $3); }
    | exp_math SUB exp_math { $$ = ($1 - $3); printf("SUB-%g, %g->", $1, $3);}
    | exp_math MUL exp_math { $$ = ($1 * $3); printf("MUL-%g, %g->", $1, $3);}
    | exp_math DIV exp_math { if ($3 != 0) $$ = ($1 / $3); else yyerror("Zero as divisor"); printf("DIV-%g, %g->", $1, $3);}
    | BRACKET_L exp_math BRACKET_R { $$ = $2; printf("(exp_math)-->");}
    ;

exp_bool: TRUE { $$ = 1; printf("TRUE-->");}
    | FALSE { $$ = 0; printf("FALSE-->");}
    | exp_bool QUEST exp_bool COLON exp_bool { $$ = ($1) ? $3 : $5; printf("%g ? %g : %g-->", $1, $3, $5);}
    | exp_bool AND exp_bool { $$ = ($1 != 0 && $3 != 0); printf("AND-->");}
    | exp_bool OR exp_bool { $$ = ($1 != 0 || $3 != 0); printf("OR-->");}
    | exp_bool XOR exp_bool { $$ = ($1 == 0 && $3 != 0) || ($1 != 0 && $3 == 0); printf("XOR-->"); }
    | exp_math LE exp_math { $$ = ($1 <= $3); printf("LE-->");}
    | exp_math GE exp_math { $$ = ($1 >= $3); printf("GE-->");}
    | exp_math EQ exp_math { $$ = ($1 == $3); printf("EQ-->");}
    | exp_bool EQ exp_bool { $$ = ($1 == $3); printf("EQ-->");}
    | exp_math NE exp_math { $$ = ($1 != $3); printf("NE-->");}
    | exp_bool NE exp_bool { $$ = ($1 != $3); printf("NE-->");}
    | exp_math LT exp_math { $$ = ($1 < $3); printf("LT-->");}
    | exp_math GT exp_math { $$ = ($1 > $3); printf("GT-->");}
    | NOT exp_bool { $$ = ($2 == 0 ? 1 : 0); printf("NOT-->");}
    | BRACKET_L exp_bool BRACKET_R { $$ = $2; printf("(exp_bool)-->");}
    ;

%%

int main(int argc, char **argv)
{
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return (1);
        }
    }
    return yyparse();
}

yyerror(char *s)
{
    fprintf(stderr, "Error: %s!\n", s);
}
