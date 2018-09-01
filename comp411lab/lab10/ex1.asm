.data
	buffer:		.space	20
	
.text

main:
# store the first number
li	$v0, 5
syscall
move	$a0, $v0

jal	print_bin

# New Line
li	$v0, 11
li	$a0, 10
syscall

j main

print_bin:

add	$t0, $zero, $a0	# put our input ($a0) into $t0

add	$t1, $zero, $zero	# Zero out $t1
addi $t3, $zero, 1	# load 1 as a mask
sll $t3, $t3, 7	# move the mask to appropriate position
addi $t4, $zero, 8	# loop counter

loop:

and $t1, $t0, $t3	# and the input with the mask
beq $t1, $zero, print	# Branch to print if its 0

add $t1, $zero, $zero	# Zero out $t1
addi $t1, $zero, 1	# Put a 1 in $t1
j print


print:	li $v0, 1
move $a0, $t1
syscall
 

srl $t3, $t3, 1
addi $t4, $t4, -1
bne	$t4, $zero, loop

beqz	$t0, exit  # use this to print all 0s and end the program if inputed
jr	$ra

exit:
	ori 	$v0, $0, 10		#System call code 10 for exit
	syscall				#exit the program