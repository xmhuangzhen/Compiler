	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB40:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-84
LBB41:
LBB42:
	li a1,0
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
LBB43:
	lui a0,%hi(i)
	lw a1,%lo(i)(a0)
	li a0,5
	slt a0,a1,a0
	bnez a0,LBB44
	j LBB52
LBB44:
	li a1,0
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
LBB45:
	lui a0,%hi(j)
	lw a1,%lo(j)(a0)
	li a0,5
	slt a0,a1,a0
	bnez a0,LBB46
	j LBB50
LBB46:
	call getInt
	lui a1,%hi(n)
	sw a0,%lo(n)(a1)
	lui a0,%hi(n)
	lw a1,%lo(n)(a0)
	li a0,1
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB47
	j LBB48
LBB47:
	lui a0,%hi(i)
	lw a1,%lo(i)(a0)
	lui a0,%hi(r)
	sw a1,%lo(r)(a0)
	lui a0,%hi(j)
	lw a1,%lo(j)(a0)
	lui a0,%hi(c)
	sw a1,%lo(c)(a0)
LBB48:
LBB49:
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	addi a1,a0,1
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
	j LBB45
LBB50:
LBB51:
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	addi a1,a0,1
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
	j LBB43
LBB52:
	lui a0,%hi(r)
	lw a1,%lo(r)(a0)
LBB53:
	li a0,0
	slt a0,a0,s2
	bnez a0,LBB54
	j LBB55
LBB54:
	j LBB56
LBB55:
	addi s2,a1,-2
LBB56:
LBB57:
	lui a0,%hi(c)
	lw a1,%lo(c)(a0)
LBB58:
	li a0,0
	slt a0,a0,s1
	bnez a0,LBB59
	j LBB60
LBB59:
	j LBB61
LBB60:
	addi s1,a1,-2
LBB61:
LBB62:
	add a0,s2,s1
	call printInt
	li a0,0
LBB63:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
n:
	.word	0

	.p2align	2
r:
	.word	0

	.p2align	2
c:
	.word	0

	.p2align	2
i:
	.word	0

	.p2align	2
j:
	.word	0

