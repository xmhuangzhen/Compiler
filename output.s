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
	.globl	qpow					# start function : qpow
	.p2align	2
qpow:
#LBB63:
	addi sp,sp,-144
	sw ra,140(sp)
	sw s0,136(sp)
	addi s0,sp,144
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
	li t0,1
	sw t0,-24(s0)
	lw t0,-24(s0)
	lw t1,-28(s0)
	mv t1,t0
	sw t0,-24(s0)
	sw t1,-28(s0)
	lw t0,-12(s0)
	lw t1,-32(s0)
	mv t1,t0
	sw t0,-12(s0)
	sw t1,-32(s0)
LBB64:
	lw t0,-36(s0)
	li t0,0
	sw t0,-36(s0)
	lw t0,-40(s0)
	lw t1,-36(s0)
	lw t2,-16(s0)
	slt t0,t1,t2
	sw t0,-40(s0)
	sw t1,-36(s0)
	sw t2,-16(s0)
	lw t0,-40(s0)
	bnez t0,LBB65
	j LBB68
	sw t0,-40(s0)
LBB65:
	lw t0,-44(s0)
	lw t1,-16(s0)
	andi t0,t1,1
	sw t0,-44(s0)
	sw t1,-16(s0)
	lw t0,-48(s0)
	li t0,1
	sw t0,-48(s0)
	lw t0,-52(s0)
	lw t1,-44(s0)
	lw t2,-48(s0)
	xor t0,t1,t2
	sw t0,-52(s0)
	sw t1,-44(s0)
	sw t2,-48(s0)
	lw t0,-56(s0)
	lw t1,-52(s0)
	seqz t0,t1
	sw t0,-56(s0)
	sw t1,-52(s0)
	lw t0,-56(s0)
	bnez t0,LBB66
	j LBB67
	sw t0,-56(s0)
LBB66:
	lw t0,-60(s0)
	lw t1,-28(s0)
	lw t2,-32(s0)
	mul t0,t1,t2
	sw t0,-60(s0)
	sw t1,-28(s0)
	sw t2,-32(s0)
	lw t0,-64(s0)
	lw t1,-60(s0)
	lw t2,-20(s0)
	rem t0,t1,t2
	sw t0,-64(s0)
	sw t1,-60(s0)
	sw t2,-20(s0)
	lw t0,-64(s0)
	lw t1,-28(s0)
	mv t1,t0
	sw t0,-64(s0)
	sw t1,-28(s0)
	j LBB67
LBB67:
	lw t0,-68(s0)
	lw t1,-32(s0)
	lw t2,-32(s0)
	mul t0,t1,t1
	sw t0,-68(s0)
	sw t1,-32(s0)
	sw t2,-32(s0)
	lw t0,-72(s0)
	lw t1,-68(s0)
	lw t2,-20(s0)
	rem t0,t1,t2
	sw t0,-72(s0)
	sw t1,-68(s0)
	sw t2,-20(s0)
	lw t0,-72(s0)
	lw t1,-32(s0)
	mv t1,t0
	sw t0,-72(s0)
	sw t1,-32(s0)
	lw t0,-76(s0)
	li t0,2
	sw t0,-76(s0)
	lw t0,-80(s0)
	lw t1,-16(s0)
	lw t2,-76(s0)
	div t0,t1,t2
	sw t0,-80(s0)
	sw t1,-16(s0)
	sw t2,-76(s0)
	lw t0,-80(s0)
	lw t1,-16(s0)
	mv t1,t0
	sw t0,-80(s0)
	sw t1,-16(s0)
	j LBB64
LBB68:
	lw t0,-28(s0)
	lw t1,-84(s0)
	mv t1,t0
	sw t0,-28(s0)
	sw t1,-84(s0)
	j LBB69
LBB69:
	j LBB70
LBB70:
	lw t0,-84(s0)
	mv a0,t0
	sw t0,-84(s0)
	lw s0,136(sp)
	lw ra,140(sp)
	addi sp,sp,144
	ret
# end function : qpow
	.globl	main					# start function : main
	.p2align	2
main:
#LBB71:
	addi sp,sp,-112
	sw ra,108(sp)
	sw s0,104(sp)
	addi s0,sp,112
	call __init__
	lw t0,-12(s0)
	li t0,2
	sw t0,-12(s0)
	lw t0,-12(s0)
	mv a0,t0
	sw t0,-12(s0)
	lw t0,-16(s0)
	li t0,10
	sw t0,-16(s0)
	lw t0,-16(s0)
	mv a1,t0
	sw t0,-16(s0)
	lw t0,-20(s0)
	li t0,10000
	sw t0,-20(s0)
	lw t0,-20(s0)
	mv a2,t0
	sw t0,-20(s0)
	call qpow
	lw t0,-24(s0)
	mv t0,a0
	sw t0,-24(s0)
	lw t0,-24(s0)
	mv a0,t0
	sw t0,-24(s0)
	call toString
	lw t0,-28(s0)
	mv a0,t0
	sw t0,-28(s0)
	call println
	lw t0,-32(s0)
	li t0,2
	sw t0,-32(s0)
	lw t0,-32(s0)
	mv a0,t0
	sw t0,-32(s0)
	lw t0,-36(s0)
	li t0,10
	sw t0,-36(s0)
	lw t0,-36(s0)
	mv a1,t0
	sw t0,-36(s0)
	lw t0,-40(s0)
	li t0,10000
	sw t0,-40(s0)
	lw t0,-40(s0)
	mv a2,t0
	sw t0,-40(s0)
	call qpow
	lw t0,-44(s0)
	mv t0,a0
	sw t0,-44(s0)
	lw t0,-44(s0)
	lw t1,-48(s0)
	mv t1,t0
	sw t0,-44(s0)
	sw t1,-48(s0)
	j LBB72
LBB72:
	j LBB73
LBB73:
	lw t0,-48(s0)
	mv a0,t0
	sw t0,-48(s0)
	lw s0,104(sp)
	lw ra,108(sp)
	addi sp,sp,112
	ret
# end function : main
