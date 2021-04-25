	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB0:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
LBB1:
	li a0,7053
	call toString
	call println
	li a0,1035
	call toString
	call println
	li a0,7035
	call toString
	call println
	li a0,0
LBB2:
	addi sp,sp,84
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
