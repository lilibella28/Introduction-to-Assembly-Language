.data

fibs: .word 0, 1, 1, 2, 3, 5, 8, 13, 21, 35, 55, 89, 144  # an array of integers --
                                                          # each integer is a word in length, 
                                                          # so each array element is 4 bytes away 
                                                          # from each other

.text
la $t1, fibs     # put the memory address of 
                 # fibs[0] array
                 # into the register $t1
             

lw $t0, 0($t1)   # put the value at the memory address of
                 # fibs[0] array, which is 0 bytes away from
                 # the address that the label fibs aliases
                 # into the register 
                 
lw $t0, 4($t1)   # put the value at the memory address of
                 # fibs[1] array, which is 4 bytes away from
                 # the address that the label fibs aliases
                 # into the register 