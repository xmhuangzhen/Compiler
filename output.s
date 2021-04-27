	.text
	.globl	Heap_Node.maxHeapify					# start function : Heap_Node.maxHeapify
	.p2align	2
Heap_Node.maxHeapify:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-88
LBB1:
	li a2,2
	mul a2,a1,a2
	addi a3,a2,1
	li a2,2
	mul a2,a1,a2
	addi a2,a2,2
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a3,a4,LBB2
LBB3:
	mv a3,a1
LBB4:
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a2,a4,LBB7
LBB8:
LBB9:
	beq a3,a1,LBB12
LBB13:
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
	blt a2,a4,LBB15
LBB16:
	mv a2,a3
LBB17:
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a1,a4,LBB20
LBB21:
LBB22:
	beq a2,a3,LBB25
LBB26:
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
	blt a3,a4,LBB28
LBB29:
	mv a3,a2
LBB30:
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a1,a4,LBB33
LBB34:
LBB35:
	beq a3,a2,LBB38
LBB39:
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
	blt a1,a4,LBB41
LBB42:
	mv a1,a3
LBB43:
	addi a4,a0,0
	lw a4,0(a4)
	lw a4,4(a4)
	blt a2,a4,LBB46
LBB47:
LBB48:
	beq a1,a3,LBB51
LBB52:
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
LBB53:
LBB40:
LBB27:
LBB14:
	mv a0,s1
	addi sp,sp,88
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB51:
	j LBB53
LBB46:
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
	bgt a4,a5,LBB49
LBB50:
	j LBB48
LBB49:
	mv a1,a2
	j LBB48
LBB41:
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
	bgt a4,a5,LBB44
LBB45:
	mv a1,a3
	j LBB43
LBB44:
	j LBB43
LBB38:
	j LBB40
LBB33:
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
	bgt a4,a5,LBB36
LBB37:
	j LBB35
LBB36:
	mv a3,a1
	j LBB35
LBB28:
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
	bgt a4,a5,LBB31
LBB32:
	mv a3,a2
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
	slli a5,a2,2
	add a5,a6,a5
	lw a5,0(a5)
	lw a6,4(a5)
	li a5,0
	sub a5,a5,a6
	bgt a4,a5,LBB23
LBB24:
	j LBB22
LBB23:
	mv a2,a1
	j LBB22
LBB15:
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
	bgt a4,a5,LBB18
LBB19:
	mv a2,a3
	j LBB17
LBB18:
	j LBB17
LBB12:
	j LBB14
LBB7:
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
	bgt a4,a5,LBB10
LBB11:
	j LBB9
LBB10:
	mv a3,a2
	j LBB9
LBB2:
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
	bgt a4,a5,LBB5
LBB6:
	mv a3,a1
	j LBB4
LBB5:
	j LBB4
# end function : Heap_Node.maxHeapify
	.globl	dijkstra					# start function : dijkstra
	.p2align	2
dijkstra:
#LBB54:
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
	addi sp,sp,-88
	mv s4,a0
	lui a0,%hi(n)
	lw s1,%lo(n)(a0)
	li a0,4
	mul a0,s1,a0
	addi a0,a0,4
	call malloc
	sw s1,0(a0)
	addi a0,a0,4
	addi s3,a0,0
	lui a0,%hi(n)
	lw s1,%lo(n)(a0)
	li a0,4
	mul a0,s1,a0
	addi a0,a0,4
	call malloc
	sw s1,0(a0)
	addi a0,a0,4
	addi s7,a0,0
	li a0,0
LBB55:
	lui a1,%hi(n)
	lw a1,%lo(n)(a1)
	blt a0,a1,LBB56
LBB57:
	slli a0,s4,2
	add a1,s7,a0
	li a0,0
	sw a0,0(a1)
	li a0,4
	call malloc
	addi s1,a0,0
	mv a0,s1
	addi s5,a0,0
	li a0,8
	call malloc
	addi s2,a0,0
	li a0,0
	sw a0,4(s2)
	addi s6,s2,0
	li a0,68
	call malloc
	li a1,16
	sw a1,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s6)
	sw s2,0(s5)
	li a0,8
	call malloc
	addi s2,a0,0
	li a0,0
	sw a0,4(s2)
	sw s4,0(s2)
	mv s4,s1
	addi a0,s4,0
	lw s5,0(a0)
	lw a0,4(s5)
	addi a1,s5,0
	lw a1,0(a1)
	addi a1,a1,-4
	lw a1,0(a1)
	beq a0,a1,LBB58
LBB59:
	addi a0,s5,0
	lw a1,0(a0)
	lw a0,4(s5)
	slli a0,a0,2
	add a0,a1,a0
	sw s2,0(a0)
	lw a0,4(s5)
	addi a0,a0,1
	sw a0,4(s5)
	addi a0,s4,0
	lw a0,0(a0)
	lw a0,4(a0)
	addi a2,a0,-1
LBB63:
	li a0,0
	bgt a2,a0,LBB64
LBB65:
LBB68:
	mv a0,s1
	addi a0,a0,0
	lw a0,0(a0)
	lw a0,4(a0)
	li a1,0
	bne a0,a1,LBB69
LBB70:
	mv a0,s7
LBB102:
	addi sp,sp,88
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
LBB69:
	mv a0,s1
	addi a1,a0,0
	lw a1,0(a1)
	addi a1,a1,0
	lw a1,0(a1)
	addi a1,a1,0
	lw s2,0(a1)
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
	blt a2,a1,LBB71
LBB72:
	li a1,0
LBB73:
	addi a2,a0,0
	lw a2,0(a2)
	lw a2,4(a2)
	li a3,2
	blt a3,a2,LBB76
LBB77:
LBB78:
	li a2,0
	beq a1,a2,LBB81
LBB82:
	addi a2,a0,0
	lw a2,0(a2)
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
	lw a3,0(a2)
	slli a2,a1,2
	add a2,a3,a2
	sw a6,0(a2)
	call Heap_Node.maxHeapify
LBB83:
	lw s4,0(s2)
	slli a0,s4,2
	add a0,s3,a0
	lw a1,0(a0)
	li a0,1
	beq a1,a0,LBB84
LBB85:
	slli a0,s4,2
	add a1,s3,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	addi a0,a0,8
	lw a1,0(a0)
	slli a0,s4,2
	add a0,a1,a0
	lw a0,0(a0)
	mv s8,a0
LBB86:
	li a0,-1
	bne s8,a0,LBB87
LBB88:
	j LBB68
LBB87:
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	slli a0,s8,2
	add a0,a1,a0
	lw a0,0(a0)
	lw s2,4(a0)
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	slli a0,s8,2
	add a0,a1,a0
	lw a0,0(a0)
	lw a1,8(a0)
	slli a0,s4,2
	add a0,s7,a0
	lw a0,0(a0)
	add a1,a0,a1
	slli a0,s2,2
	add a0,s7,a0
	lw a0,0(a0)
	bge a1,a0,LBB89
LBB90:
	slli a0,s2,2
	add a0,s7,a0
	sw a1,0(a0)
	li a0,8
	call malloc
	addi a1,a0,0
	sw s2,0(a1)
	slli a0,s2,2
	add a0,s7,a0
	lw a0,0(a0)
	sw a0,4(a1)
	addi a0,s1,0
	lw a0,0(a0)
	mv s2,a0
	mv s11,a1
	mv a0,s2
	lw a0,4(a0)
	addi a1,s2,0
	lw a1,0(a1)
	addi a1,a1,-4
	lw a1,0(a1)
	beq a0,a1,LBB92
LBB93:
	addi a0,s2,0
	lw a1,0(a0)
	lw a0,4(s2)
	slli a0,a0,2
	add a0,a1,a0
	sw s11,0(a0)
	lw a0,4(s2)
	addi a0,a0,1
	sw a0,4(s2)
	mv a0,s1
	addi a0,a0,0
	lw a0,0(a0)
	lw a0,4(a0)
	addi a2,a0,-1
LBB97:
	li a0,0
	bgt a2,a0,LBB98
LBB99:
LBB91:
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	slli a0,s8,2
	add a0,a1,a0
	lw a0,0(a0)
	mv s8,a0
	j LBB86
LBB98:
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
	bge a0,a3,LBB100
LBB101:
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
	j LBB97
LBB100:
	j LBB99
LBB92:
	addi a0,s2,0
	lw s6,0(a0)
	lw s10,4(s2)
	addi s5,s2,0
	addi a0,s6,-4
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
	sw a0,0(s5)
	li a0,0
	sw a0,4(s2)
LBB94:
	lw a0,4(s2)
	bne a0,s10,LBB95
LBB96:
	j LBB93
LBB95:
	addi a0,s2,0
	lw a1,0(a0)
	lw a0,4(s2)
	slli a0,a0,2
	add a1,a1,a0
	lw a0,4(s2)
	slli a0,a0,2
	add a0,s6,a0
	lw a0,0(a0)
	sw a0,0(a1)
	lw a0,4(s2)
	addi a0,a0,1
	sw a0,4(s2)
	j LBB94
LBB89:
	j LBB91
LBB84:
	j LBB68
LBB81:
	j LBB83
LBB76:
	addi a2,a0,0
	lw a2,0(a2)
	addi a2,a2,0
	lw a2,0(a2)
	addi a2,a2,8
	lw a2,0(a2)
	lw a3,4(a2)
	li a2,0
	sub a2,a2,a3
	addi a3,a0,0
	lw a3,0(a3)
	addi a3,a3,0
	lw a4,0(a3)
	slli a3,a1,2
	add a3,a4,a3
	lw a3,0(a3)
	lw a4,4(a3)
	li a3,0
	sub a3,a3,a4
	bgt a2,a3,LBB79
LBB80:
	j LBB78
LBB79:
	li a1,2
	j LBB78
LBB71:
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
	bgt a1,a2,LBB74
LBB75:
	li a1,0
	j LBB73
LBB74:
	li a1,1
	j LBB73
LBB64:
	addi a1,a2,-1
	li a0,2
	div a1,a1,a0
	addi a0,s4,0
	lw a0,0(a0)
	addi a0,a0,0
	lw a3,0(a0)
	slli a0,a1,2
	add a0,a3,a0
	lw a0,0(a0)
	lw a3,4(a0)
	li a0,0
	sub a0,a0,a3
	addi a3,s4,0
	lw a3,0(a3)
	addi a3,a3,0
	lw a4,0(a3)
	slli a3,a2,2
	add a3,a4,a3
	lw a3,0(a3)
	lw a4,4(a3)
	li a3,0
	sub a3,a3,a4
	bge a0,a3,LBB66
LBB67:
	addi a0,s4,0
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
	j LBB63
LBB66:
	j LBB65
LBB58:
	addi a0,s5,0
	lw s9,0(a0)
	lw s6,4(s5)
	addi s8,s5,0
	addi a0,s9,-4
	lw a1,0(a0)
	li a0,2
	mul s10,a1,a0
	li a0,4
	mul a0,s10,a0
	addi a0,a0,4
	call malloc
	sw s10,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s8)
	li a0,0
	sw a0,4(s5)
LBB60:
	lw a0,4(s5)
	bne a0,s6,LBB61
LBB62:
	j LBB59
LBB61:
	addi a0,s5,0
	lw a1,0(a0)
	lw a0,4(s5)
	slli a0,a0,2
	add a1,a1,a0
	lw a0,4(s5)
	slli a0,a0,2
	add a0,s9,a0
	lw a0,0(a0)
	sw a0,0(a1)
	lw a0,4(s5)
	addi a0,a0,1
	sw a0,4(s5)
	j LBB60
LBB56:
	slli a1,a0,2
	add a2,s7,a1
	lui a1,%hi(INF)
	lw a1,%lo(INF)(a1)
	sw a1,0(a2)
	slli a1,a0,2
	add a2,s3,a1
	li a1,0
	sw a1,0(a2)
	addi a0,a0,1
	j LBB55
# end function : dijkstra
	.globl	main					# start function : main
	.p2align	2
main:
#LBB103:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	mv s0,sp
	addi sp,sp,-84
LBB104:
	li a1,10000000
	lui a0,%hi(INF)
	sw a1,%lo(INF)(a0)
	call getInt
	lui a1,%hi(n)
	sw a0,%lo(n)(a1)
	call getInt
	lui a1,%hi(m)
	sw a0,%lo(m)(a1)
	li a0,16
	call malloc
	addi a1,a0,0
	lui a0,%hi(g)
	sw a1,%lo(g)(a0)
	lui a0,%hi(g)
	lw s1,%lo(g)(a0)
	lui a0,%hi(n)
	lw s2,%lo(n)(a0)
	lui a0,%hi(m)
	lw s3,%lo(m)(a0)
	addi s5,s1,0
	li a0,4
	mul a0,s3,a0
	addi s4,a0,4
	mv a0,s4
	call malloc
	sw s3,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s5)
	addi s5,s1,4
	mv a0,s4
	call malloc
	sw s3,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s5)
	addi s4,s1,8
	li a0,4
	mul a0,s2,a0
	addi a0,a0,4
	call malloc
	sw s2,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s4)
	li a0,0
LBB105:
	blt a0,s3,LBB106
LBB107:
	li a0,0
LBB108:
	blt a0,s2,LBB109
LBB110:
	li a0,0
	sw a0,12(s1)
	li s5,0
LBB111:
	lui a0,%hi(m)
	lw a0,%lo(m)(a0)
	blt s5,a0,LBB112
LBB113:
	li s1,0
LBB114:
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
	blt s1,a0,LBB115
LBB116:
	li a0,0
LBB123:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB115:
	mv a0,s1
	call dijkstra
	mv s3,a0
	li s2,0
LBB117:
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
	blt s2,a0,LBB118
LBB119:
	la a0,const_string_no2
	call println
	addi s1,s1,1
	j LBB114
LBB118:
	slli a0,s2,2
	add a0,s3,a0
	lw a1,0(a0)
	lui a0,%hi(INF)
	lw a0,%lo(INF)(a0)
	beq a1,a0,LBB120
LBB121:
	slli a0,s2,2
	add a0,s3,a0
	lw a0,0(a0)
	call toString
	call print
LBB122:
	la a0,const_string_no1
	call print
	addi s2,s2,1
	j LBB117
LBB120:
	la a0,const_string_no0
	call print
	j LBB122
LBB112:
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
	j LBB111
LBB109:
	addi a1,s1,8
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	li a1,-1
	sw a1,0(a2)
	addi a0,a0,1
	j LBB108
LBB106:
	addi a1,s1,4
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	li a1,-1
	sw a1,0(a2)
	addi a0,a0,1
	j LBB105
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

