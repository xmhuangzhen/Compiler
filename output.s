	.text
	.globl	test					# start function : test
	.p2align	2
test:
#LBB40:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	mv s0,sp
	addi sp,sp,-120
	mv t2,a0
	mv t1,a1
	mv t0,a2
	mv a1,a3
	mv a2,a4
	mv a3,a5
	mv a4,a6
	mv a5,a7
	lw a6,0(s0)
	lw a7,4(s0)
	xor s3,t2,t1
	seqz s3,s3
	bnez s3,LBB41
	j LBB73
LBB41:
	xor s3,t1,t0
	snez s4,s3
	li s3,0
	xor s3,s4,s3
	seqz s3,s3
	bnez s3,LBB42
	j LBB43
LBB42:
	xor s1,t0,a1
	snez s1,s1
LBB43:
	or s1,s4,s1
	bnez s1,LBB44
	j LBB54
LBB44:
LBB45:
	xor s1,t1,t0
	seqz s1,s1
	bnez s1,LBB46
	j LBB51
LBB46:
	xor s1,t0,a1
	snez s2,s1
	li s1,0
	xor s1,s2,s1
	seqz s1,s1
	bnez s1,LBB47
	j LBB48
LBB47:
	xor a0,a1,a2
	snez a0,a0
LBB48:
	or a0,s2,a0
	bnez a0,LBB49
	j LBB50
LBB49:
	mv a0,t0
	sw t2,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,1
	j LBB52
LBB50:
	addi a4,a4,-1
	addi a5,a5,-2
	mv a0,t0
	sw t2,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,2
	j LBB52
LBB51:
	add a0,t1,t0
	add a0,a0,t1
LBB52:
LBB53:
	addi a0,a0,1
	j LBB74
LBB54:
	addi s1,a3,-1
	addi a3,a4,-2
LBB55:
	xor a4,t1,t0
	seqz a4,a4
	bnez a4,LBB56
	j LBB70
LBB56:
	xor a4,t0,a1
	snez s3,a4
	li a4,0
	xor a4,s3,a4
	seqz a4,a4
	bnez a4,LBB57
	j LBB58
LBB57:
	xor a4,a1,a2
	snez s2,a4
LBB58:
	or a4,s3,s2
	bnez a4,LBB59
	j LBB69
LBB59:
LBB60:
	xor a4,t0,a1
	seqz a4,a4
	bnez a4,LBB61
	j LBB66
LBB61:
	xor a4,a1,a2
	snez s2,a4
	li a4,0
	xor a4,s2,a4
	seqz a4,a4
	bnez a4,LBB62
	j LBB63
LBB62:
	xor a0,a2,s1
	snez a0,a0
LBB63:
	or a0,s2,a0
	bnez a0,LBB64
	j LBB65
LBB64:
	mv a0,a1
	mv a1,a2
	mv a2,s1
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t2
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,1
	j LBB67
LBB65:
	addi a4,a5,-1
	addi a5,a6,-2
	mv a0,a1
	mv a1,a2
	mv a2,s1
	mv a6,a7
	mv a7,t2
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB67
LBB66:
	add a0,t0,a1
	add a0,a0,t0
LBB67:
LBB68:
	addi a0,a0,1
	j LBB71
LBB69:
	addi a4,a3,-1
	addi a5,a5,-2
	mv a0,t0
	mv a3,s1
	sw t2,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,2
	j LBB71
LBB70:
	add a0,t1,t0
	add a0,a0,t1
LBB71:
LBB72:
	addi a0,a0,2
	j LBB74
LBB73:
	add a0,t2,t1
	add a0,a0,t2
LBB74:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB75:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-120
LBB76:
	li s1,0
	li s2,19260817
LBB77:
LBB78:
LBB79:
	li a0,13
	sll a0,s2,a0
LBB80:
	xor a1,s2,a0
LBB81:
	li a0,17
	li a2,0
	slt a2,a1,a2
	xori a2,a2,1
	bnez a2,LBB82
	j LBB83
LBB82:
	sra a0,a1,a0
	j LBB84
LBB83:
	li a2,31
	sub a3,a2,a0
	li a2,1
	sll a3,a2,a3
	li a2,-2147483648
	xor a2,a1,a2
	sra a0,a2,a0
	or a0,a3,a0
LBB84:
LBB85:
	xor a1,a1,a0
LBB86:
	li a0,5
	sll a0,a1,a0
LBB87:
	xor a1,a1,a0
	li a0,1073741823
	and a2,a1,a0
LBB88:
LBB89:
LBB90:
	mv a0,a2
	li a1,13
	sll a0,a0,a1
LBB91:
	xor a1,a2,a0
LBB92:
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB93
	j LBB94
LBB93:
	sra a0,a1,a0
	j LBB95
LBB94:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a3,a1,a3
	sra a0,a3,a0
	or a0,a4,a0
LBB95:
LBB96:
	xor a1,a1,a0
LBB97:
	li a0,5
	sll a0,a1,a0
LBB98:
	xor a1,a1,a0
	li a0,1073741823
	and a1,a1,a0
LBB99:
	andi a2,a2,255
	andi a0,a1,255
	xor a0,a2,a0
	snez a0,a0
	bnez a0,LBB100
	j LBB156
LBB100:
LBB101:
LBB102:
	li a0,13
	sll a0,a1,a0
LBB103:
	xor a1,a1,a0
LBB104:
	li a0,17
	li a2,0
	slt a2,a1,a2
	xori a2,a2,1
	bnez a2,LBB105
	j LBB106
LBB105:
	sra a0,a1,a0
	j LBB107
LBB106:
	li a2,31
	sub a3,a2,a0
	li a2,1
	sll a3,a2,a3
	li a2,-2147483648
	xor a2,a1,a2
	sra a0,a2,a0
	or a0,a3,a0
LBB107:
LBB108:
	xor a1,a1,a0
LBB109:
	li a0,5
	sll a0,a1,a0
LBB110:
	xor a1,a1,a0
	li a0,1073741823
	and a2,a1,a0
LBB111:
LBB112:
LBB113:
	mv a0,a2
	li a1,13
	sll a0,a0,a1
LBB114:
	xor a1,a2,a0
LBB115:
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB116
	j LBB117
LBB116:
	sra a0,a1,a0
	j LBB118
LBB117:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a3,a1,a3
	sra a0,a3,a0
	or a0,a4,a0
LBB118:
LBB119:
	xor a1,a1,a0
LBB120:
	li a0,5
	sll a0,a1,a0
LBB121:
	xor a1,a1,a0
	li a0,1073741823
	and a3,a1,a0
LBB122:
LBB123:
LBB124:
	mv a0,a3
	li a1,13
	sll a0,a0,a1
LBB125:
	xor a1,a3,a0
LBB126:
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB127
	j LBB128
LBB127:
	sra a0,a1,a0
	j LBB129
LBB128:
	li a4,31
	sub a5,a4,a0
	li a4,1
	sll a5,a4,a5
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a5,a0
LBB129:
LBB130:
	xor a1,a1,a0
LBB131:
	li a0,5
	sll a0,a1,a0
LBB132:
	xor a1,a1,a0
	li a0,1073741823
	and a5,a1,a0
LBB133:
LBB134:
LBB135:
	mv a0,a5
	li a1,13
	sll a0,a0,a1
LBB136:
	xor a1,a5,a0
LBB137:
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB138
	j LBB139
LBB138:
	sra a0,a1,a0
	j LBB140
LBB139:
	li a4,31
	sub a6,a4,a0
	li a4,1
	sll a6,a4,a6
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a6,a0
LBB140:
LBB141:
	xor a1,a1,a0
LBB142:
	li a0,5
	sll a0,a1,a0
LBB143:
	xor a1,a1,a0
	li a0,1073741823
	and a7,a1,a0
LBB144:
LBB145:
LBB146:
	mv a0,a7
	li a1,13
	sll a0,a0,a1
LBB147:
	xor a1,a7,a0
LBB148:
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB149
	j LBB150
LBB149:
	sra a0,a1,a0
	j LBB151
LBB150:
	li a4,31
	sub a6,a4,a0
	li a4,1
	sll a6,a4,a6
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a6,a0
LBB151:
LBB152:
	xor a1,a1,a0
LBB153:
	li a0,5
	sll a0,a1,a0
LBB154:
	xor a1,a1,a0
	li a0,1073741823
	and s2,a1,a0
LBB155:
	andi a0,a2,3
	srai a1,a2,28
	andi a2,a3,1
	srai a3,a3,29
	srai a4,a5,25
	andi a5,a5,31
	srai a6,a7,15
	li t0,32767
	and a7,a7,t0
	srai t1,s2,15
	li t0,32767
	and t0,s2,t0
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	xor s1,s1,a0
	j LBB157
LBB156:
	j LBB158
LBB157:
	j LBB77
LBB158:
	addi a0,s1,-19
LBB159:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
