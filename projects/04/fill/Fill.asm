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

(LOOP_ESPERA_CLIK) // loop infinito que estuta o KBD register input
    @KBD
    D = M // D = ram[kdb]. faz uma leitura do registrador do teclado
    @LOOP_ESPERA_CLIK
    D ; JEQ // if D = 0 goto LOOP_ESPERA_CLIK

    // tem alguma coisa no teclado, então fazer tela ficar preta

    // carregar valor 8191
    @8191
    D = A // D = 8191
    @n // cria variável
    M = D // n = 8191

    @i // cria variável
    M = 0 // i = 0

    @SCREEN // palavra chave que contém o endereço base da memória de tela
    D = A // D recebe o endereço base da tela
    @address // cria variável
    M = D // address = 16284

(LOOP_BLACK_SCREEN)
    @i
    D = M // D = ram[i]
    @n
    D = D - M // D = ram[i] - ram[n]
    @LOOP_ESPERA_UNCLIK
    D ; JGT // if i > n goto END

    @address
    A = M
    M = -1// ram[address] = -1 (16 pixels com valor 1) 1111111... Preenche a linha com uns 

    @i
    M = M + 1 // i = i + i
    @1
    D = A
    @address
    M = M + D // address = address + 1
    @LOOP_BLACK_SCREEN
    0 ; JMP // salto incondicional para LOOP_BLACK_SCREEN

(LOOP_ESPERA_UNCLIK)
    @KBD
    D = M // D = ram[kdb]. faz uma leitura do registrador do teclado
    @PREPARE_WHITE_SCREEN
    D ; JEQ // if D = 0 goto LOOP_WHITE_SCREEN
    @LOOP_ESPERA_UNCLIK
    0 ; JMP

(PREPARE_WHITE_SCREEN)
    // carregar valor 8191, último endereço da tela
    @8191
    D = A // D = 8191
    @n // cria variável
    M = D // n = 8191

    @i // cria variável
    M = 0 // i = 0

    @SCREEN // palavra chave que contém o endereço base da memória de tela
    D = A // D recebe o endereço base da tela
    @address // cria variável
    M = D // address = 16284

(LOOP_WHITE_SCREEN)
    @i
    D = M // D = ram[i]
    @n
    D = D - M // D = ram[i] - ram[n]
    @LOOP_ESPERA_CLIK
    D ; JGT // if i > n goto END

    @address
    A = M
    M = 0// ram[address] = 0 Preenche a linha com zeros

    @i
    M = M + 1 // i = i + i
    @1
    D = A
    @address
    M = M + D // address = address + 1
    @LOOP_WHITE_SCREEN
    0 ; JMP // salto incondicional para LOOP_BLACK_SCREEN