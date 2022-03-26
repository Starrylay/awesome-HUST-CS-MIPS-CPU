.text
addi $sp, $zero, 2000

#############################################################
#走马灯测试,测试addi,andi,sll,srl,sra,or,ori,nor,syscall  LED按走马灯方式来回显示数据
#############################################################

.text
START:

addi $s0,$zero,1 
sll $s3, $s0, 31      # $s3=0x80000000
sra $s3, $s3, 31      # $s3=0xFFFFFFFF   
addu $s0,$zero,$zero   # $s0=0         
addi $s2,$zero,12 

addiu $s6,$0,8  #走马灯计数
zmd_loop:

addiu $s0, $s0, 1    #计算下一个走马灯的数值
andi $s0, $s0, 15  

#######################################
addi $t0,$0,8    
addi $t1,$0,1
left:

sll $s3, $s3, 4   #走马灯左移
or $s3, $s3, $s0

add    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

sub $t0,$t0,$t1
bne $t0,$0,left
#######################################

addi $s0, $s0, 1   #计算下一个走马灯的数值
addi $t8,$0,15
and $s0, $s0, $t8
sll $s0, $s0, 28     

addi $t0,$0,8
addi $t1,$0,1

zmd_right:

srl $s3, $s3, 4  #走马灯右移
or $s3, $s3, $s0

addu    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

sub $t0,$t0,$t1
bne $t0,$0,zmd_right
srl $s0, $s0, 28  
#######################################

sub $s6,$s6,$t1
beq $s6,$0, exit
j zmd_loop

exit:

add $t0,$0,$0
nor $t0,$t0,$t0      #test nor  ori
sll $t0,$t0,16
ori $t0,$t0,0xffff

addu   $a0,$0,$t0       # display $t0
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

j START   # loop forever

 
InteruptProgram1:
###########################################################
#  exceptoin 1
#  使用?s6? s5?s4?s3?s0?a0?a7
###########################################################
sw $v0, 0($sp)          #保护现场
addi $sp, $sp, 4
addi $sp, $sp, 4
sw $a0, 0($sp)
addi $sp, $sp, 4
sw $s0, 0($sp)
addi $sp, $sp, 4
sw $s3, 0($sp)
addi $sp, $sp, 4
sw $s4, 0($sp)
addi $sp, $sp, 4
sw $s5, 0($sp)
addi $sp, $sp, 4
sw $s6, 0($sp)
addi $sp, $sp, 4

mfc0 $s6, $14     #访问epc寄存器压栈
sw $s6, 0($sp)
addi $sp, $sp, 4

#################  开中断
mtc0 $zero, $12

#################  中断服务

addi $s6,$zero,1       #走马灯演示数字， 不同中断号显示不同数值，分别设置为1,2,3
addi $s4,$zero,3       #循环次数初始值   
addi $s5,$zero,1       #计数器累加值

IntLoop1:
add $s0,$zero,$s6   

IntLeftShift1:       

sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall                 # we are out of here.   

bne $s0, $zero, IntLeftShift1
sub $s4,$s4,$s5      #循环次数递减
bne $s4, $zero, IntLoop1


################# 关中断
addi $s6, $zero, 1
mtc0 $s6, $12

################# 恢复现场
addi $sp, $sp, -4
lw $s6, 0($sp)
mtc0 $s6, $14       #epc出栈

addi $sp, $sp, -4
lw $s6, 0($sp)
addi $sp, $sp, -4
lw $s5, 0($sp)
addi $sp, $sp, -4
lw $s4, 0($sp)
addi $sp, $sp, -4
lw $s3, 0($sp)
addi $sp, $sp, -4
lw $s0, 0($sp)
addi $sp, $sp, -4
lw $a0, 0($sp)
addi $sp, $sp, -4
lw $v0, 0($sp)

################  中断返回
eret         #同步开中断，epc-->pc

InteruptProgram2:
###########################################################
#  exceptoin 2
#  使用?s6? s5?s4?s3?s0?a0?a7
###########################################################

sw $v0, 0($sp)          #保护现场
addi $sp, $sp, 4
addi $sp, $sp, 4
sw $a0, 0($sp)
addi $sp, $sp, 4
sw $s0, 0($sp)
addi $sp, $sp, 4
sw $s3, 0($sp)
addi $sp, $sp, 4
sw $s4, 0($sp)
addi $sp, $sp, 4
sw $s5, 0($sp)
addi $sp, $sp, 4
sw $s6, 0($sp)
addi $sp, $sp, 4

mfc0 $s6, $14     #访问epc寄存器压栈
sw $s6, 0($sp)
addi $sp, $sp, 4

#################  开中断
mtc0 $zero, $12
#################  中断服务


addi $s6,$zero,2       #走马灯演示数字， 不同中断号显示不同数值，分别设置为1,2,3
addi $s4,$zero,3       #循环次数初始值   
addi $s5,$zero,1       #计数器累加值

IntLoop2:
add $s0,$zero,$s6   

IntLeftShift2:       


sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall                 # we are out of here.   

bne $s0, $zero, IntLeftShift2
sub $s4,$s4,$s5      #循环次数递减
bne $s4, $zero, IntLoop2


################# 关中断
addi $s6, $zero, 1
mtc0 $s6, $12

################# 恢复现场
addi $sp, $sp, -4
lw $s6, 0($sp)
mtc0 $s6, $14       #epc出栈

addi $sp, $sp, -4
lw $s6, 0($sp)
addi $sp, $sp, -4
lw $s5, 0($sp)
addi $sp, $sp, -4
lw $s4, 0($sp)
addi $sp, $sp, -4
lw $s3, 0($sp)
addi $sp, $sp, -4
lw $s0, 0($sp)
addi $sp, $sp, -4
lw $a0, 0($sp)
addi $sp, $sp, -4
lw $v0, 0($sp)

################  中断返回
eret         #同步开中断，epc-->pc

InteruptProgram3:
###########################################################
#  exceptoin 3
#  使用?s6? s5?s4?s3?s0?a0?a7
###########################################################

sw $v0, 0($sp)          #保护现场
addi $sp, $sp, 4
addi $sp, $sp, 4
sw $a0, 0($sp)
addi $sp, $sp, 4
sw $s0, 0($sp)
addi $sp, $sp, 4
sw $s3, 0($sp)
addi $sp, $sp, 4
sw $s4, 0($sp)
addi $sp, $sp, 4
sw $s5, 0($sp)
addi $sp, $sp, 4
sw $s6, 0($sp)
addi $sp, $sp, 4

mfc0 $s6, $14     #访问epc寄存器压栈
sw $s6, 0($sp)
addi $sp, $sp, 4

#################  开中断
mtc0 $zero, $12
#################  中断服务

addi $s6,$zero,3       #走马灯演示数字， 不同中断号显示不同数值，分别设置为1,2,3
addi $s4,$zero,3       #循环次数初始值   
addi $s5,$zero,1       #计数器累加值

IntLoop:
add $s0,$zero,$s6   

IntLeftShift:       

sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall                 # we are out of here.   

bne $s0, $zero, IntLeftShift
sub $s4,$s4,$s5      #循环次数递减
bne $s4, $zero, IntLoop

################# 关中断
addi $s6, $zero, 1
mtc0 $s6, $12

################# 恢复现场
addi $sp, $sp, -4
lw $s6, 0($sp)
mtc0 $s6, $14       #epc出栈

addi $sp, $sp, -4
lw $s6, 0($sp)
addi $sp, $sp, -4
lw $s5, 0($sp)
addi $sp, $sp, -4
lw $s4, 0($sp)
addi $sp, $sp, -4
lw $s3, 0($sp)
addi $sp, $sp, -4
lw $s0, 0($sp)
addi $sp, $sp, -4
lw $a0, 0($sp)
addi $sp, $sp, -4
lw $v0, 0($sp)

################  中断返回
eret         #同步开中断，epc-->pc

