	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB36:
	addi sp,sp,-80
	sw ra,76(sp)
	sw s0,72(sp)
	addi s0,sp,80
	j LBB38
LBB38:
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : __init__
	.globl	A.A					# start function : A.A
	.p2align	2
A.A:
#LBB63:
	addi sp,sp,-160
	sw ra,156(sp)
	sw s0,152(sp)
	addi s0,sp,160
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	lw t0,-16(s0)
	lw t1,-20(s0)
	mv t0,t1
	sw t0,-16(s0)
	sw t1,-20(s0)
	lw t0,-24(s0)
	li t0,1
	sw t0,-24(s0)
	lw t0,-20(s0)
	lw t1,-24(s0)
	mv t0,t1
	sw t0,-20(s0)
	sw t1,-24(s0)
	lw t0,-28(s0)
	lw t1,-32(s0)
	mv t0,t1
	sw t0,-28(s0)
	sw t1,-32(s0)
	lw t0,-36(s0)
	lw t1,-20(s0)
	mv t0,t1
	sw t0,-36(s0)
	sw t1,-20(s0)
	lw t0,-40(s0)
	lw t1,-36(s0)
	addi t0,t1,1
	sw t0,-40(s0)
	sw t1,-36(s0)
	lw t0,-32(s0)
	lw t1,-40(s0)
	mv t0,t1
	sw t0,-32(s0)
	sw t1,-40(s0)
	lw t0,-44(s0)
	lw t1,-48(s0)
	mv t0,t1
	sw t0,-44(s0)
	sw t1,-48(s0)
	lw t0,-52(s0)
	lw t1,-32(s0)
	mv t0,t1
	sw t0,-52(s0)
	sw t1,-32(s0)
	lw t0,-48(s0)
	lw t1,-52(s0)
	mv t0,t1
	sw t0,-48(s0)
	sw t1,-52(s0)
	lw t0,-56(s0)
	lw t1,-60(s0)
	mv t0,t1
	sw t0,-56(s0)
	sw t1,-60(s0)
	lw t0,-64(s0)
	lw t1,-68(s0)
	mv t0,t1
	sw t0,-64(s0)
	sw t1,-68(s0)
	lw t0,-72(s0)
	lw t1,-64(s0)
	addi t0,t1,1
	sw t0,-72(s0)
	sw t1,-64(s0)
	lw t0,-60(s0)
	lw t1,-72(s0)
	mv t0,t1
	sw t0,-60(s0)
	sw t1,-72(s0)
	lw t0,-76(s0)
	lw t1,-80(s0)
	mv t0,t1
	sw t0,-76(s0)
	sw t1,-80(s0)
	lw t0,-76(s0)
	mv a0,t0
	sw t0,-76(s0)
	call toString
	lw t0,-84(s0)
	mv t0,a0
	sw t0,-84(s0)
	lw t0,-88(s0)
	lw t1,-84(s0)
	mv t0,t1
	sw t0,-88(s0)
	sw t1,-84(s0)
	lw t0,-92(s0)
	lw t1,-88(s0)
	mv t0,t1
	sw t0,-92(s0)
	sw t1,-88(s0)
	lw t0,-96(s0)
	lw t1,-92(s0)
	mv t0,t1
	sw t0,-96(s0)
	sw t1,-92(s0)
	j LBB65
LBB65:
	lw s0,152(sp)
	lw ra,156(sp)
	addi sp,sp,160
	ret
# end function : A.A
	.globl	main					# start function : main
	.p2align	2
main:
#LBB66:
	addi sp,sp,-96
	sw ra,92(sp)
	sw s0,88(sp)
	addi s0,sp,96
	call __init__
	lw t0,-12(s0)
	li t0,8
	sw t0,-12(s0)
	lw t0,-12(s0)
	mv a0,t0
	sw t0,-12(s0)
	call malloc
	lw t0,-16(s0)
	mv t0,a0
	sw t0,-16(s0)
	lw t0,-16(s0)
	mv a0,t0
	sw t0,-16(s0)
	call A.A
	lw t0,-20(s0)
	lw t1,-16(s0)
	mv t0,t1
	sw t0,-20(s0)
	sw t1,-16(s0)
	lw t0,-24(s0)
	lui t1,%hi(const_string_no0)
	lw t2,%lo(const_string_no0)(t1)
	mv t0,t2
	sw t0,-24(s0)
	lui t1,%hi(const_string_no0)
	sw t2,%lo(const_string_no0)(t1)
	lw t0,-24(s0)
	mv a0,t0
	sw t0,-24(s0)
	call println
	lw t0,-32(s0)
	li t0,0
	sw t0,-32(s0)
	lw t0,-36(s0)
	lw t1,-32(s0)
	mv t0,t1
	sw t0,-36(s0)
	sw t1,-32(s0)
	j LBB67
LBB67:
	j LBB68
LBB68:
	lw t0,-36(s0)
	mv a0,t0
	sw t0,-36(s0)
	lw s0,88(sp)
	lw ra,92(sp)
	addi sp,sp,96
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
a:
	.word	0

	.p2align	2
b:
	.word	0

const_string_no0:
	.asciz	"too young too simple. "

