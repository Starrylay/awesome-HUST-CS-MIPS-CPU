.text
j main_function


#��ʼ��Ϸ
game_start:
bne $s2, $0, not_first #��ε����ʼû��
addi $s2, $0, 1

not_first:
eret


#С������
interrupt_down:

#��ʼ���ܶ�
beq $s2, $0, not_start1

#�ߵ��߽�
beq $s1, 116, border

sw $0, 0($s1)       #��յ�ǰ��
addi $s1, $s1, 4    #С��������һ
sw $s0, 0($s1)      #���ݴ�������
addi $v0, $0, 34    
syscall

not_start1:
eret


#С������
interrupt_up:

#��ʼ���ܶ�
beq $s2, $0, not_start2

#�ߵ��߽�
beq $s1, 8, border

sw $0, 0($s1)
addi $t1, $0, 4     
sub $s1, $s1, $t1
sw $s0, 0($s1) 
addi $v0, $0, 34  
syscall

not_start2:
eret

#�߽磬��������
border: 
addi $v0, $0, 100 
syscall
eret


main_function:

addi $s0, $0, 0x8000  
sll  $s0, $s0, 16     #��ʼX����
addi $s1, $0, 64      #��ʼY����

#��·����
addi $t8, $0, 0xffff
sll $t8, $t8, 16
ori $t8, $t8, 0xffff
sw $t8, 0($0)

sw $t8, 4($0)

sw $t8, 120($0)

sw $t8, 124($0)

addi $t8, $0, 0x0
sw $t8, 8($0)

sw $t8, 12($0)

sw $t8, 16($0)

sw $t8, 20($0)

sw $t8, 24($0)

sw $t8, 28($0)

sw $t8, 32($0)

sw $t8, 36($0)

sw $t8, 40($0)

sw $t8, 44($0)

sw $t8, 48($0)

sw $t8, 52($0)

sw $t8, 56($0)

sw $t8, 60($0)

sw $t8, 68($0)

sw $t8, 72($0)

sw $t8, 76($0)

sw $t8, 80($0)

sw $t8, 84($0)

sw $t8, 88($0)

sw $t8, 92($0)

sw $t8, 96($0)

sw $t8, 100($0)

sw $t8, 104($0)

sw $t8, 108($0)

sw $t8, 112($0)

sw $t8, 116($0)

addi $t8, $0, 0x8000
sll $t8, $t8, 16
sw $t8, 64($0)

addi   $v0,$0,34
syscall

nop_cycle:
nop
nop
nop
nop
nop
j nop_cycle
