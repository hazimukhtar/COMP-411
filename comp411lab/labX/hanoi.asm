	.data
	.align 4
move_d:	.asciiz "Move disk "
from:	.asciiz " from Peg "
to:	.asciiz " to Peg "
new_line: .asciiz "\n"
 
        .text
        .globl main
main:
	add 	$fp, $zero, $sp		# set the frame pointer
 
        li 	$2, 5			# System call code to read int input
        syscall				# Read it
 
	add 	$a0, $zero, $v0		# move number into arg1
	addi 	$a1, $zero, 1		# put one into arg 2
	addi 	$a2, $zero, 3		# put two into arg 3
	addi 	$a3, $zero, 2		# put three into arg 3
	jal 	hanoi			# jump and link to hanoi
 
Exit:
        li 	$2, 10			# System call code for exit
        syscall                         # exit
 
#----------------------------------------------------------
# of the callee saved registers the subroutine hanoi uses
# s0, s1, s2, and s3 so we will save those to the stack
# as well as the old fp, and return pointers in 
# the beginng and restore them in the end.
# we will then set the new $fp to keep with convention
# although we dont ever use it
# the only long lived variable, which we do not keep in a callee 
# saved register is n. thus we push n onto the stack.
# and then pull it back off after any subroutine call.
#---------------------------------------------------------
hanoi:
	addi	$sp, $sp, -4		# dec sp
	sw	$ra, ($sp)		# save return address on stack
	addi	$sp, $sp, -4		# dec sp
	sw	$fp, ($sp)		# save fp on stack
	addi	$sp, $sp, -4		# dec sp
	sw	$s0, ($sp)		# save s0 on stack
	addi	$sp, $sp, -4		# dec sp
	sw	$s1, ($sp)		# save s1 on stack
	addi	$sp, $sp, -4		# dec sp
	sw	$s2, ($sp)		# save s2 on stack
	addi	$sp, $sp, -4		# dec sp
	sw	$s3, ($sp)		# save s3 on stack
	addi	$sp, $sp, -4		# dec sp
	addi	$fp,  $sp, 32		# set $fp
	beq	$a0,  $zero, n_zero	# is n zero
	sw	$a0, ($sp)		# store "n" on stack
	addi	$sp, $sp, -4		# dec sp
	sw	$a1, ($sp)		# store "start" on stack
	addi	$sp, $sp, -4		# dec sp
	sw	$a2, ($sp)		# store "finish" on stack
	addi	$sp, $sp, -4		# dec sp
	sw	$a3, ($sp)		# store "extra" on stack
	addi	$sp, $sp, -4		# dec sp	
	addi	$a0, $a0, -1		# put n-1 in arg0
	add	$t2,  $zero, $a2	# put a2 in temp2
	add	$a2,  $zero, $a3	# swap args 2 and 3 for first call
	add	$a3,  $zero, $t2		
	jal	hanoi			# call hanoi
	addi	$sp, $sp, 4		# inc sp	
	lw	$s0, ($sp)		# get "extra" =s0
	addi	$sp, $sp, 4		# inc sp	
	lw	$s1, ($sp)		# get "finish" =s1
	addi	$sp, $sp, 4		# inc sp	
	lw	$s2, ($sp)		# get "start" =s2
	addi	$sp, $sp, 4		# inc sp 	
	lw	$s3, ($sp)		# get n =s3
 
#----------------------------------------------------------------
#
# these lines through the next comment block
# just print the required messages
# and variables using the psuedo instructions li, la 
# and the actual instruction syscall.
#
# the psuedo instruction li in reality 
#      just ors the immediate constant with 0,
#      thus leaving the immediate in the register
#
# the la makes getting the address of a label easier, 
#       by using lui to put the
# 	upper part of the address into the top of $at
# 	and then using ori to get the rest of 
#	the address 	
#
#----------------------------------------------------------------
	li 	$v0, 4       			
	la 	$a0, move_d    			
	syscall
	li 	$2, 1                         
        add 	$4, $zero, $s3                     
	syscall
	li 	$v0, 4       		
	la 	$a0, from    		
	syscall
	li 	$v0, 1       			
	add 	$a0, $zero, $s2    			
	syscall
	li 	$v0, 4       			
	la 	$a0, to    			
	syscall
	li 	$v0, 1       			
	add 	$a0, $zero, $s1    			
	syscall
	li 	$v0, 4       			
	la 	$a0, new_line    			
	syscall
#----------------------------------------------------------------
# end the writes
#----------------------------------------------------------------
	addi 	$a0, $s3, -1		# put n-1 in arg 0
	add 	$a1, $zero, $s0		# extra is second arg;
	add 	$a2, $zero, $s1		# finish is third arg
	add 	$a3, $zero, $s2		# start is last arg;
	jal 	hanoi			# call hanoi
n_zero:
	addi	$sp, $sp, 4		# inc sp
	lw	$s3, ($sp)		# get old s3 off stack
	addi	$sp, $sp, 4		# inc sp
	lw	$s2, ($sp)		# get old s2 off stack
	addi	$sp, $sp, 4		# inc sp
	lw	$s1, ($sp)		# get old s1 off stack
	addi	$sp, $sp, 4		# inc sp
	lw	$s0, ($sp)		# get old s0 off stack
	addi	$sp, $sp, 4		# inc sp
	lw	$fp, ($sp)		# get old fp off stack
	addi	$sp, $sp, 4		# inc sp
	lw	$ra, ($sp)		# get return address off stack
	addi	$sp, $sp, 4		# inc sp back to where we expect it to start
	jr 	$ra			# go back to caller+4

