	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB40:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
LBB41:
	li a0,40004
	call malloc
	li a1,10000
	sw a1,0(a0)
	addi a0,a0,4
	addi a5,a0,0
	li a0,0
LBB42:
	li a1,10
	blt a0,a1,LBB43
	j LBB53
LBB43:
	li a1,1000
	mul t1,a0,a1
	li a1,0
LBB44:
	li a2,10
	blt a1,a2,LBB45
	j LBB52
LBB45:
	li a2,100
	mul a2,a1,a2
	add t0,t1,a2
	li a2,0
LBB46:
	li a3,10
	blt a2,a3,LBB47
	j LBB51
LBB47:
	li a3,10
	mul a3,a2,a3
	add a7,t0,a3
	li a3,0
LBB48:
	li a4,10
	blt a3,a4,LBB49
	j LBB50
LBB49:
	add a4,a7,a3
	slli a4,a4,2
	add a6,a5,a4
	add a4,a0,a3
	sw a4,0(a6)
	addi a3,a3,1
	j LBB48
LBB50:
	addi a2,a2,1
	j LBB46
LBB51:
	addi a1,a1,1
	j LBB44
LBB52:
	addi a0,a0,1
	j LBB42
LBB53:
	li a1,0
	li a0,0
LBB54:
	li a2,10
	blt a1,a2,LBB55
	j LBB68
LBB55:
	li a2,1000
	mul a6,a1,a2
	li a2,0
LBB56:
	li a3,10
	blt a2,a3,LBB57
	j LBB67
LBB57:
	li a3,100
	mul a3,a2,a3
	add a7,a6,a3
	li a3,0
LBB58:
	li a4,10
	blt a3,a4,LBB59
	j LBB66
LBB59:
	li a4,10
	mul a4,a3,a4
	add t2,a7,a4
	li a4,0
LBB60:
	li t0,10
	blt a4,t0,LBB61
	j LBB65
LBB61:
	andi t1,a4,1
	li t0,1
	beq t1,t0,LBB62
	j LBB63
LBB62:
	add t0,t2,a4
	slli t0,t0,2
	add t0,a5,t0
	lw t0,0(t0)
	add a0,a0,t0
	j LBB64
LBB63:
	add t0,t2,a4
	slli t0,t0,2
	add t0,a5,t0
	lw t0,0(t0)
	sub a0,a0,t0
LBB64:
	addi a4,a4,1
	j LBB60
LBB65:
	addi a3,a3,1
	j LBB58
LBB66:
	addi a2,a2,1
	j LBB56
LBB67:
	addi a1,a1,1
	j LBB54
LBB68:
	li a1,5000
	xor a0,a0,a1
LBB69:
	addi sp,sp,84
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
