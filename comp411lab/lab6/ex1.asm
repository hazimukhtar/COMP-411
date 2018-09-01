.data 0x0
        buffer: .space 20
        P2: .asciiz "P2\n"
        P3: .asciiz "P3"
        end_char: .asciiz " "
        newline: .asciiz "\n"
        width: .word 0
        height: .word 0
        PPM_max: .word 0
        r: .word 0
        g: .word 0
        b: .word 0
        
.text 0x3000

main:

	 li $v0,8 
         	la $a0, buffer 
         	li $a1, 20 
         	move $t0, $a0 
         	syscall        

        
        li $v0, 5 
        syscall
        sw $v0, width
        
        li $v0, 5 
        syscall
        sw $v0, height
        
        li $v0, 5    
        syscall
        sw $v0, PPM_max
	
	li $v0, 4
	la $a0, P2
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	        
        lw $t7, width    
        li $v0, 1
        move $a0, $t7
	syscall
        
	li $v0, 4
	la $a0, newline
	syscall
	
	lw $t8, height  
	li $v0, 1
	move $a0, $t8
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
		
	li $t9, 255   
	li $v0, 1
	move $a0, $t9
	syscall
	
        lw $t1, width  
        lw $t2, height
        mult $t1, $t2
        mflo $t1
        
        addi $t2, $zero, 0  
for:
        bge $t2, $t1, exit 
        
        li $v0, 5   
        syscall
        sw $v0, r
        
        li $v0, 5  
        syscall
        sw $v0, g
        
        li $v0, 5   
        syscall
        sw $v0, b
        
        lw $t6, r   
	lw $t7, g  
        lw $t8, b   
        
        li $t9, 30  
        li $s1, 59
        li $s2, 11

        mult $t6, $t9  
        mflo $t6   
        mult $t7 $s1
        mflo $t7
        mult $t8, $s2
        mflo $t8
        
        li $t9, 100  
        li $s1, 255
        
        add $t6, $t6, $t7       
        add $t6, $t6, $t8
        
        mult $t6, $s1  
	mflo $t6
        
        lw $s1, PPM_max    
        mult $t9, $s1  
        mflo $t7
        
        div $t6, $t7 
        mflo $t6
        
        li $v0, 4  
        la $a0, newline
        syscall
        
        li $v0, 1   
        move $a0, $t6
        syscall
        
        addi $t2, $t2, 1 
        b for
exit:
                             

        ori $v0, $0, 10                 
        syscall


