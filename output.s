	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	mv s0,sp
	addi sp,sp,-84
LBB1:
	li a0,124
	call malloc
	li a1,30
	sw a1,0(a0)
	addi a1,a0,4
	addi s2,a1,0
	addi s1,a0,4
	addi s4,s2,120
LBB2:
	blt s1,s4,LBB3
	j LBB4
LBB3:
	li a0,124
	call malloc
	li a1,30
	sw a1,0(a0)
	addi a1,a0,4
	addi s5,a1,0
	addi s3,a0,4
	addi s6,s5,120
LBB5:
	blt s3,s6,LBB6
	j LBB7
LBB6:
	li a0,124
	call malloc
	li a1,30
	sw a1,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s3)
	addi s3,s3,4
	j LBB5
LBB7:
	sw s5,0(s1)
	addi s1,s1,4
	j LBB2
LBB4:
	li a0,124
	call malloc
	li a1,30
	sw a1,0(a0)
	addi a0,a0,4
	addi a3,a0,0
	li a0,0
LBB8:
	li a1,30
	blt a0,a1,LBB9
	j LBB10
LBB9:
	slli a1,a0,2
	add a2,a3,a1
	li a1,1
	sw a1,0(a2)
	addi a0,a0,1
	j LBB8
LBB10:
	li a0,0
LBB11:
	li a1,30
	blt a0,a1,LBB12
	j LBB13
LBB12:
	slli a1,a0,2
	add a1,s2,a1
	sw a3,0(a1)
	addi a0,a0,1
	j LBB11
LBB13:
	li a0,0
LBB14:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
