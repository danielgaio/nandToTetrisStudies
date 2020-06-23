// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

    // carregar 480 para primeira posição da ram
    @R0
    //M = 480
    D = M // D = ram[0]
    @n // cria variável
    M = D // n = ram[0]

    @i // cria variável
    M = 0 // i = 0

    @SCREEN // palavra chave que contém o endereço base da memória de tela
    D = A // D recebe o endereço base da tela
    @address // cria variável
    M = D // address = 16284

(ESPERA) // loop infinito que estuta o KBD register input
    @KDB
    D = M // D = ram[kdb]. faz uma leitura do registrador do teclado
    @ESPERA
    D ; JGT // if D > 0 goto ESPERA

    // tem alguma coisa no teclado, então fazer tela ficar preta

(ESCRITA)
    @address
    A = M
    M = -1 // ram[address] = -1 (16 pixels com valor 1) 1111111... Preenche a linha com uns, que é o preto

    @i
    M = M + 1 // i = i + i
    @32 // <- aqui, ao invés de 32, colocar largura total da tela
    D = A // D = 32
    @address
    M = M + D // address = address + 32
    // ???? aqui mudar para condição: quando tiver escrito em toda a tela
    @KDB // se for igual a zero ir para ESPERA, senão ir para ESCRITA
    D = M
    @ESPERA
    D ; JEQ // se KDB == 0 goto ESPERA
    @ESCRITA
    0 ; JMP // salto incondicional para ESCRITA

(END)
    @END
    0 ; JMP 