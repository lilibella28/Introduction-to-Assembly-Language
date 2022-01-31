# source:  http://davidlovesprogramming.blogspot.com/2013/09/functions-in-mips.html
#
# This program adds two integers together using 
# integer values placed in the $s0 and $s1 registers
#
# a function named addFiveNumber uses the stack
# by having the values in $s0 and $s1 pushed on it
# in main, and then 
# has the values popped off it within addFiveNumber

      
main:  
         # These are 2 parameters for our function  
        li $s0, 2  
        li $s1, 3  
        
        addi $sp, $sp, -8        # make room on the stack for 2 words by decreasing the address of $sp by 8 
                                 # 2 Words are 2 * 4 bytes  
        sw $s0, 4($sp)           # push a word from $s0 onto the stack
        sw $s1, 0($sp)           # push a word from $s1 onto the stack
        
        jal addFiveNumbers  
        
        # We don't need the parameters on the stack anymore, so place the stack pointer back to the 
        # state it was in by increasing the address of $sp by 8 -- 2 words are 2 * 4 bytes
        addi $sp, $sp, 8  
        
        # Now exit the program
        li $v0, 10
        syscall  
        
        # We could use $s0 adn $s1 directly, but from a conventional point of view that's not encouraged  
        # This system is also more flexible, because the callee can use every registers he wants, and is not  
        # forced to use the exact registers the caller function rely on.        
      addFiveNumbers:  
        # Load the parameters  
        
        # From a conventional point of view the registers $t0-$t9 are 'temporary', so I can use them  
        # without any restrictions. Almost every other registers including $s0-$s7, are "preserved on call"  
        # which means that if you use them is a function you should restore them with their original  
        # values right before exiting the function.  
        lw $t0, 0($sp)  # pop a word from the stack -- the most recent word is popped first
        lw $t1, 4($sp)  # pop a word from the stack -- the first word is popped last 
       
        
        add $v0, $t0, $t1      
        add $v0, $v0, $t2  
        jr $ra  
