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
	slt a2,a0,a2
	bnez a2,LBB43
	j LBB49
LBB43:
LBB44:
	addi a0,a0,1
	addi a1,a1,1
LBB45:
LBB46:
LBB47:
LBB48:
	addi a0,a0,1
	j LBB42
LBB49:
LBB50:
LBB51:
	li a0,1919
LBB52:
	add a1,a1,a0
LBB53:
	li a0,114514
LBB54:
	add a1,a1,a0
	li a0,50997
	sub a0,a1,a0
LBB55:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
N:
	.word	80

