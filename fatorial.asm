	.data
str_dig: .asciiz "Digite um numero: "
str_fat: .asciiz "O fatorial de "
str_com: .asciiz " é "		

	.text
j main	
	
print_int:  		#printa um int que está em $a0
	li $v0,1		
	syscall
	jr $ra  	#Volta para onde ocorreu a chamada	
	
print_str:  		#printa string que está em $a0
	li $v0,4		
	syscall
	jr $ra  
	
read_int:  		#leitura int, retorno em $v0
	li $v0,5		
	syscall
	jr $ra  	

main:
	la $a0 str_dig	#print digite um numero	
	jal print_str
	
	jal read_int	#leia um inteiro
	move $t1,$v0
	
	la $a0 str_fat	# o fatorial de		
	jal print_str
	
	move $a0,$t1	#copia o conteudo de $t1 para $a0
	jal print_int
	
	la $a0 str_com	# "é "	
	jal print_str
	
	move $t0,$t1  	# $t0 variavel auxiliar
	li $t2,1 
	
	
loop: 	beq $t0,$t2,fim_loop  # enqunto $t0 nao for 1
 
	addi $t0,$t0,-1		#decrementa $t0		
	mul $t1,$t1,$t0		#multiplica $t1 = $t1 * ($t1 - 1)
	
	j loop
	
				
fim_loop:			
	
	move $a0,$t1
	jal print_int
	
	
	
fim:
	li $v0,10
	syscall 	
		