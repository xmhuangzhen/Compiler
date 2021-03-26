	.text
	.globl	tak					# start function : tak
	.p2align	2
tak:
#LBB63:
	addi sp,sp,-96
	sw ra,92(sp)
	sw s0,88(sp)
	addi s0,sp,96
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	lw t0,-16(s0)
	mv t0,a1
	sw t0,-16(s0)
	lw t0,-20(s0)
	mv t0,a2
	sw t0,-20(s0)
	lw t0,-24(s0)
	lw t1,-16(s0)
	lw t2,-12(s0)
	slt t0,t1,t2
	sw t0,-24(s0)
	sw t1,-16(s0)
	sw t2,-12(s0)
	lw t0,-24(s0)
	bnez t0,LBB64
	j LBB65
	sw t0,-24(s0)
LBB64:
	lw t0,-28(s0)
	li t0,0
	sw t0,-28(s0)
	lw t0,-28(s0)
	lw t1,-32(s0)
	mv t1,t0
	sw t0,-28(s0)
	sw t1,-32(s0)
	j LBB67
LBB65:
	lw t0,-20(s0)
	lw t1,-32(s0)
	mv t1,t0
	sw t0,-20(s0)
	sw t1,-32(s0)
	j LBB67
LBB66:
	j LBB68
LBB67:
	j LBB66
	j LBB66
LBB68:
	lw t0,-32(s0)
	mv a0,t0
	sw t0,-32(s0)
	lw s0,88(sp)
	lw ra,92(sp)
	addi sp,sp,96
	ret
# end function : tak
	.globl	main					# start function : main
	.p2align	2
main:
#LBB69:
	addi sp,sp,-112
	sw ra,108(sp)
	sw s0,104(sp)
	addi s0,sp,112
	call getInt
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	lw t0,-12(s0)
	lw t1,-16(s0)
	mv t1,t0
	sw t0,-12(s0)
	sw t1,-16(s0)
	call getInt
	lw t0,-20(s0)
	mv t0,a0
	sw t0,-20(s0)
	lw t0,-20(s0)
	lw t1,-24(s0)
	mv t1,t0
	sw t0,-20(s0)
	sw t1,-24(s0)
	call getInt
	lw t0,-28(s0)
	mv t0,a0
	sw t0,-28(s0)
	lw t0,-28(s0)
	lw t1,-32(s0)
	mv t1,t0
	sw t0,-28(s0)
	sw t1,-32(s0)
	lw t0,-16(s0)
	mv a0,t0
	sw t0,-16(s0)
	lw t0,-24(s0)
	mv a1,t0
	sw t0,-24(s0)
	lw t0,-32(s0)
	mv a2,t0
	sw t0,-32(s0)
	call tak
	lw t0,-36(s0)
	mv t0,a0
	sw t0,-36(s0)
	lw t0,-36(s0)
	lw t1,-40(s0)
	mv t1,t0
	sw t0,-36(s0)
	sw t1,-40(s0)
	j LBB70
LBB70:
	j LBB71
LBB71:
	lw t0,-40(s0)
	mv a0,t0
	sw t0,-40(s0)
	lw s0,104(sp)
	lw ra,108(sp)
	addi sp,sp,112
	ret
# end function : main
.section	.sdata,"aw",@progbits
