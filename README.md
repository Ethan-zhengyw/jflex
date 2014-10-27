jflex词法分析
==============

### 流程

1. 根据表格[symbol table.pdf]中规定好的token类别写出token.flex
2. 使用JFLex根据 token.flex生成Lexer.java文件
3. 编译运行刚刚得到的java文件，即得到可执行的词法分析器Lexer.class
4. 对test.txt进行词法分析返回token，结果输出到output.txt中

### 目录结构

    ```
    ▾ jflex-clang/
      ▾ bin/
          Lexer.class
          Yytoken.class
      ▾ doc/
          input.cpp
          outgood.txt
          output.txt
          symbol table.pdf
      ▾ src/
          c-lang.flex
          Lexer.java
          Yytoken.java
        makefile
        README.md
        run_test.sh*
    ```

## 执行测试


    ```shell
    git clone https://github.com/Ethan-zhengyw/jflex-clang.git
    ```

    ```shell
    make
    ./run_test.sh
    ```
    
