.globl fibonacci
fibonacci:				# fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)
	addi	$sp, $sp, -12		# save registers on stack
	sw	$a0, 0($sp)		
	sw	$s0, 4($sp)		
	sw	$ra, 8($sp)		
	bgt	$a0, 1, calc
	move	$v0, $a0
	j	return
	
calc:
	addi	$a0, $a0, -1
	jal	fibonacci
	move	$s0, $v0
	addi	$a0, $a0, -1
	jal	fibonacci
	addu	$v0, $v0, $s0
	
return:
	lw	$a0, 0($sp)		# restore registers from stack
	lw	$s0, 4($sp)
	lw	$ra, 8($sp)
	addi	$sp, $sp, 12		# decrease the stack size
	jr	$ra
 		
exit:
	ori 	$v0, $0, 10		#System call code 10 for exit
	syscall				#exit the program