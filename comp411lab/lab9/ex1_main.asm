.data 0x0     # followed by global variables

        .text 0x3000
.globl main



main:
	addi	$8, $0, 1		# $8 = result = 1;
	
while:
	beq	$8, $0, exit		#while (result != 0) {
	li	$v0, 5			#scanf("%d", &input);
	syscall
	move	$a0, $v0
				
	jal fibonacci
	
	move	$8, $v0			# store the value returned by fibonacci()
	li	$v0, 1			#printf("%d\n", result);
	move	$a0, $8		
	syscall
	beq	$8, $0, exit
	addi 	$a0, $0, 0xA 
        addi 	$v0, $0, 0xB 
        syscall
	j 	while		


exit:
	ori 	$v0, $0, 10		#System call code 10 for exit
	syscall				#exit the program