#######################################################################################################
#
#  This program takes an array of integers and prints a triangle pattern
#  that is composed of the array element values
#
#  The program uses a nested loop structure that is the assembly lanugage
#  equivalent of this high level language pseudocode:
#            int array = {17, 2, 13, 5, 23};
#            int Sz = 5;  // the Sz variable holds the value that represent how many elements array has 
#            for (i = 0; i < Sz; i++) {  // outer loop
#                for (j = i; j < Sz; j++) { // inner loop
#                     print(array[j]);
#                 } // end inner loop
#                print(newline character)
#            } // end inner loop
#
#   The output of printing the array elements with this nested loop structure looks like this:
#
#             17 2 13 5 23 
#             17 2 13 5 
#             17 2 13 
#             17 2 
#             17 
#
#######################################################################################################

#SETUP
.data
msg1:  .asciiz "\n"
msg2:  .asciiz " "
array: .word 17, 2, 13, 5, 23
Sz:    .word 5

.text
#t1 = i
#s1 = j
#t9 = array[j]

lw $t2, Sz            #outer loop counter ending value and inner loop counter ending value

add $t1, $zero, $zero #outer loop counter starting value:  i = 0
la $t7 array          #t7 is a pointer to the first element of array


outer: bgt $t1,$t2,exit1  #perform the outer loop until the loop counter is greater than the loop counter ending value
       
       add $t8, $t7, $zero #t8 is initialized to be a pointer to the first element of array 
  
       add $s1, $t1, $zero #initialize the inner loop counter starting value:  j = 0
       
       inner:  beq $s1,$t2,exit2  # perform the inner loop until the loop counter is greater than the loop counter ending value
       
        # load $t9 with the value of the element $t8 points to in array 
        lw $t9 0($t8)
 
        #print the value of the element $t8 points to (that value is now inside $t9):  print(array[j])
        li $v0,1
        move $a0,$t9
        syscall
        
        # print a space character between each value
        li $v0,4
        la $a0,msg2
        syscall

        addi $t8, $t8, 4  # move the $t8 pointer to point to the next element of array (move by an offset of 4 bytes from where it was pointing) 

        addi $s1,$s1,1    # increment the inner loop couter by 1: j++
        j inner

        # print a newline character after the inner loop ends 
        exit2:
        li $v0,4
        la $a0,msg1
        syscall

        addi $t1,$t1,1    # increment the outer loop counter by 1:  i++
        j outer
        
# end the program
exit1:
li $v0,10
syscall
