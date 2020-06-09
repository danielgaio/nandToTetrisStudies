// Adiciona dois numeros
// RAM[2] = RAM[0] + RAM[1]
// Uso: coloque os números que deseja somar em RAM[0] e RAM[1]

	// carrega valor no endereço 0
	@0
	D = M

	// seta endereço pra 1, e soma o que tinha sido carregado antes com o que tem na ram nesse endereço
	@1
	D = D + M

	// seta endereço pra 2 e guarda neste endereço na ram o resultado que estava no registrador D
	@2
	M = D

	// faz um loop infinito pra que não continue executando ao longo da memória
	@6
	0 ; JMP