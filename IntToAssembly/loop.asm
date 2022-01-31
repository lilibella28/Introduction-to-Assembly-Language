.data
        
       tenints: .word 11, 999, -65536, 12, 21, 6, 42, 1000, -1, 7
 
.text


main:


       la $t1,tenints # store array
      li $t2,10 # size of array
      move $t3,$zero # loop counter
      li $s1,42 #store  the value 42
       
loop_start: 
      slt $s0,$t3,$t2
      beq $zero,$s0,end_loop
      lw $a0,($t1)
      move $s2,$a0 # move array value to s2
      addi $t3,$t3,1 # increment  the loop counter
      addiu  $t1,$t1,4 # increments the array pointer b
      beq $s2,$s1,B # if to check 42  inthe array
      li $t0,0 
      j loop_start #and loop to next value
      B: li $t0,1
         move $s3,$t0 
             j loop_start
end_loop:
    
    syscall
  #LILIBEHT  APONZA MONTANO
         
#PLEASE PROFESSOR  CAN YOU PROVIDE A BETTER ANSNWER FOR IT, i AM STILL VERY CONFUSED  ABOUT LOOP IN MIPS. THANK YOU
