#############################################################
#����BHT���������̲��ԣ�LRU��̭���Բ��ԣ�BHT��Ԥ�⹦Ч����
#############################################################
.text
 addi $s1,$zero, 5   #ѭ������
 
 j jmp_next1         #����BHT,BHT��1������ 
 addi $s1,$zero, 1
 addi $s2,$zero, 2
 addi $s3,$zero, 3
 addi $s4,$zero, 4

jmp_next1:
 j jmp_next2        #����BHT,BHT��2������
 addi $s1,$zero, 1
 addi $s2,$zero, 2
 addi $s3,$zero, 3
 addi $s4,$zero, 4
jmp_next2:
 j jmp_next3        #����BHT,BHT��3������,��������ִ�У�ӦԤ��ɹ�
 addi $s1,$zero, 1
 addi $s2,$zero, 2
 addi $s3,$zero, 3
 addi $s4,$zero, 4
jmp_next3:
 j jmp_next4        #����BHT,BHT��4������,��������ִ�У�ӦԤ��ɹ�
 addi $s1,$zero, 1
 addi $s2,$zero, 2
 addi $s3,$zero, 3
 addi $s4,$zero, 4

jmp_next4:
 j jmp_next5        #����BHT,BHT��5������,��������ִ�У�ӦԤ��ɹ�
 addi $s1,$zero, 1
 addi $s2,$zero, 2
 addi $s3,$zero, 3
 addi $s4,$zero, 4

jmp_next5:
 j jmp_next6        #����BHT,BHT��6������,��������ִ�У�ӦԤ��ɹ�
 addi $s1,$zero, 1
 addi $s2,$zero, 2
 addi $s3,$zero, 3
 addi $s4,$zero, 4
 
 jmp_next6:
 j jmp_next7        #����BHT,BHT��7������,��������ִ�У�ӦԤ��ɹ�
 addi $s1,$zero, 1
 addi $s2,$zero, 2
 addi $s3,$zero, 3
 addi $s4,$zero, 4

jmp_next7:
 j jmp_next8        #����BHT,BHT��8������,��������ִ�У�ӦԤ��ɹ�
 addi $s1,$zero, 1
 addi $s2,$zero, 2
 addi $s3,$zero, 3
 addi $s4,$zero, 4

jmp_next8:
 addi $s1,$s1, -1    
 bne $s1,$0, jmp_next2   
 
 #����BHT,BHT����Ӧ��̭ j jmp_next1���������ִ�У���ת�гɹ���ʧ��

 addi $s0,$zero,1
 addi $s2,$zero,255
 addi $s1,$zero,1
 addi $s3,$zero,3

 beq $s0, $s2, jmp_next9   #����BHT,BTH��������̭j jmp_next2 
 beq $s0, $s0, jmp_next9   #����BHT,BTH��������̭j jmp_next3 

 addi $s1,$zero, 1
 addi $s2,$zero, 2
 addi $s3,$zero, 3
 addi $s4,$zero, 4

jmp_next9:
 bne $s1, $s1, jmp_next10   #����BHT,BTH��������̭j jmp_next4 
 bne $s1, $s2, jmp_next10   #����BHT,BTH��������̭j jmp_next5

 addi $s1,$zero,1    #����ִ��
 addi $s2,$zero,2
 addi $s3,$zero,3

jmp_next10:
 
 jal func            #����BHT,BTH��������̭j jmp_next6

 addi   $v0,$zero,10      
 syscall                  #�����˳���ͣ��

func: addi $s0,$zero, 0     #�Ӻ���
       addi $s0,$s0, 1
       add    $a0,$0,$s0      
       addi   $v0,$0,34        
       syscall                 
       jr $31           #����BHT,BTH��������̭j jmp_next7