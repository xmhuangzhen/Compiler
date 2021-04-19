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
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	mv s0,sp
	addi sp,sp,-120
	mv s1,a1
	mv s2,a2
	mv t0,a3
	mv t1,a4
	mv t2,a5
	mv a2,a6
	mv a3,a7
	lw a6,0(s0)
	lw a7,4(s0)
	xor s6,a0,s1
	seqz s6,s6
	bnez s6,LBB41
	j LBB109
LBB41:
	xor s6,s1,s2
	snez s7,s6
	li s6,0
	xor s6,s7,s6
	seqz s6,s6
	bnez s6,LBB42
	j LBB43
LBB42:
	xor s5,s2,t0
	snez s5,s5
LBB43:
	or s5,s7,s5
	bnez s5,LBB44
	j LBB90
LBB44:
	mv s3,a0
LBB45:
	xor a0,s1,s2
	seqz a0,a0
	bnez a0,LBB46
	j LBB87
LBB46:
	xor a0,s2,t0
	snez s5,a0
	li a0,0
	xor a0,s5,a0
	seqz a0,a0
	bnez a0,LBB47
	j LBB48
LBB47:
	xor a0,t0,t1
	snez s4,a0
LBB48:
	or a0,s5,s4
	bnez a0,LBB49
	j LBB86
LBB49:
LBB50:
	xor a0,s2,t0
	seqz a0,a0
	bnez a0,LBB51
	j LBB83
LBB51:
	xor a0,t0,t1
	snez s4,a0
	li a0,0
	xor a0,s4,a0
	seqz a0,a0
	bnez a0,LBB52
	j LBB53
LBB52:
	xor a0,t1,t2
	snez a4,a0
LBB53:
	or a0,s4,a4
	bnez a0,LBB54
	j LBB64
LBB54:
LBB55:
	xor a0,t0,t1
	seqz a0,a0
	bnez a0,LBB56
	j LBB61
LBB56:
	xor a0,t1,t2
	snez a4,a0
	li a0,0
	xor a0,a4,a0
	seqz a0,a0
	bnez a0,LBB57
	j LBB58
LBB57:
	xor a0,t2,a2
	snez a1,a0
LBB58:
	or a0,a4,a1
	bnez a0,LBB59
	j LBB60
LBB59:
	mv a0,t1
	mv a1,t2
	mv a4,a6
	mv a5,a7
	mv a6,s3
	mv a7,s1
	sw s2,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,1
	j LBB62
LBB60:
	addi a4,a6,-1
	addi a5,a7,-2
	mv a6,s3
	mv a7,s1
	mv a0,t1
	mv a1,t2
	sw s2,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB62
LBB61:
	add a0,t0,t1
	add a0,a0,t0
LBB62:
LBB63:
	addi a0,a0,1
	j LBB84
LBB64:
	addi a3,a3,-1
	addi a4,a6,-2
LBB65:
	xor a0,t0,t1
	seqz a0,a0
	bnez a0,LBB66
	j LBB80
LBB66:
	xor a0,t1,t2
	snez a6,a0
	li a0,0
	xor a0,a6,a0
	seqz a0,a0
	bnez a0,LBB67
	j LBB68
LBB67:
	xor a0,t2,a2
	snez a5,a0
LBB68:
	or a0,a6,a5
	bnez a0,LBB69
	j LBB79
LBB69:
LBB70:
	xor a0,t1,t2
	seqz a0,a0
	bnez a0,LBB71
	j LBB76
LBB71:
	xor a0,t2,a2
	snez a5,a0
	li a0,0
	xor a0,a5,a0
	seqz a0,a0
	bnez a0,LBB72
	j LBB73
LBB72:
	xor a0,a2,a3
	snez a1,a0
LBB73:
	or a0,a5,a1
	bnez a0,LBB74
	j LBB75
LBB74:
	mv a0,t2
	mv a1,a2
	mv a2,a3
	mv a3,a4
	mv a4,a7
	mv a5,s3
	mv a6,s1
	mv a7,s2
	sw t0,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,1
	j LBB77
LBB75:
	mv a0,t2
	mv a1,a2
	mv a2,a3
	mv a3,a4
	addi a4,a7,-1
	addi a5,s3,-2
	mv a6,s1
	mv a7,s2
	sw t0,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,2
	j LBB77
LBB76:
	add a0,t1,t2
	add a0,a0,t1
LBB77:
LBB78:
	addi a0,a0,1
	j LBB81
LBB79:
	mv a0,t1
	mv a1,t2
	addi a4,a4,-1
	addi a5,a7,-2
	mv a6,s3
	mv a7,s1
	sw s2,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB81
LBB80:
	add a0,t0,t1
	add a0,a0,t0
LBB81:
LBB82:
	addi a0,a0,2
	j LBB84
LBB83:
	add a0,s2,t0
	add a0,a0,s2
LBB84:
LBB85:
	addi a0,a0,1
	j LBB88
LBB86:
	addi a4,a2,-1
	addi a5,a3,-2
	mv a0,s2
	mv a1,t0
	mv a2,t1
	mv a3,t2
	sw s3,0(sp)
	sw s1,4(sp)
	call test
	addi a0,a0,2
	j LBB88
LBB87:
	add a0,s1,s2
	add a0,a0,s1
LBB88:
LBB89:
	addi a0,a0,1
	j LBB110
LBB90:
	addi a4,t2,-1
	addi a5,a2,-2
LBB91:
	mv a1,t1
	mv t2,a3
	mv t1,a0
	xor a0,s1,s2
	seqz a0,a0
	bnez a0,LBB92
	j LBB106
LBB92:
	xor a0,s2,t0
	snez a2,a0
	li a0,0
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB93
	j LBB94
LBB93:
	xor a0,t0,a1
	snez s4,a0
LBB94:
	or a0,a2,s4
	bnez a0,LBB95
	j LBB105
LBB95:
LBB96:
	xor a0,s2,t0
	seqz a0,a0
	bnez a0,LBB97
	j LBB102
LBB97:
	xor a0,t0,a1
	snez a2,a0
	li a0,0
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB98
	j LBB99
LBB98:
	xor a0,a1,a4
	snez s3,a0
LBB99:
	or a0,a2,s3
	bnez a0,LBB100
	j LBB101
LBB100:
	mv a0,t0
	mv a2,a4
	mv a3,a5
	mv a4,t2
	mv a5,a6
	mv a6,a7
	mv a7,t1
	sw s1,0(sp)
	sw s2,4(sp)
	call test
	addi a0,a0,1
	j LBB103
LBB101:
	mv a0,t0
	mv a2,a4
	mv a3,a5
	addi a4,t2,-1
	addi a5,a6,-2
	mv a6,a7
	mv a7,t1
	sw s1,0(sp)
	sw s2,4(sp)
	call test
	addi a0,a0,2
	j LBB103
LBB102:
	add a0,s2,t0
	add a0,a0,s2
LBB103:
LBB104:
	addi a0,a0,1
	j LBB107
LBB105:
	mv a0,s2
	mv a2,a1
	mv a3,a4
	addi a4,a5,-1
	addi a5,t2,-2
	mv a1,t0
	sw t1,0(sp)
	sw s1,4(sp)
	call test
	addi a0,a0,2
	j LBB107
LBB106:
	add a0,s1,s2
	add a0,a0,s1
LBB107:
LBB108:
	addi a0,a0,2
	j LBB110
LBB109:
	add a1,a0,s1
	add a0,a1,a0
LBB110:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB111:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-120
LBB112:
LBB113:
LBB114:
	li s1,0
	li s2,19260817
LBB115:
LBB116:
LBB117:
	mv a0,s2
	li a1,13
	sll a0,a0,a1
LBB118:
LBB119:
	xor a2,s2,a0
LBB120:
	mv a1,a2
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB121
	j LBB122
LBB121:
	sra a0,a1,a0
	j LBB123
LBB122:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a1,a1,a3
	sra a0,a1,a0
	or a0,a4,a0
LBB123:
LBB124:
	xor a1,a2,a0
LBB125:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB126:
LBB127:
	xor a1,a1,a0
	li a0,1073741823
	and a3,a1,a0
LBB128:
LBB129:
LBB130:
	mv a1,a3
LBB131:
	mv a0,a1
	li a2,13
	sll a0,a0,a2
LBB132:
LBB133:
	xor a2,a1,a0
LBB134:
	mv a1,a2
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB135
	j LBB136
LBB135:
	sra a0,a1,a0
	j LBB137
LBB136:
	li a4,31
	sub a5,a4,a0
	li a4,1
	sll a5,a4,a5
	li a4,-2147483648
	xor a1,a1,a4
	sra a0,a1,a0
	or a0,a5,a0
LBB137:
LBB138:
	xor a1,a2,a0
LBB139:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB140:
LBB141:
	xor a1,a1,a0
	li a0,1073741823
	and a1,a1,a0
LBB142:
LBB143:
	andi a2,a3,255
	andi a0,a1,255
	xor a0,a2,a0
	snez a0,a0
	bnez a0,LBB144
	j LBB215
LBB144:
LBB145:
LBB146:
	mv a0,a1
	li a2,13
	sll a0,a0,a2
LBB147:
LBB148:
	xor a2,a1,a0
LBB149:
	mv a1,a2
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB150
	j LBB151
LBB150:
	sra a0,a1,a0
	j LBB152
LBB151:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a1,a1,a3
	sra a0,a1,a0
	or a0,a4,a0
LBB152:
LBB153:
	xor a1,a2,a0
LBB154:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB155:
LBB156:
	xor a1,a1,a0
	li a0,1073741823
	and a4,a1,a0
LBB157:
LBB158:
LBB159:
	mv a1,a4
LBB160:
	mv a0,a1
	li a2,13
	sll a0,a0,a2
LBB161:
LBB162:
	xor a2,a1,a0
LBB163:
	mv a1,a2
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB164
	j LBB165
LBB164:
	sra a0,a1,a0
	j LBB166
LBB165:
	li a3,31
	sub a5,a3,a0
	li a3,1
	sll a5,a3,a5
	li a3,-2147483648
	xor a1,a1,a3
	sra a0,a1,a0
	or a0,a5,a0
LBB166:
LBB167:
	xor a1,a2,a0
LBB168:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB169:
LBB170:
	xor a1,a1,a0
	li a0,1073741823
	and a3,a1,a0
LBB171:
LBB172:
LBB173:
	mv a1,a3
LBB174:
	mv a0,a1
	li a2,13
	sll a0,a0,a2
LBB175:
LBB176:
	xor a2,a1,a0
LBB177:
	mv a1,a2
	li a0,17
	li a5,0
	slt a5,a1,a5
	xori a5,a5,1
	bnez a5,LBB178
	j LBB179
LBB178:
	sra a0,a1,a0
	j LBB180
LBB179:
	li a5,31
	sub a6,a5,a0
	li a5,1
	sll a6,a5,a6
	li a5,-2147483648
	xor a1,a1,a5
	sra a0,a1,a0
	or a0,a6,a0
LBB180:
LBB181:
	xor a1,a2,a0
LBB182:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB183:
LBB184:
	xor a1,a1,a0
	li a0,1073741823
	and a5,a1,a0
LBB185:
LBB186:
LBB187:
	mv a1,a5
LBB188:
	mv a0,a1
	li a2,13
	sll a0,a0,a2
LBB189:
LBB190:
	xor a2,a1,a0
LBB191:
	mv a1,a2
	li a0,17
	li a6,0
	slt a6,a1,a6
	xori a6,a6,1
	bnez a6,LBB192
	j LBB193
LBB192:
	sra a0,a1,a0
	j LBB194
LBB193:
	li a6,31
	sub a7,a6,a0
	li a6,1
	sll a7,a6,a7
	li a6,-2147483648
	xor a1,a1,a6
	sra a0,a1,a0
	or a0,a7,a0
LBB194:
LBB195:
	xor a1,a2,a0
LBB196:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB197:
LBB198:
	xor a1,a1,a0
	li a0,1073741823
	and a7,a1,a0
LBB199:
LBB200:
LBB201:
	mv a1,a7
LBB202:
	mv a0,a1
	li a2,13
	sll a0,a0,a2
LBB203:
LBB204:
	xor a2,a1,a0
LBB205:
	mv a1,a2
	li a0,17
	li a6,0
	slt a6,a1,a6
	xori a6,a6,1
	bnez a6,LBB206
	j LBB207
LBB206:
	sra a0,a1,a0
	j LBB208
LBB207:
	li a6,31
	sub t0,a6,a0
	li a6,1
	sll t0,a6,t0
	li a6,-2147483648
	xor a1,a1,a6
	sra a0,a1,a0
	or a0,t0,a0
LBB208:
LBB209:
	xor a1,a2,a0
LBB210:
	mv a0,a1
	li a2,5
	sll a0,a0,a2
LBB211:
LBB212:
	xor a1,a1,a0
	li a0,1073741823
	and s2,a1,a0
LBB213:
LBB214:
	andi a0,a4,3
	srai a1,a4,28
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
	j LBB216
LBB215:
	j LBB217
LBB216:
	j LBB115
LBB217:
LBB218:
	mv a0,s1
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
