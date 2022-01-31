.text
main:    #$a0, $a1, $a2, and $a3 registers are loaded with intefgers we need to add
    li $a0,10
    li $a1,15
    li $a2,20
    li $a3,11

    jal add4     # call function add4
    
    move $s1,$v0   # the value in $v0 should be stored in register $s1.
    
    li $v0,1    #print result
    move $a0,$s1
    syscall
    
    li $v0,10 #exit
    syscall

add4:
    addi $sp,$sp,-8     # Moving Stack pointer
    sw $t0, 0($sp)      # save $t0-$t1 in procedure stack
    sw $t1, 4($sp)      

    add $t0,$a0,$a1     # calculate $a0+$a1 and store it in $t0
    add $t1,$a2,$a3     # calculate $a2+$a3 and store it in $t1
    add $v0,$t0,$t1     # calulate $a0+$a1+$a2+$a3 and store it in $v0

    lw $t1, 4($sp)      # Load previous value
    lw $t0, 0($sp)      # Load previous value
    addi $sp,$sp,8     # Moving Stack pointer 
    
    jr $ra              # return to main
      
