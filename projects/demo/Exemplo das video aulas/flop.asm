// flip the values of RAM[0] e RAM[1]

// temp = RAM[0]
// RAM[0] = RAM[1]
// RAM[1] = temp

    // carrga D = RAM[1]
    @R1
    D = M

    @temp // temp = R1. Vai procurar algum registrador disponivel e relacionar a temp
          // então o registrador A vai receber um valor n qualquer de endereço
    M = D

    @R0
    D = M // D = RAM[0]

    @R1
    M = D // RAM[1] = RAM[0]

    @temp
    D = M

    @R0
    M = D // RAM[0] = temp

(END)
    @END
    0 ; JMP
