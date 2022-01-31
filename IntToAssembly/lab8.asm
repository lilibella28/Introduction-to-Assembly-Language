
#Lilibeth APonza Montano
#cs270

.macro push(%reg)
addi $sp,$sp,-4 #moving the stack to save it
sw %reg,($sp)
.end_macro


.macro pop(%reg)
lw %reg,($sp)
subi $sp,$sp,-4 #moving the stack to save it

.macro print(%reg)
move $a0,%reg
li $v0,11
syscall  #print
.end_macro

li $a0,'H'
li $a1,'E'
li $a2,'L'
li $a3,'L'
li $s0,'O' 
jal reverse5
li $v0,10
syscall  

reverse5:
#Print and push char 
print($a0) 
push($a0)

print($a1) 
push($a1)

print($a2) 
push($a2)

print($a3) 
push($a3)

print($s0)t
push($s0)

li $a0,'\n'
print($a0) #Break line for the new string

pop($a0) #pop and print char
print($a0)

pop($a0) 
print($a0)

pop($a0)
print($a0)

pop($a0) 
print($a0)

pop($s0) 
print($s0)
 
