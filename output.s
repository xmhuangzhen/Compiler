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
	lw t0,-20(s0)
	mv t0,zero
	sw t0,-20(s0)
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
	lw t0,-16(s0)
	mv t0,a0
	sw t0,-16(s0)
	j LBB77
LBB77:
	lw t0,-20(s0)
	mv a0,t0
	sw t0,-20(s0)
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : B.t
	.globl	main					# start function : main
	.p2align	2
main:
#LBB81:
	addi sp,sp,-176
	sw ra,172(sp)
	sw s0,168(sp)
	addi s0,sp,176
	call __init__
	lw t0,-12(s0)
	li t0,1
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
	li t0,1
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
	li t0,4
	sw t0,-44(s0)
	lw t0,-48(s0)
	li t0,4
	sw t0,-48(s0)
	lw t0,-52(s0)
	lw t1,-44(s0)
	lw t2,-48(s0)
	mul t0,t1,t2
	sw t0,-52(s0)
	sw t1,-44(s0)
	sw t2,-48(s0)
	lw t0,-56(s0)
	lw t1,-52(s0)
	addi t0,t1,4
	sw t0,-56(s0)
	sw t1,-52(s0)
	lw t0,-56(s0)
	mv a0,t0
	sw t0,-56(s0)
	call malloc
	lw t0,-60(s0)
	mv t0,a0
	sw t0,-60(s0)
	lw t0,-64(s0)
	li t0,4
	sw t0,-64(s0)
	lw t0,-64(s0)
	lw t1,-60(s0)
	sw t0,0(t1)
	sw t0,-64(s0)
	sw t1,-60(s0)
	lw t0,-68(s0)
	lw t1,-60(s0)
	addi t0,t1,4
	sw t0,-68(s0)
	sw t1,-60(s0)
	lw t0,-72(s0)
	lw t1,-68(s0)
	mv t0,t1
	sw t0,-72(s0)
	sw t1,-68(s0)
	lw t0,-76(s0)
	lw t1,-80(s0)
	mv t0,t1
	sw t0,-76(s0)
	sw t1,-80(s0)
	call getInt
	lw t0,-84(s0)
	mv t0,a0
	sw t0,-84(s0)
	lw t0,-84(s0)
	mv a0,t0
	sw t0,-84(s0)
	call toString
	lw t0,-88(s0)
	mv t0,a0
	sw t0,-88(s0)
	lw t0,-80(s0)
	lw t1,-88(s0)
	mv t0,t1
	sw t0,-80(s0)
	sw t1,-88(s0)
	lw t0,-92(s0)
	lw t1,-80(s0)
	mv t0,t1
	sw t0,-92(s0)
	sw t1,-80(s0)
	call __string_length
	lw t0,-96(s0)
	mv t0,a0
	sw t0,-96(s0)
	lw t0,-96(s0)
	mv a0,t0
	sw t0,-96(s0)
	call toString
	lw t0,-100(s0)
	mv t0,a0
	sw t0,-100(s0)
	lw t0,-100(s0)
	mv a0,t0
	sw t0,-100(s0)
	call println
	j LBB83
LBB83:
	lw t0,-104(s0)
	mv a0,t0
	sw t0,-104(s0)
	lw s0,168(sp)
	lw ra,172(sp)
	addi sp,sp,176
	ret
# end function : main
.section	.sdata,"aw",@progbits
