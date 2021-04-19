	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB40:
	sw ra,-4(sp)
	sw s0,-8(sp)
	mv s0,sp
	addi sp,sp,-80
LBB41:
LBB42:
LBB43:
LBB44:
	li a2,0
	and a0,a2,a0
	bnez a0,LBB45
	j LBB46
LBB45:
	li a0,10
	j LBB47
LBB46:
	li a0,20
LBB47:
	li a2,10
	xor a2,a0,a2
	seqz a3,a2
	bnez a3,LBB48
	j LBB49
LBB48:
	li a2,5
	li a1,0
	div a2,a2,a1
	li a1,0
	xor a1,a2,a1
	seqz a1,a1
LBB49:
	and a1,a3,a1
	bnez a1,LBB50
	j LBB51
LBB50:
LBB51:
	andi a2,a1,1
	li a1,1
	xor a1,a1,a2
	bnez a1,LBB53
	j LBB52
LBB52:
	j LBB54
LBB53:
	li a0,30
LBB54:
LBB55:
	addi sp,sp,80
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
