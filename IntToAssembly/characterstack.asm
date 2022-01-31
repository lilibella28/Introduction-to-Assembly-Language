.macro push(%reg)
addi $sp,$sp,-4 #move stack pointer and save data to stack
sw %reg,($sp)
.end_macro


.macro pop(%reg)
lw %reg,($sp)
subi $sp,$sp,-4 #move stack pointer and save data to stack
.end_macro

.macro print(%reg)
move $a0,%reg
li $v0,11
syscall  #print character
.end_macro

li $a0,'H'
li $a1,'E'
li $a2,'L'
li $a3,'L'
li $s0,'O' #using s0 for fifth parameter
jal reverse5
li $v0,10
syscall  #return

reverse5:
print($a0) #print character then print
push($a0)

print($a1) #print character then print
push($a1)

print($a2) #print character then print
push($a2)

print($a3) #print character then print
push($a3)

print($s0) #print character then print
push($s0)

li $a0,'\n'
print($a0) #print new line

pop($a0) #pop value into $a0
print($a0)

pop($a0) #pop value into $a0
print($a0)

pop($a0) #pop value into $a0
print($a0)

pop($a0) #pop value into $a0
print($a0)

pop($s0) #pop value into $a0
print($s0)
 
