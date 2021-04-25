	.text
	.globl	taskNTT.main					# start function : taskNTT.main
	.p2align	2
taskNTT.main:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s1,a0
LBB1:
	call getInt
	sw a0,16(s1)
	call getInt
	sw a0,24(s1)
	li s2,0
LBB2:
	lw a0,16(s1)
	ble s2,a0,LBB3
	j LBB4
LBB3:
	addi a0,s1,8
	lw a1,0(a0)
	slli a0,s2,2
	add s3,a1,a0
	call getInt
	sw a0,0(s3)
	addi s2,s2,1
	j LBB2
LBB4:
	li s2,0
LBB5:
	lw a0,24(s1)
	ble s2,a0,LBB6
	j LBB7
LBB6:
	addi a0,s1,12
	lw a1,0(a0)
	slli a0,s2,2
	add s3,a1,a0
	call getInt
	sw a0,0(s3)
	addi s2,s2,1
	j LBB5
LBB7:
	li a0,1
	sw a0,20(s1)
LBB8:
	lw a2,20(s1)
	lw a1,16(s1)
	lw a0,24(s1)
	add a0,a1,a0
	ble a2,a0,LBB9
	j LBB10
LBB9:
	lw a0,20(s1)
	slli a0,a0,1
	sw a0,20(s1)
	j LBB8
LBB10:
	lw t0,20(s1)
	addi a0,s1,8
	lw t1,0(a0)
	mv a0,s1
	li a3,0
	li a1,0
LBB11:
	blt a3,t0,LBB12
	j LBB13
LBB12:
	bgt a3,a1,LBB14
	j LBB15
LBB14:
	slli a2,a3,2
	add a2,t1,a2
	lw a5,0(a2)
	slli a2,a3,2
	add a4,t1,a2
	slli a2,a1,2
	add a2,t1,a2
	lw a2,0(a2)
	sw a2,0(a4)
	slli a2,a1,2
	add a2,t1,a2
	sw a5,0(a2)
LBB15:
	srai a2,t0,1
LBB16:
	xor a1,a1,a2
	bge a1,a2,LBB17
	j LBB18
LBB17:
	addi a3,a3,1
	j LBB11
LBB18:
	srai a2,a2,1
	j LBB16
LBB13:
	li a1,1
LBB19:
	blt a1,t0,LBB20
	j LBB21
LBB20:
	lw a2,4(a0)
	addi a3,a2,-1
	slli a2,a1,1
	div a4,a3,a2
	li a7,1
	li a3,3
LBB22:
	li a2,0
	bne a4,a2,LBB23
	j LBB24
LBB23:
	andi a5,a4,1
	li a2,0
	bne a5,a2,LBB25
	j LBB26
LBB26:
	j LBB27
LBB25:
	lw a6,4(a0)
	mv a5,a3
	rem a2,a7,a6
	li a7,0
LBB28:
	li t2,0
	bne a5,t2,LBB29
	j LBB30
LBB29:
	andi s2,a5,1
	li t2,0
	bne s2,t2,LBB31
	j LBB32
LBB32:
	j LBB33
LBB31:
	add a7,a7,a2
	rem a7,a7,a6
LBB33:
	srai a5,a5,1
	slli a2,a2,1
	rem a2,a2,a6
	j LBB28
LBB30:
LBB27:
	srai a4,a4,1
	lw a6,4(a0)
	mv a2,a3
	rem a5,a2,a6
	li a2,0
LBB34:
	li t2,0
	bne a3,t2,LBB35
	j LBB36
LBB35:
	andi s2,a3,1
	li t2,0
	bne s2,t2,LBB37
	j LBB38
LBB38:
	j LBB39
LBB37:
	add a2,a2,a5
	rem a2,a2,a6
LBB39:
	srai a3,a3,1
	slli a5,a5,1
	rem a5,a5,a6
	j LBB34
LBB36:
	mv a3,a2
	j LBB22
LBB24:
	slli t2,a1,1
	li a2,0
LBB40:
	blt a2,t0,LBB41
	j LBB42
LBB41:
	add s2,a2,a1
	add s3,a1,a2
	li a3,1
	li a4,0
LBB43:
	blt a4,a1,LBB44
	j LBB45
LBB44:
	add a5,s2,a4
	slli a5,a5,2
	add a5,t1,a5
	lw s4,0(a5)
	lw s5,4(a0)
	rem a6,a3,s5
	li a5,0
LBB46:
	li s6,0
	bne s4,s6,LBB47
	j LBB48
LBB47:
	andi s7,s4,1
	li s6,0
	bne s7,s6,LBB49
	j LBB50
LBB50:
	j LBB51
LBB49:
	add a5,a5,a6
	rem a5,a5,s5
LBB51:
	srai s4,s4,1
	slli a6,a6,1
	rem a6,a6,s5
	j LBB46
LBB48:
	add a6,s3,a4
	slli a6,a6,2
	add s6,t1,a6
	add s5,a2,a4
	slli a6,s5,2
	add a6,t1,a6
	lw a6,0(a6)
	sub s4,a6,a5
	lw a6,4(a0)
	add s4,s4,a6
	lw a6,4(a0)
	rem a6,s4,a6
	sw a6,0(s6)
	slli a6,s5,2
	add s4,t1,a6
	slli a6,s5,2
	add a6,t1,a6
	lw a6,0(a6)
	add a6,a6,a5
	lw a5,4(a0)
	rem a5,a6,a5
	sw a5,0(s4)
	lw s4,4(a0)
	mv a6,a7
	rem a5,a3,s4
	li a3,0
LBB52:
	li s5,0
	bne a6,s5,LBB53
	j LBB54
LBB53:
	andi s6,a6,1
	li s5,0
	bne s6,s5,LBB55
	j LBB56
LBB56:
	j LBB57
LBB55:
	add a3,a3,a5
	rem a3,a3,s4
LBB57:
	srai a6,a6,1
	slli a5,a5,1
	rem a5,a5,s4
	j LBB52
LBB54:
	addi a4,a4,1
	j LBB43
LBB45:
	add a2,a2,t2
	j LBB40
LBB42:
	slli a1,a1,1
	j LBB19
LBB21:
	lw t1,20(s1)
	addi a0,s1,12
	lw t0,0(a0)
	mv a0,s1
	li a3,0
	li a1,0
LBB58:
	blt a3,t1,LBB59
	j LBB60
LBB59:
	bgt a3,a1,LBB61
	j LBB62
LBB61:
	slli a2,a3,2
	add a2,t0,a2
	lw a5,0(a2)
	slli a2,a3,2
	add a4,t0,a2
	slli a2,a1,2
	add a2,t0,a2
	lw a2,0(a2)
	sw a2,0(a4)
	slli a2,a1,2
	add a2,t0,a2
	sw a5,0(a2)
LBB62:
	srai a2,t1,1
LBB63:
	xor a1,a1,a2
	bge a1,a2,LBB64
	j LBB65
LBB64:
	addi a3,a3,1
	j LBB58
LBB65:
	srai a2,a2,1
	j LBB63
LBB60:
	li a1,1
LBB66:
	blt a1,t1,LBB67
	j LBB68
LBB67:
	lw a2,4(a0)
	addi a3,a2,-1
	slli a2,a1,1
	div a4,a3,a2
	li a7,1
	li a3,3
LBB69:
	li a2,0
	bne a4,a2,LBB70
	j LBB71
LBB70:
	andi a5,a4,1
	li a2,0
	bne a5,a2,LBB72
	j LBB73
LBB73:
	j LBB74
LBB72:
	lw a6,4(a0)
	mv a5,a3
	rem a2,a7,a6
	li a7,0
LBB75:
	li t2,0
	bne a5,t2,LBB76
	j LBB77
LBB76:
	andi s2,a5,1
	li t2,0
	bne s2,t2,LBB78
	j LBB79
LBB79:
	j LBB80
LBB78:
	add a7,a7,a2
	rem a7,a7,a6
LBB80:
	srai a5,a5,1
	slli a2,a2,1
	rem a2,a2,a6
	j LBB75
LBB77:
LBB74:
	srai a4,a4,1
	lw a6,4(a0)
	mv a2,a3
	rem a5,a2,a6
	li a2,0
LBB81:
	li t2,0
	bne a3,t2,LBB82
	j LBB83
LBB82:
	andi s2,a3,1
	li t2,0
	bne s2,t2,LBB84
	j LBB85
LBB85:
	j LBB86
LBB84:
	add a2,a2,a5
	rem a2,a2,a6
LBB86:
	srai a3,a3,1
	slli a5,a5,1
	rem a5,a5,a6
	j LBB81
LBB83:
	mv a3,a2
	j LBB69
LBB71:
	slli t2,a1,1
	li a2,0
LBB87:
	blt a2,t1,LBB88
	j LBB89
LBB88:
	add s2,a2,a1
	add s3,a1,a2
	li a3,1
	li a4,0
LBB90:
	blt a4,a1,LBB91
	j LBB92
LBB91:
	add a5,s2,a4
	slli a5,a5,2
	add a5,t0,a5
	lw s4,0(a5)
	lw s5,4(a0)
	rem a6,a3,s5
	li a5,0
LBB93:
	li s6,0
	bne s4,s6,LBB94
	j LBB95
LBB94:
	andi s7,s4,1
	li s6,0
	bne s7,s6,LBB96
	j LBB97
LBB97:
	j LBB98
LBB96:
	add a5,a5,a6
	rem a5,a5,s5
LBB98:
	srai s4,s4,1
	slli a6,a6,1
	rem a6,a6,s5
	j LBB93
LBB95:
	add a6,s3,a4
	slli a6,a6,2
	add s6,t0,a6
	add s5,a2,a4
	slli a6,s5,2
	add a6,t0,a6
	lw a6,0(a6)
	sub s4,a6,a5
	lw a6,4(a0)
	add s4,s4,a6
	lw a6,4(a0)
	rem a6,s4,a6
	sw a6,0(s6)
	slli a6,s5,2
	add s4,t0,a6
	slli a6,s5,2
	add a6,t0,a6
	lw a6,0(a6)
	add a6,a6,a5
	lw a5,4(a0)
	rem a5,a6,a5
	sw a5,0(s4)
	lw s4,4(a0)
	mv a6,a7
	rem a5,a3,s4
	li a3,0
LBB99:
	li s5,0
	bne a6,s5,LBB100
	j LBB101
LBB100:
	andi s6,a6,1
	li s5,0
	bne s6,s5,LBB102
	j LBB103
LBB103:
	j LBB104
LBB102:
	add a3,a3,a5
	rem a3,a3,s4
LBB104:
	srai a6,a6,1
	slli a5,a5,1
	rem a5,a5,s4
	j LBB99
LBB101:
	addi a4,a4,1
	j LBB90
LBB92:
	add a2,a2,t2
	j LBB87
LBB89:
	slli a1,a1,1
	j LBB66
LBB68:
	li a1,0
LBB105:
	lw a0,20(s1)
	ble a1,a0,LBB106
	j LBB107
LBB106:
	addi a0,s1,8
	lw a2,0(a0)
	slli a0,a1,2
	add a5,a2,a0
	addi a0,s1,8
	lw a2,0(a0)
	slli a0,a1,2
	add a0,a2,a0
	lw a0,0(a0)
	addi a2,s1,12
	lw a3,0(a2)
	slli a2,a1,2
	add a2,a3,a2
	lw a3,0(a2)
	lw a4,4(s1)
	rem a2,a0,a4
	li a0,0
LBB108:
	li a6,0
	bne a3,a6,LBB109
	j LBB110
LBB109:
	andi a7,a3,1
	li a6,0
	bne a7,a6,LBB111
	j LBB112
LBB112:
	j LBB113
LBB111:
	add a0,a0,a2
	rem a0,a0,a4
LBB113:
	srai a3,a3,1
	slli a2,a2,1
	rem a2,a2,a4
	j LBB108
LBB110:
	sw a0,0(a5)
	addi a1,a1,1
	j LBB105
LBB107:
	lw a1,20(s1)
	addi a0,s1,8
	lw a2,0(a0)
	mv a0,s1
	li a5,0
	li a3,0
LBB114:
	blt a5,a1,LBB115
	j LBB116
LBB115:
	bgt a5,a3,LBB117
	j LBB118
LBB117:
	slli a4,a5,2
	add a4,a2,a4
	lw a7,0(a4)
	slli a4,a5,2
	add a6,a2,a4
	slli a4,a3,2
	add a4,a2,a4
	lw a4,0(a4)
	sw a4,0(a6)
	slli a4,a3,2
	add a4,a2,a4
	sw a7,0(a4)
LBB118:
	srai a4,a1,1
LBB119:
	xor a3,a3,a4
	bge a3,a4,LBB120
	j LBB121
LBB120:
	addi a5,a5,1
	j LBB114
LBB121:
	srai a4,a4,1
	j LBB119
LBB116:
	li a3,1
LBB122:
	blt a3,a1,LBB123
	j LBB124
LBB123:
	lw a4,4(a0)
	addi a5,a4,-1
	slli a4,a3,1
	div a6,a5,a4
	li t1,1
	li a5,3
LBB125:
	li a4,0
	bne a6,a4,LBB126
	j LBB127
LBB126:
	andi a7,a6,1
	li a4,0
	bne a7,a4,LBB128
	j LBB129
LBB129:
	j LBB130
LBB128:
	lw t0,4(a0)
	mv a7,a5
	rem a4,t1,t0
	li t1,0
LBB131:
	li t2,0
	bne a7,t2,LBB132
	j LBB133
LBB132:
	andi s2,a7,1
	li t2,0
	bne s2,t2,LBB134
	j LBB135
LBB135:
	j LBB136
LBB134:
	add t1,t1,a4
	rem t1,t1,t0
LBB136:
	srai a7,a7,1
	slli a4,a4,1
	rem a4,a4,t0
	j LBB131
LBB133:
LBB130:
	srai a6,a6,1
	lw t0,4(a0)
	mv a4,a5
	rem a7,a4,t0
	li a4,0
LBB137:
	li t2,0
	bne a5,t2,LBB138
	j LBB139
LBB138:
	andi s2,a5,1
	li t2,0
	bne s2,t2,LBB140
	j LBB141
LBB141:
	j LBB142
LBB140:
	add a4,a4,a7
	rem a4,a4,t0
LBB142:
	srai a5,a5,1
	slli a7,a7,1
	rem a7,a7,t0
	j LBB137
LBB139:
	mv a5,a4
	j LBB125
LBB127:
	slli t2,a3,1
	li a4,0
LBB143:
	blt a4,a1,LBB144
	j LBB145
LBB144:
	add s3,a4,a3
	add s2,a3,a4
	li a5,1
	li a6,0
LBB146:
	blt a6,a3,LBB147
	j LBB148
LBB147:
	add a7,s3,a6
	slli a7,a7,2
	add a7,a2,a7
	lw s4,0(a7)
	lw s5,4(a0)
	rem t0,a5,s5
	li a7,0
LBB149:
	li s6,0
	bne s4,s6,LBB150
	j LBB151
LBB150:
	andi s7,s4,1
	li s6,0
	bne s7,s6,LBB152
	j LBB153
LBB153:
	j LBB154
LBB152:
	add a7,a7,t0
	rem a7,a7,s5
LBB154:
	srai s4,s4,1
	slli t0,t0,1
	rem t0,t0,s5
	j LBB149
LBB151:
	add t0,s2,a6
	slli t0,t0,2
	add s6,a2,t0
	add s5,a4,a6
	slli t0,s5,2
	add t0,a2,t0
	lw t0,0(t0)
	sub s4,t0,a7
	lw t0,4(a0)
	add s4,s4,t0
	lw t0,4(a0)
	rem t0,s4,t0
	sw t0,0(s6)
	slli t0,s5,2
	add s4,a2,t0
	slli t0,s5,2
	add t0,a2,t0
	lw t0,0(t0)
	add t0,t0,a7
	lw a7,4(a0)
	rem a7,t0,a7
	sw a7,0(s4)
	lw s4,4(a0)
	mv t0,t1
	rem a7,a5,s4
	li a5,0
LBB155:
	li s5,0
	bne t0,s5,LBB156
	j LBB157
LBB156:
	andi s6,t0,1
	li s5,0
	bne s6,s5,LBB158
	j LBB159
LBB159:
	j LBB160
LBB158:
	add a5,a5,a7
	rem a5,a5,s4
LBB160:
	srai t0,t0,1
	slli a7,a7,1
	rem a7,a7,s4
	j LBB155
LBB157:
	addi a6,a6,1
	j LBB146
LBB148:
	add a4,a4,t2
	j LBB143
LBB145:
	slli a3,a3,1
	j LBB122
LBB124:
	li a0,1
LBB161:
	blt a0,a1,LBB162
	j LBB163
LBB162:
	addi a1,a1,-1
	slli a3,a0,2
	add a3,a2,a3
	lw a5,0(a3)
	slli a3,a0,2
	add a4,a2,a3
	slli a3,a1,2
	add a3,a2,a3
	lw a3,0(a3)
	sw a3,0(a4)
	slli a3,a1,2
	add a3,a2,a3
	sw a5,0(a3)
	addi a0,a0,1
	j LBB161
LBB163:
	lw a1,20(s1)
	lw a0,4(s1)
	addi a2,a0,-2
	li a4,1
LBB164:
	li a0,0
	bne a2,a0,LBB165
	j LBB166
LBB165:
	andi a3,a2,1
	li a0,0
	bne a3,a0,LBB167
	j LBB168
LBB168:
	j LBB169
LBB167:
	lw a5,4(s1)
	mv a3,a1
	rem a0,a4,a5
	li a4,0
LBB170:
	li a6,0
	bne a3,a6,LBB171
	j LBB172
LBB171:
	andi a7,a3,1
	li a6,0
	bne a7,a6,LBB173
	j LBB174
LBB174:
	j LBB175
LBB173:
	add a4,a4,a0
	rem a4,a4,a5
LBB175:
	srai a3,a3,1
	slli a0,a0,1
	rem a0,a0,a5
	j LBB170
LBB172:
LBB169:
	srai a2,a2,1
	lw a5,4(s1)
	mv a0,a1
	rem a3,a0,a5
	li a0,0
LBB176:
	li a6,0
	bne a1,a6,LBB177
	j LBB178
LBB177:
	andi a7,a1,1
	li a6,0
	bne a7,a6,LBB179
	j LBB180
LBB180:
	j LBB181
LBB179:
	add a0,a0,a3
	rem a0,a0,a5
LBB181:
	srai a1,a1,1
	slli a3,a3,1
	rem a3,a3,a5
	j LBB176
LBB178:
	mv a1,a0
	j LBB164
LBB166:
	li a1,0
LBB182:
	lw a0,20(s1)
	blt a1,a0,LBB183
	j LBB184
LBB183:
	addi a0,s1,8
	lw a2,0(a0)
	slli a0,a1,2
	add a6,a2,a0
	addi a0,s1,8
	lw a2,0(a0)
	slli a0,a1,2
	add a0,a2,a0
	lw a0,0(a0)
	lw a5,4(s1)
	mv a3,a4
	rem a2,a0,a5
	li a0,0
LBB185:
	li a7,0
	bne a3,a7,LBB186
	j LBB187
LBB186:
	andi t0,a3,1
	li a7,0
	bne t0,a7,LBB188
	j LBB189
LBB189:
	j LBB190
LBB188:
	add a0,a0,a2
	rem a0,a0,a5
LBB190:
	srai a3,a3,1
	slli a2,a2,1
	rem a2,a2,a5
	j LBB185
LBB187:
	sw a0,0(a6)
	addi a1,a1,1
	j LBB182
LBB184:
	li s2,0
LBB191:
	lw a1,24(s1)
	lw a0,16(s1)
	add a0,a1,a0
	ble s2,a0,LBB192
	j LBB193
LBB192:
	addi a0,s1,8
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a0,0(a0)
	call printlnInt
	addi s2,s2,1
	j LBB191
LBB193:
	li a0,0
LBB194:
	addi sp,sp,84
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
# end function : taskNTT.main
	.globl	taskInline.gcd					# start function : taskInline.gcd
	.p2align	2
taskInline.gcd:
#LBB195:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-92
	li a3,0
	bgt a2,a3,LBB196
	j LBB197
LBB196:
	rem a1,a1,a2
	li a3,0
	bgt a1,a3,LBB198
	j LBB199
LBB198:
	rem a2,a2,a1
	li a3,0
	bgt a2,a3,LBB200
	j LBB201
LBB200:
	rem a1,a1,a2
	li a3,0
	bgt a1,a3,LBB202
	j LBB203
LBB202:
	rem a2,a2,a1
	call taskInline.gcd
	j LBB204
LBB203:
	mv a0,a2
LBB204:
	j LBB205
LBB201:
	mv a0,a1
LBB205:
	j LBB206
LBB199:
	mv a0,a2
LBB206:
	j LBB207
LBB197:
	mv a0,a1
LBB207:
	addi sp,sp,92
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : taskInline.gcd
	.globl	main					# start function : main
	.p2align	2
main:
#LBB208:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-92
LBB209:
	li a0,28
	call malloc
	addi s1,a0,0
	li a0,999
	sw a0,0(s1)
	li a0,998244353
	sw a0,4(s1)
	addi s3,s1,8
	lw s2,0(s1)
	li a0,4
	mul a0,s2,a0
	addi a0,a0,4
	call malloc
	sw s2,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s3)
	addi s3,s1,12
	lw s2,0(s1)
	li a0,4
	mul a0,s2,a0
	addi a0,a0,4
	call malloc
	sw s2,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s3)
	mv a0,s1
	call taskNTT.main
	li a0,4
	call malloc
	addi s2,a0,0
	li a0,19260817
	sw a0,0(s2)
	li s1,0
LBB210:
	lw a0,0(s2)
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB211
	j LBB212
LBB211:
	srai a0,a1,17
	j LBB213
LBB212:
	li a0,-2147483648
	xor a0,a1,a0
	srai a2,a0,17
	li a0,16384
	or a0,a0,a2
LBB213:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	sw a1,0(s2)
	li a0,1073741823
	and a0,a1,a0
	andi a2,a0,255
	lw a0,0(s2)
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB214
	j LBB215
LBB214:
	srai a0,a1,17
	j LBB216
LBB215:
	li a0,-2147483648
	xor a0,a1,a0
	srai a3,a0,17
	li a0,16384
	or a0,a0,a3
LBB216:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	sw a1,0(s2)
	li a0,1073741823
	and a0,a1,a0
	andi a0,a0,255
	bne a2,a0,LBB217
	j LBB218
LBB217:
	lw a0,0(s2)
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB219
	j LBB220
LBB219:
	srai a0,a1,17
	j LBB221
LBB220:
	li a0,-2147483648
	xor a0,a1,a0
	srai a2,a0,17
	li a0,16384
	or a0,a0,a2
LBB221:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	sw a1,0(s2)
	li a0,1073741823
	and a0,a1,a0
	addi a0,a0,1
	lw a1,0(s2)
	slli a2,a1,13
	xor a2,a1,a2
	li a1,0
	bge a2,a1,LBB222
	j LBB223
LBB222:
	srai a1,a2,17
	j LBB224
LBB223:
	li a1,-2147483648
	xor a1,a2,a1
	srai a3,a1,17
	li a1,16384
	or a1,a1,a3
LBB224:
	xor a1,a2,a1
	slli a2,a1,5
	xor a2,a1,a2
	sw a2,0(s2)
	li a1,1073741823
	and a1,a2,a1
	addi a2,a1,1
	li a1,0
	bgt a2,a1,LBB225
	j LBB226
LBB225:
	rem a1,a0,a2
	mv a0,s2
	li a3,0
	bgt a1,a3,LBB227
	j LBB228
LBB227:
	rem a2,a2,a1
	call taskInline.gcd
	j LBB229
LBB228:
	mv a0,a2
LBB229:
	j LBB230
LBB226:
LBB230:
	xor s1,s1,a0
	j LBB210
LBB218:
	li a0,5647
	xor a0,s1,a0
	li a1,0
	bne a0,a1,LBB231
	j LBB232
LBB231:
	li a0,-1
	j LBB233
LBB232:
	li a0,4
	call malloc
	addi a0,a0,0
	li a1,100
	sw a1,0(a0)
	lw a5,0(a0)
	li a3,0
	li a1,0
LBB234:
	blt a1,a5,LBB235
	j LBB236
LBB235:
	addi a2,a1,1
	li a4,0
	bne a2,a4,LBB237
	j LBB238
LBB238:
	j LBB239
LBB237:
	mv a3,a2
LBB239:
	addi a1,a1,1
	j LBB234
LBB236:
	li a1,200
	sw a1,0(a0)
	lw a5,0(a0)
	li a0,0
	li a1,0
LBB240:
	blt a1,a5,LBB241
	j LBB242
LBB241:
	addi a2,a1,1
	li a4,0
	bne a2,a4,LBB243
	j LBB244
LBB244:
	j LBB245
LBB243:
	mv a0,a2
LBB245:
	addi a1,a1,1
	j LBB240
LBB242:
	add a0,a3,a0
	addi a0,a0,-300
	li a1,0
	bne a0,a1,LBB246
	j LBB247
LBB246:
	li a0,-1
	j LBB233
LBB247:
	li a0,0
	call malloc
	li a0,0
	li a1,0
LBB248:
	li a2,200
	blt a1,a2,LBB249
	j LBB250
LBB249:
	addi a1,a1,1
	addi a0,a0,1
	addi a1,a1,1
	j LBB248
LBB250:
	addi a0,a0,-100
	li a1,0
	bne a0,a1,LBB251
	j LBB252
LBB251:
	li a0,-1
	j LBB233
LBB252:
	li a0,0
LBB233:
	addi sp,sp,92
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	"wtf"

