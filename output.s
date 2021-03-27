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
	.globl	main					# start function : main
	.p2align	2
main:
#LBB63:
	addi sp,sp,-128
	sw ra,124(sp)
	sw s0,120(sp)
	addi s0,sp,128
	call __init__
	lw t0,-12(s0)
	li t0,4
	sw t0,-12(s0)
	lw t0,-16(s0)
	li t0,4
	sw t0,-16(s0)
	lw t0,-20(s0)
	lw t1,-12(s0)
	lw t2,-16(s0)
	mul t0,t1,t2
	sw t0,-20(s0)
	sw t1,-12(s0)
	sw t2,-16(s0)
	lw t0,-24(s0)
	lw t1,-20(s0)
	addi t0,t1,4
	sw t0,-24(s0)
	sw t1,-20(s0)
	lw t0,-24(s0)
	mv a0,t0
	sw t0,-24(s0)
	call malloc
	lw t0,-28(s0)
	mv t0,a0
	sw t0,-28(s0)
	lw t0,-32(s0)
	li t0,4
	sw t0,-32(s0)
	lw t0,-32(s0)
	lw t1,-28(s0)
	sw t0,0(t1)
	sw t0,-32(s0)
	sw t1,-28(s0)
	lw t0,-36(s0)
	lw t1,-28(s0)
	addi t0,t1,4
	sw t0,-36(s0)
	sw t1,-28(s0)
	lw t0,-40(s0)
	lw t1,-36(s0)
	mv t0,t1
	sw t0,-40(s0)
	sw t1,-36(s0)
	lw t0,-44(s0)
	lw t1,-40(s0)
	addi t0,t1,0
	sw t0,-44(s0)
	sw t1,-40(s0)
	lw t0,-48(s0)
	li t0,100
	sw t0,-48(s0)
	lw t0,-48(s0)
	lw t1,-44(s0)
	sw t0,0(t1)
	sw t0,-48(s0)
	sw t1,-44(s0)
	lw t0,-52(s0)
	lw t1,-40(s0)
	addi t0,t1,4
	sw t0,-52(s0)
	sw t1,-40(s0)
	lw t0,-56(s0)
	lw t1,-40(s0)
	addi t0,t1,0
	sw t0,-56(s0)
	sw t1,-40(s0)
	lw t0,-60(s0)
	lw t1,-56(s0)
	lw t0,0(t1)
	sw t0,-60(s0)
	sw t1,-56(s0)
	lw t0,-60(s0)
	lw t1,-52(s0)
	sw t0,0(t1)
	sw t0,-60(s0)
	sw t1,-52(s0)
	lw t0,-64(s0)
	lw t1,-40(s0)
	addi t0,t1,4
	sw t0,-64(s0)
	sw t1,-40(s0)
	lw t0,-68(s0)
	lw t1,-64(s0)
	lw t0,0(t1)
	sw t0,-68(s0)
	sw t1,-64(s0)
	j LBB64
LBB64:
	j LBB65
LBB65:
	lw t0,-68(s0)
	mv a0,t0
	sw t0,-68(s0)
	lw s0,120(sp)
	lw ra,124(sp)
	addi sp,sp,128
	ret
# end function : main
.section	.sdata,"aw",@progbits
