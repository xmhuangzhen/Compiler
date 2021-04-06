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
	.globl	B.B					# start function : B.B
	.p2align	2
B.B:
#LBB44:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	lw t0,1012(s0)
	mv t0,a0
	sw t0,1012(s0)
	j LBB45
	j LBB45
LBB45:
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : B.B
	.globl	C.func					# start function : C.func
	.p2align	2
C.func:
#LBB48:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	lw t0,1012(s0)
	mv t0,a0
	sw t0,1012(s0)
	lw t0,1008(s0)
	li t0,93
	sw t0,1008(s0)
	lw t0,1004(s0)
	lw t1,1008(s0)
	mv t0,t1
	sw t0,1004(s0)
	j LBB49
	j LBB49
LBB49:
	lw t0,1004(s0)
	mv a0,t0
	sw t0,1004(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : C.func
	.globl	main					# start function : main
	.p2align	2
main:
#LBB50:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	call __init__
	j LBB51
LBB51:
	lw t0,1012(s0)
	mv a0,t0
	sw t0,1012(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : main
	.globl	func					# start function : func
	.p2align	2
func:
#LBB52:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	lw t0,1012(s0)
	li t0,0
	sw t0,1012(s0)
	lw t0,1012(s0)
	bnez t0,LBB60
	j LBB53
	sw t0,1012(s0)
LBB53:
	j LBB54
LBB54:
	lw t0,1008(s0)
	li t0,1
	sw t0,1008(s0)
	lw t0,1008(s0)
	bnez t0,LBB55
	j LBB56
	sw t0,1008(s0)
LBB56:
	j LBB57
LBB57:
	j LBB57
LBB58:
	j LBB59
	li %8,10
	li %9,4
	mul %7,%8,%9
	addi %10,%7,4
	mv a0,%10
	call malloc
	mv %11,a0
	li %12,10
	sw %12,0(%11)
	addi %13,%11,4
	addi %14,%13,0
	li %15,0
	mv a0,%15
	call malloc
	mv %16,a0
	addi %17,%16,0
	mv a0,%17
	call C.func
	mv %18,a0
	li %19,0
	mv a0,%19
	call malloc
	mv %20,a0
	addi %21,%20,0
	mv a0,%21
	call C.func
	mv %22,a0
	add %23,%18,%22
	j LBB59
LBB59:
	lw t0,1004(s0)
	mv a0,t0
	sw t0,1004(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : func
.section	.sdata,"aw",@progbits
