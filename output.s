	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB40:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
LBB41:
	li a1,99
	lui a0,%hi(h)
	sw a1,%lo(h)(a0)
	li a1,100
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
	li a1,101
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
	li a1,102
	lui a0,%hi(k)
	sw a1,%lo(k)(a0)
	li a1,0
	lui a0,%hi(total)
	sw a1,%lo(total)(a0)
	call getInt
	lui a1,%hi(N)
	sw a0,%lo(N)(a1)
	li a0,1
LBB42:
	lui a1,%hi(N)
	lw a1,%lo(N)(a1)
	slt a1,a1,a0
	xori a1,a1,1
	bnez a1,LBB43
	j LBB181
LBB43:
	li a1,1
LBB44:
	lui a2,%hi(N)
	lw a2,%lo(N)(a2)
	slt a2,a2,a1
	xori a2,a2,1
	bnez a2,LBB45
	j LBB180
LBB45:
	li a2,1
LBB46:
	lui a3,%hi(N)
	lw a3,%lo(N)(a3)
	slt a3,a3,a2
	xori a3,a3,1
	bnez a3,LBB47
	j LBB179
LBB47:
	li a3,1
LBB48:
	lui a4,%hi(N)
	lw a4,%lo(N)(a4)
	slt a4,a4,a3
	xori a4,a4,1
	bnez a4,LBB49
	j LBB178
LBB49:
	li a4,1
LBB50:
	lui a5,%hi(N)
	lw a5,%lo(N)(a5)
	slt a5,a5,a4
	xori a5,a5,1
	bnez a5,LBB51
	j LBB177
LBB51:
	li a5,1
LBB52:
	lui a6,%hi(N)
	lw a6,%lo(N)(a6)
	slt a6,a6,a5
	xori a6,a6,1
	bnez a6,LBB53
	j LBB176
LBB53:
	xor a6,a0,a1
	snez a6,a6
	bnez a6,LBB55
	j LBB54
LBB54:
	li a6,0
	j LBB56
LBB55:
	xor a6,a0,a2
	snez a6,a6
LBB56:
	bnez a6,LBB58
	j LBB57
LBB57:
	li a6,0
	j LBB59
LBB58:
	xor a6,a0,a3
	snez a6,a6
LBB59:
	bnez a6,LBB61
	j LBB60
LBB60:
	li a6,0
	j LBB62
LBB61:
	xor a6,a0,a4
	snez a6,a6
LBB62:
	bnez a6,LBB64
	j LBB63
LBB63:
	li a6,0
	j LBB65
LBB64:
	xor a6,a0,a5
	snez a6,a6
LBB65:
	bnez a6,LBB67
	j LBB66
LBB66:
	li a6,0
	j LBB68
LBB67:
	lui a6,%hi(h)
	lw a6,%lo(h)(a6)
	xor a6,a0,a6
	snez a6,a6
LBB68:
	bnez a6,LBB70
	j LBB69
LBB69:
	li a6,0
	j LBB71
LBB70:
	lui a6,%hi(i)
	lw a6,%lo(i)(a6)
	xor a6,a0,a6
	snez a6,a6
LBB71:
	bnez a6,LBB73
	j LBB72
LBB72:
	li a6,0
	j LBB74
LBB73:
	lui a6,%hi(j)
	lw a6,%lo(j)(a6)
	xor a6,a0,a6
	snez a6,a6
LBB74:
	bnez a6,LBB76
	j LBB75
LBB75:
	li a6,0
	j LBB77
LBB76:
	lui a6,%hi(k)
	lw a6,%lo(k)(a6)
	xor a6,a0,a6
	snez a6,a6
LBB77:
	bnez a6,LBB79
	j LBB78
LBB78:
	li a6,0
	j LBB80
LBB79:
	xor a6,a1,a2
	snez a6,a6
LBB80:
	bnez a6,LBB82
	j LBB81
LBB81:
	li a6,0
	j LBB83
LBB82:
	xor a6,a1,a3
	snez a6,a6
LBB83:
	bnez a6,LBB85
	j LBB84
LBB84:
	li a6,0
	j LBB86
LBB85:
	xor a6,a1,a4
	snez a6,a6
LBB86:
	bnez a6,LBB88
	j LBB87
LBB87:
	li a6,0
	j LBB89
LBB88:
	xor a6,a1,a5
	snez a6,a6
LBB89:
	bnez a6,LBB91
	j LBB90
LBB90:
	li a6,0
	j LBB92
LBB91:
	lui a6,%hi(h)
	lw a6,%lo(h)(a6)
	xor a6,a1,a6
	snez a6,a6
LBB92:
	bnez a6,LBB94
	j LBB93
LBB93:
	li a6,0
	j LBB95
LBB94:
	lui a6,%hi(i)
	lw a6,%lo(i)(a6)
	xor a6,a1,a6
	snez a6,a6
LBB95:
	bnez a6,LBB97
	j LBB96
LBB96:
	li a6,0
	j LBB98
LBB97:
	lui a6,%hi(j)
	lw a6,%lo(j)(a6)
	xor a6,a1,a6
	snez a6,a6
LBB98:
	bnez a6,LBB100
	j LBB99
LBB99:
	li a6,0
	j LBB101
LBB100:
	lui a6,%hi(k)
	lw a6,%lo(k)(a6)
	xor a6,a1,a6
	snez a6,a6
LBB101:
	bnez a6,LBB103
	j LBB102
LBB102:
	li a6,0
	j LBB104
LBB103:
	xor a6,a2,a3
	snez a6,a6
LBB104:
	bnez a6,LBB106
	j LBB105
LBB105:
	li a6,0
	j LBB107
LBB106:
	xor a6,a2,a4
	snez a6,a6
LBB107:
	bnez a6,LBB109
	j LBB108
LBB108:
	li a6,0
	j LBB110
LBB109:
	xor a6,a2,a5
	snez a6,a6
LBB110:
	bnez a6,LBB112
	j LBB111
LBB111:
	li a6,0
	j LBB113
LBB112:
	lui a6,%hi(h)
	lw a6,%lo(h)(a6)
	xor a6,a2,a6
	snez a6,a6
LBB113:
	bnez a6,LBB115
	j LBB114
LBB114:
	li a6,0
	j LBB116
LBB115:
	lui a6,%hi(i)
	lw a6,%lo(i)(a6)
	xor a6,a2,a6
	snez a6,a6
LBB116:
	bnez a6,LBB118
	j LBB117
LBB117:
	li a6,0
	j LBB119
LBB118:
	lui a6,%hi(j)
	lw a6,%lo(j)(a6)
	xor a6,a2,a6
	snez a6,a6
LBB119:
	bnez a6,LBB121
	j LBB120
LBB120:
	li a6,0
	j LBB122
LBB121:
	lui a6,%hi(k)
	lw a6,%lo(k)(a6)
	xor a6,a2,a6
	snez a6,a6
LBB122:
	bnez a6,LBB124
	j LBB123
LBB123:
	li a6,0
	j LBB125
LBB124:
	xor a6,a3,a4
	snez a6,a6
LBB125:
	bnez a6,LBB127
	j LBB126
LBB126:
	li a6,0
	j LBB128
LBB127:
	xor a6,a3,a5
	snez a6,a6
LBB128:
	bnez a6,LBB130
	j LBB129
LBB129:
	li a6,0
	j LBB131
LBB130:
	lui a6,%hi(h)
	lw a6,%lo(h)(a6)
	xor a6,a3,a6
	snez a6,a6
LBB131:
	bnez a6,LBB133
	j LBB132
LBB132:
	li a6,0
	j LBB134
LBB133:
	lui a6,%hi(i)
	lw a6,%lo(i)(a6)
	xor a6,a3,a6
	snez a6,a6
LBB134:
	bnez a6,LBB136
	j LBB135
LBB135:
	li a6,0
	j LBB137
LBB136:
	lui a6,%hi(j)
	lw a6,%lo(j)(a6)
	xor a6,a3,a6
	snez a6,a6
LBB137:
	bnez a6,LBB139
	j LBB138
LBB138:
	li a6,0
	j LBB140
LBB139:
	lui a6,%hi(k)
	lw a6,%lo(k)(a6)
	xor a6,a3,a6
	snez a6,a6
LBB140:
	bnez a6,LBB142
	j LBB141
LBB141:
	li a6,0
	j LBB143
LBB142:
	xor a6,a4,a5
	snez a6,a6
LBB143:
	bnez a6,LBB145
	j LBB144
LBB144:
	li a6,0
	j LBB146
LBB145:
	lui a6,%hi(h)
	lw a6,%lo(h)(a6)
	xor a6,a4,a6
	snez a6,a6
LBB146:
	bnez a6,LBB148
	j LBB147
LBB147:
	li a6,0
	j LBB149
LBB148:
	lui a6,%hi(i)
	lw a6,%lo(i)(a6)
	xor a6,a4,a6
	snez a6,a6
LBB149:
	bnez a6,LBB151
	j LBB150
LBB150:
	li a6,0
	j LBB152
LBB151:
	lui a6,%hi(j)
	lw a6,%lo(j)(a6)
	xor a6,a4,a6
	snez a6,a6
LBB152:
	bnez a6,LBB154
	j LBB153
LBB153:
	li a6,0
	j LBB155
LBB154:
	lui a6,%hi(k)
	lw a6,%lo(k)(a6)
	xor a6,a4,a6
	snez a6,a6
LBB155:
	bnez a6,LBB157
	j LBB156
LBB156:
	li a6,0
	j LBB158
LBB157:
	lui a6,%hi(h)
	lw a6,%lo(h)(a6)
	xor a6,a5,a6
	snez a6,a6
LBB158:
	bnez a6,LBB160
	j LBB159
LBB159:
	li a6,0
	j LBB161
LBB160:
	lui a6,%hi(i)
	lw a6,%lo(i)(a6)
	xor a6,a5,a6
	snez a6,a6
LBB161:
	bnez a6,LBB163
	j LBB162
LBB162:
	li a6,0
	j LBB164
LBB163:
	lui a6,%hi(j)
	lw a6,%lo(j)(a6)
	xor a6,a5,a6
	snez a6,a6
LBB164:
	bnez a6,LBB166
	j LBB165
LBB165:
	li a6,0
	j LBB167
LBB166:
	lui a6,%hi(k)
	lw a6,%lo(k)(a6)
	xor a6,a5,a6
	snez a6,a6
LBB167:
	bnez a6,LBB169
	j LBB168
LBB168:
	li a6,0
	j LBB170
LBB169:
	lui a6,%hi(i)
	lw a7,%lo(i)(a6)
	lui a6,%hi(j)
	lw a6,%lo(j)(a6)
	xor a6,a7,a6
	snez a6,a6
LBB170:
	bnez a6,LBB172
	j LBB171
LBB171:
	li a6,0
	j LBB173
LBB172:
	lui a6,%hi(h)
	lw a7,%lo(h)(a6)
	lui a6,%hi(k)
	lw a6,%lo(k)(a6)
	xor a6,a7,a6
	snez a6,a6
LBB173:
	bnez a6,LBB174
	j LBB175
LBB174:
	lui a6,%hi(total)
	lw a6,%lo(total)(a6)
	addi a7,a6,1
	lui a6,%hi(total)
	sw a7,%lo(total)(a6)
LBB175:
	addi a5,a5,1
	j LBB52
LBB176:
	addi a4,a4,1
	j LBB50
LBB177:
	addi a3,a3,1
	j LBB48
LBB178:
	addi a2,a2,1
	j LBB46
LBB179:
	addi a1,a1,1
	j LBB44
LBB180:
	addi a0,a0,1
	j LBB42
LBB181:
	lui a0,%hi(total)
	lw a0,%lo(total)(a0)
	call toString
	call println
	li a0,0
LBB182:
	addi sp,sp,84
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
N:
	.word	0

	.p2align	2
h:
	.word	99

	.p2align	2
i:
	.word	100

	.p2align	2
j:
	.word	101

	.p2align	2
k:
	.word	102

	.p2align	2
total:
	.word	0

