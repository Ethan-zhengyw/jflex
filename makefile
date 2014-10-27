VPATH = src:bin

Lexer.class: Lexer.java Yytoken.class
	javac -classpath bin/ src/Lexer.java -d bin/

Yytoken.class: Yytoken.java
	javac src/Yytoken.java -d bin/

Lexer.java: c-lang.flex
	jflex src/c-lang.flex

clean:
	rm -fv bin/* src/Lexer.java src/*.swp doc/output.txt
