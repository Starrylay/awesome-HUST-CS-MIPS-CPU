.text
j main_function

goldcoin_start:
addi $s3, $0, 1
addi $s5, $0, 8
addi $s0, $0, 1# 金币位置初始化
addi $s1, $0, 1# 金币位置初始化
addi $s2, $0, 1# 金币位置初始化
addi $s4, $0, 0
goldcoin0:
sw $s0, 32($0)    # 放置金币
sw $s0, 60($0)
sw $s0, 80($0)
addi   $v0,$0,34  # 显示金币
syscall
sll $s0, $s0, 1   # 金币位置左移一格
addi $s4, $s4, 1
bne $s4, $s5, goldcoin0
addi $s4, $0, 0
#等于时继续
goldcoin1:
sw $s0, 32($0)    # 放置金币
sw $s0, 60($0)
sw $s0, 80($0)
sw $s1, 16($0)
sw $s1, 48($0)
sw $s1, 128($0)
addi   $v0,$0,34  # 显示金币
syscall
sll $s0, $s0, 1   # 金币位置左移一格
sll $s1, $s1, 1   # 金币位置左移一格
addi $s4, $s4, 1
bne $s4, $s5, goldcoin1
addi $s4, $0, 0
goldcoin2:
sw $s0, 32($0)    # 放置金币
sw $s0, 60($0)
sw $s0, 80($0)
sw $s1, 16($0)
sw $s1, 48($0)
sw $s1, 96($0)
sw $s2, 8($0)
sw $s2, 40($0)
sw $s2, 64($0)
addi   $v0,$0,34  # 显示金币
syscall
sll $s0, $s0, 1   # 金币位置左移一格
sll $s1, $s1, 1   # 金币位置左移一格
sll $s2, $s2, 1   # 金币位置左移一格
addi $s4, $s4, 1
bne $s4, $s5, goldcoin2
addi $s4, $0, 0

addi $s0, $s0, 1   # 金币新增
hhhh:
sw $s0, 32($0)    # 放置金币
sw $s0, 60($0)
sw $s0, 80($0)
sw $s1, 16($0)
sw $s1, 48($0)
sw $s1, 96($0)
sw $s2, 8($0)
sw $s2, 40($0)
sw $s2, 64($0)
addi   $v0,$0,34  # 显示金币
syscall
sll $s0, $s0, 1   # 金币位置左移一格
sll $s1, $s1, 1   # 金币位置左移一格
sll $s2, $s2, 1   # 金币位置左移一格
addi $s4, $s4, 1
bne $s4, $s5, hhhh
addi $s4, $0, 0
addi $s1, $s1, 1  # 金币新增
iiii:
sw $s0, 32($0)    # 放置金币
sw $s0, 60($0)
sw $s0, 80($0)
sw $s1, 16($0)
sw $s1, 48($0)
sw $s1, 96($0)
sw $s2, 8($0)
sw $s2, 40($0)
sw $s2, 64($0)
addi   $v0,$0,34  # 显示金币
syscall
sll $s0, $s0, 1   # 金币位置左移一格
sll $s1, $s1, 1   # 金币位置左移一格
sll $s2, $s2, 1   # 金币位置左移一格
addi $s4, $s4, 1
bne $s4, $s5, iiii
addi $s4, $0, 0
addi $s2, $s2, 1  # 金币新增
jjjj:
sw $s0, 32($0)    # 放置金币
sw $s0, 60($0)
sw $s0, 80($0)
sw $s1, 16($0)
sw $s1, 48($0)
sw $s1, 96($0)
sw $s2, 8($0)
sw $s2, 40($0)
sw $s2, 64($0)
addi   $v0,$0,34  # 显示金币
syscall
sll $s0, $s0, 1   # 金币位置左移一格
sll $s1, $s1, 1   # 金币位置左移一格
sll $s2, $s2, 1   # 金币位置左移一格
addi $s4, $s4, 1
bne $s4, $s5, jjjj
addi $s4, $0, 0
addi $s0, $s0, 1  # 金币新增
j hhhh

finish:
addi $s3, $0, 1  #游戏成功

addi $t8, $0, 0x7577
sll $t8, $t8, 16
ori $t8, $t8, 0x7772
sw $t8, 52($0)

addi $t8, $0, 0x4544
sll $t8, $t8, 16
ori $t8, $t8, 0x5442
sw $t8, 56($0)

addi $t8, $0, 0x7544
sll $t8, $t8, 16
ori $t8, $t8, 0x7772
sw $t8, 60($0)

addi $t8, $0, 0x1544
sll $t8, $t8, 16
ori $t8, $t8, 0x4110
sw $t8, 64($0)

addi $t8, $0, 0x7777
sll $t8, $t8, 16
ori $t8, $t8, 0x7772
sw $t8, 68($0)

addi   $v0,$0,34
syscall

main_function:

nop_cycle:
nop
nop
nop
nop
nop
j nop_cycle
