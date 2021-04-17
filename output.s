	.text
	.globl	rng					# start function : rng
	.p2align	2
rng:
#LBB40:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB41:
	mv a1,a0
	li a2,13
	sll a1,a1,a2
LBB42:
LBB43:
	xor a2,a0,a1
LBB44:
	mv a1,a2
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB45
	j LBB46
LBB45:
	sra a0,a1,a0
	j LBB47
LBB46:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a1,a1,a3
	sra a0,a1,a0
	or a0,a4,a0
LBB47:
LBB48:
	xor a1,a2,a0
LBB49:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB50:
LBB51:
	xor a1,a1,a0
	li a0,1073741823
	and a0,a1,a0
LBB52:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : rng
	.globl	test					# start function : test
	.p2align	2
test:
#LBB53:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-120
	mv t1,a0
	mv a0,a1
	mv a1,a2
	mv a2,a3
	mv a3,a4
	mv t0,a6
	mv a6,a7
	lw a7,0(s0)
	lw t2,4(s0)
	xor s1,t1,a0
	seqz s1,s1
	bnez s1,LBB54
	j LBB59
LBB54:
	xor s1,a0,a1
	snez s2,s1
	li s1,0
	xor s1,s2,s1
	seqz s1,s1
	bnez s1,LBB55
	j LBB56
LBB55:
	xor a4,a1,a2
	snez a4,a4
LBB56:
	or a4,s2,a4
	bnez a4,LBB57
	j LBB58
LBB57:
	mv a4,a5
	mv a5,t0
	sw t2,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,1
	j LBB60
LBB58:
	addi a4,a5,-1
	addi a5,t0,-2
	sw t2,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,2
	j LBB60
LBB59:
	add a0,t1,a0
	add a0,a0,t1
LBB60:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw ra,-4(sp)
	ret
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB61:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	mv s0,sp
	addi sp,sp,-120
LBB62:
LBB63:
LBB64:
	li s1,0
	li s2,19260817
LBB65:
LBB66:
LBB67:
	mv a0,s2
	li a1,13
	sll a0,a0,a1
LBB68:
LBB69:
	xor a2,s2,a0
LBB70:
	mv a1,a2
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB71
	j LBB72
LBB71:
	sra a0,a1,a0
	j LBB73
LBB72:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a1,a1,a3
	sra a0,a1,a0
	or a0,a4,a0
LBB73:
LBB74:
	xor a1,a2,a0
LBB75:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB76:
LBB77:
	xor a1,a1,a0
	li a0,1073741823
	and a3,a1,a0
LBB78:
LBB79:
LBB80:
	mv a1,a3
LBB81:
	mv a0,a1
	li a2,13
	sll a0,a0,a2
LBB82:
LBB83:
	xor a2,a1,a0
LBB84:
	mv a1,a2
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB85
	j LBB86
LBB85:
	sra a0,a1,a0
	j LBB87
LBB86:
	li a4,31
	sub a5,a4,a0
	li a4,1
	sll a5,a4,a5
	li a4,-2147483648
	xor a1,a1,a4
	sra a0,a1,a0
	or a0,a5,a0
LBB87:
LBB88:
	xor a1,a2,a0
LBB89:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB90:
LBB91:
	xor a1,a1,a0
	li a0,1073741823
	and a1,a1,a0
LBB92:
LBB93:
	andi a2,a3,255
	andi a0,a1,255
	xor a0,a2,a0
	snez a0,a0
	bnez a0,LBB94
	j LBB137
LBB94:
LBB95:
LBB96:
	mv a0,a1
	li a2,13
	sll a0,a0,a2
LBB97:
LBB98:
	xor a2,a1,a0
LBB99:
	mv a1,a2
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB100
	j LBB101
LBB100:
	sra a0,a1,a0
	j LBB102
LBB101:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a1,a1,a3
	sra a0,a1,a0
	or a0,a4,a0
LBB102:
LBB103:
	xor a1,a2,a0
LBB104:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB105:
LBB106:
	xor a1,a1,a0
	li a0,1073741823
	and s6,a1,a0
LBB107:
LBB108:
LBB109:
	mv a1,s6
LBB110:
	mv a0,a1
	li a2,13
	sll a0,a0,a2
LBB111:
LBB112:
	xor a2,a1,a0
LBB113:
	mv a1,a2
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB114
	j LBB115
LBB114:
	sra a0,a1,a0
	j LBB116
LBB115:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a1,a1,a3
	sra a0,a1,a0
	or a0,a4,a0
LBB116:
LBB117:
	xor a1,a2,a0
LBB118:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB119:
LBB120:
	xor a1,a1,a0
	li a0,1073741823
	and s5,a1,a0
LBB121:
LBB122:
LBB123:
	mv a1,s5
LBB124:
	mv a0,a1
	li a2,13
	sll a0,a0,a2
LBB125:
LBB126:
	xor a2,a1,a0
LBB127:
	mv a1,a2
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB128
	j LBB129
LBB128:
	sra a0,a1,a0
	j LBB130
LBB129:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a1,a1,a3
	sra a0,a1,a0
	or a0,a4,a0
LBB130:
LBB131:
	xor a1,a2,a0
LBB132:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB133:
LBB134:
	xor a1,a1,a0
	li a0,1073741823
	and s3,a1,a0
LBB135:
LBB136:
	mv a0,s3
	call rng
	mv s4,a0
	mv a0,s4
	call rng
	mv s2,a0
	andi a0,s6,3
	srai a1,s6,28
	andi a2,s5,1
	srai a3,s5,29
	srai a4,s3,25
	andi a5,s3,31
	srai a6,s4,15
	li a7,32767
	and a7,s4,a7
	srai t1,s2,15
	li t0,32767
	and t0,s2,t0
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	xor s1,s1,a0
	j LBB138
LBB137:
	j LBB139
LBB138:
	j LBB65
LBB139:
LBB140:
	mv a0,s1
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
