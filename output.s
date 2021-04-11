	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	sw s0,-8(sp)
	mv s0,sp
	addi sp,sp,-80
	j LBB25
LBB25:
	addi sp,sp,80
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	main					# start function : main
	.p2align	2
main:
#LBB42:
	sw ra,-4(sp)
	sw s0,-8(sp)
	mv s0,sp
	addi sp,sp,-80
	call __init__
	call getInt
	mv s3,a0
	li a0,4
	mul a0,s3,a0
	addi a0,a0,4
	call malloc
	sw s3,0(a0)
	addi a1,a0,4
	addi a1,a1,0
	addi s2,a0,4
	slli a0,s3,2
	add s4,a1,a0
	mv s1,s3
	j LBB43
LBB43:
	slt a0,s2,s4
	bnez a0,LBB45
	j LBB44
LBB44:
	j LBB47
LBB45:
	j LBB46
LBB46:
	li a0,4
	mul a0,s3,a0
	addi a0,a0,4
	call malloc
	sw s3,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s2)
	addi s2,s2,4
	j LBB43
LBB47:
	lui a0,%hi(a)
	sw a1,%lo(a)(a0)
	lui a0,%hi(a)
	lw a0,%lo(a)(a0)
	addi a0,a0,4
	lw a0,0(a0)
	addi a1,a0,0
	li a0,123
	sw a0,0(a1)
	lui a0,%hi(a)
	lw a0,%lo(a)(a0)
	addi a0,a0,4
	lw a0,0(a0)
	addi a0,a0,0
	lw a0,0(a0)
	j LBB48
LBB48:
	addi sp,sp,80
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
a:
	.word	0

