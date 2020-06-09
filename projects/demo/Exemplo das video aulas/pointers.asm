// Este programa coloca o valor -1 nas primeiras 10 posições de um vetor
// for (i=0;i<n;i++)
//      arr[i] = -1

// Suponha que arr = 100 (label arr, 100 é o endereço onde o vetor começa), e n = 10

    @100
    D = A // D = 100
    @arr // label de variável, será posição 16 na arquitetura do hack
    M = D // guarda valor 100 na ram

    @10
    D = A // D = 10
    @n
    M = D // aloca registrador com label 'n' e guarda 10 dentro

    // initialaze i = 0
    @i
    M = 0

(LOOP)
    // if (i == n) goto END
    @i
    D = M // D recebe ram[i]
    @n
    D = D - M // D = D - ram[n]
    @END
    D ; JEQ // se D == 0 vai para endereço de END

    // ram[arr + i] = -1
    @arr
    D = M // carrega primeiro elemento do vetor. D = ram[arr]
    @i
    A = D + M // A = ram[arr] + ram[i]. calculando endereço base + index do array
    M = -1 // ram[arr + I] = -1. O 'A' recebeu o endereço calculado para o vetor

    // i++
    @i
    M = M + 1

    @LOOP
    0 ; JMP // jump incondicional para endereço de LOOP

(END)
    @END
    0 ; JMP // lop infinito de encerramento

// Variaveis que armazenam endereços são ponteiros, nesse caso 'arr' e 'i'