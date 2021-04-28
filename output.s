	.text
	.globl	Heap_Node.pop					# start function : Heap_Node.pop
	.p2align	2
Heap_Node.pop:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-88
	addi a1,a0,0
	lw a1,0(a1)
LBB1:
	addi a1,a1,0
	lw a1,0(a1)
	addi a1,a1,0
	lw s1,0(a1)
	addi a1,a0,0
	lw a2,0(a1)
	addi a1,a0,0
	lw a1,0(a1)
	lw a1,4(a1)
	addi a1,a1,-1
	addi a3,a2,0
	lw a3,0(a3)
	addi a3,a3,0
	lw a6,0(a3)
	addi a3,a2,0
	lw a3,0(a3)
	addi a5,a3,0
	addi a3,a2,0
	lw a4,0(a3)
	slli a3,a1,2
	add a3,a4,a3
	lw a3,0(a3)
	sw a3,0(a5)
	addi a2,a2,0
	lw a2,0(a2)
	slli a1,a1,2
	add a1,a2,a1
	sw a6,0(a1)
	addi a1,a0,0
	lw a1,0(a1)
	lw a2,4(a1)
	addi a2,a2,-1
	sw a2,4(a1)
	addi a1,a0,0
	lw a1,0(a1)
	lw a1,4(a1)
	li a2,1
	blt a2,a1,LBB2
LBB3:
	li a2,0
LBB4:
	addi a1,a0,0
	lw a1,0(a1)
	lw a1,4(a1)
	li a3,2
	blt a3,a1,LBB7
LBB8:
LBB9:
	li a1,0
	beq a2,a1,LBB12
LBB13:
	addi a1,a0,0
	lw a1,0(a1)
	addi a3,a1,0
	lw a3,0(a3)
	addi a3,a3,0
	lw a6,0(a3)
	addi a3,a1,0
	lw a3,0(a3)
	addi a5,a3,0
	addi a3,a1,0
	lw a4,0(a3)
	slli a3,a2,2
	add a3,a4,a3
	lw a3,0(a3)
	sw a3,0(a5)
	addi a1,a1,0
	lw a3,0(a1)
	slli a1,a2,2
	add a1,a3,a1
	sw a6,0(a1)
	li a1,2
	mul a1,a2,a1
	addi a3,a1,1
	li a1,2
	mul a1,a2,a1
	addi a1,a1,2
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a3,a4,LBB15
LBB16:
	mv a3,a2
LBB17:
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a1,a4,LBB20
LBB21:
LBB22:
	beq a3,a2,LBB25
LBB26:
	addi a1,a0,0
	lw a1,0(a1)
	addi a4,a1,0
	lw a5,0(a4)
	slli a4,a2,2
	add a4,a5,a4
	lw a6,0(a4)
	addi a4,a1,0
	lw a4,0(a4)
	slli a2,a2,2
	add a5,a4,a2
	addi a2,a1,0
	lw a4,0(a2)
	slli a2,a3,2
	add a2,a4,a2
	lw a2,0(a2)
	sw a2,0(a5)
	addi a1,a1,0
	lw a2,0(a1)
	slli a1,a3,2
	add a1,a2,a1
	sw a6,0(a1)
	li a1,2
	mul a1,a3,a1
	addi a1,a1,1
	li a2,2
	mul a2,a3,a2
	addi a2,a2,2
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a1,a4,LBB28
LBB29:
	mv a1,a3
LBB30:
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a2,a4,LBB33
LBB34:
LBB35:
	beq a1,a3,LBB38
LBB39:
	addi a2,a0,0
	lw a2,0(a2)
	addi a4,a2,0
	lw a5,0(a4)
	slli a4,a3,2
	add a4,a5,a4
	lw a6,0(a4)
	addi a4,a2,0
	lw a4,0(a4)
	slli a3,a3,2
	add a5,a4,a3
	addi a3,a2,0
	lw a4,0(a3)
	slli a3,a1,2
	add a3,a4,a3
	lw a3,0(a3)
	sw a3,0(a5)
	addi a2,a2,0
	lw a3,0(a2)
	slli a2,a1,2
	add a2,a3,a2
	sw a6,0(a2)
	call Heap_Node.maxHeapify
LBB40:
LBB27:
LBB14:
LBB41:
	mv a0,s1
	addi sp,sp,88
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB38:
	j LBB40
LBB33:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a2,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a1,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB36
LBB37:
	j LBB35
LBB36:
	mv a1,a2
	j LBB35
LBB28:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a1,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a3,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB31
LBB32:
	mv a1,a3
	j LBB30
LBB31:
	j LBB30
LBB25:
	j LBB27
LBB20:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a1,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a3,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB23
LBB24:
	j LBB22
LBB23:
	mv a3,a1
	j LBB22
LBB15:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a3,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a2,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB18
LBB19:
	mv a3,a2
	j LBB17
LBB18:
	j LBB17
LBB12:
	j LBB14
LBB7:
	addi a1,a0,0
	lw a1,0(a1)
	addi a1,a1,0
	lw a1,0(a1)
	addi a1,a1,8
	lw a1,0(a1)
	lw a3,4(a1)
	li a1,0
	sub a1,a1,a3
	addi a3,a0,0
	lw a3,0(a3)
	addi a3,a3,0
	lw a4,0(a3)
	slli a3,a2,2
	add a3,a4,a3
	lw a3,0(a3)
	lw a4,4(a3)
	li a3,0
	sub a3,a3,a4
	bgt a1,a3,LBB10
LBB11:
	j LBB9
LBB10:
	li a2,2
	j LBB9
LBB2:
	addi a1,a0,0
	lw a1,0(a1)
	addi a1,a1,0
	lw a1,0(a1)
	addi a1,a1,4
	lw a1,0(a1)
	lw a2,4(a1)
	li a1,0
	sub a1,a1,a2
	addi a2,a0,0
	lw a2,0(a2)
	addi a2,a2,0
	lw a2,0(a2)
	addi a2,a2,0
	lw a2,0(a2)
	lw a3,4(a2)
	li a2,0
	sub a2,a2,a3
	bgt a1,a2,LBB5
LBB6:
	li a2,0
	j LBB4
LBB5:
	li a2,1
	j LBB4
# end function : Heap_Node.pop
	.globl	Heap_Node.maxHeapify					# start function : Heap_Node.maxHeapify
	.p2align	2
Heap_Node.maxHeapify:
#LBB42:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-88
LBB43:
	li a2,2
	mul a2,a1,a2
	addi a3,a2,1
	li a2,2
	mul a2,a1,a2
	addi a2,a2,2
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a3,a4,LBB44
LBB45:
	mv a3,a1
LBB46:
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a2,a4,LBB49
LBB50:
LBB51:
	beq a3,a1,LBB54
LBB55:
	addi a2,a0,0
	lw a2,0(a2)
	addi a4,a2,0
	lw a5,0(a4)
	slli a4,a1,2
	add a4,a5,a4
	lw a6,0(a4)
	addi a4,a2,0
	lw a4,0(a4)
	slli a1,a1,2
	add a5,a4,a1
	addi a1,a2,0
	lw a4,0(a1)
	slli a1,a3,2
	add a1,a4,a1
	lw a1,0(a1)
	sw a1,0(a5)
	addi a1,a2,0
	lw a2,0(a1)
	slli a1,a3,2
	add a1,a2,a1
	sw a6,0(a1)
	li a1,2
	mul a1,a3,a1
	addi a2,a1,1
	li a1,2
	mul a1,a3,a1
	addi a1,a1,2
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a2,a4,LBB57
LBB58:
	mv a2,a3
LBB59:
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a1,a4,LBB62
LBB63:
LBB64:
	beq a2,a3,LBB67
LBB68:
	addi a1,a0,0
	lw a1,0(a1)
	addi a4,a1,0
	lw a5,0(a4)
	slli a4,a3,2
	add a4,a5,a4
	lw a6,0(a4)
	addi a4,a1,0
	lw a4,0(a4)
	slli a3,a3,2
	add a5,a4,a3
	addi a3,a1,0
	lw a4,0(a3)
	slli a3,a2,2
	add a3,a4,a3
	lw a3,0(a3)
	sw a3,0(a5)
	addi a1,a1,0
	lw a3,0(a1)
	slli a1,a2,2
	add a1,a3,a1
	sw a6,0(a1)
	li a1,2
	mul a1,a2,a1
	addi a3,a1,1
	li a1,2
	mul a1,a2,a1
	addi a1,a1,2
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a3,a4,LBB70
LBB71:
	mv a3,a2
LBB72:
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a1,a4,LBB75
LBB76:
LBB77:
	beq a3,a2,LBB80
LBB81:
	addi a1,a0,0
	lw a1,0(a1)
	addi a4,a1,0
	lw a5,0(a4)
	slli a4,a2,2
	add a4,a5,a4
	lw a6,0(a4)
	addi a4,a1,0
	lw a4,0(a4)
	slli a2,a2,2
	add a5,a4,a2
	addi a2,a1,0
	lw a4,0(a2)
	slli a2,a3,2
	add a2,a4,a2
	lw a2,0(a2)
	sw a2,0(a5)
	addi a1,a1,0
	lw a2,0(a1)
	slli a1,a3,2
	add a1,a2,a1
	sw a6,0(a1)
	li a1,2
	mul a1,a3,a1
	addi a1,a1,1
	li a2,2
	mul a2,a3,a2
	addi a2,a2,2
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a1,a4,LBB83
LBB84:
	mv a1,a3
LBB85:
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a2,a4,LBB88
LBB89:
LBB90:
	beq a1,a3,LBB93
LBB94:
	addi a2,a0,0
	lw a2,0(a2)
	addi a4,a2,0
	lw a5,0(a4)
	slli a4,a3,2
	add a4,a5,a4
	lw a6,0(a4)
	addi a4,a2,0
	lw a4,0(a4)
	slli a3,a3,2
	add a5,a4,a3
	addi a3,a2,0
	lw a4,0(a3)
	slli a3,a1,2
	add a3,a4,a3
	lw a3,0(a3)
	sw a3,0(a5)
	addi a2,a2,0
	lw a3,0(a2)
	slli a2,a1,2
	add a2,a3,a2
	sw a6,0(a2)
	call Heap_Node.maxHeapify
LBB95:
LBB82:
LBB69:
LBB56:
	mv a0,s1
	addi sp,sp,88
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB93:
	j LBB95
LBB88:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a2,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a1,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB91
LBB92:
	j LBB90
LBB91:
	mv a1,a2
	j LBB90
LBB83:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a1,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a3,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB86
LBB87:
	mv a1,a3
	j LBB85
LBB86:
	j LBB85
LBB80:
	j LBB82
LBB75:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a1,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a3,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB78
LBB79:
	j LBB77
LBB78:
	mv a3,a1
	j LBB77
LBB70:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a3,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a2,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB73
LBB74:
	mv a3,a2
	j LBB72
LBB73:
	j LBB72
LBB67:
	j LBB69
LBB62:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a1,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a2,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB65
LBB66:
	j LBB64
LBB65:
	mv a2,a1
	j LBB64
LBB57:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a2,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a3,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB60
LBB61:
	mv a2,a3
	j LBB59
LBB60:
	j LBB59
LBB54:
	j LBB56
LBB49:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a2,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a3,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB52
LBB53:
	j LBB51
LBB52:
	mv a3,a2
	j LBB51
LBB44:
	addi a4,a0,0
	lw a4,0(a4)
	addi a4,a4,0
	lw a5,0(a4)
	slli a4,a3,2
	add a4,a5,a4
	lw a4,0(a4)
	lw a5,4(a4)
	li a4,0
	sub a4,a4,a5
	addi a5,a0,0
	lw a5,0(a5)
	addi a5,a5,0
	lw a6,0(a5)
	slli a5,a1,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB47
LBB48:
	mv a3,a1
	j LBB46
LBB47:
	j LBB46
# end function : Heap_Node.maxHeapify
	.globl	main					# start function : main
	.p2align	2
main:
#LBB96:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-84
LBB97:
	call getInt
	mv s1,a0
	call getInt
	mv s2,a0
	li a0,16
	call malloc
	addi s3,a0,0
	addi s5,s3,0
	li a0,4
	mul a0,s2,a0
	addi s4,a0,4
	mv a0,s4
	call malloc
	sw s2,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s5)
	addi s5,s3,4
	mv a0,s4
	call malloc
	sw s2,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s5)
	addi s4,s3,8
	li a0,4
	mul a0,s1,a0
	addi a0,a0,4
	call malloc
	sw s1,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s4)
	lui a0,%hi(n)
	sw s1,%lo(n)(a0)
	lui a0,%hi(m)
	sw s2,%lo(m)(a0)
	lui a0,%hi(g)
	sw s3,%lo(g)(a0)
	li a1,10000000
	lui a0,%hi(INF)
	sw a1,%lo(INF)(a0)
	li a0,0
LBB98:
	blt a0,s2,LBB99
LBB100:
	li a0,0
LBB101:
	blt a0,s1,LBB102
LBB103:
	li a0,0
	sw a0,12(s3)
	li s5,0
LBB104:
	lui a0,%hi(m)
	lw a0,%lo(m)(a0)
	blt s5,a0,LBB105
LBB106:
	li a0,0
	mv s8,a0
LBB107:
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
	blt s8,a0,LBB108
LBB109:
	li a0,0
LBB150:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB108:
	mv s2,s8
	lui a0,%hi(n)
	lw s3,%lo(n)(a0)
	li a0,4
	mul a0,s3,a0
	addi s1,a0,4
	mv a0,s1
	call malloc
	sw s3,0(a0)
	addi a0,a0,4
	addi s7,a0,0
	mv a0,s1
	call malloc
	sw s3,0(a0)
	addi a0,a0,4
	addi s4,a0,0
	li a0,0
LBB110:
	lui a1,%hi(n)
	lw a1,%lo(n)(a1)
	blt a0,a1,LBB111
LBB112:
	slli a0,s2,2
	add a1,s4,a0
	li a0,0
	sw a0,0(a1)
	li a0,4
	call malloc
	addi s1,a0,0
	mv a0,s1
	addi s5,a0,0
	li a0,8
	call malloc
	addi s3,a0,0
	li a0,0
	sw a0,4(s3)
	addi s6,s3,0
	li a0,68
	call malloc
	li a1,16
	sw a1,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s6)
	sw s3,0(s5)
	li a0,8
	call malloc
	addi a1,a0,0
	li a0,0
	sw a0,4(a1)
	sw s2,0(a1)
	addi a0,s1,0
	lw a0,0(a0)
	mv s2,a0
	mv s10,a1
	mv a0,s2
	lw a0,4(a0)
	addi a1,s2,0
	lw a1,0(a1)
	addi a1,a1,-4
	lw a1,0(a1)
	beq a0,a1,LBB113
LBB114:
	addi a0,s2,0
	lw a1,0(a0)
	lw a0,4(s2)
	slli a0,a0,2
	add a0,a1,a0
	sw s10,0(a0)
	lw a0,4(s2)
	addi a0,a0,1
	sw a0,4(s2)
	mv a0,s1
	addi a0,a0,0
	lw a0,0(a0)
	lw a0,4(a0)
	addi a2,a0,-1
LBB118:
	li a0,0
	bgt a2,a0,LBB119
LBB120:
LBB123:
	mv a0,s1
	addi a0,a0,0
	lw a0,0(a0)
	lw a0,4(a0)
	li a1,0
	bne a0,a1,LBB124
LBB125:
	mv s1,s4
	li s2,0
LBB144:
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
	blt s2,a0,LBB145
LBB146:
	la a0,const_string_no2
	call println
	addi a0,s8,1
	mv s8,a0
	j LBB107
LBB145:
	slli a0,s2,2
	add a0,s1,a0
	lw a1,0(a0)
	lui a0,%hi(INF)
	lw a0,%lo(INF)(a0)
	beq a1,a0,LBB147
LBB148:
	slli a0,s2,2
	add a0,s1,a0
	lw a0,0(a0)
	call toString
	call print
LBB149:
	la a0,const_string_no1
	call print
	addi s2,s2,1
	j LBB144
LBB147:
	la a0,const_string_no0
	call print
	j LBB149
LBB124:
	mv a0,s1
	call Heap_Node.pop
	lw s3,0(a0)
	slli a0,s3,2
	add a0,s7,a0
	lw a1,0(a0)
	li a0,1
	beq a1,a0,LBB126
LBB127:
	slli a0,s3,2
	add a1,s7,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	addi a0,a0,8
	lw a1,0(a0)
	slli a0,s3,2
	add a0,a1,a0
	lw a0,0(a0)
	mv s6,a0
LBB128:
	li a0,-1
	bne s6,a0,LBB129
LBB130:
	j LBB123
LBB129:
	lui a0,%hi(g)
	lw a2,%lo(g)(a0)
	addi a0,a2,0
	lw a1,0(a0)
	slli a0,s6,2
	add a0,a1,a0
	lw a0,0(a0)
	lw s2,4(a0)
	addi a0,a2,0
	lw a1,0(a0)
	slli a0,s6,2
	add a0,a1,a0
	lw a0,0(a0)
	lw a1,8(a0)
	slli a0,s3,2
	add a0,s4,a0
	lw a0,0(a0)
	add a1,a0,a1
	slli a0,s2,2
	add a0,s4,a0
	lw a0,0(a0)
	bge a1,a0,LBB131
LBB132:
	slli a0,s2,2
	add a0,s4,a0
	sw a1,0(a0)
	li a0,8
	call malloc
	addi a1,a0,0
	sw s2,0(a1)
	slli a0,s2,2
	add a0,s4,a0
	lw a0,0(a0)
	sw a0,4(a1)
	addi a0,s1,0
	lw a0,0(a0)
	mv s2,a0
	sw a1,-56(s0)
	mv a0,s2
	lw a0,4(a0)
	addi a1,s2,0
	lw a1,0(a1)
	addi a1,a1,-4
	lw a1,0(a1)
	beq a0,a1,LBB134
LBB135:
	addi a0,s2,0
	lw a1,0(a0)
	lw a0,4(s2)
	slli a0,a0,2
	add a1,a1,a0
	lw a0,-56(s0)
	sw a0,0(a1)
	lw a0,4(s2)
	addi a0,a0,1
	sw a0,4(s2)
	mv a0,s1
	addi a0,a0,0
	lw a0,0(a0)
	lw a0,4(a0)
	addi a2,a0,-1
LBB139:
	li a0,0
	bgt a2,a0,LBB140
LBB141:
LBB133:
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	slli a0,s6,2
	add a0,a1,a0
	lw a0,0(a0)
	mv s6,a0
	j LBB128
LBB140:
	addi a1,a2,-1
	li a0,2
	div a1,a1,a0
	addi a0,s1,0
	lw a0,0(a0)
	addi a0,a0,0
	lw a3,0(a0)
	slli a0,a1,2
	add a0,a3,a0
	lw a0,0(a0)
	lw a3,4(a0)
	li a0,0
	sub a0,a0,a3
	addi a3,s1,0
	lw a3,0(a3)
	addi a3,a3,0
	lw a4,0(a3)
	slli a3,a2,2
	add a3,a4,a3
	lw a3,0(a3)
	lw a4,4(a3)
	li a3,0
	sub a3,a3,a4
	bge a0,a3,LBB142
LBB143:
	addi a0,s1,0
	lw a0,0(a0)
	addi a3,a0,0
	lw a4,0(a3)
	slli a3,a1,2
	add a3,a4,a3
	lw a6,0(a3)
	addi a3,a0,0
	lw a4,0(a3)
	slli a3,a1,2
	add a5,a4,a3
	addi a3,a0,0
	lw a4,0(a3)
	slli a3,a2,2
	add a3,a4,a3
	lw a3,0(a3)
	sw a3,0(a5)
	addi a0,a0,0
	lw a3,0(a0)
	slli a0,a2,2
	add a0,a3,a0
	sw a6,0(a0)
	mv a2,a1
	j LBB139
LBB142:
	j LBB141
LBB134:
	addi a0,s2,0
	lw s10,0(a0)
	lw s5,4(s2)
	addi s11,s2,0
	addi a0,s10,-4
	lw a1,0(a0)
	li a0,2
	mul s9,a1,a0
	li a0,4
	mul a0,s9,a0
	addi a0,a0,4
	call malloc
	sw s9,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s11)
	li a0,0
	sw a0,4(s2)
LBB136:
	lw a0,4(s2)
	bne a0,s5,LBB137
LBB138:
	j LBB135
LBB137:
	addi a0,s2,0
	lw a1,0(a0)
	lw a0,4(s2)
	slli a0,a0,2
	add a1,a1,a0
	lw a0,4(s2)
	slli a0,a0,2
	add a0,s10,a0
	lw a0,0(a0)
	sw a0,0(a1)
	lw a0,4(s2)
	addi a0,a0,1
	sw a0,4(s2)
	j LBB136
LBB131:
	j LBB133
LBB126:
	j LBB123
LBB119:
	addi a1,a2,-1
	li a0,2
	div a1,a1,a0
	addi a0,s1,0
	lw a0,0(a0)
	addi a0,a0,0
	lw a3,0(a0)
	slli a0,a1,2
	add a0,a3,a0
	lw a0,0(a0)
	lw a3,4(a0)
	li a0,0
	sub a0,a0,a3
	addi a3,s1,0
	lw a3,0(a3)
	addi a3,a3,0
	lw a4,0(a3)
	slli a3,a2,2
	add a3,a4,a3
	lw a3,0(a3)
	lw a4,4(a3)
	li a3,0
	sub a3,a3,a4
	bge a0,a3,LBB121
LBB122:
	addi a0,s1,0
	lw a0,0(a0)
	addi a3,a0,0
	lw a4,0(a3)
	slli a3,a1,2
	add a3,a4,a3
	lw a6,0(a3)
	addi a3,a0,0
	lw a4,0(a3)
	slli a3,a1,2
	add a5,a4,a3
	addi a3,a0,0
	lw a4,0(a3)
	slli a3,a2,2
	add a3,a4,a3
	lw a3,0(a3)
	sw a3,0(a5)
	addi a0,a0,0
	lw a3,0(a0)
	slli a0,a2,2
	add a0,a3,a0
	sw a6,0(a0)
	mv a2,a1
	j LBB118
LBB121:
	j LBB120
LBB113:
	addi a0,s2,0
	lw s3,0(a0)
	lw s5,4(s2)
	addi s9,s2,0
	addi a0,s3,-4
	lw a1,0(a0)
	li a0,2
	mul s6,a1,a0
	li a0,4
	mul a0,s6,a0
	addi a0,a0,4
	call malloc
	sw s6,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s9)
	li a0,0
	sw a0,4(s2)
LBB115:
	lw a0,4(s2)
	bne a0,s5,LBB116
LBB117:
	j LBB114
LBB116:
	addi a0,s2,0
	lw a1,0(a0)
	lw a0,4(s2)
	slli a0,a0,2
	add a1,a1,a0
	lw a0,4(s2)
	slli a0,a0,2
	add a0,s3,a0
	lw a0,0(a0)
	sw a0,0(a1)
	lw a0,4(s2)
	addi a0,a0,1
	sw a0,4(s2)
	j LBB115
LBB111:
	slli a1,a0,2
	add a2,s4,a1
	lui a1,%hi(INF)
	lw a1,%lo(INF)(a1)
	sw a1,0(a2)
	slli a1,a0,2
	add a2,s7,a1
	li a1,0
	sw a1,0(a2)
	addi a0,a0,1
	j LBB110
LBB105:
	call getInt
	mv s1,a0
	call getInt
	mv s2,a0
	call getInt
	mv s3,a0
	lui a0,%hi(g)
	lw s4,%lo(g)(a0)
	li a0,12
	call malloc
	addi a2,a0,0
	sw s1,0(a2)
	sw s2,4(a2)
	sw s3,8(a2)
	addi a0,s4,0
	lw a1,0(a0)
	lw a0,12(s4)
	slli a0,a0,2
	add a0,a1,a0
	sw a2,0(a0)
	addi a0,s4,4
	lw a1,0(a0)
	lw a0,12(s4)
	slli a0,a0,2
	add a2,a1,a0
	addi a0,s4,8
	lw a1,0(a0)
	slli a0,s1,2
	add a0,a1,a0
	lw a0,0(a0)
	sw a0,0(a2)
	addi a0,s4,8
	lw a1,0(a0)
	slli a0,s1,2
	add a1,a1,a0
	lw a0,12(s4)
	sw a0,0(a1)
	lw a0,12(s4)
	addi a0,a0,1
	sw a0,12(s4)
	addi s5,s5,1
	j LBB104
LBB102:
	addi a1,s3,8
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	li a1,-1
	sw a1,0(a2)
	addi a0,a0,1
	j LBB101
LBB99:
	addi a1,s3,4
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	li a1,-1
	sw a1,0(a2)
	addi a0,a0,1
	j LBB98
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
n:
	.word	0

	.p2align	2
m:
	.word	0

	.p2align	2
g:
	.word	0

	.p2align	2
INF:
	.word	10000000

const_string_no0:
	.asciz	"-1"

const_string_no1:
	.asciz	" "

const_string_no2:
	.asciz	""

