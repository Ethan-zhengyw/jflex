calc: token.l calculator.y
	bison -vd calculator.y
	flex token.l
	cc -o $@ calculator.tab.c lex.yy.c -lfl

clean:
	rm -f demo *tab* *yy.c
