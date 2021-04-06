	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	j LBB25
LBB25:
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	abs					# start function : abs
	.p2align	2
abs:
#LBB42:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	lw t0,1012(s0)
	mv t0,a0
	sw t0,1012(s0)
	lw t0,1008(s0)
	lw t1,1012(s0)
	mv t0,t1
	sw t0,1008(s0)
	lw t0,1004(s0)
	li t0,0
	sw t0,1004(s0)
	lw t0,1000(s0)
	lw t1,1004(s0)
	lw t2,1008(s0)
	slt t0,t1,t2
	sw t0,1000(s0)
	lw t0,1000(s0)
	bnez t0,LBB43
	j LBB44
	sw t0,1000(s0)
LBB43:
	lw t0,996(s0)
	lw t1,1012(s0)
	mv t0,t1
	sw t0,996(s0)
	lw t0,992(s0)
	lw t1,996(s0)
	mv t0,t1
	sw t0,992(s0)
	j LBB45
	j LBB44
LBB44:
	lw t0,988(s0)
	lw t1,1012(s0)
	mv t0,t1
	sw t0,988(s0)
	lw t0,984(s0)
	li t0,0
	sw t0,984(s0)
	lw t0,980(s0)
	lw t1,984(s0)
	lw t2,988(s0)
	sub t0,t1,t2
	sw t0,980(s0)
	lw t0,992(s0)
	lw t1,980(s0)
	mv t0,t1
	sw t0,992(s0)
	j LBB45
	j LBB45
LBB45:
	lw t0,992(s0)
	mv a0,t0
	sw t0,992(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : abs
	.globl	main					# start function : main
	.p2align	2
main:
#LBB46:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	call __init__
	lw t0,1012(s0)
	li t0,0
	sw t0,1012(s0)
	lui t0,%hi(i)
	lw t1,%lo(i)(t0)
	lw t2,1012(s0)
	mv t1,t2
	lui t0,%hi(i)
	sw t1,%lo(i)(t0)
	j LBB47
LBB47:
	lw t0,1004(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,1004(s0)
	lw t0,1000(s0)
	li t0,5
	sw t0,1000(s0)
	lw t0,996(s0)
	lw t1,1004(s0)
	lw t2,1000(s0)
	slt t0,t1,t2
	sw t0,996(s0)
	lw t0,996(s0)
	bnez t0,LBB48
	j LBB56
	sw t0,996(s0)
LBB48:
	lw t0,992(s0)
	li t0,0
	sw t0,992(s0)
	lui t0,%hi(j)
	lw t1,%lo(j)(t0)
	lw t2,992(s0)
	mv t1,t2
	lui t0,%hi(j)
	sw t1,%lo(j)(t0)
	j LBB49
LBB49:
	lw t0,984(s0)
	lui t1,%hi(j)
	lw t2,%lo(j)(t1)
	mv t0,t2
	sw t0,984(s0)
	lw t0,980(s0)
	li t0,5
	sw t0,980(s0)
	lw t0,976(s0)
	lw t1,984(s0)
	lw t2,980(s0)
	slt t0,t1,t2
	sw t0,976(s0)
	lw t0,976(s0)
	bnez t0,LBB50
	j LBB54
	sw t0,976(s0)
LBB50:
	call getInt
	lw t0,972(s0)
	mv t0,a0
	sw t0,972(s0)
	lui t0,%hi(n)
	lw t1,%lo(n)(t0)
	lw t2,972(s0)
	mv t1,t2
	lui t0,%hi(n)
	sw t1,%lo(n)(t0)
	lw t0,964(s0)
	lui t1,%hi(n)
	lw t2,%lo(n)(t1)
	mv t0,t2
	sw t0,964(s0)
	lw t0,960(s0)
	li t0,1
	sw t0,960(s0)
	lw t0,956(s0)
	lw t1,964(s0)
	lw t2,960(s0)
	xor t0,t1,t2
	sw t0,956(s0)
	lw t0,952(s0)
	lw t1,956(s0)
	seqz t0,t1
	sw t0,952(s0)
	lw t0,952(s0)
	bnez t0,LBB51
	j LBB52
	sw t0,952(s0)
LBB51:
	lw t0,948(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,948(s0)
	lui t0,%hi(r)
	lw t1,%lo(r)(t0)
	lw t2,948(s0)
	mv t1,t2
	lui t0,%hi(r)
	sw t1,%lo(r)(t0)
	lw t0,940(s0)
	lui t1,%hi(j)
	lw t2,%lo(j)(t1)
	mv t0,t2
	sw t0,940(s0)
	lui t0,%hi(c)
	lw t1,%lo(c)(t0)
	lw t2,940(s0)
	mv t1,t2
	lui t0,%hi(c)
	sw t1,%lo(c)(t0)
	j LBB52
LBB52:
	j LBB53
LBB53:
	lw t0,932(s0)
	lui t1,%hi(j)
	lw t2,%lo(j)(t1)
	mv t0,t2
	sw t0,932(s0)
	lw t0,928(s0)
	lw t1,932(s0)
	addi t0,t1,1
	sw t0,928(s0)
	lui t0,%hi(j)
	lw t1,%lo(j)(t0)
	lw t2,928(s0)
	mv t1,t2
	lui t0,%hi(j)
	sw t1,%lo(j)(t0)
	j LBB49
LBB54:
	j LBB55
LBB55:
	lw t0,924(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,924(s0)
	lw t0,920(s0)
	lw t1,924(s0)
	addi t0,t1,1
	sw t0,920(s0)
	lui t0,%hi(i)
	lw t1,%lo(i)(t0)
	lw t2,920(s0)
	mv t1,t2
	lui t0,%hi(i)
	sw t1,%lo(i)(t0)
	j LBB47
LBB56:
	lw t0,916(s0)
	lui t1,%hi(r)
	lw t2,%lo(r)(t1)
	mv t0,t2
	sw t0,916(s0)
	lw t0,912(s0)
	li t0,2
	sw t0,912(s0)
	lw t0,908(s0)
	lw t1,912(s0)
	lw t2,916(s0)
	sub t0,t1,t2
	sw t0,908(s0)
	lw t0,908(s0)
	mv a0,t0
	sw t0,908(s0)
	call abs
	lw t0,904(s0)
	mv t0,a0
	sw t0,904(s0)
	lw t0,900(s0)
	lui t1,%hi(c)
	lw t2,%lo(c)(t1)
	mv t0,t2
	sw t0,900(s0)
	lw t0,896(s0)
	li t0,2
	sw t0,896(s0)
	lw t0,892(s0)
	lw t1,896(s0)
	lw t2,900(s0)
	sub t0,t1,t2
	sw t0,892(s0)
	lw t0,892(s0)
	mv a0,t0
	sw t0,892(s0)
	call abs
	lw t0,888(s0)
	mv t0,a0
	sw t0,888(s0)
	lw t0,884(s0)
	lw t1,904(s0)
	lw t2,888(s0)
	add t0,t1,t2
	sw t0,884(s0)
	lw t0,884(s0)
	mv a0,t0
	sw t0,884(s0)
	call printInt
	lw t0,880(s0)
	li t0,0
	sw t0,880(s0)
	lw t0,876(s0)
	lw t1,880(s0)
	mv t0,t1
	sw t0,876(s0)
	j LBB57
	j LBB57
LBB57:
	lw t0,876(s0)
	mv a0,t0
	sw t0,876(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
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

