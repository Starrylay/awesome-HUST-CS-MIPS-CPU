#�˷� ����ָ�����   revise date:2015/12/16
#�˷�ʱ��ʾ����������ʾ  0x00000001  0x00000010 0x00000100 0x00001000 0x00010000 0x00100000 0x01000000 0x10000000 0x00000000 
.text
##########�˷�����##################
addi $s1,$0,1
addi $s2,$0,16
add    $a0,$0,$s1      
addi   $v0,$0,34         # display hex
syscall                 # we are out of here. 

mul_loop:     
mult $s1,$s2   
mfhi $t1
mflo $s1
add    $a0,$0,$s1      
addi   $v0,$0,34         # display hex
syscall                 # we are out of here.  
beq $t1, $zero, mul_loop
###########��������#################
#����ʱ��ʾ����������ʾ 0x80000000 0x08000000 0x00800000 0x00080000 0x00008000 0x00000800 0x00000080 0x00000008
addi $s1,$0,1
addi $s2,$0,16
sll $s1,$s1,31
div_loop:
add    $a0,$0,$s1      
addi   $v0,$0,34         # display hex
syscall                 # we are out of here.  
divu $s1,$s2
mfhi $t1
mflo $s1
bne $s1, $zero, div_loop
######################################
addi   $v0,$zero,10         # system call for exit
syscall                  # we are out of here.   
