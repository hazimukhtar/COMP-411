#---------------------------------
# Lab 5: Pixel Conversion
#
# Name: <Hazim Asif Mukhtar>
#
# --------------------------------
# Below is the expected output.
# 
# Converting pixels to grayscale:
# 0
# 1
# 2
# 34
# 5
# 67
# 89
# Finished.
# -- program is finished running --
#---------------------------------

.data 0x0
	startString:	.asciiz	"Converting pixels to grayscale:\n"
	finishString:	.asciiz	"Finished."
	newline:	.asciiz	"\n"
	pixels:		.word 	0x00010000,	0x010101,	0x6,		0x3333, 
				0x030c,		0x700853,	0x294999,	-1

.text 0x3000

main:
	ori $v0, $0, 4				#System call code 4 for printing a string
	ori $a0, $0, 0x0   	 		#address of startString is in $a0
	syscall						#print the string


#------- INSERT YOUR CODE HERE -------
#t1 = rgb
#t2 = blue
#t3 = green
#t4 = red	
#t5 = gray
#t6 scrap movement right
#t7 scrap movemtn right 2
	
	addi 	$t0, $0, 0  #the location of the pixel array(start)
loop:	
	lw 	$t1, pixels($t0)  #load the contens of t0 into location t1
	beq	$t1, -1, exit
	andi 	$t2, $t1, 0xff  
	srl	$t6, $t1, 8
	andi	$t3, $t6, 0xff
	srl	$t7, $t1, 16
	andi	$t4, $t7, 0xff
	add	$t5, $t2, $t3
	add	$t5, $t5, $t4
	div	$t5, $t5, 3
	mflo	$t5
	addi	$t0, $t0, 4
	ori 	$v0, $0,  1
	ori	$a0, $t5, 0
	syscall
	ori 	$v0, $0, 4				#System call code 4 for printing a string
	la 	$a0, newline
	syscall 
	j	loop
	



#
#------------ END CODE ---------------

	
exit:

	ori $v0, $0, 4				# System call code 4 for printing a string
	ori $a0, $0, 33  			# address of finishString is in $a0; we computed this
								# simply by counting the number of chars in startString,
								# including the \n and the terminating \0

	syscall						#print the string

	ori $v0, $0, 10				#System call code 10 for exit
	syscall						#exit the program
