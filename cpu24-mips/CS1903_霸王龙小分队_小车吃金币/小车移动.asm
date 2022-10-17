.text
j main_function


#开始游戏
game_start:
bne $s2, $0, not_first #多次点击开始没用
addi $s2, $0, 1

not_first:
eret


#小车下移
interrupt_down:

#开始才能动
beq $s2, $0, not_start1

#走到边界
beq $s1, 116, border

sw $0, 0($s1)       #清空当前行
addi $s1, $s1, 4    #小车行数加一
sw $s0, 0($s1)      #数据存入新行
addi $v0, $0, 34    
syscall

not_start1:
eret


#小车上移
interrupt_up:

#开始才能动
beq $s2, $0, not_start2

#走到边界
beq $s1, 8, border

sw $0, 0($s1)
addi $t1, $0, 4     
sub $s1, $s1, $t1
sw $s0, 0($s1) 
addi $v0, $0, 34  
syscall

not_start2:
eret

#边界，发出警告
border: 
addi $v0, $0, 100 
syscall
eret


main_function:

addi $s0, $0, 0x8000  
sll  $s0, $s0, 16     #初始X坐标
addi $s1, $0, 64      #初始Y坐标

#道路布局
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
