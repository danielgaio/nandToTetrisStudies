// Computes RAM[1] = 1 + 2 + ... + n
// Uso: coloque um número n em RAM[0]

    @R0
    D = M // D = número n, até onde vai somar

    @n // Criação de um label. é traduzido para um número de registrador. Será alocado em 16
    M = D // memória ram na posição n recebe o número n carregado anteriormente

    @i // Aloca registrador em algum endereço, com label i. Alocado em posição 17
    M = 1 // memória na posição do registrador alocado recebe 1. Inicialização do contador

    @sum // label para endereço de memória. Posição 18
    M = 0 // inicializa variável que quarda a soma, com valor zero

(LOOP) // criação de rótulo para branches
    @i
    D = M // register D = M[i]
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