	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	sw s0,-8(sp)
	mv s0,sp
	addi sp,sp,-80
	li a1,10000000
	lui a0,%hi(INF)
	sw a1,%lo(INF)(a0)
	j LBB25
LBB25:
	addi sp,sp,80
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	init					# start function : init
	.p2align	2
init:
#LBB42:
	sw ra,-4(sp)
	sw s0,-8(sp)
	mv s0,sp
	addi sp,sp,-80
	call getInt
	lui a1,%hi(n)
	sw a0,%lo(n)(a1)
	call getInt
	lui a1,%hi(m)
	sw a0,%lo(m)(a1)
	lui a0,%hi(n)
	lw s5,%lo(n)(a0)
	lui a0,%hi(n)
	lw s3,%lo(n)(a0)
	li a0,4
	mul a0,s5,a0
	addi a0,a0,4
	call malloc
	sw s5,0(a0)
	addi a1,a0,4
	addi s4,a1,0
	addi s2,a0,4
	slli a0,s5,2
	add s5,s4,a0
	j LBB43
LBB43:
	slt a0,s2,s5
	bnez a0,LBB44
	j LBB45
LBB44:
	li a0,4
	mul a0,s3,a0
	addi a0,a0,4
	call malloc
	sw s3,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s2)
	addi s2,s2,4
	j LBB43
LBB45:
	lui a0,%hi(a)
	sw s4,%lo(a)(a0)
	li a0,0
	j LBB46
LBB46:
	lui a1,%hi(n)
	lw a1,%lo(n)(a1)
	slt a1,a0,a1
	bnez a1,LBB48
	j LBB47
LBB47:
	j LBB57
LBB48:
	j LBB49
LBB49:
	li a1,0
	j LBB50
LBB50:
	lui a2,%hi(n)
	lw a2,%lo(n)(a2)
	slt a2,a1,a2
	bnez a2,LBB52
	j LBB51
LBB51:
	j LBB55
LBB52:
	j LBB53
LBB53:
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a0,2
	add a2,a3,a2
	lw a3,0(a2)
	slli a2,a1,2
	add a3,a3,a2
	lui a2,%hi(INF)
	lw a2,%lo(INF)(a2)
	sw a2,0(a3)
	j LBB54
LBB54:
	addi a1,a1,1
	j LBB50
LBB55:
	j LBB56
LBB56:
	addi a0,a0,1
	j LBB46
LBB57:
	li a0,0
	j LBB58
LBB58:
	lui a1,%hi(n)
	lw a1,%lo(n)(a1)
	slt a1,a0,a1
	bnez a1,LBB60
	j LBB59
LBB59:
	j LBB63
LBB60:
	j LBB61
LBB61:
	lui a1,%hi(a)
	lw a2,%lo(a)(a1)
	slli a1,a0,2
	add a1,a2,a1
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	li a1,0
	sw a1,0(a2)
	j LBB62
LBB62:
	addi a0,a0,1
	j LBB58
LBB63:
	li s2,0
	j LBB64
LBB64:
	lui a0,%hi(m)
	lw a0,%lo(m)(a0)
	slt a0,s2,a0
	bnez a0,LBB66
	j LBB65
LBB65:
	j LBB69
LBB66:
	j LBB67
LBB67:
	call getInt
	mv s3,a0
	call getInt
	mv s4,a0
	call getInt
	lui a1,%hi(a)
	lw a2,%lo(a)(a1)
	slli a1,s3,2
	add a1,a2,a1
	lw a2,0(a1)
	slli a1,s4,2
	add a1,a2,a1
	sw a0,0(a1)
	j LBB68
LBB68:
	addi s2,s2,1
	j LBB64
LBB69:
	j LBB70
LBB70:
	mv a0,s1
	addi sp,sp,80
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : init
	.globl	main					# start function : main
	.p2align	2
main:
#LBB71:
	sw ra,-4(sp)
	sw s0,-8(sp)
	mv s0,sp
	addi sp,sp,-80
	call __init__
	call init
	li s1,0
	j LBB72
LBB72:
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
	slt a0,s1,a0
	bnez a0,LBB74
	j LBB73
LBB73:
	j LBB93
LBB74:
	j LBB75
LBB75:
	li a0,0
	j LBB76
LBB76:
	lui a1,%hi(n)
	lw a1,%lo(n)(a1)
	slt a1,a0,a1
	bnez a1,LBB78
	j LBB77
LBB77:
	j LBB91
LBB78:
	j LBB79
LBB79:
	li a1,0
	j LBB80
LBB80:
	lui a2,%hi(n)
	lw a2,%lo(n)(a2)
	slt a2,a1,a2
	bnez a2,LBB82
	j LBB81
LBB81:
	j LBB89
LBB82:
	j LBB83
LBB83:
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a0,2
	add a2,a3,a2
	lw a3,0(a2)
	slli a2,a1,2
	add a2,a3,a2
	lw a5,0(a2)
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a0,2
	add a2,a3,a2
	lw a3,0(a2)
	slli a2,s1,2
	add a2,a3,a2
	lw a4,0(a2)
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,s1,2
	add a2,a3,a2
	lw a3,0(a2)
	slli a2,a1,2
	add a2,a3,a2
	lw a2,0(a2)
	add a2,a4,a2
	slt a2,a2,a5
	bnez a2,LBB85
	j LBB84
LBB84:
	j LBB87
LBB85:
	j LBB86
LBB86:
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a0,2
	add a2,a3,a2
	lw a3,0(a2)
	slli a2,a1,2
	add a5,a3,a2
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a0,2
	add a2,a3,a2
	lw a3,0(a2)
	slli a2,s1,2
	add a2,a3,a2
	lw a4,0(a2)
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,s1,2
	add a2,a3,a2
	lw a3,0(a2)
	slli a2,a1,2
	add a2,a3,a2
	lw a2,0(a2)
	add a2,a4,a2
	sw a2,0(a5)
	j LBB87
LBB87:
	j LBB88
LBB88:
	addi a1,a1,1
	j LBB80
LBB89:
	j LBB90
LBB90:
	addi a0,a0,1
	j LBB76
LBB91:
	j LBB92
LBB92:
	addi s1,s1,1
	j LBB72
LBB93:
	li s2,0
	j LBB94
LBB94:
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
	slt a0,s2,a0
	bnez a0,LBB96
	j LBB95
LBB95:
	j LBB110
LBB96:
	j LBB97
LBB97:
	li s3,0
	j LBB98
LBB98:
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
	slt a0,s3,a0
	bnez a0,LBB100
	j LBB99
LBB99:
	j LBB108
LBB100:
	j LBB101
LBB101:
	lui a0,%hi(a)
	lw a1,%lo(a)(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a1,0(a0)
	slli a0,s3,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(INF)
	lw a0,%lo(INF)(a0)
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB103
	j LBB102
LBB102:
	j LBB105
LBB103:
	j LBB104
LBB104:
	la a0,const_string_no0
	call print
	j LBB106
LBB105:
	lui a0,%hi(a)
	lw a1,%lo(a)(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a1,0(a0)
	slli a0,s3,2
	add a0,a1,a0
	lw a0,0(a0)
	call toString
	call print
	j LBB106
LBB106:
	la a0,const_string_no1
	call print
	j LBB107
LBB107:
	addi s3,s3,1
	j LBB98
LBB108:
	la a0,const_string_no2
	call println
	j LBB109
LBB109:
	addi s2,s2,1
	j LBB94
LBB110:
	li a0,0
	j LBB111
LBB111:
	addi sp,sp,80
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
INF:
	.word	10000000

	.p2align	2
n:
	.word	0

	.p2align	2
m:
	.word	0

	.p2align	2
a:
	.word	0

const_string_no0:
	.asciz	"-1"

const_string_no1:
	.asciz	" "

const_string_no2:
	.asciz	""

