	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB0:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
LBB1:
	li a0,40004
	call malloc
	li a1,10000
	sw a1,0(a0)
	addi a0,a0,4
	addi a5,a0,0
	li a0,0
LBB2:
	li a1,10
	blt a0,a1,LBB3
	j LBB4
LBB3:
	li a1,1000
	mul t1,a0,a1
	li a1,0
LBB5:
	li a2,10
	blt a1,a2,LBB6
	j LBB7
LBB6:
	li a2,100
	mul a2,a1,a2
	add t0,t1,a2
	li a2,0
LBB8:
	li a3,10
	blt a2,a3,LBB9
	j LBB10
LBB9:
	li a3,10
	mul a3,a2,a3
	add a7,t0,a3
	li a3,0
LBB11:
	li a4,10
	blt a3,a4,LBB12
	j LBB13
LBB12:
	add a4,a7,a3
	slli a4,a4,2
	add a6,a5,a4
	add a4,a0,a3
	sw a4,0(a6)
	addi a3,a3,1
	j LBB11
LBB13:
	addi a2,a2,1
	j LBB8
LBB10:
	addi a1,a1,1
	j LBB5
LBB7:
	addi a0,a0,1
	j LBB2
LBB4:
	li a1,0
	li a0,0
LBB14:
	li a2,10
	blt a1,a2,LBB15
	j LBB16
LBB15:
	li a2,1000
	mul a6,a1,a2
	li a2,0
LBB17:
	li a3,10
	blt a2,a3,LBB18
	j LBB19
LBB18:
	li a3,100
	mul a3,a2,a3
	add a7,a6,a3
	li a3,0
LBB20:
	li a4,10
	blt a3,a4,LBB21
	j LBB22
LBB21:
	li a4,10
	mul a4,a3,a4
	add t2,a7,a4
	li a4,0
LBB23:
	li t0,10
	blt a4,t0,LBB24
	j LBB25
LBB24:
	andi t1,a4,1
	li t0,1
	beq t1,t0,LBB26
	j LBB27
LBB26:
	add t0,t2,a4
	slli t0,t0,2
	add t0,a5,t0
	lw t0,0(t0)
	add a0,a0,t0
	j LBB28
LBB27:
	add t0,t2,a4
	slli t0,t0,2
	add t0,a5,t0
	lw t0,0(t0)
	sub a0,a0,t0
LBB28:
	addi a4,a4,1
	j LBB23
LBB25:
	addi a3,a3,1
	j LBB20
LBB22:
	addi a2,a2,1
	j LBB17
LBB19:
	addi a1,a1,1
	j LBB14
LBB16:
	li a1,5000
	xor a0,a0,a1
LBB29:
	addi sp,sp,84
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
