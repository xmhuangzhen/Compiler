	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-84
LBB1:
	li a0,11208
	call malloc
	li a1,2801
	sw a1,0(a0)
	addi a0,a0,4
	addi s2,a0,0
	li a0,0
LBB2:
	li a1,2800
	sub a2,a0,a1
	li a1,0
	bne a2,a1,LBB3
	j LBB4
LBB3:
	slli a1,a0,2
	add a2,s2,a1
	li a1,2000
	sw a1,0(a2)
	addi a0,a0,1
	j LBB2
LBB4:
	li a3,0
	li s1,2800
LBB5:
	li a0,2
	mul a1,s1,a0
	li a0,0
	beq a1,a0,LBB6
	j LBB7
LBB6:
	la a0,const_string_no0
	call print
	li a0,0
	j LBB8
LBB7:
	mv a0,s1
	li a2,0
LBB9:
	slli a4,a0,2
	add a4,s2,a4
	lw a5,0(a4)
	li a4,10000
	mul a4,a5,a4
	add a5,a2,a4
	slli a2,a0,2
	add a4,s2,a2
	addi a2,a1,-1
	rem a1,a5,a2
	sw a1,0(a4)
	div s3,a5,a2
	addi a1,a2,-1
	addi a0,a0,-1
	li a2,0
	beq a0,a2,LBB10
	j LBB11
LBB10:
	addi s1,s1,-14
	li a0,10000
	div a0,s3,a0
	add a0,a3,a0
	call toString
	call print
	li a0,10000
	rem a3,s3,a0
	j LBB5
LBB11:
	mul a2,s3,a0
	j LBB9
LBB8:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	"\n"

