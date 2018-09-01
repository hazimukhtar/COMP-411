.data 0x0     # followed by global variables
nl:         .asciiz     "\n"
.text 0x3000
        
.globl main



main:
	addi	$8, $0, 1		# $8 = result = 1;
	
while:
	beq	$8, $0, exit		#while (result != 0) {
	li	$v0, 5			#scanf("%d", &input);
	syscall
	move	$a0, $v0
	
	move	$t8, $a0	# Start Value

Gen:	
	li	$v0, 1		#printf("%d\n", result);
	syscall
	
	move	$t1, $a0	# Start Value
	move	$t2, $t1	# R = start for >>4;
	move	$t3, $t1	# R = start for >>2;
	
	move	$t5, $t1	# Clean value of R
	
	srl	$t2, $t2 4	# (R >> 4)
	and	$t2, $t2, 0x01	# ..  & 0x01)
				#t2 has the value of ((R >> 4) & 0x01)
				
	srl	$t3, $t3 2	# (R >> 2)
	and	$t3, $t3, 0x01	# ..  & 0x01)
	
	xor	$t4, $t2, $t3	# B = ((R >> 4) & 0x01) ^ ((R >> 2) & 0x01);
	# Register T4 has the value of B
	
	and	$t5, $t5, 0x0F	#(R & 0x0F)
	sll	$t5, $t5, 1	#...  << 1
	or	$t5, $t5, $t4
	
	la	$a0, nl
	li	$v0, 4
	Syscall
	
	move	$a0, $t5
	bne	$t5, $t8, Gen
	
	
exit:	
	ori 	$v0, $0, 10		#System call code 10 for exit
	syscall				#exit the program

	
