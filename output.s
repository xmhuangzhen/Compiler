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
#LBB44:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	call __init__
	lw t0,1012(s0)
	li t0,13
	sw t0,1012(s0)
	lw t0,1012(s0)
	mv a0,t0
	sw t0,1012(s0)
	call malloc
	lw t0,1008(s0)
	mv t0,a0
	sw t0,1008(s0)
	lw t0,1004(s0)
	lw t1,1008(s0)
	addi t0,t1,0
	sw t0,1004(s0)
	lw t0,1000(s0)
	li t0,10
	sw t0,1000(s0)
	lw t0,1000(s0)
	lw t1,1004(s0)
	sw t0,0(t1)
	lw t0,996(s0)
	li t0,20
	sw t0,996(s0)
	lw t0,996(s0)
	lw t1,1004(s0)
	sw t0,4(t1)
	lw t0,992(s0)
	lw t1,1004(s0)
	lw t0,0(t1)
	sw t0,992(s0)
	lw t0,988(s0)
	lw t1,1004(s0)
	lw t0,4(t1)
	sw t0,988(s0)
	lw t0,984(s0)
	lw t1,988(s0)
	lw t2,992(s0)
	slt t0,t1,t2
	sw t0,984(s0)
	lw t0,984(s0)
	lw t1,1004(s0)
	sw t0,8(t1)
	lw t0,980(s0)
	lw t1,1004(s0)
	lw t0,8(t1)
	sw t0,980(s0)
	lw t0,980(s0)
	bnez t0,LBB46
	j LBB45
	sw t0,980(s0)
LBB45:
	lw t0,976(s0)
	lw t1,1004(s0)
	mv t0,t1
	sw t0,976(s0)
	j LBB48
LBB46:
	lw t0,972(s0)
	lw t1,1004(s0)
	mv t0,t1
	sw t0,972(s0)
	j LBB47
LBB47:
	lw t0,968(s0)
	li t0,40
	sw t0,968(s0)
	lw t0,968(s0)
	lw t1,972(s0)
	sw t0,9(t1)
	lw t0,964(s0)
	lw t1,972(s0)
	mv t0,t1
	sw t0,964(s0)
	j LBB49
LBB48:
	lw t0,960(s0)
	li t0,80
	sw t0,960(s0)
	lw t0,960(s0)
	lw t1,976(s0)
	sw t0,9(t1)
	lw t0,964(s0)
	lw t1,976(s0)
	mv t0,t1
	sw t0,964(s0)
	j LBB49
LBB49:
	lw t0,956(s0)
	lw t1,964(s0)
	lw t0,0(t1)
	sw t0,956(s0)
	lw t0,952(s0)
	lw t1,964(s0)
	lw t0,4(t1)
	sw t0,952(s0)
	lw t0,948(s0)
	lw t1,956(s0)
	lw t2,952(s0)
	add t0,t1,t2
	sw t0,948(s0)
	lw t0,944(s0)
	lw t1,964(s0)
	lw t0,9(t1)
	sw t0,944(s0)
	lw t0,940(s0)
	lw t1,948(s0)
	lw t2,944(s0)
	add t0,t1,t2
	sw t0,940(s0)
	lw t0,936(s0)
	lw t1,940(s0)
	mv t0,t1
	sw t0,936(s0)
	lw t0,932(s0)
	lw t1,964(s0)
	mv t0,t1
	sw t0,932(s0)
	j LBB50
LBB50:
	lw t0,936(s0)
	mv a0,t0
	sw t0,936(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
