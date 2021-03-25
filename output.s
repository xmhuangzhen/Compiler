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
	addi sp,sp,-80
	sw ra,76(sp)
	sw s0,72(sp)
	addi s0,sp,80
	j LBB65
LBB65:
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : A.A
	.globl	A.aabc					# start function : A.aabc
	.p2align	2
A.aabc:
#LBB66:
	addi sp,sp,-80
	sw ra,76(sp)
	sw s0,72(sp)
	addi s0,sp,80
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	lw t0,-16(s0)
	mv t0,a1
	sw t0,-16(s0)
	lw t0,-12(s0)
	lw t1,-20(s0)
	mv t1,t0
	sw t0,-12(s0)
	sw t1,-20(s0)
	j LBB67
LBB67:
	j LBB68
LBB68:
	lw t0,-20(s0)
	mv a0,t0
	sw t0,-20(s0)
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : A.aabc
	.globl	B.B					# start function : B.B
	.p2align	2
B.B:
#LBB69:
	addi sp,sp,-80
	sw ra,76(sp)
	sw s0,72(sp)
	addi s0,sp,80
	j LBB71
LBB71:
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : B.B
	.globl	B.D					# start function : B.D
	.p2align	2
B.D:
#LBB72:
	addi sp,sp,-80
	sw ra,76(sp)
	sw s0,72(sp)
	addi s0,sp,80
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	j LBB74
LBB74:
	lw t0,-16(s0)
	mv a0,t0
	sw t0,-16(s0)
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : B.D
	.globl	B.t					# start function : B.t
	.p2align	2
B.t:
#LBB75:
	addi sp,sp,-80
	sw ra,76(sp)
	sw s0,72(sp)
	addi s0,sp,80
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	call B.D
	mv zero,a0
	j LBB77
LBB77:
	lw t0,-16(s0)
	mv a0,t0
	sw t0,-16(s0)
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : B.t
	.globl	main					# start function : main
	.p2align	2
main:
#LBB81:
	addi sp,sp,-160
	sw ra,156(sp)
	sw s0,152(sp)
	addi s0,sp,160
	call __init__
	lw t0,-12(s0)
	li t0,1
	sw t0,-12(s0)
	lw t0,-16(s0)
	lw t1,-12(s0)
	addi t0,t1,-4
	sw t0,-16(s0)
	sw t1,-12(s0)
	lw t0,-20(s0)
	lw t1,-16(s0)
	addi t0,t1,4
	sw t0,-20(s0)
	sw t1,-16(s0)
	lw t0,-20(s0)
	mv a0,t0
	sw t0,-20(s0)
	call malloc
	lw t0,-24(s0)
	lw t1,-28(s0)
	addi t0,t1,0
	sw t0,-24(s0)
	sw t1,-28(s0)
	lw t0,-32(s0)
	li t0,1
	sw t0,-32(s0)
	lw t0,-32(s0)
	lw t1,-24(s0)
	mv t1,t0
	sw t0,-32(s0)
	sw t1,-24(s0)
	lw t0,-24(s0)
	lw t1,-36(s0)
	mv t1,t0
	sw t0,-24(s0)
	sw t1,-36(s0)
	lw t0,-40(s0)
	li t0,4
	sw t0,-40(s0)
	lw t0,-44(s0)
	lw t1,-40(s0)
	addi t0,t1,-4
	sw t0,-44(s0)
	sw t1,-40(s0)
	lw t0,-48(s0)
	lw t1,-44(s0)
	addi t0,t1,4
	sw t0,-48(s0)
	sw t1,-44(s0)
	lw t0,-48(s0)
	mv a0,t0
	sw t0,-48(s0)
	call malloc
	lw t0,-52(s0)
	lw t1,-56(s0)
	addi t0,t1,0
	sw t0,-52(s0)
	sw t1,-56(s0)
	lw t0,-60(s0)
	li t0,4
	sw t0,-60(s0)
	lw t0,-60(s0)
	lw t1,-52(s0)
	mv t1,t0
	sw t0,-60(s0)
	sw t1,-52(s0)
	lw t0,-52(s0)
	lw t1,-64(s0)
	mv t1,t0
	sw t0,-52(s0)
	sw t1,-64(s0)
	call getInt
	lw t0,-68(s0)
	mv a0,t0
	sw t0,-68(s0)
	call toString
	lw t0,-72(s0)
	lw t1,-76(s0)
	mv t1,t0
	sw t0,-72(s0)
	sw t1,-76(s0)
	call __string_length
	lw t0,-80(s0)
	mv a0,t0
	sw t0,-80(s0)
	call toString
	lw t0,-84(s0)
	mv a0,t0
	sw t0,-84(s0)
	call println
	j LBB83
LBB83:
	lw t0,-88(s0)
	mv a0,t0
	sw t0,-88(s0)
	lw s0,152(sp)
	lw ra,156(sp)
	addi sp,sp,160
	ret
# end function : main
