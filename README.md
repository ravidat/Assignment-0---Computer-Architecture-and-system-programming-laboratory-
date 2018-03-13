# Assignment-0---Computer-Architecture-and-system-programming-laboratory-
Assignment 0: Getting aquainted with assembly language and the linking process

Assignment Description
We provide you with a simple program written in C that receives a string from a user.
Then, this program calls a function written in assembly language (which you need to implement) that receives a (pointer to) a null terminated character string as an argument. Your code should operate on the string as follows:

    Convert lower case to upper case.
    Convert ‘(’ into ‘<’.
    Convert ‘)’ into ‘>’.
    Count the number of the non-letter characters, that is ANY character that is not 'a'->'z' or 'A'->'Z', including newline character (Note: characters that are not letters,’(‘ or ‘)’ will remain as they are) 


The function returns the counter.
The characters conversion should be in-place.

Example:

> myexe.out
42: heLL() WorLd!
42: HELL<> WORLD!

9
What We Provide
The attached files:

    main.c As explained above.
    asm.s Contains skeleton code that you need to modify. 
    
    RUNNING NASM
    
    To assemble a file, you issue a command of the form
> nasm  -f   <format>   <filename>  [-o <output>] [ -l listing]
        
Example:

> nasm  -f   elf64 myasm.s  -o myelf.o

It would create myelf.o file that has elf format (executable and linkable format).
We use main.c file (that is written in C language) to start our program, and 
sometimes also for input / output from a user. So to compile main.c with our 
assembly file we should execute the following command:

gcc  main.c myelf.o   -o myexe.out

If we do not use main.c, we compile with gcc as follows:

gcc  myelf.o   -o myexe.out

It would create executable file myexe.out.
In order to run it you should write its name on the command line:
> myexe.out
