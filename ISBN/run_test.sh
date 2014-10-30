java -classpath bin ISBNLexer doc/isbn_example.txt > doc/output.txt
cat doc/output.txt | grep return -A1 -B1
