	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB40:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB41:
	li a0,30
LBB42:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
