#bgez ����    ���ڵ�������ת   �ݼ����� ����������ʼ��������revise date:2018/3/12 tiger  
#�������0x0000000f 0x0000000e 0x0000000d 0x0000000c 0x0000000b 0x0000000a 0x00000009 0x00000008 0x00000007 0x00000006 0x00000005 0x00000004 0x00000003 0x000000020 x000000010 x00000000
.text
addi $s1,$zero,15  #��ʼֵ
bgez_branch:
add $a0,$0,$s1          
addi $v0,$zero,34         
syscall                  # �����ǰֵ
addi $s1,$s1,-1
bgez $s1,bgez_branch   #����ָ��

addi   $v0,$zero,10         #ͣ��ָ��
syscall                  # ϵͳ����
