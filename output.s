	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB40:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB41:
	li a1,1
	lui a0,%hi(N)
	sw a1,%lo(N)(a0)
LBB42:
LBB43:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
LBB44:
LBB45:
LBB46:
	addi a0,a0,1
LBB47:
LBB48:
LBB49:
	addi a0,a0,1
LBB50:
LBB51:
LBB52:
LBB53:
LBB54:
LBB55:
	addi a0,a0,1
LBB56:
LBB57:
LBB58:
	addi a0,a0,1
LBB59:
LBB60:
LBB61:
LBB62:
LBB63:
LBB64:
	addi a0,a0,-3
LBB65:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
N:
	.word	1

