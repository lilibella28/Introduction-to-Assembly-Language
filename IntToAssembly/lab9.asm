
#Lilibeht Aponza Montano
main:
li $v0,0 
li $a0,12
li $a1,7
li $a2,20
li $a3,21 #passing values 

jal myFunction

move $a0,$v0
li $v0,1
syscall 

li $v0,10
syscall 

myFunction:
blt $a0,$a1,imyFunction1
beq $a0,$a1,imyFunction2
bgt $a0,$a1,imyFunction3

j exitFunc

imyFunction1:
move $v0,$a0 #move the value of a 
j exitFunc

imyFunction2:
move $v0,$a1 #move the value of b
j exitFunc

imyFunction3:
add $v0,$a2,$a3 # add c  and  d
j myFunctionexit



myFunctionexit:
jr $ra
