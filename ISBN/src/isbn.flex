import java.util.regex.*;

class Yytoken {
    private int kind;
    private String isbn;
    int groups[13];

    Yytoken (int kind_, String isbn_) {
        kind = kind_;
        isbn = isbn_;
    }

    boolean sizeCheck() {
        return (kind == 10 && isbn.length() == 13)
            || (kind == 13 && isbn.length() == 17);
    }

    int checkNum()

    public String toString() {
        System.out.println(sizeCheck());
        return "(Text: "+ isbn + "    index : "+ kind +")\n";
    }
}

%%

%class ISBNLexer
%unicode
%debug

pre = 978|979
group = \d{1,5}
publisher = \d{1,7}
bookname = \d{1,6}
checkdigit_10 = [X\d]
checkdigit_13 = \d
separator = [-\ ]
isbn10 = {group}{separator}{publisher}{separator}{bookname}{separator}{checkdigit_10}
isbn13 = {pre}{separator}{group}{separator}{publisher}{separator}{bookname}{separator}{checkdigit_13}

space = [\t\n\r\ ]

%%

<YYINITIAL>
{
    {isbn10}	{ return new Yytoken(10, yytext()); }
    {isbn13}	{ return new Yytoken(13, yytext()); }
}

{space}         { System.out.println("Space"); }
. {}
