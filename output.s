	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB40:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB41:
	li a1,80
	lui a0,%hi(N)
	sw a1,%lo(N)(a0)
	li a1,0
	li a0,0
LBB42:
	li a2,200
	blt a1,a2,LBB43
	j LBB44
LBB43:
	addi a1,a1,1
	addi a0,a0,1
	addi a1,a1,1
	j LBB42
LBB44:
	li a1,65436
	add a0,a0,a1
LBB45:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
N:
	.word	80

