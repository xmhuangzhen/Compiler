	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB63:
	addi sp,sp,-80
	sw ra,76(sp)
	sw s0,72(sp)
	addi s0,sp,80
	lw t0,-12(s0)
	lui t0,%hi(a)
	sw t0,-12(s0)
	lw t0,-16(s0)
	lw t1,-12(s0)
	lw t0,%lo(a)(t1)
	sw t0,-16(s0)
	sw t1,-12(s0)
	lw t0,-16(s0)
	lw t1,-20(s0)
	mv t1,t0
	sw t0,-16(s0)
	sw t1,-20(s0)
	j LBB64
LBB64:
	j LBB65
LBB65:
	lw t0,-20(s0)
	mv a0,t0
	sw t0,-20(s0)
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
a:
	.word	1

