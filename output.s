	.text
	.globl	test					# start function : test
	.p2align	2
test:
#LBB40:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
	li a0,40004
	call malloc
	li a1,10000
	sw a1,0(a0)
	addi a0,a0,4
	addi a5,a0,0
	li a0,0
LBB41:
	li a1,10
	slt a1,a0,a1
	bnez a1,LBB42
	j LBB52
LBB42:
	li a1,1000
	mul a4,a0,a1
	li a1,0
LBB43:
	li a2,10
	slt a2,a1,a2
	bnez a2,LBB44
	j LBB51
LBB44:
	li a2,100
	mul a2,a1,a2
	add t1,a4,a2
	li a2,0
LBB45:
	li a3,10
	slt a3,a2,a3
	bnez a3,LBB46
	j LBB50
LBB46:
	li a3,10
	mul a3,a2,a3
	add t0,t1,a3
	li a3,0
LBB47:
	li a6,10
	slt a6,a3,a6
	bnez a6,LBB48
	j LBB49
LBB48:
	add a6,t0,a3
	slli a6,a6,2
	add a7,a5,a6
	add a6,a0,a3
	sw a6,0(a7)
	addi a3,a3,1
	j LBB47
LBB49:
	addi a2,a2,1
	j LBB45
LBB50:
	addi a1,a1,1
	j LBB43
LBB51:
	addi a0,a0,1
	j LBB41
LBB52:
	li a1,0
	li a0,0
LBB53:
	li a2,10
	slt a2,a1,a2
	bnez a2,LBB54
	j LBB67
LBB54:
	li a2,1000
	mul a6,a1,a2
	li a2,0
LBB55:
	li a3,10
	slt a3,a2,a3
	bnez a3,LBB56
	j LBB66
LBB56:
	li a3,100
	mul a3,a2,a3
	add a7,a6,a3
	li a3,0
LBB57:
	li a4,10
	slt a4,a3,a4
	bnez a4,LBB58
	j LBB65
LBB58:
	li a4,10
	mul a4,a3,a4
	add t0,a7,a4
	li a4,0
LBB59:
	li t1,10
	slt t1,a4,t1
	bnez t1,LBB60
	j LBB64
LBB60:
	andi t2,a4,1
	li t1,1
	xor t1,t2,t1
	seqz t1,t1
	bnez t1,LBB61
	j LBB62
LBB61:
	add t1,t0,a4
	slli t1,t1,2
	add t1,a5,t1
	lw t1,0(t1)
	add a0,a0,t1
	j LBB63
LBB62:
	add t1,t0,a4
	slli t1,t1,2
	add t1,a5,t1
	lw t1,0(t1)
	sub a0,a0,t1
LBB63:
	addi a4,a4,1
	j LBB59
LBB64:
	addi a3,a3,1
	j LBB57
LBB65:
	addi a2,a2,1
	j LBB55
LBB66:
	addi a1,a1,1
	j LBB53
LBB67:
LBB68:
	addi sp,sp,84
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB69:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB70:
	call test
	li a1,5000
	xor a0,a0,a1
LBB71:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
