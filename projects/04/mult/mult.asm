// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    @R1
    D = M   // D = primeiro operando
    @STOP_ZERO
    D ; JLE // verifica se 1º operando é zero
    @R1
    D = M
    @result
    M = D

    @R0
    D = M
    @STOP_ZERO
    D ; JLE // verifica se 2º operando é zero
    @R0
    D = M

    @count
    M = D - 1   // já asicionei uma vez ao result

(LOOP)      // criação de rótulo para branches
    @R1
    D = M
    @result
    M = M + D   // result + R1
    
    @count
    M = M - 1
    D = M
    @STOP
    D ; JEQ
    @LOOP
    0 ; JMP

(STOP)
    @result
    D = M
    @R2
    M = D
    @END
    0 ; JMP

(STOP_ZERO)
    @R2
    M = 0

(END) // loop infinito de finalização de programa
    @END
    0 ; JMP


//    int soma(r0, r1, r2){
//        a = r0;
//        b = r1;
//        count = 0;

//        do{
//            b = b + b;
//        }while(count <= a);
//    }