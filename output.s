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
	.globl	main					# start function : main
	.p2align	2
main:
#LBB42:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	call __init__
	lw t0,1012(s0)
	lw t1,1008(s0)
	mv t0,t1
	sw t0,1012(s0)
	lw t0,1004(s0)
	lw t1,1012(s0)
	addi t0,t1,1
	sw t0,1004(s0)
	lw t0,1000(s0)
	lw t1,1004(s0)
	addi t0,t1,1
	sw t0,1000(s0)
	j LBB43
LBB43:
	lw t0,996(s0)
	mv a0,t0
	sw t0,996(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
