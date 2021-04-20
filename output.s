	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB25:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	older.solveAge					# start function : older.solveAge
	.p2align	2
older.solveAge:
#LBB44:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a2,1
	sw a2,0(a0)
LBB45:
	mv a0,a1
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : older.solveAge
	.globl	main					# start function : main
	.p2align	2
main:
#LBB46:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-84
	call __init__
	li a0,4
	call malloc
	addi s1,a0,0
	mv a0,s1
	call older.solveAge
	lw a0,0(s1)
LBB47:
	addi sp,sp,84
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
