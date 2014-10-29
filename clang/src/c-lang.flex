
%%

%class Lexer
%unicode
%debug

include = "#include"
filename = <.*?>
functionname = \w+\(.*?\)
comma = ","
semicolon = ";"
bracket_3_left = "{"
bracket_3_right = "}"
add = "+"
sub = "-"
bracket_1_left = "("
bracket_1_right = ")"
mul = "*"
div = "/"
lt = "<"
gt = ">"
eq = "="
int = "int"
double = "double"
if = "if"
return = "return"
number = \d+
id = \w+
string = \"\w+\"
space = [\n\r]

%%

<YYINITIAL> {
    {include}	{ return new Yytoken(1, yytext()); }
    {filename}	{ return new Yytoken(2, yytext()); }
    {functionname}	{ return new Yytoken(3, yytext()); }
    {comma}   { return new Yytoken(6, yytext()); }
    {semicolon}   { return new Yytoken(7, yytext()); }
    {bracket_3_left}   { return new Yytoken(8, yytext()); }
    {bracket_3_right}   { return new Yytoken(9, yytext()); }
    {add} { return new Yytoken(10, yytext()); }
    {sub} { return new Yytoken(11, yytext()); }
    {bracket_1_left}   { return new Yytoken(12, yytext()); }
    {bracket_1_right}   { return new Yytoken(13, yytext()); }
    {mul} { return new Yytoken(14, yytext()); }
    {div} { return new Yytoken(15, yytext()); }
    {lt} { return new Yytoken(16, yytext()); }
    {gt} { return new Yytoken(17, yytext()); }
    {eq} { return new Yytoken(18, yytext()); }
    {int}   { return new Yytoken(19, yytext()); }
    {double}    { return new Yytoken(20, yytext()); }
    {if}    { return new Yytoken(21, yytext()); }
    {return}    { return new Yytoken(22, yytext()); }
    {number}	{ return new Yytoken(23, yytext()); }
    {id}	{ return new Yytoken(24, yytext()); }
    {string}	{ return new Yytoken(4, yytext()); }
}

{space} {}
. {}
