#LHU ����    revise date:2018/3/12 tiger
#�������  0x00008281 0x00008483 0x00008685 0x00008887 0x00008a89 0x00008c8b 0x00008e8d 0x0000908f 0x00009291 0x00009493 0x00009695 0x00009897 0x00009a99 0x00009c9b 0x00009e9d 0x0000a09f 0x0000a2a1 0x0000a4a3 0x0000a6a5 0x0000a8a7 0x0000aaa9 0x0000acab 0x0000aead 0x0000b0af 0x0000b2b1 0x0000b4b3 0x0000b6b5 0x0000b8b7 0x0000bab9 0x0000bcbb 0x0000bebd 0x0000c0bf
.text

addi $t1,$zero,0     #init_addr 
addi $t3,$zero,16     #counter

#Ԥ��д�����ݣ�ʵ���ǰ��ֽ�˳����� 0x81,82,84,86,87,88,89.......�Ȳ�����
ori $s1,$zero, 0x8483  #
addi $s2,$zero, 0x0404  #
sll $s1,$s1,16
sll $s2,$s2,16
ori $s1,$s1, 0x8281  #    ע��һ�������MIPS���ô�˷�ʽ
addi $s2,$s2, 0x0404  #   init_data= 0x84838281 next_data=init_data+ 0x04040404

lhu_store:
sw $s1,($t1)
add $s1,$s1,$s2   #data +1
addi $t1,$t1,4    # addr +4  
addi $t3,$t3,-1   #counter
bne $t3,$zero,lhu_store

addi $t3,$zero,32   #ѭ������
addi $t1,$zero,0    # addr
lhu_branch:
lhu $s1,($t1)     #����ָ��
add $a0,$0,$s1          
addi $v0,$zero,34         
syscall                  # print
addi $t1,$t1, 2    
addi $t3,$t3, -1    
bne $t3,$zero,lhu_branch

addi   $v0,$zero,10         # system call for exit
syscall                  # we are out of here.   
