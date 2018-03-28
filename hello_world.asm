	.data 
str_dig: .asciiz "Digite um numero qualquer: "	
str_pos: .asciiz "Hello world positivo pra tu :) !\n"
str_neg: .asciiz "Hello world negativo pra tu :( !\n"	 

.text

main: 

	li $v0,4  	# código pra impressão de string
	la $a0 str_dig	# endereço de str_dig em a0
	syscall
	
	li $v0,5    	#codigo para leitura de um inteiro #retorno em $v0
	syscall
	
	move $t1,$v0	# guardando em outro registrador
	
	slti $t0,$t1,0	#if ($t1 < 0) $t0 = 1 else $t0 = 0  
	
	beq $t0,$zero,print_pos
	j print_neg

	
print_pos:
	la $a0,str_pos  #carrega o endereco da string positiva
	j print_str
	
print_neg:
	la $a0,str_neg  #carrega o endereco da string negativa
	j print_str							

print_str:
	li $v0,4		
	syscall
	
fim:
	li $v0,10	#código para terminar o programa		
	syscall 										