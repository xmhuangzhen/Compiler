	.text
	.globl	test					# start function : test
	.p2align	2
test:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-120
	mv t0,a0
	mv t1,a1
	mv a0,a2
	mv a1,a3
	mv a2,a4
	mv a3,a5
	mv a4,a6
	mv a5,a7
	lw a6,0(s0)
	lw a7,4(s0)
	beq t0,t1,LBB1
	j LBB2
LBB1:
	bne t1,a0,LBB3
	j LBB4
LBB3:
	li t2,1
	j LBB5
LBB4:
	xor t2,a0,a1
	snez t2,t2
LBB5:
	bnez t2,LBB6
	j LBB7
LBB6:
	beq t1,a0,LBB8
	j LBB9
LBB8:
	bne a0,a1,LBB10
	j LBB11
LBB10:
	li t2,1
	j LBB12
LBB11:
	xor t2,a1,a2
	snez t2,t2
LBB12:
	bnez t2,LBB13
	j LBB14
LBB13:
	sw t0,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,1
	j LBB15
LBB14:
	addi a4,a4,-1
	addi a5,a5,-2
	sw t0,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,2
	j LBB15
LBB9:
	add a0,t1,a0
	add a0,a0,t1
LBB15:
	addi a0,a0,1
	j LBB16
LBB7:
	addi t2,a3,-1
	addi a3,a4,-2
	beq t1,a0,LBB17
	j LBB18
LBB17:
	bne a0,a1,LBB19
	j LBB20
LBB19:
	li a4,1
	j LBB21
LBB20:
	xor a4,a1,a2
	snez a4,a4
LBB21:
	bnez a4,LBB22
	j LBB23
LBB22:
	mv s1,a0
	beq s1,a1,LBB24
	j LBB25
LBB24:
	bne a1,a2,LBB26
	j LBB27
LBB26:
	li a0,1
	j LBB28
LBB27:
	xor a0,a2,t2
	snez a0,a0
LBB28:
	bnez a0,LBB29
	j LBB30
LBB29:
	mv a0,a1
	mv a1,a2
	mv a2,t2
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t0
	sw t1,0(sp)
	sw s1,4(sp)
	call test
	addi a0,a0,1
	j LBB31
LBB30:
	addi a4,a5,-1
	addi a5,a6,-2
	mv a0,a1
	mv a1,a2
	mv a2,t2
	mv a6,a7
	mv a7,t0
	sw t1,0(sp)
	sw s1,4(sp)
	call test
	addi a0,a0,2
	j LBB31
LBB25:
	add a0,s1,a1
	add a0,a0,s1
LBB31:
	addi a0,a0,1
	j LBB32
LBB23:
	addi a4,a3,-1
	addi a5,a5,-2
	mv a3,t2
	sw t0,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,2
	j LBB32
LBB18:
	add a0,t1,a0
	add a0,a0,t1
LBB32:
	addi a0,a0,2
	j LBB16
LBB2:
	add a0,t0,t1
	add a0,a0,t0
LBB16:
	addi sp,sp,120
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB33:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	mv s0,sp
	addi sp,sp,-120
LBB34:
	li a0,0
	mv s1,a0
	li a0,19260817
LBB35:
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB36
	j LBB37
LBB36:
	srai a0,a1,17
	j LBB38
LBB37:
	li a0,-2147483648
	xor a0,a1,a0
	srai a2,a0,17
	li a0,16384
	or a0,a0,a2
LBB38:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a2,a1,a0
	mv a0,a2
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB39
	j LBB40
LBB39:
	srai a0,a1,17
	j LBB41
LBB40:
	li a0,-2147483648
	xor a0,a1,a0
	srai a3,a0,17
	li a0,16384
	or a0,a0,a3
LBB41:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a0,a1,a0
	andi a2,a2,255
	andi a1,a0,255
	bne a2,a1,LBB42
	j LBB43
LBB42:
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB44
	j LBB45
LBB44:
	srai a0,a1,17
	j LBB46
LBB45:
	li a0,-2147483648
	xor a0,a1,a0
	srai a2,a0,17
	li a0,16384
	or a0,a0,a2
LBB46:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a5,a1,a0
	mv a0,a5
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB47
	j LBB48
LBB47:
	srai a0,a1,17
	j LBB49
LBB48:
	li a0,-2147483648
	xor a0,a1,a0
	srai a2,a0,17
	li a0,16384
	or a0,a0,a2
LBB49:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a3,a1,a0
	mv a0,a3
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB50
	j LBB51
LBB50:
	srai a0,a1,17
	j LBB52
LBB51:
	li a0,-2147483648
	xor a0,a1,a0
	srai a2,a0,17
	li a0,16384
	or a0,a0,a2
LBB52:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a2,a1,a0
	mv a0,a2
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB53
	j LBB54
LBB53:
	srai a0,a1,17
	j LBB55
LBB54:
	li a0,-2147483648
	xor a0,a1,a0
	srai a4,a0,17
	li a0,16384
	or a0,a0,a4
LBB55:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a4,a1,a0
	mv a0,a4
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB56
	j LBB57
LBB56:
	srai a0,a1,17
	j LBB58
LBB57:
	li a0,-2147483648
	xor a0,a1,a0
	srai a6,a0,17
	li a0,16384
	or a0,a0,a6
LBB58:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a0,a1,a0
	mv s2,a0
	andi s8,a5,3
	srai t1,a5,28
	andi s5,a3,1
	srai t0,a3,29
	srai s4,a2,25
	andi s6,a2,31
	srai t2,a4,15
	li a0,32767
	and s7,a4,a0
	srai s3,s2,15
	li a0,32767
	and a7,s2,a0
	beq s8,t1,LBB59
	j LBB60
LBB59:
	bne t1,s5,LBB61
	j LBB62
LBB61:
	li a0,1
	j LBB63
LBB62:
	xor a0,s5,t0
	snez a0,a0
LBB63:
	bnez a0,LBB64
	j LBB65
LBB64:
	beq t1,s5,LBB66
	j LBB67
LBB66:
	bne s5,t0,LBB68
	j LBB69
LBB68:
	li a0,1
	j LBB70
LBB69:
	xor a0,t0,s4
	snez a0,a0
LBB70:
	bnez a0,LBB71
	j LBB72
LBB71:
	beq s5,t0,LBB73
	j LBB74
LBB73:
	bne t0,s4,LBB75
	j LBB76
LBB75:
	li a0,1
	j LBB77
LBB76:
	xor a0,s4,s6
	snez a0,a0
LBB77:
	bnez a0,LBB78
	j LBB79
LBB78:
	mv a4,s8
	beq t0,s4,LBB80
	j LBB81
LBB80:
	bne s4,s6,LBB82
	j LBB83
LBB82:
	li a0,1
	j LBB84
LBB83:
	xor a0,s6,t2
	snez a0,a0
LBB84:
	bnez a0,LBB85
	j LBB86
LBB85:
	beq s4,s6,LBB87
	j LBB88
LBB87:
	bne s6,t2,LBB89
	j LBB90
LBB89:
	li a0,1
	j LBB91
LBB90:
	xor a0,t2,s7
	snez a0,a0
LBB91:
	bnez a0,LBB92
	j LBB93
LBB92:
	beq s6,t2,LBB94
	j LBB95
LBB94:
	bne t2,s7,LBB96
	j LBB97
LBB96:
	li a0,1
	j LBB98
LBB97:
	xor a0,s7,s3
	snez a0,a0
LBB98:
	bnez a0,LBB99
	j LBB100
LBB99:
	beq t2,s7,LBB101
	j LBB102
LBB101:
	bne s7,s3,LBB103
	j LBB104
LBB103:
	li a0,1
	j LBB105
LBB104:
	xor a0,s3,a7
	snez a0,a0
LBB105:
	bnez a0,LBB106
	j LBB107
LBB106:
	beq s7,s3,LBB108
	j LBB109
LBB108:
	bne s3,a7,LBB110
	j LBB111
LBB110:
	li a0,1
	j LBB112
LBB111:
	xor a0,a7,a4
	snez a0,a0
LBB112:
	bnez a0,LBB113
	j LBB114
LBB113:
	mv a0,s3
	mv a1,a7
	mv a2,a4
	mv a3,t1
	mv a4,s5
	mv a5,t0
	mv a6,s4
	mv a7,s6
	sw t2,0(sp)
	sw s7,4(sp)
	call test
	addi a0,a0,1
	j LBB115
LBB114:
	addi a6,s5,-1
	addi a5,t0,-2
	mv a0,s3
	mv a1,a7
	mv a2,a4
	mv a3,t1
	mv a4,a6
	mv a6,s4
	mv a7,s6
	sw t2,0(sp)
	sw s7,4(sp)
	call test
	addi a0,a0,2
	j LBB115
LBB109:
	add a0,s7,s3
	add a0,a0,s7
LBB115:
	addi a0,a0,1
	j LBB116
LBB107:
	addi a5,t1,-1
	addi a3,s5,-2
	beq s7,s3,LBB117
	j LBB118
LBB117:
	bne s3,a7,LBB119
	j LBB120
LBB119:
	li a0,1
	j LBB121
LBB120:
	xor a0,a7,a4
	snez a0,a0
LBB121:
	bnez a0,LBB122
	j LBB123
LBB122:
	beq s3,a7,LBB124
	j LBB125
LBB124:
	bne a7,a4,LBB126
	j LBB127
LBB126:
	li a0,1
	j LBB128
LBB127:
	xor a0,a4,a5
	snez a0,a0
LBB128:
	bnez a0,LBB129
	j LBB130
LBB129:
	mv a0,a7
	mv a1,a4
	mv a2,a5
	mv a4,t0
	mv a5,s4
	mv a6,s6
	mv a7,t2
	sw s7,0(sp)
	sw s3,4(sp)
	call test
	addi a0,a0,1
	j LBB131
LBB130:
	addi t0,t0,-1
	addi a6,s4,-2
	mv a0,a7
	mv a1,a4
	mv a2,a5
	mv a4,t0
	mv a5,a6
	mv a6,s6
	mv a7,t2
	sw s7,0(sp)
	sw s3,4(sp)
	call test
	addi a0,a0,2
	j LBB131
LBB125:
	add a0,s3,a7
	add a0,a0,s3
LBB131:
	addi a0,a0,1
	j LBB132
LBB123:
	addi t1,a3,-1
	addi a6,t0,-2
	mv a0,s3
	mv a1,a7
	mv a2,a4
	mv a3,a5
	mv a4,t1
	mv a5,a6
	mv a6,s4
	mv a7,s6
	sw t2,0(sp)
	sw s7,4(sp)
	call test
	addi a0,a0,2
	j LBB132
LBB118:
	add a0,s7,s3
	add a0,a0,s7
LBB132:
	addi a0,a0,2
	j LBB116
LBB102:
	add a0,t2,s7
	add a0,a0,t2
LBB116:
	addi a0,a0,1
	j LBB133
LBB100:
	addi a4,a4,-1
	addi a5,t1,-2
	mv a0,t2
	mv a1,s7
	mv a2,s3
	mv a3,a7
	mv a6,s5
	mv a7,t0
	sw s4,0(sp)
	sw s6,4(sp)
	call test
	addi a0,a0,2
	j LBB133
LBB95:
	add a0,s6,t2
	add a0,a0,s6
LBB133:
	addi a0,a0,1
	j LBB134
LBB93:
	addi a5,a7,-1
	addi a3,a4,-2
	beq s6,t2,LBB135
	j LBB136
LBB135:
	bne t2,s7,LBB137
	j LBB138
LBB137:
	li a0,1
	j LBB139
LBB138:
	xor a0,s7,s3
	snez a0,a0
LBB139:
	bnez a0,LBB140
	j LBB141
LBB140:
	beq t2,s7,LBB142
	j LBB143
LBB142:
	bne s7,s3,LBB144
	j LBB145
LBB144:
	li a0,1
	j LBB146
LBB145:
	xor a0,s3,a5
	snez a0,a0
LBB146:
	bnez a0,LBB147
	j LBB148
LBB147:
	mv a0,s7
	mv a1,s3
	mv a2,a5
	mv a4,t1
	mv a5,s5
	mv a6,t0
	mv a7,s4
	sw s6,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,1
	j LBB149
LBB148:
	addi a4,t1,-1
	addi a6,s5,-2
	mv a0,s7
	mv a1,s3
	mv a2,a5
	mv a5,a6
	mv a6,t0
	mv a7,s4
	sw s6,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,2
	j LBB149
LBB143:
	add a0,t2,s7
	add a0,a0,t2
LBB149:
	addi a0,a0,1
	j LBB150
LBB141:
	addi a4,a3,-1
	addi a6,t1,-2
	mv a0,t2
	mv a1,s7
	mv a2,s3
	mv a3,a5
	mv a5,a6
	mv a6,s5
	mv a7,t0
	sw s4,0(sp)
	sw s6,4(sp)
	call test
	addi a0,a0,2
	j LBB150
LBB136:
	add a0,s6,t2
	add a0,a0,s6
LBB150:
	addi a0,a0,2
	j LBB134
LBB88:
	add a0,s4,s6
	add a0,a0,s4
LBB134:
	addi a0,a0,1
	j LBB151
LBB86:
	addi a2,s3,-1
	addi a3,a7,-2
	beq s4,s6,LBB152
	j LBB153
LBB152:
	bne s6,t2,LBB154
	j LBB155
LBB154:
	li a0,1
	j LBB156
LBB155:
	xor a0,t2,s7
	snez a0,a0
LBB156:
	bnez a0,LBB157
	j LBB158
LBB157:
	beq s6,t2,LBB159
	j LBB160
LBB159:
	bne t2,s7,LBB161
	j LBB162
LBB161:
	li a0,1
	j LBB163
LBB162:
	xor a0,s7,a2
	snez a0,a0
LBB163:
	bnez a0,LBB164
	j LBB165
LBB164:
	mv a0,t2
	mv a1,s7
	mv a5,t1
	mv a6,s5
	mv a7,t0
	sw s4,0(sp)
	sw s6,4(sp)
	call test
	addi a0,a0,1
	j LBB166
LBB165:
	addi a4,a4,-1
	addi a5,t1,-2
	mv a0,t2
	mv a1,s7
	mv a6,s5
	mv a7,t0
	sw s4,0(sp)
	sw s6,4(sp)
	call test
	addi a0,a0,2
	j LBB166
LBB160:
	add a0,s6,t2
	add a0,a0,s6
LBB166:
	addi a0,a0,1
	j LBB167
LBB158:
	addi a6,a3,-1
	addi a3,a4,-2
	beq s6,t2,LBB168
	j LBB169
LBB168:
	bne t2,s7,LBB170
	j LBB171
LBB170:
	li a0,1
	j LBB172
LBB171:
	xor a0,s7,a2
	snez a0,a0
LBB172:
	bnez a0,LBB173
	j LBB174
LBB173:
	beq t2,s7,LBB175
	j LBB176
LBB175:
	bne s7,a2,LBB177
	j LBB178
LBB177:
	li a0,1
	j LBB179
LBB178:
	xor a0,a2,a6
	snez a0,a0
LBB179:
	bnez a0,LBB180
	j LBB181
LBB180:
	mv a0,s7
	mv a1,a2
	mv a2,a6
	mv a4,t1
	mv a5,s5
	mv a6,t0
	mv a7,s4
	sw s6,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,1
	j LBB182
LBB181:
	addi a4,t1,-1
	addi a5,s5,-2
	mv a0,s7
	mv a1,a2
	mv a2,a6
	mv a6,t0
	mv a7,s4
	sw s6,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,2
	j LBB182
LBB176:
	add a0,t2,s7
	add a0,a0,t2
LBB182:
	addi a0,a0,1
	j LBB183
LBB174:
	addi a4,a3,-1
	addi a5,t1,-2
	mv a0,t2
	mv a1,s7
	mv a3,a6
	mv a6,s5
	mv a7,t0
	sw s4,0(sp)
	sw s6,4(sp)
	call test
	addi a0,a0,2
	j LBB183
LBB169:
	add a0,s6,t2
	add a0,a0,s6
LBB183:
	addi a0,a0,2
	j LBB167
LBB153:
	add a0,s4,s6
	add a0,a0,s4
LBB167:
	addi a0,a0,2
	j LBB151
LBB81:
	add a0,t0,s4
	add a0,a0,t0
LBB151:
	addi a0,a0,1
	j LBB184
LBB79:
	addi s7,s7,-1
	addi a3,s3,-2
	beq t0,s4,LBB185
	j LBB186
LBB185:
	bne s4,s6,LBB187
	j LBB188
LBB187:
	li a0,1
	j LBB189
LBB188:
	xor a0,s6,t2
	snez a0,a0
LBB189:
	bnez a0,LBB190
	j LBB191
LBB190:
	mv a2,a7
	beq s4,s6,LBB192
	j LBB193
LBB192:
	bne s6,t2,LBB194
	j LBB195
LBB194:
	li a0,1
	j LBB196
LBB195:
	xor a0,t2,s7
	snez a0,a0
LBB196:
	bnez a0,LBB197
	j LBB198
LBB197:
	mv a1,a3
	beq s6,t2,LBB199
	j LBB200
LBB199:
	bne t2,s7,LBB201
	j LBB202
LBB201:
	li a0,1
	j LBB203
LBB202:
	xor a0,s7,a1
	snez a0,a0
LBB203:
	bnez a0,LBB204
	j LBB205
LBB204:
	beq t2,s7,LBB206
	j LBB207
LBB206:
	bne s7,a1,LBB208
	j LBB209
LBB208:
	li a0,1
	j LBB210
LBB209:
	xor a0,a1,a2
	snez a0,a0
LBB210:
	bnez a0,LBB211
	j LBB212
LBB211:
	mv a0,s7
	mv a3,s8
	mv a4,t1
	mv a5,s5
	mv a6,t0
	mv a7,s4
	sw s6,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,1
	j LBB213
LBB212:
	addi a4,t1,-1
	addi a5,s5,-2
	mv a0,s7
	mv a3,s8
	mv a6,t0
	mv a7,s4
	sw s6,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,2
	j LBB213
LBB207:
	add a0,t2,s7
	add a0,a0,t2
LBB213:
	addi a0,a0,1
	j LBB214
LBB205:
	addi a6,s8,-1
	addi a3,t1,-2
	beq t2,s7,LBB215
	j LBB216
LBB215:
	bne s7,a1,LBB217
	j LBB218
LBB217:
	li a0,1
	j LBB219
LBB218:
	xor a0,a1,a2
	snez a0,a0
LBB219:
	bnez a0,LBB220
	j LBB221
LBB220:
	beq s7,a1,LBB222
	j LBB223
LBB222:
	bne a1,a2,LBB224
	j LBB225
LBB224:
	li a0,1
	j LBB226
LBB225:
	xor a0,a2,a6
	snez a0,a0
LBB226:
	bnez a0,LBB227
	j LBB228
LBB227:
	mv a0,a1
	mv a1,a2
	mv a2,a6
	mv a4,s5
	mv a5,t0
	mv a6,s4
	mv a7,s6
	sw t2,0(sp)
	sw s7,4(sp)
	call test
	addi a0,a0,1
	j LBB229
LBB228:
	addi a4,s5,-1
	addi a5,t0,-2
	mv a0,a1
	mv a1,a2
	mv a2,a6
	mv a6,s4
	mv a7,s6
	sw t2,0(sp)
	sw s7,4(sp)
	call test
	addi a0,a0,2
	j LBB229
LBB223:
	add a0,s7,a1
	add a0,a0,s7
LBB229:
	addi a0,a0,1
	j LBB230
LBB221:
	addi a4,a3,-1
	addi a5,s5,-2
	mv a0,s7
	mv a3,a6
	mv a6,t0
	mv a7,s4
	sw s6,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,2
	j LBB230
LBB216:
	add a0,t2,s7
	add a0,a0,t2
LBB230:
	addi a0,a0,2
	j LBB214
LBB200:
	add a0,s6,t2
	add a0,a0,s6
LBB214:
	addi a0,a0,1
	j LBB231
LBB198:
	addi a4,a2,-1
	addi a5,s8,-2
	mv a0,s6
	mv a1,t2
	mv a2,s7
	mv a6,t1
	mv a7,s5
	sw t0,0(sp)
	sw s4,4(sp)
	call test
	addi a0,a0,2
	j LBB231
LBB193:
	add a0,s4,s6
	add a0,a0,s4
LBB231:
	addi a0,a0,1
	j LBB232
LBB191:
	addi a4,a3,-1
	addi a5,a7,-2
	mv a0,s4
	mv a1,s6
	mv a2,t2
	mv a3,s7
	mv a6,s8
	mv a7,t1
	sw s5,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB232
LBB186:
	add a0,t0,s4
	add a0,a0,t0
LBB232:
	addi a0,a0,2
	j LBB184
LBB74:
	add a0,s5,t0
	add a0,a0,s5
LBB184:
	addi a0,a0,1
	j LBB233
LBB72:
	addi a2,t2,-1
	addi a3,s7,-2
	beq s5,t0,LBB234
	j LBB235
LBB234:
	bne t0,s4,LBB236
	j LBB237
LBB236:
	li a0,1
	j LBB238
LBB237:
	xor a0,s4,s6
	snez a0,a0
LBB238:
	bnez a0,LBB239
	j LBB240
LBB239:
	beq t0,s4,LBB241
	j LBB242
LBB241:
	bne s4,s6,LBB243
	j LBB244
LBB243:
	li a0,1
	j LBB245
LBB244:
	xor a0,s6,a2
	snez a0,a0
LBB245:
	bnez a0,LBB246
	j LBB247
LBB246:
	mv a0,s4
	mv a1,s6
	mv a4,s3
	mv a5,a7
	mv a6,s8
	mv a7,t1
	sw s5,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,1
	j LBB248
LBB247:
	addi a4,s3,-1
	addi a5,a7,-2
	mv a0,s4
	mv a1,s6
	mv a6,s8
	mv a7,t1
	sw s5,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB248
LBB242:
	add a0,t0,s4
	add a0,a0,t0
LBB248:
	addi a0,a0,1
	j LBB249
LBB240:
	addi a6,a3,-1
	addi a3,s3,-2
	beq t0,s4,LBB250
	j LBB251
LBB250:
	bne s4,s6,LBB252
	j LBB253
LBB252:
	li a0,1
	j LBB254
LBB253:
	xor a0,s6,a2
	snez a0,a0
LBB254:
	bnez a0,LBB255
	j LBB256
LBB255:
	beq s4,s6,LBB257
	j LBB258
LBB257:
	bne s6,a2,LBB259
	j LBB260
LBB259:
	li a0,1
	j LBB261
LBB260:
	xor a0,a2,a6
	snez a0,a0
LBB261:
	bnez a0,LBB262
	j LBB263
LBB262:
	mv a0,s6
	mv a1,a2
	mv a2,a6
	mv a4,a7
	mv a5,s8
	mv a6,t1
	mv a7,s5
	sw t0,0(sp)
	sw s4,4(sp)
	call test
	addi a0,a0,1
	j LBB264
LBB263:
	addi a4,a7,-1
	addi a5,s8,-2
	mv a0,s6
	mv a1,a2
	mv a2,a6
	mv a6,t1
	mv a7,s5
	sw t0,0(sp)
	sw s4,4(sp)
	call test
	addi a0,a0,2
	j LBB264
LBB258:
	add a0,s4,s6
	add a0,a0,s4
LBB264:
	addi a0,a0,1
	j LBB265
LBB256:
	addi a4,a3,-1
	addi a5,a7,-2
	mv a0,s4
	mv a1,s6
	mv a3,a6
	mv a6,s8
	mv a7,t1
	sw s5,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB265
LBB251:
	add a0,t0,s4
	add a0,a0,t0
LBB265:
	addi a0,a0,2
	j LBB249
LBB235:
	add a0,s5,t0
	add a0,a0,s5
LBB249:
	addi a0,a0,2
	j LBB233
LBB67:
	add a0,t1,s5
	add a0,a0,t1
LBB233:
	addi a0,a0,1
	j LBB266
LBB65:
	addi a6,s6,-1
	addi a3,t2,-2
	beq t1,s5,LBB267
	j LBB268
LBB267:
	bne s5,t0,LBB269
	j LBB270
LBB269:
	li a0,1
	j LBB271
LBB270:
	xor a0,t0,s4
	snez a0,a0
LBB271:
	bnez a0,LBB272
	j LBB273
LBB272:
	beq s5,t0,LBB274
	j LBB275
LBB274:
	bne t0,s4,LBB276
	j LBB277
LBB276:
	li a0,1
	j LBB278
LBB277:
	xor a0,s4,a6
	snez a0,a0
LBB278:
	bnez a0,LBB279
	j LBB280
LBB279:
	mv a0,t0
	mv a1,s4
	mv a2,a6
	mv a4,s7
	mv a5,s3
	mv a6,a7
	mv a7,s8
	sw t1,0(sp)
	sw s5,4(sp)
	call test
	addi a0,a0,1
	j LBB281
LBB280:
	addi a4,s7,-1
	addi a5,s3,-2
	mv a0,t0
	mv a1,s4
	mv a2,a6
	mv a6,a7
	mv a7,s8
	sw t1,0(sp)
	sw s5,4(sp)
	call test
	addi a0,a0,2
	j LBB281
LBB275:
	add a0,s5,t0
	add a0,a0,s5
LBB281:
	addi a0,a0,1
	j LBB282
LBB273:
	addi a4,a3,-1
	addi a5,s7,-2
	mv a0,s5
	mv a1,t0
	mv a2,s4
	mv a3,a6
	mv a6,s3
	sw s8,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,2
	j LBB282
LBB268:
	add a0,t1,s5
	add a0,a0,t1
LBB282:
	addi a0,a0,2
	j LBB266
LBB60:
	add a0,s8,t1
	add a0,a0,s8
LBB266:
	xor s1,s1,a0
	mv a0,s2
	j LBB35
LBB43:
	addi a0,s1,-19
LBB283:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
