.data
#set the size and content of array
Sz: .word 23
# array
Array: .word 29, 106, 18, 2, 55, 21, 17, 13, 9999, 1024, 13, 2, 5, 23, 51, 2021, 111, 89, 89, 91, 861, 1234, 5004
# newline character
spacecharacter: .asciiz

li $t7, 2       #outer ending value
li $t6, 5       #inner ending value
li $s0, 0        #outer starting value
la $s5, Array     #pointer to first element in the array

outer: bgt $s0, $t7, exit1 # perfomming the outer loop 
       add $s4, $s5, $zero  #initilized s4 to be pointerr to the 1sh array element
       add $s3, $s0, $zero #initialized the inner loop 
       li $s6, 0
       
       inner: beq $s3, $tt6, exit2 #run the inner loop until the loop  counter is > than the ending value
              lw $a0 0($s4) #load
              add $s6, $s6, $a0 #calculating the sums 
             
              addi $s4, $s4, 4 #move the piointer s4 to point the next element in the array
              addi $s3, $s3, 1 #increast the inner loop by1. 
              j inner
              
              exit2:
              
              add $t9, $t9, $s6
              addi $s0, $s0, 1 #increase the outer by 1
              j outer
              
       #end         
       exit1:
       add $t8, $t8, $s6
       
       li $v0, 10
       syscall 
 
      
