.data 0x0
	P2: .asciiz "P2\n"
	newline: .asciiz "\n"
	x1: .word 0
	x2: .word 0 
	y1: .word 0
	y2: .word 0
	width: .word 0
	height: .word 0
	PPM_max: .word 0
	new_width: .word 0 
	new_height: .word 0
	gray_value: .word 0
	
.text 0x3000

main:
	li $v0, 5 
	syscall
	sw $v0, x1
	
	li $v0, 5 
	syscall
	sw $v0, x2
	
	li $v0, 5  
	syscall
	sw $v0, y1
	
	li $v0, 5 
	syscall
	sw $v0, y2
	
	li $v0, 5 
	syscall
	sw $v0, width
	
	li $v0, 5 
	syscall
	sw $v0, height
	
	li $v0, 5    
	syscall
	sw $v0, PPM_max
	
	lw $s2, x1    
	lw $s3, x2
	lw $s4, y1
	lw $s5, y2
	
	sub $s6, $s3, $s2  
	addi $s6, $s6, 1
	sw $s6, new_width
	
	sub $s7, $s5, $s4   
	addi $s7, $s7, 1
	sw $s7, new_height
	
	li $v0, 4   
	la $a0, P2
	syscall
	
	lw $t7, new_width   
	li $v0, 1
	move $a0, $t7
	syscall 
	
	li $v0, 4   
	la $a0, newline
	syscall
	
	lw $t8, new_height    
	li $v0, 1
	move $a0, $t8
	syscall
	
	li $v0, 4  
	la $a0, newline
	syscall
	
	lw $t9, PPM_max   
	li $v0, 1
	move $a0, $t9
	syscall
	
	li $t3, 0 
	lw $s6, width
	lw $s7, height
	
outer_loop:
	bge $t3, $s7, exit 
	li $t4, 0 
	
inner_loop:
	
	bge $t4, $s6, end_inner 
	
	li $v0, 5    
	syscall
	sw $v0, gray_value
	
	slt $t6, $t3, $s4 
	slt $t7, $s5, $t3 
	or  $t8, $t6, $t7
	
	slt $t6, $t4, $s2 
	slt $t7, $s3, $t4
	or  $t9, $t6, $t7
	
	or $t6, $t8, $t9
	
	bne $t6, $zero, increment 
	
	li $v0, 4  
	la $a0, newline
	syscall
	
	lw $t9, gray_value  
	li $v0, 1
	move $a0, $t9
	syscall
	
	b increment								
	
increment:
	addi $t4, $t4, 1
	b inner_loop
	
	
end_inner:
	addi $t3, $t3, 1
	b outer_loop	
									
exit:

	ori $v0, $0, 4				
	ori $a0, $0, 33  

	syscall

	ori $v0, $0, 10	
	syscall


