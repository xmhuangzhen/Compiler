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
	lui t1,%hi(a)
	lw t2,%lo(a)(t1)
	addi t0,t2,1
	sw t0,-12(s0)
	lui t1,%hi(a)
	sw t2,%lo(a)(t1)
	lw t0,-12(s0)
	lui t1,%hi(a)
	lw t2,%lo(a)(t1)
	mv t2,t0
	sw t0,-12(s0)
	lui t1,%hi(a)
	sw t2,%lo(a)(t1)
	lui t0,%hi(a)
	lw t1,%lo(a)(t0)
	lw t2,-20(s0)
	mv t2,t1
	lui t0,%hi(a)
	sw t1,%lo(a)(t0)
	sw t2,-20(s0)
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

