#lilibeth Aponza Montano 
      
.text
main:    
    li $a0,10
    li $a1,15
    li $a2,20
    li $a3,11

    jal add4     # call function 
    
    move $s1,$v0   
    
    li $v0,1   
    move $a0,$s1
    syscall
    
    li $v0,10 #exit
    syscall

add4:
    addi $sp,$sp,-8     #moved stack 
    sw $t0, 0($sp)      # save stack
    sw $t1, 4($sp)      

    add $t0,$a0,$a1     # add the number and store in t0
    add $t1,$a2,$a3     # add the number and store in t1
    add $v0,$t0,$t1    

    lw $t1, 4($sp)      # Load\\s value
    lw $t0, 0($sp) 
    addi $sp,$sp,8     #\moved Stack pointer 
    
    jr $ra        #back to main
