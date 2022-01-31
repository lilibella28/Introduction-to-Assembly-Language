
.data 

threeints:  .word 11, 999, -65536 
    #Lilibeht Aponza
    prompt: .ascii "Testing purporse"
    
.text 
main:

la $t0, threeints #loading the array
add $t0,  $t0, 12 #4bytes*3ints
la $a0, threeints   #setting base

lw $t2, 0($a0) #Setting firs elemetes of the array. 
lw $t3, 8($a0)
slt $t5, $t3, $t2 # if t3 < t2 set t5 equal 1
beq $t5, $0, swap
sw $t2, 8($a0)
sw $t3, 8($a0)
swap:

lw $t2, 4($a0) #Setting firs elemetes of the array. 
lw $t3, 8($a0)
slt $t5, $t3, $t2 # if t3 < t2 set the the five element in array  equal 1
beq $t5, $0, Swap
sw $t2, 8($a0)
sw $t3, 4($a0)
Swap:

li $v0, 4
la $a0, prompt



