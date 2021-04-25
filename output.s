	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB0:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB1:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	foo					# start function : foo
	.p2align	2
foo:
#LBB2:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	mv s0,sp
	addi sp,sp,-92
	mv s4,a0
	mv s3,a1
	mv s2,a2
	li a0,1000
	mul a1,s4,a0
	li a0,10
	mul a0,s3,a0
	add a0,a1,a0
	add a0,a0,s2
	call toString
	call println
	li a0,1
	beq s4,a0,LBB3
	j LBB4
LBB3:
LBB4:
	li a0,1
	mv a1,s2
	mv a2,s3
	call foo
	li a0,1000
	mul a1,s4,a0
	li a0,10
	mul a0,s2,a0
	add a0,a1,a0
	add a0,a0,s3
	call toString
	call println
LBB5:
	mv a0,s1
	addi sp,sp,92
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : foo
	.globl	main					# start function : main
	.p2align	2
main:
#LBB6:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-92
	call __init__
	li a0,7
	li a1,5
	li a2,3
	call foo
	li a0,0
LBB7:
	addi sp,sp,92
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
