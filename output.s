	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a1,19260817
	lui a0,%hi(rng_seed)
	sw a1,%lo(rng_seed)(a0)
LBB25:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	unsigned_shl					# start function : unsigned_shl
	.p2align	2
unsigned_shl:
#LBB42:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	sll a0,a0,a1
LBB43:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : unsigned_shl
	.globl	unsigned_shr					# start function : unsigned_shr
	.p2align	2
unsigned_shr:
#LBB44:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a3,0
	slt a3,a0,a3
	xori a3,a3,1
	bnez a3,LBB45
	j LBB46
LBB45:
	j LBB47
LBB46:
	li a2,31
	sub a3,a2,a1
	li a2,1
	sll a3,a2,a3
	li a2,-2147483648
	xor a0,a0,a2
	sra a0,a0,a1
	or a2,a3,a0
LBB47:
	mv a0,a2
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : unsigned_shr
	.globl	rng					# start function : rng
	.p2align	2
rng:
#LBB48:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-88
	lui a0,%hi(rng_seed)
	lw s1,%lo(rng_seed)(a0)
	mv a0,s1
	li a1,13
	call unsigned_shl
	xor s1,s1,a0
	mv a0,s1
	li a1,17
	call unsigned_shr
	xor s1,s1,a0
	mv a0,s1
	li a1,5
	call unsigned_shl
	xor a1,s1,a0
	lui a0,%hi(rng_seed)
	sw a1,%lo(rng_seed)(a0)
	li a0,1073741823
	and a0,a1,a0
LBB49:
	addi sp,sp,88
	lw s1,-12(sp)
	lw ra,-4(sp)
	ret
# end function : rng
	.globl	main					# start function : main
	.p2align	2
main:
#LBB50:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	call __init__
LBB51:
	lui a0,%hi(rng_seed)
	lw a1,%lo(rng_seed)(a0)
	li a0,100
	rem a1,a1,a0
	li a0,0
	xor a0,a1,a0
	snez a0,a0
	bnez a0,LBB52
	j LBB53
LBB52:
	lui a0,%hi(rng_seed)
	lw a0,%lo(rng_seed)(a0)
	addi a1,a0,-1
	lui a0,%hi(rng_seed)
	sw a1,%lo(rng_seed)(a0)
	j LBB51
LBB53:
	call rng
	call rng
	andi a1,a0,127
	li a0,100000
	add a2,a1,a0
	li a0,0
LBB54:
	slt a1,a0,a2
	bnez a1,LBB55
	j LBB57
LBB55:
LBB56:
	addi a0,a0,1
	j LBB54
LBB57:
	li a0,0
LBB58:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
rng_seed:
	.word	19260817

