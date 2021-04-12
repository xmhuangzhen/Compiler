	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	sw s0,-8(sp)
	mv s0,sp
	addi sp,sp,-80
	j LBB25
LBB25:
	addi sp,sp,80
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	check					# start function : check
	.p2align	2
check:
#LBB42:
	sw ra,-4(sp)
	sw s0,-8(sp)
	mv s0,sp
	addi sp,sp,-80
	slt a3,a0,a1
	bnez a3,LBB43
	j LBB44
LBB43:
	li a1,0
	slt a0,a0,a1
	xori a2,a0,1
	j LBB44
LBB44:
	and a0,a3,a2
	j LBB45
LBB45:
	addi sp,sp,80
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : check
	.globl	main					# start function : main
	.p2align	2
main:
#LBB46:
	sw ra,-4(sp)
	sw s0,-8(sp)
	mv s0,sp
	addi sp,sp,-624
	call __init__
	call getInt
	mv s2,a0
	addi s1,s2,-1
	mul s3,s2,s2
	li a0,4
	mul a0,s3,a0
	addi a0,a0,4
	call malloc
	sw s3,0(a0)
	addi a0,a0,4
	addi a5,a0,0
	li t1,0
	li a6,0
	li t0,0
	li a7,0
	li a4,0
	li a3,0
	li a2,0
	li a0,0
	li t2,0
	li s9,0
	mv a1,s2
	j LBB47
LBB47:
	mul s2,a1,a1
	slt s2,t1,s2
	bnez s2,LBB49
	j LBB48
LBB48:
	mv s3,a5
	mv s7,a6
	mv s6,t0
	mv s5,a7
	mv s2,a4
	mv s4,a3
	mv s8,s1
	mv s10,a2
	mv s11,a0
	sw t2,-184(s0)
	sw s9,-248(s0)
	mv s1,a1
	j LBB52
LBB49:
	j LBB50
LBB50:
	slli s2,t1,2
	add s3,a5,s2
	li s2,0
	sw s2,0(s3)
	j LBB51
LBB51:
	addi s2,t1,1
	j LBB47
LBB52:
	mul s9,s1,s1
	li a0,4
	mul a0,s9,a0
	addi a0,a0,4
	call malloc
	sw s9,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	li a0,0
	mv a5,a0
	mv t0,a1
	mv a1,s7
	mv a7,s6
	mv a0,s5
	mv a4,s4
	mv t2,s8
	mv a6,s10
	mv a3,s11
	lw a2,-184(s0)
	lw t1,-248(s0)
	j LBB53
LBB53:
	mul s4,s1,s1
	slt s4,a5,s4
	bnez s4,LBB55
	j LBB54
LBB54:
	sw t0,-336(s0)
	sw s3,-288(s0)
	sw a1,-564(s0)
	sw a7,-560(s0)
	mv s11,a0
	mv s10,s2
	mv s9,a4
	mv s8,t2
	mv s7,a6
	mv s2,a3
	mv s3,a2
	mv s4,t1
	j LBB58
LBB55:
	j LBB56
LBB56:
	slli s4,a5,2
	add s5,t0,s4
	li s4,0
	sw s4,0(s5)
	j LBB57
LBB57:
	addi s4,a5,1
	j LBB53
LBB58:
	li a0,4
	mul a0,s1,a0
	addi a0,a0,4
	call malloc
	sw s1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	li a0,0
	mv t1,a0
	mv t0,a1
	lw s5,-336(s0)
	lw s6,-288(s0)
	lw a0,-564(s0)
	lw t2,-560(s0)
	mv a1,s11
	mv a7,s10
	mv a4,s9
	mv a5,s8
	mv a2,s7
	mv a6,s2
	mv s2,s3
	mv a3,s4
	j LBB59
LBB59:
	slt s3,t1,s1
	bnez s3,LBB61
	j LBB60
LBB60:
	mv s7,t1
	mv s3,t0
	mv s4,s5
	mv t0,s6
	mv t1,t2
	mv t2,s2
	mv s6,s1
	j LBB70
LBB61:
	mv s3,t1
	mv s4,t0
	sw s6,-460(s0)
	sw a0,-424(s0)
	sw t2,-380(s0)
	sw a1,-332(s0)
	sw a7,-284(s0)
	mv s11,a4
	mv s10,a5
	mv s9,a2
	mv s8,a6
	mv s7,s2
	mv s6,a3
	j LBB62
LBB62:
	slli a0,s3,2
	add s2,s4,a0
	li a0,4
	mul a0,s1,a0
	addi a0,a0,4
	call malloc
	sw s1,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s2)
	li a0,0
	mv s2,a0
	mv t1,s3
	mv t0,s4
	lw s4,-460(s0)
	lw a0,-424(s0)
	lw t2,-380(s0)
	lw a1,-332(s0)
	lw a7,-284(s0)
	mv a4,s11
	mv a5,s10
	mv a2,s9
	mv a6,s8
	mv s3,s7
	mv a3,s6
	j LBB63
LBB63:
	slt s6,s2,s1
	bnez s6,LBB65
	j LBB64
LBB64:
	mv s6,s4
	j LBB68
LBB65:
	j LBB66
LBB66:
	slli s6,t1,2
	add s6,t0,s6
	lw s7,0(s6)
	slli s6,s2,2
	add s7,s7,s6
	li s6,-1
	sw s6,0(s7)
	j LBB67
LBB67:
	addi s6,s2,1
	j LBB63
LBB68:
	j LBB69
LBB69:
	addi s2,t1,1
	mv s2,s3
	j LBB59
LBB70:
	addi s1,t0,0
	sw t2,0(s1)
	addi s1,s4,0
	sw a6,0(s1)
	slli s1,t2,2
	add s1,s3,s1
	lw s2,0(s1)
	slli s1,a6,2
	add s1,s2,s1
	lw s2,0(s1)
	li s1,0
	xor s1,s2,s1
	seqz s1,s1
	mv s1,s7
	mv s2,s3
	mv s5,a7
	mv s7,a4
	mv a4,a5
	mv a5,a6
	mv a6,t2
	mv a7,s6
	j LBB71
LBB71:
	slt t2,s7,a3
	xori t2,t2,1
	bnez t2,LBB73
	j LBB72
LBB72:
	mv t2,s1
	mv s1,s2
	mv s2,s4
	mv s3,t0
	mv t0,t1
	mv t1,s5
	mv s4,s7
	j LBB239
LBB73:
	sw s1,-104(s0)
	mv s3,s2
	mv s9,s4
	mv s1,t0
	mv a0,t1
	mv a0,a1
	sw s5,-112(s0)
	sw s7,-72(s0)
	sw a4,-68(s0)
	mv s11,a2
	mv s10,a5
	mv s2,a6
	mv s5,a3
	mv s4,a7
	j LBB74
LBB74:
	slli a0,s5,2
	add a0,s1,a0
	lw a0,0(a0)
	slli a0,a0,2
	add a0,s3,a0
	lw a1,0(a0)
	slli a0,s5,2
	add a0,s9,a0
	lw a0,0(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw s8,0(a0)
	slli a0,s5,2
	add a0,s1,a0
	lw a0,0(a0)
	addi s6,a0,-1
	slli a0,s5,2
	add a0,s9,a0
	lw a0,0(a0)
	addi s7,a0,-2
	mv a0,s6
	mv a1,s4
	call check
	sw a0,-168(s0)
	lw a0,-168(s0)
	bnez a0,LBB76
	j LBB75
LBB75:
	lw a5,-104(s0)
	mv a0,s3
	mv a1,s9
	mv a2,s1
	mv a3,s7
	mv a4,s6
	mv a6,s8
	lw s9,-112(s0)
	lw a7,-72(s0)
	lw t0,-68(s0)
	mv t1,s11
	mv t2,s10
	mv s1,s2
	mv s2,s5
	mv s3,s4
	j LBB78
LBB76:
	lw a0,-104(s0)
	sw a0,-456(s0)
	sw s3,-420(s0)
	sw s9,-376(s0)
	sw s1,-328(s0)
	mv s1,s7
	sw s6,-280(s0)
	sw s8,-244(s0)
	lw a0,-112(s0)
	sw a0,-212(s0)
	lw s7,-72(s0)
	lw s6,-68(s0)
	mv s3,s11
	mv s8,s10
	j LBB77
LBB77:
	mv a0,s1
	mv a1,s4
	call check
	sw a0,-556(s0)
	lw a5,-456(s0)
	lw a0,-420(s0)
	lw a1,-376(s0)
	lw a2,-328(s0)
	mv a3,s1
	lw a4,-280(s0)
	lw a6,-244(s0)
	lw s9,-212(s0)
	mv a7,s7
	mv t0,s6
	mv t1,s3
	mv t2,s8
	mv s1,s2
	mv s2,s5
	mv s3,s4
	j LBB78
LBB78:
	lw s5,-168(s0)
	lw s4,-556(s0)
	and s4,s5,s4
	bnez s4,LBB80
	j LBB79
LBB79:
	mv s5,s9
	mv s6,s2
	mv t3,s3
	j LBB82
LBB80:
	j LBB81
LBB81:
	slli s5,a4,2
	add s5,a0,s5
	lw s6,0(s5)
	slli s5,a3,2
	add s5,s6,s5
	lw s6,0(s5)
	li s5,-1
	xor s5,s6,s5
	seqz s5,s5
	sw s5,-496(s0)
	mv s5,s9
	mv s6,s2
	mv t3,s3
	j LBB82
LBB82:
	lw s2,-496(s0)
	and s2,s4,s2
	bnez s2,LBB84
	j LBB83
LBB83:
	sw a5,-136(s0)
	sw a0,-64(s0)
	mv s4,a1
	mv s9,a2
	mv a0,a3
	mv a0,a4
	sw a6,-36(s0)
	mv s11,s5
	mv s10,a7
	mv s5,t0
	mv s3,t1
	mv s8,t2
	mv s2,s1
	mv s7,s6
	mv s1,t3
	j LBB94
LBB84:
	mv s2,a4
	mv a4,a6
	mv a6,s5
	mv s4,a7
	mv a7,t0
	mv t0,t1
	mv t1,t2
	mv t2,s1
	mv s3,s6
	mv s1,t3
	j LBB85
LBB85:
	addi s5,s4,1
	slli s4,s5,2
	add s4,a2,s4
	sw s2,0(s4)
	slli s4,s5,2
	add s4,a1,s4
	sw a3,0(s4)
	slli s4,s2,2
	add s4,a0,s4
	lw s6,0(s4)
	slli s4,a3,2
	add s6,s6,s4
	addi s4,a4,1
	sw s4,0(s6)
	xor s4,s2,t0
	seqz s4,s4
	bnez s4,LBB87
	j LBB86
LBB86:
	j LBB89
LBB87:
	j LBB88
LBB88:
	xor s6,a3,a7
	seqz s6,s6
	sw s6,-524(s0)
	j LBB89
LBB89:
	lw s6,-524(s0)
	and s4,s4,s6
	bnez s4,LBB91
	j LBB90
LBB90:
	mv s4,a1
	mv a1,a3
	mv a3,s2
	mv s2,a6
	mv a6,s5
	mv s6,s3
	j LBB93
LBB91:
	mv s4,a1
	mv a1,a3
	mv a3,s2
	mv a6,s5
	j LBB92
LBB92:
	li s2,1
	mv s6,s3
	j LBB93
LBB93:
	sw a5,-136(s0)
	sw a0,-64(s0)
	mv s9,a2
	mv a0,a1
	mv a0,a3
	sw a4,-36(s0)
	mv s11,s2
	mv s10,a6
	mv s5,a7
	mv s3,t0
	mv s8,t1
	mv s2,t2
	mv s7,s6
	j LBB94
LBB94:
	slli a0,s7,2
	add a0,s9,a0
	lw a0,0(a0)
	addi s6,a0,-1
	slli a0,s7,2
	add a0,s4,a0
	lw a0,0(a0)
	addi a0,a0,2
	sw a0,-100(s0)
	mv a0,s6
	mv a1,s1
	call check
	sw a0,-164(s0)
	lw a0,-164(s0)
	bnez a0,LBB96
	j LBB95
LBB95:
	lw a5,-136(s0)
	lw a4,-64(s0)
	mv a0,s4
	mv a1,s9
	lw a2,-100(s0)
	mv a3,s6
	lw t1,-36(s0)
	mv a6,s11
	mv a7,s10
	mv t0,s5
	mv t2,s3
	mv s3,s8
	mv s4,s7
	j LBB98
LBB96:
	lw a0,-136(s0)
	sw a0,-452(s0)
	lw a0,-64(s0)
	sw a0,-416(s0)
	sw s4,-372(s0)
	sw s9,-324(s0)
	lw s4,-100(s0)
	sw s6,-276(s0)
	lw a0,-36(s0)
	sw a0,-240(s0)
	sw s11,-208(s0)
	mv s6,s10
	j LBB97
LBB97:
	mv a0,s4
	mv a1,s1
	call check
	sw a0,-552(s0)
	lw a5,-452(s0)
	lw a4,-416(s0)
	lw a0,-372(s0)
	lw a1,-324(s0)
	mv a2,s4
	lw a3,-276(s0)
	lw t1,-240(s0)
	lw a6,-208(s0)
	mv a7,s6
	mv t0,s5
	mv t2,s3
	mv s3,s8
	mv s4,s7
	j LBB98
LBB98:
	lw s6,-164(s0)
	lw s5,-552(s0)
	and s6,s6,s5
	bnez s6,LBB100
	j LBB99
LBB99:
	mv s5,a1
	mv a1,a2
	mv a2,a3
	mv a3,t1
	mv s7,s3
	mv t1,s2
	mv t3,s4
	mv t4,s1
	j LBB102
LBB100:
	mv s5,a1
	mv a1,a2
	mv a2,a3
	mv a3,t1
	mv t1,s2
	mv s2,s4
	j LBB101
LBB101:
	slli s4,a2,2
	add s4,a4,s4
	lw s7,0(s4)
	slli s4,a1,2
	add s4,s7,s4
	lw s7,0(s4)
	li s4,-1
	xor s4,s7,s4
	seqz s4,s4
	sw s4,-492(s0)
	mv s7,s3
	mv t3,s2
	mv t4,s1
	j LBB102
LBB102:
	lw s1,-492(s0)
	and s1,s6,s1
	bnez s1,LBB104
	j LBB103
LBB103:
	sw a5,-132(s0)
	sw a4,-60(s0)
	mv s2,a0
	mv s1,s5
	mv a0,a1
	mv a0,a2
	sw a3,-32(s0)
	mv s11,a6
	mv s10,a7
	mv s4,t0
	mv s3,t2
	mv s8,s7
	mv s9,t1
	mv s7,t3
	mv s6,t4
	j LBB114
LBB104:
	mv s1,s5
	mv s2,a3
	mv a3,a6
	mv s3,a7
	mv a6,t0
	mv a7,t2
	mv t0,s7
	mv t2,t3
	j LBB105
LBB105:
	addi s3,s3,1
	slli s4,s3,2
	add s4,s1,s4
	sw a2,0(s4)
	slli s4,s3,2
	add s4,a0,s4
	sw a1,0(s4)
	slli s4,a2,2
	add s4,a4,s4
	lw s5,0(s4)
	slli s4,a1,2
	add s5,s5,s4
	addi s4,s2,1
	sw s4,0(s5)
	xor s4,a2,a7
	seqz s4,s4
	bnez s4,LBB107
	j LBB106
LBB106:
	mv s5,t4
	j LBB109
LBB107:
	mv s5,t4
	j LBB108
LBB108:
	xor s6,a1,a6
	seqz s6,s6
	sw s6,-520(s0)
	j LBB109
LBB109:
	lw s6,-520(s0)
	and s4,s4,s6
	bnez s4,LBB111
	j LBB110
LBB110:
	mv s4,a0
	mv a0,a1
	mv a1,a2
	mv a2,s2
	mv s6,a3
	mv a3,s3
	j LBB113
LBB111:
	mv s4,a0
	mv a0,a1
	mv a1,a2
	mv a2,s2
	mv a3,s3
	mv s2,s5
	j LBB112
LBB112:
	li s3,1
	mv s6,s3
	mv s5,s2
	j LBB113
LBB113:
	sw a5,-132(s0)
	sw a4,-60(s0)
	mv s2,s4
	mv a0,a1
	sw a2,-32(s0)
	mv s11,s6
	mv s10,a3
	mv s4,a6
	mv s3,a7
	mv s8,t0
	mv s9,t1
	mv s7,t2
	mv s6,s5
	j LBB114
LBB114:
	slli a0,s7,2
	add a0,s1,a0
	lw a0,0(a0)
	addi s5,a0,1
	slli a0,s7,2
	add a0,s2,a0
	lw a0,0(a0)
	addi a0,a0,-2
	sw a0,-96(s0)
	mv a0,s5
	mv a1,s6
	call check
	sw a0,-160(s0)
	lw a0,-160(s0)
	bnez a0,LBB116
	j LBB115
LBB115:
	lw a6,-132(s0)
	lw a5,-60(s0)
	mv a0,s2
	mv a1,s1
	lw a2,-96(s0)
	mv a3,s5
	lw t2,-32(s0)
	mv a4,s11
	mv a7,s10
	mv t0,s4
	mv t1,s3
	mv s1,s8
	mv s2,s9
	mv s3,s7
	mv s4,s6
	j LBB118
LBB116:
	lw a0,-132(s0)
	sw a0,-448(s0)
	lw a0,-60(s0)
	sw a0,-412(s0)
	sw s2,-368(s0)
	sw s1,-320(s0)
	lw s1,-96(s0)
	sw s5,-272(s0)
	lw a0,-32(s0)
	sw a0,-236(s0)
	sw s11,-204(s0)
	sw s10,-180(s0)
	mv s2,s4
	mv s4,s8
	mv s5,s9
	j LBB117
LBB117:
	mv a0,s1
	mv a1,s6
	call check
	sw a0,-548(s0)
	lw a6,-448(s0)
	lw a5,-412(s0)
	lw a0,-368(s0)
	lw a1,-320(s0)
	mv a2,s1
	lw a3,-272(s0)
	lw t2,-236(s0)
	lw a4,-204(s0)
	lw a7,-180(s0)
	mv t0,s2
	mv t1,s3
	mv s1,s4
	mv s2,s5
	mv s3,s7
	mv s4,s6
	j LBB118
LBB118:
	lw s6,-160(s0)
	lw s5,-548(s0)
	and s5,s6,s5
	bnez s5,LBB120
	j LBB119
LBB119:
	mv s6,s1
	mv t3,s3
	mv t4,s4
	j LBB122
LBB120:
	j LBB121
LBB121:
	slli s6,a3,2
	add s6,a5,s6
	lw s7,0(s6)
	slli s6,a2,2
	add s6,s7,s6
	lw s7,0(s6)
	li s6,-1
	xor s6,s7,s6
	seqz s6,s6
	sw s6,-488(s0)
	mv s6,s1
	mv t3,s3
	mv t4,s4
	j LBB122
LBB122:
	lw s1,-488(s0)
	and s1,s5,s1
	bnez s1,LBB124
	j LBB123
LBB123:
	sw a6,-128(s0)
	sw a5,-56(s0)
	mv s1,a0
	mv s7,a1
	mv a0,a2
	mv a0,a3
	sw t2,-28(s0)
	mv s11,a4
	mv s10,a7
	mv s5,t0
	mv s8,t1
	mv s9,s6
	mv s3,s2
	mv s4,t3
	mv s2,t4
	j LBB134
LBB124:
	mv s3,a2
	mv a2,a3
	mv a3,t2
	mv s4,a7
	mv a7,t0
	mv t0,t1
	mv t1,s6
	mv t2,t3
	mv s1,t4
	j LBB125
LBB125:
	addi s4,s4,1
	slli s5,s4,2
	add s5,a1,s5
	sw a2,0(s5)
	slli s5,s4,2
	add s5,a0,s5
	sw s3,0(s5)
	slli s5,a2,2
	add s5,a5,s5
	lw s6,0(s5)
	slli s5,s3,2
	add s6,s6,s5
	addi s5,a3,1
	sw s5,0(s6)
	xor s5,a2,t0
	seqz s5,s5
	bnez s5,LBB127
	j LBB126
LBB126:
	j LBB129
LBB127:
	j LBB128
LBB128:
	xor s6,s3,a7
	seqz s6,s6
	sw s6,-516(s0)
	j LBB129
LBB129:
	lw s6,-516(s0)
	and s5,s5,s6
	bnez s5,LBB131
	j LBB130
LBB130:
	mv s5,a0
	mv a0,s3
	mv s3,a4
	mv a4,s4
	mv s6,s1
	j LBB133
LBB131:
	mv s5,a0
	mv a0,s3
	mv a4,s4
	j LBB132
LBB132:
	li s3,1
	mv s6,s1
	j LBB133
LBB133:
	sw a6,-128(s0)
	sw a5,-56(s0)
	mv s1,s5
	mv s7,a1
	mv a0,a2
	sw a3,-28(s0)
	mv s11,s3
	mv s10,a4
	mv s5,a7
	mv s8,t0
	mv s9,t1
	mv s3,s2
	mv s4,t2
	mv s2,s6
	j LBB134
LBB134:
	slli a0,s4,2
	add a0,s7,a0
	lw a0,0(a0)
	addi s6,a0,1
	slli a0,s4,2
	add a0,s1,a0
	lw a0,0(a0)
	addi a0,a0,2
	sw a0,-92(s0)
	mv a0,s6
	mv a1,s2
	call check
	sw a0,-156(s0)
	lw a0,-156(s0)
	bnez a0,LBB136
	j LBB135
LBB135:
	lw a3,-128(s0)
	lw a4,-56(s0)
	mv a0,s1
	mv a1,s7
	lw a2,-92(s0)
	mv a5,s6
	lw t0,-28(s0)
	mv a6,s11
	mv a7,s10
	mv t1,s5
	mv t2,s8
	mv s1,s9
	j LBB138
LBB136:
	lw a0,-128(s0)
	sw a0,-444(s0)
	lw a0,-56(s0)
	sw a0,-408(s0)
	sw s1,-364(s0)
	sw s7,-316(s0)
	lw s1,-92(s0)
	sw s6,-268(s0)
	lw a0,-28(s0)
	sw a0,-232(s0)
	mv s6,s11
	mv s7,s10
	j LBB137
LBB137:
	mv a0,s1
	mv a1,s2
	call check
	sw a0,-544(s0)
	lw a3,-444(s0)
	lw a4,-408(s0)
	lw a0,-364(s0)
	lw a1,-316(s0)
	mv a2,s1
	lw a5,-268(s0)
	lw t0,-232(s0)
	mv a6,s6
	mv a7,s7
	mv t1,s5
	mv t2,s8
	mv s1,s9
	j LBB138
LBB138:
	lw s6,-156(s0)
	lw s5,-544(s0)
	and s6,s6,s5
	bnez s6,LBB140
	j LBB139
LBB139:
	mv s5,a0
	mv a0,a1
	mv a1,a2
	mv a2,a5
	mv a5,t0
	mv t0,t1
	mv t1,s3
	mv s7,s4
	mv t3,s2
	j LBB142
LBB140:
	mv s5,a0
	mv a0,a1
	mv a1,a2
	mv a2,a5
	mv a5,t0
	mv t0,t1
	mv t1,s3
	mv s3,s4
	j LBB141
LBB141:
	slli s4,a2,2
	add s4,a4,s4
	lw s7,0(s4)
	slli s4,a1,2
	add s4,s7,s4
	lw s7,0(s4)
	li s4,-1
	xor s4,s7,s4
	seqz s4,s4
	sw s4,-484(s0)
	mv s7,s3
	mv t3,s2
	j LBB142
LBB142:
	lw s2,-484(s0)
	and s2,s6,s2
	bnez s2,LBB144
	j LBB143
LBB143:
	sw a3,-124(s0)
	sw a4,-52(s0)
	mv s2,s5
	mv s5,a0
	mv a0,a1
	mv a0,a2
	sw a5,-24(s0)
	mv s11,a6
	mv s10,a7
	mv s9,t0
	mv s4,t2
	mv s3,s1
	mv s8,t1
	mv s6,t3
	j LBB154
LBB144:
	mv s2,s5
	mv s3,a2
	mv a2,a5
	mv a5,a6
	mv s4,a7
	mv a6,t0
	mv a7,t2
	mv t2,s1
	mv t0,t1
	mv t1,s7
	j LBB145
LBB145:
	addi s1,s4,1
	slli s4,s1,2
	add s4,a0,s4
	sw s3,0(s4)
	slli s4,s1,2
	add s4,s2,s4
	sw a1,0(s4)
	slli s4,s3,2
	add s4,a4,s4
	lw s5,0(s4)
	slli s4,a1,2
	add s5,s5,s4
	addi s4,a2,1
	sw s4,0(s5)
	xor s4,s3,a7
	seqz s4,s4
	bnez s4,LBB147
	j LBB146
LBB146:
	mv s5,t3
	j LBB149
LBB147:
	mv s5,t3
	j LBB148
LBB148:
	xor s6,a1,a6
	seqz s6,s6
	sw s6,-512(s0)
	j LBB149
LBB149:
	lw s6,-512(s0)
	and s4,s4,s6
	bnez s4,LBB151
	j LBB150
LBB150:
	mv s4,a5
	mv a5,s1
	mv s1,s5
	j LBB153
LBB151:
	mv a5,s1
	mv s1,s5
	j LBB152
LBB152:
	li s4,1
	j LBB153
LBB153:
	sw a3,-124(s0)
	sw a4,-52(s0)
	mv s5,a0
	mv a0,a1
	mv a0,s3
	sw a2,-24(s0)
	mv s11,s4
	mv s10,a5
	mv s9,a6
	mv s4,a7
	mv s3,t2
	mv s8,t0
	mv s7,t1
	mv s6,s1
	j LBB154
LBB154:
	slli a0,s7,2
	add a0,s5,a0
	lw a0,0(a0)
	addi s1,a0,-2
	slli a0,s7,2
	add a0,s2,a0
	lw a0,0(a0)
	addi a0,a0,-1
	sw a0,-88(s0)
	mv a0,s1
	mv a1,s6
	call check
	sw a0,-152(s0)
	lw a0,-152(s0)
	bnez a0,LBB156
	j LBB155
LBB155:
	lw a5,-124(s0)
	lw a4,-52(s0)
	mv a0,s2
	mv a1,s5
	lw a2,-88(s0)
	mv a3,s1
	lw t1,-24(s0)
	mv a6,s11
	mv a7,s10
	mv t0,s9
	mv t2,s4
	mv s1,s3
	mv s2,s8
	mv s3,s7
	mv s4,s6
	j LBB158
LBB156:
	lw a0,-124(s0)
	sw a0,-440(s0)
	lw a0,-52(s0)
	sw a0,-404(s0)
	sw s2,-360(s0)
	sw s5,-312(s0)
	lw s2,-88(s0)
	sw s1,-264(s0)
	lw a0,-24(s0)
	sw a0,-228(s0)
	sw s11,-200(s0)
	mv s1,s10
	mv s5,s9
	j LBB157
LBB157:
	mv a0,s2
	mv a1,s6
	call check
	sw a0,-540(s0)
	lw a5,-440(s0)
	lw a4,-404(s0)
	lw a0,-360(s0)
	lw a1,-312(s0)
	mv a2,s2
	lw a3,-264(s0)
	lw t1,-228(s0)
	lw a6,-200(s0)
	mv a7,s1
	mv t0,s5
	mv t2,s4
	mv s1,s3
	mv s2,s8
	mv s3,s7
	mv s4,s6
	j LBB158
LBB158:
	lw s6,-152(s0)
	lw s5,-540(s0)
	and s6,s6,s5
	bnez s6,LBB160
	j LBB159
LBB159:
	mv s5,a0
	mv a0,a2
	mv s7,a3
	mv a2,t1
	mv a3,a6
	mv a6,t0
	mv s8,s1
	mv t0,s2
	mv t1,s3
	j LBB162
LBB160:
	mv s5,a0
	mv a0,a2
	mv s7,a3
	mv a2,t1
	mv a3,a6
	mv a6,t0
	mv t0,s2
	mv t1,s3
	mv s2,s4
	j LBB161
LBB161:
	slli s3,s7,2
	add s3,a4,s3
	lw s4,0(s3)
	slli s3,a0,2
	add s3,s4,s3
	lw s4,0(s3)
	li s3,-1
	xor s3,s4,s3
	seqz s3,s3
	sw s3,-480(s0)
	mv s8,s1
	mv s4,s2
	j LBB162
LBB162:
	lw s1,-480(s0)
	and s1,s6,s1
	bnez s1,LBB164
	j LBB163
LBB163:
	sw a5,-120(s0)
	sw a4,-48(s0)
	mv s6,s5
	mv s3,a1
	mv a0,s7
	sw a2,-20(s0)
	mv s11,a3
	mv s10,a7
	mv s9,a6
	mv s1,t2
	mv s7,s8
	mv s5,t0
	mv s2,t1
	j LBB174
LBB164:
	mv s1,s5
	mv s2,s7
	mv s3,a2
	mv a2,a3
	mv s6,a7
	mv s5,a6
	mv a3,t2
	mv a6,s8
	mv a7,t1
	j LBB165
LBB165:
	addi t2,s6,1
	slli t1,t2,2
	add t1,a1,t1
	sw s2,0(t1)
	slli t1,t2,2
	add t1,s1,t1
	sw a0,0(t1)
	slli t1,s2,2
	add t1,a4,t1
	lw s6,0(t1)
	slli t1,a0,2
	add s6,s6,t1
	addi t1,s3,1
	sw t1,0(s6)
	xor t1,s2,a3
	seqz t1,t1
	bnez t1,LBB167
	j LBB166
LBB166:
	j LBB169
LBB167:
	j LBB168
LBB168:
	xor s6,a0,s5
	seqz s6,s6
	sw s6,-508(s0)
	j LBB169
LBB169:
	lw s6,-508(s0)
	and t1,t1,s6
	bnez t1,LBB171
	j LBB170
LBB170:
	mv t1,s1
	mv s1,s3
	mv s7,a2
	mv a2,t2
	mv t2,s4
	j LBB173
LBB171:
	mv t1,s1
	mv s1,s3
	mv a2,t2
	mv t2,s4
	j LBB172
LBB172:
	li s3,1
	mv s7,s3
	j LBB173
LBB173:
	sw a5,-120(s0)
	sw a4,-48(s0)
	mv s6,t1
	mv s3,a1
	mv a0,s2
	sw s1,-20(s0)
	mv s11,s7
	mv s10,a2
	mv s9,s5
	mv s1,a3
	mv s7,a6
	mv s5,t0
	mv s2,a7
	mv s4,t2
	j LBB174
LBB174:
	slli a0,s2,2
	add a0,s3,a0
	lw a0,0(a0)
	addi s8,a0,-2
	slli a0,s2,2
	add a0,s6,a0
	lw a0,0(a0)
	addi a0,a0,1
	sw a0,-84(s0)
	mv a0,s8
	mv a1,s4
	call check
	sw a0,-148(s0)
	lw a0,-148(s0)
	bnez a0,LBB176
	j LBB175
LBB175:
	lw a4,-120(s0)
	lw a5,-48(s0)
	mv a0,s6
	mv a1,s3
	lw a2,-84(s0)
	mv a3,s8
	lw t1,-20(s0)
	mv a6,s11
	mv a7,s10
	mv t0,s9
	mv t2,s1
	mv s1,s7
	mv s3,s5
	j LBB178
LBB176:
	lw a0,-120(s0)
	sw a0,-436(s0)
	lw a0,-48(s0)
	sw a0,-400(s0)
	sw s6,-356(s0)
	sw s3,-308(s0)
	lw s3,-84(s0)
	sw s8,-260(s0)
	lw a0,-20(s0)
	sw a0,-224(s0)
	sw s11,-196(s0)
	mv s6,s10
	mv s8,s9
	j LBB177
LBB177:
	mv a0,s3
	mv a1,s4
	call check
	sw a0,-536(s0)
	lw a4,-436(s0)
	lw a5,-400(s0)
	lw a0,-356(s0)
	lw a1,-308(s0)
	mv a2,s3
	lw a3,-260(s0)
	lw t1,-224(s0)
	lw a6,-196(s0)
	mv a7,s6
	mv t0,s8
	mv t2,s1
	mv s1,s7
	mv s3,s5
	j LBB178
LBB178:
	lw s6,-148(s0)
	lw s5,-536(s0)
	and s6,s6,s5
	bnez s6,LBB180
	j LBB179
LBB179:
	mv s5,a0
	mv a0,a2
	mv a2,a3
	mv a3,t1
	mv s8,s1
	mv t1,s3
	mv t3,s2
	mv s3,s4
	j LBB182
LBB180:
	mv s5,a0
	mv a0,a2
	mv a2,a3
	mv a3,t1
	mv t1,s3
	mv s3,s4
	j LBB181
LBB181:
	slli s4,a2,2
	add s4,a5,s4
	lw s7,0(s4)
	slli s4,a0,2
	add s4,s7,s4
	lw s7,0(s4)
	li s4,-1
	xor s4,s7,s4
	seqz s4,s4
	sw s4,-476(s0)
	mv s8,s1
	mv t3,s2
	j LBB182
LBB182:
	lw s1,-476(s0)
	and s1,s6,s1
	bnez s1,LBB184
	j LBB183
LBB183:
	sw a4,-116(s0)
	sw a5,-44(s0)
	mv s2,s5
	mv s7,a1
	mv a0,a2
	sw a3,-16(s0)
	mv s11,a6
	mv s10,a7
	mv s1,t0
	mv s6,t2
	mv s5,s8
	mv s9,t1
	mv s8,t3
	j LBB194
LBB184:
	mv s1,s5
	mv s5,a7
	mv a7,t0
	mv s2,t2
	mv t0,s8
	mv s4,t1
	mv t1,t3
	mv t2,s3
	j LBB185
LBB185:
	addi s3,s5,1
	slli s5,s3,2
	add s5,a1,s5
	sw a2,0(s5)
	slli s5,s3,2
	add s5,s1,s5
	sw a0,0(s5)
	slli s5,a2,2
	add s5,a5,s5
	lw s6,0(s5)
	slli s5,a0,2
	add s6,s6,s5
	addi s5,a3,1
	sw s5,0(s6)
	xor s5,a2,s2
	seqz s5,s5
	bnez s5,LBB187
	j LBB186
LBB186:
	j LBB189
LBB187:
	j LBB188
LBB188:
	xor s6,a0,a7
	seqz s6,s6
	sw s6,-504(s0)
	j LBB189
LBB189:
	lw s6,-504(s0)
	and s5,s5,s6
	bnez s5,LBB191
	j LBB190
LBB190:
	mv s5,a6
	mv a6,s3
	mv s3,s2
	j LBB193
LBB191:
	mv a6,s3
	j LBB192
LBB192:
	li s3,1
	mv s5,s3
	mv s3,s2
	j LBB193
LBB193:
	sw a4,-116(s0)
	sw a5,-44(s0)
	mv s2,s1
	mv s7,a1
	mv a0,a2
	sw a3,-16(s0)
	mv s11,s5
	mv s10,a6
	mv s1,a7
	mv s6,s3
	mv s5,t0
	mv s9,s4
	mv s8,t1
	mv s3,t2
	j LBB194
LBB194:
	slli a0,s8,2
	add a0,s7,a0
	lw a0,0(a0)
	addi s4,a0,2
	slli a0,s8,2
	add a0,s2,a0
	lw a0,0(a0)
	addi a0,a0,-1
	sw a0,-80(s0)
	mv a0,s4
	mv a1,s3
	call check
	sw a0,-144(s0)
	lw a0,-144(s0)
	bnez a0,LBB196
	j LBB195
LBB195:
	lw a4,-116(s0)
	lw a5,-44(s0)
	mv a0,s2
	mv a1,s7
	lw a2,-80(s0)
	mv a3,s4
	lw t1,-16(s0)
	mv a6,s11
	mv a7,s10
	mv t0,s1
	mv t2,s6
	mv s1,s5
	mv s2,s9
	mv s4,s8
	j LBB198
LBB196:
	lw a0,-116(s0)
	sw a0,-432(s0)
	lw a0,-44(s0)
	sw a0,-396(s0)
	sw s2,-352(s0)
	sw s7,-304(s0)
	lw s2,-80(s0)
	sw s4,-256(s0)
	lw a0,-16(s0)
	sw a0,-220(s0)
	sw s11,-192(s0)
	mv s4,s10
	mv s7,s9
	j LBB197
LBB197:
	mv a0,s2
	mv a1,s3
	call check
	sw a0,-532(s0)
	lw a4,-432(s0)
	lw a5,-396(s0)
	lw a0,-352(s0)
	lw a1,-304(s0)
	mv a2,s2
	lw a3,-256(s0)
	lw t1,-220(s0)
	lw a6,-192(s0)
	mv a7,s4
	mv t0,s1
	mv t2,s6
	mv s1,s5
	mv s2,s7
	mv s4,s8
	j LBB198
LBB198:
	lw s6,-144(s0)
	lw s5,-532(s0)
	and s6,s6,s5
	bnez s6,LBB200
	j LBB199
LBB199:
	mv s5,a0
	mv a0,a1
	mv a1,a2
	mv a2,a3
	mv a3,t1
	mv s8,s1
	mv t1,s2
	mv t3,s3
	j LBB202
LBB200:
	mv s5,a0
	mv a0,a1
	mv a1,a2
	mv a2,a3
	mv a3,t1
	mv t1,s2
	mv s2,s4
	j LBB201
LBB201:
	slli s4,a2,2
	add s4,a5,s4
	lw s7,0(s4)
	slli s4,a1,2
	add s4,s7,s4
	lw s7,0(s4)
	li s4,-1
	xor s4,s7,s4
	seqz s4,s4
	sw s4,-472(s0)
	mv s8,s1
	mv s4,s2
	mv t3,s3
	j LBB202
LBB202:
	lw s1,-472(s0)
	and s1,s6,s1
	bnez s1,LBB204
	j LBB203
LBB203:
	sw a4,-140(s0)
	sw a5,-40(s0)
	mv s1,s5
	mv s6,a0
	mv a0,a1
	mv a0,a2
	sw a3,-12(s0)
	mv s11,a6
	mv s10,a7
	mv s7,t0
	mv s2,t2
	mv s9,s8
	mv s8,t1
	mv s3,s4
	mv s4,t3
	j LBB214
LBB204:
	mv s1,s5
	mv s2,a3
	mv a3,a6
	mv s5,a7
	mv s3,t0
	mv a6,t2
	mv a7,s8
	mv t0,s4
	j LBB205
LBB205:
	addi t2,s5,1
	slli s4,t2,2
	add s4,a0,s4
	sw a2,0(s4)
	slli s4,t2,2
	add s4,s1,s4
	sw a1,0(s4)
	slli s4,a2,2
	add s4,a5,s4
	lw s5,0(s4)
	slli s4,a1,2
	add s5,s5,s4
	addi s4,s2,1
	sw s4,0(s5)
	xor s4,a2,a6
	seqz s4,s4
	bnez s4,LBB207
	j LBB206
LBB206:
	mv s5,t3
	j LBB209
LBB207:
	mv s5,t3
	j LBB208
LBB208:
	xor s6,a1,s3
	seqz s6,s6
	sw s6,-500(s0)
	j LBB209
LBB209:
	lw s6,-500(s0)
	and s4,s4,s6
	bnez s4,LBB211
	j LBB210
LBB210:
	mv s4,a0
	mv a0,a1
	mv a1,a2
	mv a2,s2
	mv s2,a3
	mv a3,t2
	mv t2,s3
	j LBB213
LBB211:
	mv s4,a0
	mv a0,a1
	mv a1,a2
	mv a2,s2
	mv a3,t2
	j LBB212
LBB212:
	li t2,1
	mv s2,t2
	mv t2,s3
	j LBB213
LBB213:
	sw a4,-140(s0)
	sw a5,-40(s0)
	mv s6,s4
	mv a0,a1
	sw a2,-12(s0)
	mv s11,s2
	mv s10,a3
	mv s7,t2
	mv s2,a6
	mv s9,a7
	mv s8,t1
	mv s3,t0
	mv s4,s5
	j LBB214
LBB214:
	slli a0,s3,2
	add a0,s6,a0
	lw a0,0(a0)
	addi s5,a0,2
	slli a0,s3,2
	add a0,s1,a0
	lw a0,0(a0)
	addi a0,a0,1
	sw a0,-76(s0)
	mv a0,s5
	mv a1,s4
	call check
	sw a0,-108(s0)
	lw a0,-108(s0)
	bnez a0,LBB216
	j LBB215
LBB215:
	lw t0,-140(s0)
	lw t1,-40(s0)
	mv a0,s1
	mv a1,s6
	lw a2,-76(s0)
	mv a3,s5
	lw s1,-12(s0)
	mv a4,s11
	mv a5,s10
	mv a6,s7
	mv a7,s2
	mv t2,s9
	mv s2,s8
	j LBB218
LBB216:
	lw a0,-140(s0)
	sw a0,-428(s0)
	lw a0,-40(s0)
	sw a0,-392(s0)
	sw s1,-348(s0)
	sw s6,-300(s0)
	lw s1,-76(s0)
	sw s5,-252(s0)
	lw a0,-12(s0)
	sw a0,-216(s0)
	sw s11,-188(s0)
	mv s6,s2
	mv s5,s9
	mv s2,s8
	j LBB217
LBB217:
	mv a0,s1
	mv a1,s4
	call check
	sw a0,-528(s0)
	lw t0,-428(s0)
	lw t1,-392(s0)
	lw a0,-348(s0)
	lw a1,-300(s0)
	mv a2,s1
	lw a3,-252(s0)
	lw s1,-216(s0)
	lw a4,-188(s0)
	mv a5,s10
	mv a6,s7
	mv a7,s6
	mv t2,s5
	j LBB218
LBB218:
	lw s6,-108(s0)
	lw s5,-528(s0)
	and s5,s6,s5
	bnez s5,LBB220
	j LBB219
LBB219:
	j LBB222
LBB220:
	j LBB221
LBB221:
	slli s6,a3,2
	add s6,t1,s6
	lw s7,0(s6)
	slli s6,a2,2
	add s6,s7,s6
	lw s7,0(s6)
	li s6,-1
	xor s6,s7,s6
	seqz s6,s6
	sw s6,-468(s0)
	j LBB222
LBB222:
	lw s6,-468(s0)
	and s5,s5,s6
	bnez s5,LBB224
	j LBB223
LBB223:
	mv s6,t1
	mv t1,a1
	mv a1,a2
	mv a2,a3
	mv a3,s1
	mv s5,a4
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t2
	mv t2,s2
	mv s7,s3
	mv s3,s4
	j LBB234
LBB224:
	mv s5,a1
	mv a1,a2
	mv a2,a3
	mv a3,s1
	j LBB225
LBB225:
	addi s1,a5,1
	slli a5,s1,2
	add a5,s5,a5
	sw a2,0(a5)
	slli a5,s1,2
	add a5,a0,a5
	sw a1,0(a5)
	slli a5,a2,2
	add a5,t1,a5
	lw s6,0(a5)
	slli a5,a1,2
	add s6,s6,a5
	addi a5,a3,1
	sw a5,0(s6)
	xor a5,a2,a7
	seqz a5,a5
	bnez a5,LBB227
	j LBB226
LBB226:
	j LBB229
LBB227:
	j LBB228
LBB228:
	xor s6,a1,a6
	seqz s6,s6
	sw s6,-464(s0)
	j LBB229
LBB229:
	lw s6,-464(s0)
	and a5,a5,s6
	bnez a5,LBB231
	j LBB230
LBB230:
	mv a5,t1
	mv t1,s5
	mv s5,a4
	mv a4,s1
	mv s1,s2
	mv s2,s3
	mv s3,s4
	j LBB233
LBB231:
	mv a5,t1
	mv t1,s5
	mv a4,s1
	j LBB232
LBB232:
	li s1,1
	mv s5,s1
	mv s1,s2
	mv s2,s3
	mv s3,s4
	j LBB233
LBB233:
	mv s6,a5
	mv a5,a6
	mv a6,a7
	mv a7,t2
	mv t2,s1
	mv s7,s2
	j LBB234
LBB234:
	li s1,1
	xor s1,s5,s1
	seqz s1,s1
	bnez s1,LBB236
	j LBB235
LBB235:
	mv s1,t0
	mv s2,s6
	mv s4,a0
	mv t0,t1
	mv a0,a1
	mv t1,a2
	mv a1,a3
	mv a2,s5
	mv a3,a4
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t2
	mv s5,s7
	mv t2,s3
	j LBB238
LBB236:
	mv s1,t0
	mv s4,s6
	mv s2,a0
	mv a0,a1
	mv t0,a2
	mv a1,a3
	mv a2,s5
	mv a3,a4
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t2
	mv s5,s7
	mv s6,s3
	j LBB237
LBB237:
	mv t2,s1
	mv s1,s4
	mv s3,t1
	mv t1,a2
	mv s4,a3
	mv a2,a5
	mv a5,a6
	mv a6,a7
	mv a3,s5
	mv a7,s6
	j LBB239
LBB238:
	addi s3,s5,1
	mv s5,a2
	mv s7,a3
	mv a2,a5
	mv a5,a6
	mv a6,a7
	mv a3,s3
	mv a7,t2
	j LBB71
LBB239:
	li s5,1
	xor s5,t1,s5
	seqz s5,s5
	bnez s5,LBB241
	j LBB240
LBB240:
	sw t2,-388(s0)
	sw s1,-344(s0)
	sw s2,-296(s0)
	sw s3,-176(s0)
	mv s11,a0
	mv s10,t0
	mv s1,a1
	mv s2,t1
	mv s3,s4
	mv s4,a4
	mv s5,a2
	mv s6,a5
	mv s7,a6
	mv s8,a3
	mv s9,a7
	j LBB243
LBB241:
	sw t2,-384(s0)
	mv s6,s1
	sw s2,-340(s0)
	sw s3,-292(s0)
	sw a0,-172(s0)
	mv s11,t0
	mv s10,a1
	mv s8,t1
	mv s1,s4
	mv s7,a4
	mv s3,a2
	mv s4,a5
	mv s5,a6
	mv s9,a3
	mv s2,a7
	j LBB242
LBB242:
	slli a0,s3,2
	add a0,s6,a0
	lw a1,0(a0)
	slli a0,s7,2
	add a0,a1,a0
	lw a0,0(a0)
	call toString
	call println
	lw a1,-384(s0)
	mv a0,s6
	lw a2,-340(s0)
	lw a3,-292(s0)
	lw a4,-172(s0)
	mv a5,s11
	mv a6,s10
	mv a7,s8
	mv t0,s1
	mv t1,s7
	mv t2,s3
	mv s1,s4
	mv s3,s5
	mv s4,s9
	j LBB244
LBB243:
	la a0,const_string_no0
	call print
	lw a1,-388(s0)
	lw a0,-344(s0)
	lw a2,-296(s0)
	lw a3,-176(s0)
	mv a4,s11
	mv a5,s10
	mv a6,s1
	mv a7,s2
	mv t0,s3
	mv t1,s4
	mv t2,s5
	mv s1,s6
	mv s3,s7
	mv s4,s8
	mv s2,s9
	j LBB244
LBB244:
	li s5,0
	mv a0,a2
	mv a0,a3
	mv a0,a4
	mv a0,a5
	j LBB245
LBB245:
	mv a0,s5
	addi sp,sp,624
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	"no solution!\n"

