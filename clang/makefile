VPATH = src:bin

Lexer.class: Lexer.java Yytoken.class
	javac -classpath bin/ src/Lexer.java -d bin/

Yytoken.class: Yytoken.java
	mkdir bin
	javac src/Yytoken.java -d bin/

Lexer.java: c-lang.flex
	jflex src/c-lang.flex

clean:
	rm -rfv bin/* src/Lexer.java src/*.swp doc/output.txt bin
