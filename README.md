jflex词法分析
==============

### 流程

*clang*
    1. 根据表格[symbol table.pdf]中规定好的token类别写出token.flex
    2. 使用JFLex根据 token.flex生成Lexer.java文件
    3. 编译运行刚刚得到的java文件，即得到可执行的词法分析器Lexer.class
    4. 对test.txt进行词法分析返回token，结果输出到output.txt中

*ISBN*
    1. 从标准输入中逐行读取待检验的串。
    2. 使用正则匹配ISBN码，若匹配失败则输出Error。若匹配成功则检验校验码是否正确。
    3. 若校验码错误，则输出Error。
    4. 若校验码正确，则根据组号输出语言区、出版社代号到标准输出。

### 目录结构

        ▾ jflex/
          ▾ clang/
            ▾ bin/
                Lexer.class
                Yytoken.class
            ▾ doc/
                input.cpp
                outgood.txt   
                symbol table.pdf
            ▾ src/
                c-lang.flex
                Lexer.java
                Yytoken.java
              makefile
              run_test.sh*
          ▸ ISBN/
            README.md

### 执行测试

下载目录到本地
    
        git clone https://github.com/Ethan-zhengyw/jflex-clang.git
        
    
在clang或ISBN目录下编译并测试

        make
        ./run_test.sh
