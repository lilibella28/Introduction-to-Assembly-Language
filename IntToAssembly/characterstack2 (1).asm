# Reverse and output 4 characters 
#
# $a0 -- the first parameter to the function reversechars;  contains the first of the 4 characters to be reversed
# $a1 -- the second parameter to the function reversechars;  contains the second of the 4 characters to be reversed
# $a2 -- the third parameter to the function reversechars;  contains the third of the 4 characters to be reversed
# $a3 -- the forth parameter to the function reversechars;  contains the forth of the 4 characters to be reversed
#
#  Note that since MIPS only has 4 registers for function parameter passing, 
#  this program will *not* work if we try to use more than 4 characters
#
# $a0 --- character printed
# $s0 --- character that indicates the first of the 4 characters to be revesred

.data
char0:    .ascii  "A"       
char1:    .ascii  "B"  
char2:    .ascii  "C"
char3:    .ascii  "D"

.text
main:          
        lbu     $a0, char0  # place the the first of the 4 characters to be reversed 
                            # into the reversechars function's first parameter
                            
        lbu     $a1, char1  # place the the second of the 4 characters to be reversed 
                            # into the reversechars function's second parameter
                            
        lbu     $a2, char2  # place the the third of the 4 characters to be reversed 
                            # into the reversechars function's third parameter
        
        lbu     $a3, char3  # place the the forth of the 4 characters to be reversed 
                            # into the reversechars function's forth parameter
        
       
        add     $s0, $zero, $a0 # store fhrt first of the 4 characters in a register that
                                # is preserved across functions calling
        
        jal     reversechars    # call the reversechars function

done:   
        li      $v0,10         # exit
        syscall           
                
reversechars:             
# push each character onto the stack
        sw      $a0,($sp)      # place the first cbaracter in the first function parameter register on to the stack
        sub     $sp,$sp,4      # push using the stack pointer
        sw      $a1,($sp)      # place the second cbaracter in the second function parameter register on to the stack
        sub     $sp,$sp,4      # push using the stack pointer
        sw      $a2,($sp)      # place the third cbaracter in the third function parameter register on to the stack 
        sub     $sp,$sp,4      # push using the stack pointer
        sw      $a3,($sp)      # place the fourth cbaracter in the second function parameter register on to the stack
        sub     $sp,$sp,4      # push using the stack pointer
                
        
# pop chars from stack back into the buffer
loop:   
        addu    $sp,$sp,4      # pop using the stack pointer
        
        lw      $a0,($sp)      # print a char at the top of the stack -- to print a character in MIPS the $a0 register 
                               # must contain the character to be printed
        li      $v0,11         # service code for printing a character           
        syscall                # prints the character in $a0 when $v0 equals 11
       
        add     $t0, $zero, $a0    # place the character printed into $t0
        
        beq     $s0, $t0, return   # if $t0 is equal to the first of the 4 characters, 
                                   # then all the other characters must have been printed
                                   # so branch to thend the function
        
        j       loop           # loop back to print another character

return: jr $ra
syscall 