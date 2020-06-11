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

    @R0
    D = M // D = ram[0]
    @n // cria variável
    M = D // n = ram[0]

    @i // cria variável
    M = 0 // i = 0

    @SCREEN // palavra chave que contém o endereço base da memória de tela
    D = A // D recebe o endereço base da tela
    @address // cria variável
    M = D // address = 16284

(LOOP) // loop infinito que estuta o KBD register input
    @KDB
    D = M // D = ram[kdb]. faz uma leitura do registrador do teclado
    @LOOP
    D ; JET // if D == 0 goto LOOP

    // tem alguma coisa no teclado, então fazer tela ficar preta
    // CONTINUAR AQUI ... 
    @address
    A = M
    M = -1 // ram[address] = -1 (16 pixels com valor 1) 1111111... Preenche a linha com uns 

    @i
    M = M + 1 // i = i + i
    @32
    D = A
    @address
    M = M + D // address = address + 32
    @LOOP
    0 ; JMP // salto incondicional para LOOP

(END)
    @END
    0 ; JMP 