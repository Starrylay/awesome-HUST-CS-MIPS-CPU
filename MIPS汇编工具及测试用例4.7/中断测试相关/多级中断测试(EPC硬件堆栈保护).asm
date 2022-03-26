.text

addi $sp, $zero, 2000

#############################################################
#����Ʋ���,����addi,andi,sll,srl,sra,or,ori,nor,syscall  LED������Ʒ�ʽ������ʾ����
#############################################################

.text
START:

addi $s0,$zero,1 
sll $s3, $s0, 31      # $s3=0x80000000
sra $s3, $s3, 31      # $s3=0xFFFFFFFF   
addu $s0,$zero,$zero   # $s0=0         
addi $s2,$zero,12 

addiu $s6,$0,8  #����Ƽ���
zmd_loop:

addiu $s0, $s0, 1    #������һ������Ƶ���ֵ
andi $s0, $s0, 15  

#######################################
addi $t0,$0,8    
addi $t1,$0,1
left:

sll $s3, $s3, 4   #���������
or $s3, $s3, $s0

add    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

sub $t0,$t0,$t1
bne $t0,$0,left
#######################################

addi $s0, $s0, 1   #������һ������Ƶ���ֵ
addi $t8,$0,15
and $s0, $s0, $t8
sll $s0, $s0, 28     

addi $t0,$0,8
addi $t1,$0,1

zmd_right:

srl $s3, $s3, 4  #���������
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
#  ʹ��?s6? s5?s4?s3?s0?a0?a7
###########################################################
sw $v0, 0($sp)     #�����ֳ�
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

#################  ���ж�
mfc0 $zero,$zero
#################  �жϷ���

addi $s6,$zero,1       #�������ʾ���֣� ��ͬ�жϺ���ʾ��ͬ��ֵ���ֱ�����Ϊ1,2,3
addi $s4,$zero,3       #ѭ��������ʼֵ   
addi $s5,$zero,1       #�������ۼ�ֵ

IntLoop1:
add $s0,$zero,$s6   

IntLeftShift1:       


sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall              

bne $s0, $zero, IntLeftShift1
sub $s4,$s4,$s5       #ѭ�������ݼ�
bne $s4, $zero, IntLoop1


################# ���ж�
mtc0 $zero,$zero
################# �ָ��ֳ�

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

################  �жϷ���
eret         #ͬ�����жϣ�epc-->pc

InteruptProgram2:
###########################################################
#  exceptoin 2
#  ʹ��?s6? s5?s4?s3?s0?a0?a7
###########################################################

sw $v0, 0($sp)     #�����ֳ�
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

#################  ���ж�
mfc0 $zero,$zero
#################  �жϷ���

addi $s6,$zero,3       #�������ʾ���֣� ��ͬ�жϺ���ʾ��ͬ��ֵ���ֱ�����Ϊ1,2,3
addi $s4,$zero,3       #ѭ��������ʼֵ   
addi $s5,$zero,1       #�������ۼ�ֵ

IntLoop1:
add $s0,$zero,$s6   

IntLeftShift1:       


sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall              

bne $s0, $zero, IntLeftShift1
sub $s4,$s4,$s5       #ѭ�������ݼ�
bne $s4, $zero, IntLoop1


################# ���ж�
mtc0 $zero,$zero
################# �ָ��ֳ�

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

################  �жϷ���
eret         #ͬ�����жϣ�epc-->pc

InteruptProgram3:
###########################################################
#  exceptoin 3
#  ʹ��?s6? s5?s4?s3?s0?a0?a7
###########################################################

sw $v0, 0($sp)     #�����ֳ�
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

#################  ���ж�
mfc0 $zero,$zero
#################  �жϷ���

addi $s6,$zero,3       #�������ʾ���֣� ��ͬ�жϺ���ʾ��ͬ��ֵ���ֱ�����Ϊ1,2,3
addi $s4,$zero,3       #ѭ��������ʼֵ   
addi $s5,$zero,1       #�������ۼ�ֵ

IntLoop1:
add $s0,$zero,$s6   

IntLeftShift1:       


sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall              

bne $s0, $zero, IntLeftShift1
sub $s4,$s4,$s5       #ѭ�������ݼ�
bne $s4, $zero, IntLoop1


################# ���ж�
mtc0 $zero,$zero
################# �ָ��ֳ�

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

################  �жϷ���
eret         #ͬ�����жϣ�epc-->pc