main:
li $v0,0 #set result=0
li $a0,12
li $a1,7
li $a2,20
li $a3,21 #pass values 12,7,20,21

jal f

move $a0,$v0
li $v0,1
syscall #print return value

li $v0,10
syscall #terminate

f:
blt $a0,$a1,if1
beq $a0,$a1,if2
bgt $a0,$a1,if3

j exitFunc

if1:
move $v0,$a0 #get a
j exitFunc

if2:
move $v0,$a1 #get b
j exitFunc

if3:
add $v0,$a2,$a3 #get c+d
j exitFunc



exitFunc:
jr $ra #return to caller
