#if [ ! -f "bin/Lexer.class" ]; then
#    echo "Error: Lexer.class not found, Please execute command: make"
#elif [ ! -f "doc/input.cpp" ]; then
#    echo "input file doc/input.cpp not found!"
#else
#    echo "Testing..."
#    echo
#    echo "Execute: java -classpath bin/ Lexer doc/input.cpp"
#    java -classpath bin Lexer doc/input.cpp > doc/output.txt
#    echo "writing result into doc/output.txt"
#    echo 
#    echo "Comparing token: (Text: *    index : *) between output.txt and outgood.txt"
#
#    output=$(cat doc/output.txt | grep Text)
#    outgood=$(cat doc/outgood.txt | grep Text)
#
#    cat doc/output.txt | grep Text > doc/output_token.txt
#    cat doc/outgood.txt | grep Text > doc/outgood_token.txt
#
#    echo "token in output.txt"
#    echo "-------------------"
#    echo "$output"
#    echo "token in outgood.txt"
#    echo "-------------------"
#    echo "$outgood"
#
#    diff doc/output_token.txt doc/outgood_token.txt
#
#    if [ "$output" == "$outgood" ]; then
#        echo "Test succeed!"
#    else
#        echo "Test Failed!"
#    fi
#
#    rm doc/output_token.txt doc/outgood_token.txt
#fi

java -classpath bin ISBNLexer doc/isbn_example.txt > doc/output.txt
cat doc/output.txt
