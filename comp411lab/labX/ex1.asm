.data 0x00ee
space: .asciiz "\n"
.text 0x3000

main:

	add $8,$0,$0
	add $9,$0,$0
	li $v0, 5		# length of array
	syscall
	move $s4, $v0	
	
	
	
	move $s5, $s4  
	mul $s5, $s5,  4	# space allocation for array
	mflo $s5
	
	move $s6, $s4  
	addi $s6, $s6, -1
	
array:
	li $v0, 5
	syscall
	sw $v0,($8)
	addi $8,$8,4
	
	beq $8,$s5, callMerge
	j array

callMerge:
	la $a0,0 # Array Address
	li $a1,0 #Low value
	move $a2, $s6 # High Value
	jal mergeSort
	add $8,$0,$0
	j finalPrint # call for program to end

finalPrint:
	li $v0,1
	lw $a0,($8)
	syscall

	li $v0,4
	la $a0, space
	syscall

	addi $8,$8,4
	beq $8,$s5, fin
	j finalPrint

fin:
	li $v0, 10
	syscall



mergeSort:
	addi $sp, $sp, -20 #Storing registry values	
	sw $s0, 4($sp)		
	sw $s1, 8($sp)		
	sw $s2, 12($sp)		
	sw $s3, 16($sp)	
	sw $ra, 20($sp)		

	add $s0, $a0, $0		
	add  $s1, $a1, $0		
	add  $s2, $a2, $0	

if:
	blt $s1, $s2, then	# if low < high
	j endIf
then:
	li $t0, 2
	add $s3, $s1, $s2 #mid value
	div $s3, $s3, $t0

	move  $a0, $s0
	move $a1, $s1
	move $a2, $s3
	jal mergeSort

	move $a0, $s0
	addi $a1, $s3, 1
	move $a2, $s2
	jal mergeSort

	move $a0, $s0 #address
	move $a1, $s1 #low
	move $a2, $s3 #mid
	move $a3, $s2 #high
	jal merge

endIf:          # Restore stack values if the merge bounds go outside

	lw $s0, 4($sp)		
	lw $s1, 8($sp)		
	lw $s2, 12($sp)		
	lw $s3, 16($sp)		
	lw $ra, 20($sp)		
	addi $sp, $sp, 20		

	jr $ra 
	
endMergeSort:


	.text
	.globl merge
	
merge:

li	$t6, 4 #increment value


addi $sp, $sp, -96 # slating out space for a temp array


move $t0, $a1   # low value
addi $t1, $a2, 1 #mid value
li $t2, 0        #counter

while:
	ble $t0, $a2, andTest #test to see when low value and mid value collide, does second test
	j endWhile
andTest:
	ble $t1, $a3, whileBody # see if mid and high collide, if so, skip first part
	j	endWhile
whileBody:
	
if2:
	mul $t3, $t0, $t6
	add $t3, $t3, $a0 #low value *4 + address value, to access registers
	lw $t7, 0($t3)

	mul $t4, $t1, $t6
	add $t4, $t4, $a0 #same but with the mid value
	lw $t8, 0($t4)

	blt $t7, $t8, then2  # checks to see if a swap is needed
	j else2
then2:                     #Do a swap
	mul $t5, $t2, $t6  
	add $t5, $t5, $sp
	addi $t5, $t5, 4
	sw $t7, 0($t5)
	
	addi $t0, $t0, 1 # increment
	j endIf2
else2:                       #No swap, stores value back in standard register in array
	mul $t5, $t2, $t6 
	add $t5, $t5, $sp
	addi $t5, $t5, 4
	sw $t8, 0($t5)
	
	addi $t1, $t1, 1 # increment
endIf2:

	addi $t2, $t2, 1 #increment

	j while

.globl endWhile
endWhile:

if3:
	bgt $t0, $a2, then3 # if low vlaue >= mid, skips the upper merge
	j else3
then3:
	
for:
	move  $t0, $t1		#recycle low value, swap for mid
forLoop:
	ble $t0, $a3, forBody   # same as above, but for mid-high, once the mid value reaches high, section ends
	j endFor
forBody:
	mul $t3, $t0, $t6
	add $t3, $t3, $a0
	lw $t7, 0($t3)

	mul $t5, $t2, $t6
	add $t5, $t5, $sp
	addi $t5, $t5, 4
	sw $t7, 0($t5)
	
	addi  $t2, $t2, 1

	addi $t0, $t0, 1
	j forLoop
endFor:
	j endIf3


.globl else3

else3:

for2:
	move $t1, $t0		# t1 takes value of small value
forLoop2:
	ble $t1, $a2, forBody2 # if small is less than mid, proceed, else end
	j endFor2
forBody2:
	mul $t4, $t1, $t6  #check array values and loads in new ones, starting at low value
	add $t4, $t4, $a0
	lw $t8, 0($t4)

	mul $t5, $t2, $t6 #check array values and loads them, starting at incremented value
	add $t5, $t5, $sp
	addi $t5, $t5, 4 #adds to check for next register
	sw $t8, 0($t5)
	
	addi $t2, $t2, 1 # increment

	addi $t1, $t1, 1 #increment
	j forLoop2
endFor2:

endIf3:	

	li $t2, 0
for3:
	move $t1, $a1		# reuse $t1 for m
forLoop3:
	ble $t1, $a3, forBody3
	j endFor3
forBody3:
	mul $t5, $t2, $t6
	add $t5, $t5, $sp
	addi $t5, $t5, 4
	lw $t9, 0($t5)
	
	mul $t4, $t1, $t6
	add $t4, $t4, $a0
	sw $t9, 0($t4)

	addi  $t2, $t2, 1

	addi $t1, $t1, 1
	j forLoop3
endFor3:


addi $sp, $sp, 96 #removes temporary array

jr	$ra

endMerge: