// Desenha um retângulo preenchido, no canto superior esquerdo da tela
// Com largura de 16 pixels e altura especificada RAM[0]
// Uso: Coloque um valor não negativo em RAM[0]

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

(LOOP)
    @i
    D = M // D = ram[i]
    @n
    D = D - M // D = ram[i] - ram[n]
    @END
    D ; JGT // if i > n goto END

    @address
    A = M
    M = -1 // ram[address] = -1 (16 pixels com valor 1) 1111111... Preenche a linha com uns 

    @i
    M = M + 1 // i = i + 1
    @1
    D = A
    @address
    M = M + D // address = address + 32
    @LOOP
    0 ; JMP // salto incondicional para LOOP

(END)
    @END
    0 ; JMP // loop infinito de finalização




















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