.data

fibs: .word 0, 1, 1, 2, 3, 5, 8, 13, 21, 35, 55, 89, 144  # an array of integers --
                                                          # each integer is a word in length, 
                                                          # so each array element is 4 bytes away 
                                                          # from each other

.text

li $t1, 0         # put 0 into register $t1 to indicate 
                  # the element number of fibs[0] 
                  # that is, the very first element in the fibs array
                  
lw $t0, fibs($t1) # using base addressing mode with the label fibs 
                  # get the value at fibs[0] 
                  # and load that value into register $t0
                  
addi $t1, $t1, 4  # increase $t1 by 4 to represent $t1 indicating
                  # the element number of fibs[1]
                  # that is, the second element in the fibs array
                  
lw $t0, fibs($t1) # using base addressing mode with the label fibs 
                  # get the value at fibs[1] 
                  # and load that value into register $t0
