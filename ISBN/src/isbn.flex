class Yytoken {
    private int kind;
    private String isbn;
    private int[] isbn_num = new int[13]; // isbn without seperator

    Yytoken (int kind_, String isbn_) {
        kind = kind_;
        isbn = isbn_;

        if (sizeCheck()) {
            int count = 0;
            for (int i = 0; i < isbn.length(); i++) {
                char item = isbn.charAt(i);
                if ((item >= '0' && item <= '9') || (item == 'X'))
                    isbn_num[count++] = (item - '0');
            }
        }
    }

    boolean sizeCheck() {
        return (kind == 10 && isbn.length() == 13)
            || (kind == 13 && isbn.length() == 17);
    }

    int getCheckNum() {
        int checkNum, sum = 0, remainder;
        
        if (kind == 10) {
            for (int i = 0; i < 9; i++) {
                sum += (10 - i) * (isbn_num[i]);
            }
            remainder = sum % 11;
            checkNum = (11 - remainder) % 11;
            if (checkNum == 10) {
                checkNum = 'X' - '0';
            }
        } else {
            for (int i = 0; i < 12; i++) {
                sum += ((isbn_num[i]) * ((i % 2 == 0) ? 1 : 3));
            }
            remainder = sum % 10;
            checkNum = (10 - remainder) % 10;
        }
        
        return checkNum;
    }

    String getLan() {
        int lanCode;
        String language;

        if (kind == 10)
            lanCode = isbn_num[0];
        else
            lanCode = isbn_num[3];
        
        if (lanCode == 0)
            language = "English";
        else if (lanCode == 7)
            language = "Chinese";
        else
            language = "Other";
        
        return language;
    }

    String getPublisher() {
        int[] indexOfSeperator = new int[4];

        int count = 0;
        for (int i = 0; i < isbn.length(); i++) {
            char item = isbn.charAt(i);
            if (item == ' ' || item == '-')
                indexOfSeperator[count++] = i;
        }
        
        return ((kind == 10) ?
            (isbn.substring(indexOfSeperator[0] + 1, indexOfSeperator[1])) :
            (isbn.substring(indexOfSeperator[1] + 1, indexOfSeperator[2])));
    }

    public String toString() {
        int len = (kind == 10) ? 10 : 13;

        if (sizeCheck() && getCheckNum() == isbn_num[len - 1])
            return getLan() + " " + getPublisher();
        else
            return "Error";
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

{space}         { }
.               { }
