// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    @R0
    D = M   // D = primeiro operando

    @i      // Aloca registrador em algum endereço, com label i. Alocado em posição 16
    M = D   // memória na posição do registrador alocado recebe primeiro operando. Inicialização do contador

    @R1
    D = M   // D = segundo operando

    @b      // Criação de um label. é traduzido para um número de registrador. Será alocado em 17
    M = D   // memória ram na posição b recebe o número b carregado anteriormente

    @c      // label para guardar o resultado. Posição 18
    M = 0   // inicializa variável que quarda resultado, com valor zero

(LOOP)      // criação de rótulo para branches
    @i
    D = M   // register D = M[i]      CONTINUAR .....
    @n
    D = D - M // D = D - M[n]
    @STOP // pula para o endereço rotulado como STOP
    D ; JGT // if i > n goto STOP

    @sum
    D = M
    @i
    D = D + M
    @sum
    M = D // sum = sum + i
    @i
    M = M + 1 // i = i + 1
    @LOOP // volta para onde esta o rótulo LOOP
    0 ; JMP // com esse jump incondicional

(STOP)
    @sum
    D = M // carrega resultado da soma para registrador D
    @R1
    M = D // RAM[1] = sum. Salva resultado na posição 1 da memória

(END) // loop infinito de finalização de programa
    @END
    0 ; JMP