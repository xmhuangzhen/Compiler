	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB0:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB1:
	li a0,30
LBB2:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
