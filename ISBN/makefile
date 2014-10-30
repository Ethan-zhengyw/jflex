VPATH = src:bin

ISBNLexer.class: ISBNLexer.java
	rm -rf bin; mkdir bin
	javac -classpath bin/ src/ISBNLexer.java -d bin/

ISBNLexer.java: isbn.flex
	jflex src/isbn.flex

clean:
	rm -rfv src/ISBNLexer.java src/*.swp doc/output.txt bin src/*~
