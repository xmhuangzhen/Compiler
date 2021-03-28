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
	.globl	point.point					# start function : point.point
	.p2align	2
point.point:
#LBB63:
	addi sp,sp,-96
	sw ra,92(sp)
	sw s0,88(sp)
	addi s0,sp,96
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	lw t0,-16(s0)
	lw t1,-12(s0)
	mv t0,t1
	sw t0,-16(s0)
	sw t1,-12(s0)
	lw t0,-20(s0)
	lw t1,-16(s0)
	lw t0,0(t1)
	sw t0,-20(s0)
	sw t1,-16(s0)
	lw t0,-24(s0)
	li t0,555
	sw t0,-24(s0)
	lw t0,-24(s0)
	lw t1,-16(s0)
	sw t0,0(t1)
	sw t0,-24(s0)
	sw t1,-16(s0)
	j LBB65
LBB65:
	lw s0,88(sp)
	lw ra,92(sp)
	addi sp,sp,96
	ret
# end function : point.point
	.globl	point.printout					# start function : point.printout
	.p2align	2
point.printout:
#LBB66:
	addi sp,sp,-96
	sw ra,92(sp)
	sw s0,88(sp)
	addi s0,sp,96
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	lw t0,-16(s0)
	lw t1,-12(s0)
	mv t0,t1
	sw t0,-16(s0)
	sw t1,-12(s0)
	lw t0,-20(s0)
	lw t1,-16(s0)
	lw t0,0(t1)
	sw t0,-20(s0)
	sw t1,-16(s0)
	lw t0,-20(s0)
	mv a0,t0
	sw t0,-20(s0)
	call toString
	lw t0,-24(s0)
	mv t0,a0
	sw t0,-24(s0)
	lw t0,-24(s0)
	mv a0,t0
	sw t0,-24(s0)
	call println
	j LBB68
LBB68:
	lw t0,-28(s0)
	mv a0,t0
	sw t0,-28(s0)
	lw s0,88(sp)
	lw ra,92(sp)
	addi sp,sp,96
	ret
# end function : point.printout
	.globl	main					# start function : main
	.p2align	2
main:
#LBB69:
	addi sp,sp,-112
	sw ra,108(sp)
	sw s0,104(sp)
	addi s0,sp,112
	call __init__
	lw t0,-12(s0)
	li t0,4
	sw t0,-12(s0)
	lw t0,-12(s0)
	mv a0,t0
	sw t0,-12(s0)
	call malloc
	lw t0,-16(s0)
	mv t0,a0
	sw t0,-16(s0)
	lw t0,-20(s0)
	lw t1,-16(s0)
	addi t0,t1,0
	sw t0,-20(s0)
	sw t1,-16(s0)
	lw t0,-20(s0)
	mv a0,t0
	sw t0,-20(s0)
	call point.point
	lw t0,-24(s0)
	lw t1,-20(s0)
	mv t0,t1
	sw t0,-24(s0)
	sw t1,-20(s0)
	lw t0,-28(s0)
	lw t1,-24(s0)
	mv t0,t1
	sw t0,-28(s0)
	sw t1,-24(s0)
	lw t0,-28(s0)
	mv a0,t0
	sw t0,-28(s0)
	call point.printout
	lw t0,-32(s0)
	mv t0,a0
	sw t0,-32(s0)
	lw t0,-36(s0)
	lw t1,-24(s0)
	mv t0,t1
	sw t0,-36(s0)
	sw t1,-24(s0)
	lw t0,-40(s0)
	lw t1,-36(s0)
	lw t0,0(t1)
	sw t0,-40(s0)
	sw t1,-36(s0)
	lw t0,-44(s0)
	lw t1,-40(s0)
	mv t0,t1
	sw t0,-44(s0)
	sw t1,-40(s0)
	j LBB70
LBB70:
	j LBB71
LBB71:
	lw t0,-44(s0)
	mv a0,t0
	sw t0,-44(s0)
	lw s0,104(sp)
	lw ra,108(sp)
	addi sp,sp,112
	ret
# end function : main
.section	.sdata,"aw",@progbits
