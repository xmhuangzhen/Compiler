	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
	li a0,84
	call malloc
	li a1,20
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(a)
	sw a1,%lo(a)(a0)
LBB25:
	addi sp,sp,84
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	main					# start function : main
	.p2align	2
main:
#LBB42:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-84
	call __init__
	call getInt
	lui a1,%hi(n)
	sw a0,%lo(n)(a1)
	li a1,0
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
LBB43:
	lui a0,%hi(i)
	lw a1,%lo(i)(a0)
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
	slt a0,a1,a0
	bnez a0,LBB44
	j LBB46
LBB44:
	lui a0,%hi(a)
	lw a1,%lo(a)(a0)
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slli a0,a0,2
	add s1,a1,a0
	call getInt
	sw a0,0(s1)
LBB45:
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	addi a1,a0,1
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
	j LBB43
LBB46:
	lui a0,%hi(n)
	lw a1,%lo(n)(a0)
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
LBB47:
	lui a0,%hi(i)
	lw a1,%lo(i)(a0)
	li a0,0
	slt a0,a0,a1
	bnez a0,LBB48
	j LBB68
LBB48:
	lui a0,%hi(i)
	lw a3,%lo(i)(a0)
LBB49:
	li a0,0
LBB50:
	lui a1,%hi(n)
	lw a1,%lo(n)(a1)
	div a1,a1,a3
	slt a1,a0,a1
	bnez a1,LBB51
	j LBB62
LBB51:
	li a1,0
	li a2,0
LBB52:
	addi a4,a3,-1
	slt a4,a2,a4
	bnez a4,LBB53
	j LBB58
LBB53:
	lui a4,%hi(a)
	lw a5,%lo(a)(a4)
	mul a4,a0,a3
	add a4,a4,a2
	slli a4,a4,2
	add a4,a5,a4
	lw a6,0(a4)
	lui a4,%hi(a)
	lw a5,%lo(a)(a4)
	mul a4,a0,a3
	add a4,a4,a2
	addi a4,a4,1
	slli a4,a4,2
	add a4,a5,a4
	lw a4,0(a4)
	slt a4,a4,a6
	bnez a4,LBB55
	j LBB54
LBB54:
	j LBB56
LBB55:
	li a1,1
LBB56:
LBB57:
	addi a2,a2,1
	j LBB52
LBB58:
	li a2,1
	xor a1,a2,a1
	bnez a1,LBB59
	j LBB60
LBB59:
	li a0,1
	j LBB63
LBB60:
LBB61:
	addi a0,a0,1
	j LBB50
LBB62:
	li a0,0
LBB63:
LBB64:
	li a1,0
	slt a0,a1,a0
	bnez a0,LBB65
	j LBB66
LBB65:
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	call toString
	call print
	li a0,0
	j LBB69
LBB66:
LBB67:
	lui a0,%hi(i)
	lw a1,%lo(i)(a0)
	li a0,2
	div a1,a1,a0
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
	j LBB47
LBB68:
	li a0,0
LBB69:
	addi sp,sp,84
	lw s1,-12(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
n:
	.word	0

	.p2align	2
a:
	.word	0

	.p2align	2
i:
	.word	0

