	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-40
	mv s0,sp
	addi sp,sp,-40
	j LBB25
LBB25:
	addi sp,sp,40
	addi sp,sp,40
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
	addi sp,sp,-56
	mv s0,sp
	addi sp,sp,-56
	lw t0,44(s0)
	mv t0,a0
	sw t0,44(s0)
	lw t0,40(s0)
	lw t1,44(s0)
	mv t0,t1
	sw t0,40(s0)
	sw t1,44(s0)
	lw t0,36(s0)
	li t0,0
	sw t0,36(s0)
	lw t0,32(s0)
	lw t1,36(s0)
	lw t2,40(s0)
	slt t0,t1,t2
	sw t0,32(s0)
	sw t1,36(s0)
	sw t2,40(s0)
	lw t0,32(s0)
	bnez t0,LBB43
	j LBB44
	sw t0,32(s0)
LBB43:
	lw t0,28(s0)
	lw t1,44(s0)
	mv t0,t1
	sw t0,28(s0)
	sw t1,44(s0)
	lw t0,24(s0)
	lw t1,28(s0)
	mv t0,t1
	sw t0,24(s0)
	sw t1,28(s0)
	j LBB45
	j LBB44
LBB44:
	lw t0,20(s0)
	lw t1,44(s0)
	mv t0,t1
	sw t0,20(s0)
	sw t1,44(s0)
	lw t0,16(s0)
	li t0,0
	sw t0,16(s0)
	lw t0,12(s0)
	lw t1,16(s0)
	lw t2,20(s0)
	sub t0,t1,t2
	sw t0,12(s0)
	sw t1,16(s0)
	sw t2,20(s0)
	lw t0,24(s0)
	lw t1,12(s0)
	mv t0,t1
	sw t0,24(s0)
	sw t1,12(s0)
	j LBB45
	j LBB45
LBB45:
	lw t0,24(s0)
	mv a0,t0
	sw t0,24(s0)
	addi sp,sp,56
	addi sp,sp,56
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
	addi sp,sp,-112
	mv s0,sp
	addi sp,sp,-112
	call __init__
	lw t0,100(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,100(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,92(s0)
	li t0,0
	sw t0,92(s0)
	lui t0,%hi(i)
	lw t1,%lo(i)(t0)
	lw t2,92(s0)
	mv t1,t2
	lui t0,%hi(i)
	sw t1,%lo(i)(t0)
	sw t2,92(s0)
	j LBB47
LBB47:
	lw t0,88(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,88(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,84(s0)
	li t0,5
	sw t0,84(s0)
	lw t0,80(s0)
	lw t1,88(s0)
	lw t2,84(s0)
	slt t0,t1,t2
	sw t0,80(s0)
	sw t1,88(s0)
	sw t2,84(s0)
	lw t0,80(s0)
	bnez t0,LBB48
	j LBB56
	sw t0,80(s0)
LBB48:
	lw t0,76(s0)
	lui t1,%hi(j)
	lw t2,%lo(j)(t1)
	mv t0,t2
	sw t0,76(s0)
	lui t1,%hi(j)
	sw t2,%lo(j)(t1)
	lw t0,68(s0)
	li t0,0
	sw t0,68(s0)
	lui t0,%hi(j)
	lw t1,%lo(j)(t0)
	lw t2,68(s0)
	mv t1,t2
	lui t0,%hi(j)
	sw t1,%lo(j)(t0)
	sw t2,68(s0)
	j LBB49
LBB49:
	lw t0,64(s0)
	lui t1,%hi(j)
	lw t2,%lo(j)(t1)
	mv t0,t2
	sw t0,64(s0)
	lui t1,%hi(j)
	sw t2,%lo(j)(t1)
	lw t0,60(s0)
	li t0,5
	sw t0,60(s0)
	lw t0,56(s0)
	lw t1,64(s0)
	lw t2,60(s0)
	slt t0,t1,t2
	sw t0,56(s0)
	sw t1,64(s0)
	sw t2,60(s0)
	lw t0,56(s0)
	bnez t0,LBB50
	j LBB54
	sw t0,56(s0)
LBB50:
	lw t0,52(s0)
	lui t1,%hi(n)
	lw t2,%lo(n)(t1)
	mv t0,t2
	sw t0,52(s0)
	lui t1,%hi(n)
	sw t2,%lo(n)(t1)
	call getInt
	lw t0,44(s0)
	mv t0,a0
	sw t0,44(s0)
	lui t0,%hi(n)
	lw t1,%lo(n)(t0)
	lw t2,44(s0)
	mv t1,t2
	lui t0,%hi(n)
	sw t1,%lo(n)(t0)
	sw t2,44(s0)
	lw t0,40(s0)
	lui t1,%hi(n)
	lw t2,%lo(n)(t1)
	mv t0,t2
	sw t0,40(s0)
	lui t1,%hi(n)
	sw t2,%lo(n)(t1)
	lw t0,36(s0)
	li t0,1
	sw t0,36(s0)
	lw t0,32(s0)
	lw t1,40(s0)
	lw t2,36(s0)
	xor t0,t1,t2
	sw t0,32(s0)
	sw t1,40(s0)
	sw t2,36(s0)
	lw t0,28(s0)
	lw t1,32(s0)
	seqz t0,t1
	sw t0,28(s0)
	sw t1,32(s0)
	lw t0,28(s0)
	bnez t0,LBB51
	j LBB52
	sw t0,28(s0)
LBB51:
	lw t0,24(s0)
	lui t1,%hi(r)
	lw t2,%lo(r)(t1)
	mv t0,t2
	sw t0,24(s0)
	lui t1,%hi(r)
	sw t2,%lo(r)(t1)
	lw t0,16(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,16(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lui t0,%hi(r)
	lw t1,%lo(r)(t0)
	lw t2,16(s0)
	mv t1,t2
	lui t0,%hi(r)
	sw t1,%lo(r)(t0)
	sw t2,16(s0)
	lw t0,12(s0)
	lui t1,%hi(c)
	lw t2,%lo(c)(t1)
	mv t0,t2
	sw t0,12(s0)
	lui t1,%hi(c)
	sw t2,%lo(c)(t1)
	lw t0,4(s0)
	lui t1,%hi(j)
	lw t2,%lo(j)(t1)
	mv t0,t2
	sw t0,4(s0)
	lui t1,%hi(j)
	sw t2,%lo(j)(t1)
	lui t0,%hi(c)
	lw t1,%lo(c)(t0)
	lw t2,4(s0)
	mv t1,t2
	lui t0,%hi(c)
	sw t1,%lo(c)(t0)
	sw t2,4(s0)
	j LBB52
LBB52:
	j LBB53
LBB53:
	lw t0,0(s0)
	lui t1,%hi(j)
	lw t2,%lo(j)(t1)
	mv t0,t2
	sw t0,0(s0)
	lui t1,%hi(j)
	sw t2,%lo(j)(t1)
	lw t0,-4(s0)
	lw t1,0(s0)
	addi t0,t1,1
	sw t0,-4(s0)
	sw t1,0(s0)
	lui t0,%hi(j)
	lw t1,%lo(j)(t0)
	lw t2,-4(s0)
	mv t1,t2
	lui t0,%hi(j)
	sw t1,%lo(j)(t0)
	sw t2,-4(s0)
	j LBB49
LBB54:
	j LBB55
LBB55:
	lw t0,-8(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-8(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-12(s0)
	lw t1,-8(s0)
	addi t0,t1,1
	sw t0,-12(s0)
	sw t1,-8(s0)
	lui t0,%hi(i)
	lw t1,%lo(i)(t0)
	lw t2,-12(s0)
	mv t1,t2
	lui t0,%hi(i)
	sw t1,%lo(i)(t0)
	sw t2,-12(s0)
	j LBB47
LBB56:
	lw t0,-16(s0)
	lui t1,%hi(r)
	lw t2,%lo(r)(t1)
	mv t0,t2
	sw t0,-16(s0)
	lui t1,%hi(r)
	sw t2,%lo(r)(t1)
	lw t0,-20(s0)
	li t0,2
	sw t0,-20(s0)
	lw t0,-24(s0)
	lw t1,-20(s0)
	lw t2,-16(s0)
	sub t0,t1,t2
	sw t0,-24(s0)
	sw t1,-20(s0)
	sw t2,-16(s0)
	lw t0,-24(s0)
	mv a0,t0
	sw t0,-24(s0)
	call abs
	lw t0,-28(s0)
	mv t0,a0
	sw t0,-28(s0)
	lw t0,-32(s0)
	lui t1,%hi(c)
	lw t2,%lo(c)(t1)
	mv t0,t2
	sw t0,-32(s0)
	lui t1,%hi(c)
	sw t2,%lo(c)(t1)
	lw t0,-36(s0)
	li t0,2
	sw t0,-36(s0)
	lw t0,-40(s0)
	lw t1,-36(s0)
	lw t2,-32(s0)
	sub t0,t1,t2
	sw t0,-40(s0)
	sw t1,-36(s0)
	sw t2,-32(s0)
	lw t0,-40(s0)
	mv a0,t0
	sw t0,-40(s0)
	call abs
	lw t0,-44(s0)
	mv t0,a0
	sw t0,-44(s0)
	lw t0,-48(s0)
	lw t1,-28(s0)
	lw t2,-44(s0)
	add t0,t1,t2
	sw t0,-48(s0)
	sw t1,-28(s0)
	sw t2,-44(s0)
	lw t0,-52(s0)
	lw t1,-48(s0)
	mv t0,t1
	sw t0,-52(s0)
	sw t1,-48(s0)
	j LBB57
	j LBB57
LBB57:
	lw t0,-52(s0)
	mv a0,t0
	sw t0,-52(s0)
	addi sp,sp,112
	addi sp,sp,112
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

