#############################################################
#������ˮ�ߵķ�ָ֧��j,jal,jr,beq,bne�������ݳ�ͻ����
#LED����ܻᵹ����ֱ���㣬Ȼ��ͣ��
#############################################################
.text
  addi $s1,$zero,32   
  addi $v0,$zero,34         # display hex
  j jmp_next1
  addi $s1,$zero, 4
  addi $s2,$zero, 5
  addi $s3,$zero, 6
jmp_next1:
  beq  $zero,$zero jmp_next2
  addi $s1,$zero, 7
  addi $s2,$zero, 8
  addi $s3,$zero, 9
jmp_next2:
  bne  $zero,$s1,jmp_next3
  addi $s1,$zero, 10
  addi $s2,$zero, 11
  addi $s3,$zero, 12
jmp_next3:
  jal jmp_func
  addi $v0,$zero,10         # system call for exit
  nop
  nop
  nop
  syscall                  # we are out of here.   
 
jmp_func: 
  addi $s1,$s1,-1
  nop
  nop
  nop
  add $a0,$0,$s1      
  nop
  nop
  nop
  syscall        
  bne $s1,$zero,jmp_func           
  jr $31
