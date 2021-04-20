	.text
	.globl	test					# start function : test
	.p2align	2
test:
#LBB40:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-120
	mv t2,a0
	lw t1,0(s0)
	lw s1,4(s0)
	xor t0,t2,a1
	seqz t0,t0
	bnez t0,LBB41
	j LBB46
LBB41:
	xor t0,a1,a2
	snez s2,t0
	li t0,0
	xor t0,s2,t0
	seqz t0,t0
	bnez t0,LBB42
	j LBB43
LBB42:
	xor a0,a2,a3
	snez a0,a0
LBB43:
	or a0,s2,a0
	bnez a0,LBB44
	j LBB45
LBB44:
	mv a0,a1
	mv a1,a2
	mv a2,a3
	mv a3,a4
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t1
	sw s1,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,1
	j LBB47
LBB45:
	addi t0,a5,-1
	addi a5,a6,-2
	mv a0,a1
	mv a1,a2
	mv a2,a3
	mv a3,a4
	mv a4,t0
	mv a6,a7
	mv a7,t1
	sw s1,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,2
	j LBB47
LBB46:
	add a0,t2,a1
	add a0,a0,t2
LBB47:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB48:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-120
LBB49:
LBB50:
LBB51:
	li s1,0
	li s2,19260817
LBB52:
LBB53:
LBB54:
	li a0,13
	sll a0,s2,a0
LBB55:
LBB56:
	xor a1,s2,a0
LBB57:
	li a0,17
	li a2,0
	slt a2,a1,a2
	xori a2,a2,1
	bnez a2,LBB58
	j LBB59
LBB58:
	sra a0,a1,a0
	j LBB60
LBB59:
	li a2,31
	sub a3,a2,a0
	li a2,1
	sll a3,a2,a3
	li a2,-2147483648
	xor a2,a1,a2
	sra a0,a2,a0
	or a0,a3,a0
LBB60:
LBB61:
	xor a1,a1,a0
LBB62:
	li a0,5
	sll a0,a1,a0
LBB63:
LBB64:
	xor a1,a1,a0
	li a0,1073741823
	and a2,a1,a0
LBB65:
LBB66:
LBB67:
LBB68:
	mv a0,a2
	li a1,13
	sll a0,a0,a1
LBB69:
LBB70:
	xor a1,a2,a0
LBB71:
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB72
	j LBB73
LBB72:
	sra a0,a1,a0
	j LBB74
LBB73:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a3,a1,a3
	sra a0,a3,a0
	or a0,a4,a0
LBB74:
LBB75:
	xor a1,a1,a0
LBB76:
	li a0,5
	sll a0,a1,a0
LBB77:
LBB78:
	xor a1,a1,a0
	li a0,1073741823
	and a1,a1,a0
LBB79:
LBB80:
	andi a2,a2,255
	andi a0,a1,255
	xor a0,a2,a0
	snez a0,a0
	bnez a0,LBB81
	j LBB152
LBB81:
LBB82:
LBB83:
	li a0,13
	sll a0,a1,a0
LBB84:
LBB85:
	xor a1,a1,a0
LBB86:
	li a0,17
	li a2,0
	slt a2,a1,a2
	xori a2,a2,1
	bnez a2,LBB87
	j LBB88
LBB87:
	sra a0,a1,a0
	j LBB89
LBB88:
	li a2,31
	sub a3,a2,a0
	li a2,1
	sll a3,a2,a3
	li a2,-2147483648
	xor a2,a1,a2
	sra a0,a2,a0
	or a0,a3,a0
LBB89:
LBB90:
	xor a1,a1,a0
LBB91:
	li a0,5
	sll a0,a1,a0
LBB92:
LBB93:
	xor a1,a1,a0
	li a0,1073741823
	and a2,a1,a0
LBB94:
LBB95:
LBB96:
LBB97:
	mv a0,a2
	li a1,13
	sll a0,a0,a1
LBB98:
LBB99:
	xor a1,a2,a0
LBB100:
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB101
	j LBB102
LBB101:
	sra a0,a1,a0
	j LBB103
LBB102:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a3,a1,a3
	sra a0,a3,a0
	or a0,a4,a0
LBB103:
LBB104:
	xor a1,a1,a0
LBB105:
	li a0,5
	sll a0,a1,a0
LBB106:
LBB107:
	xor a1,a1,a0
	li a0,1073741823
	and a3,a1,a0
LBB108:
LBB109:
LBB110:
LBB111:
	mv a0,a3
	li a1,13
	sll a0,a0,a1
LBB112:
LBB113:
	xor a1,a3,a0
LBB114:
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB115
	j LBB116
LBB115:
	sra a0,a1,a0
	j LBB117
LBB116:
	li a4,31
	sub a5,a4,a0
	li a4,1
	sll a5,a4,a5
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a5,a0
LBB117:
LBB118:
	xor a1,a1,a0
LBB119:
	li a0,5
	sll a0,a1,a0
LBB120:
LBB121:
	xor a1,a1,a0
	li a0,1073741823
	and a5,a1,a0
LBB122:
LBB123:
LBB124:
LBB125:
	mv a0,a5
	li a1,13
	sll a0,a0,a1
LBB126:
LBB127:
	xor a1,a5,a0
LBB128:
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB129
	j LBB130
LBB129:
	sra a0,a1,a0
	j LBB131
LBB130:
	li a4,31
	sub a6,a4,a0
	li a4,1
	sll a6,a4,a6
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a6,a0
LBB131:
LBB132:
	xor a1,a1,a0
LBB133:
	li a0,5
	sll a0,a1,a0
LBB134:
LBB135:
	xor a1,a1,a0
	li a0,1073741823
	and a7,a1,a0
LBB136:
LBB137:
LBB138:
LBB139:
	mv a0,a7
	li a1,13
	sll a0,a0,a1
LBB140:
LBB141:
	xor a1,a7,a0
LBB142:
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB143
	j LBB144
LBB143:
	sra a0,a1,a0
	j LBB145
LBB144:
	li a4,31
	sub a6,a4,a0
	li a4,1
	sll a6,a4,a6
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a6,a0
LBB145:
LBB146:
	xor a1,a1,a0
LBB147:
	li a0,5
	sll a0,a1,a0
LBB148:
LBB149:
	xor a1,a1,a0
	li a0,1073741823
	and s2,a1,a0
LBB150:
LBB151:
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
	j LBB153
LBB152:
	j LBB154
LBB153:
	j LBB52
LBB154:
	addi a0,s1,-19
LBB155:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
