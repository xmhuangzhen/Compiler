	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a1,80
	lui a0,%hi(N)
	sw a1,%lo(N)(a0)
	j LBB25
LBB25:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	test					# start function : test
	.p2align	2
test:
#LBB42:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a3,0
	li a4,0
	li a5,0
	li a0,0
	li a1,0
	j LBB43
LBB43:
	li a3,200
	slt a3,a1,a3
	bnez a3,LBB44
	j LBB45
LBB44:
	addi a1,a1,1
	addi a0,a0,1
	mv a3,a2
	li a4,2
	li a5,1
	addi a1,a1,1
	j LBB43
LBB45:
	j LBB46
LBB46:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : test
	.globl	naivedce					# start function : naivedce
	.p2align	2
naivedce:
#LBB47:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a0,114514
	li a3,0
	li a0,1
	j LBB48
LBB48:
	li a2,100
	slt a2,a2,a0
	xori a2,a2,1
	bnez a2,LBB49
	j LBB50
LBB49:
	add a3,a3,a0
	addi a0,a0,1
	j LBB48
LBB50:
	j LBB51
LBB51:
	li a2,1
	slt a2,a0,a2
	xori a2,a2,1
	bnez a2,LBB52
	j LBB53
LBB52:
	add a3,a3,a0
	addi a0,a0,-1
	j LBB51
LBB53:
	addi a2,a0,1
	li a0,1
	j LBB54
LBB54:
	li a4,10
	slt a4,a4,a2
	xori a4,a4,1
	bnez a4,LBB55
	j LBB56
LBB55:
	mul a0,a0,a2
	addi a2,a2,1
	j LBB54
LBB56:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB58
	j LBB57
LBB57:
	j LBB161
LBB58:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB60
	j LBB59
LBB59:
	j LBB160
LBB60:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB62
	j LBB61
LBB61:
	j LBB159
LBB62:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB64
	j LBB63
LBB63:
	j LBB158
LBB64:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB66
	j LBB65
LBB65:
	j LBB157
LBB66:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB68
	j LBB67
LBB67:
	j LBB156
LBB68:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB70
	j LBB69
LBB69:
	j LBB155
LBB70:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB72
	j LBB71
LBB71:
	j LBB154
LBB72:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB74
	j LBB73
LBB73:
	j LBB153
LBB74:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB76
	j LBB75
LBB75:
	j LBB152
LBB76:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB78
	j LBB77
LBB77:
	j LBB151
LBB78:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB80
	j LBB79
LBB79:
	j LBB150
LBB80:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB82
	j LBB81
LBB81:
	j LBB149
LBB82:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB84
	j LBB83
LBB83:
	j LBB148
LBB84:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB86
	j LBB85
LBB85:
	j LBB147
LBB86:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB88
	j LBB87
LBB87:
	j LBB146
LBB88:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB90
	j LBB89
LBB89:
	j LBB145
LBB90:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB92
	j LBB91
LBB91:
	j LBB144
LBB92:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB94
	j LBB93
LBB93:
	j LBB143
LBB94:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB96
	j LBB95
LBB95:
	j LBB142
LBB96:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB98
	j LBB97
LBB97:
	j LBB141
LBB98:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB100
	j LBB99
LBB99:
	j LBB140
LBB100:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB102
	j LBB101
LBB101:
	j LBB139
LBB102:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB104
	j LBB103
LBB103:
	j LBB138
LBB104:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB106
	j LBB105
LBB105:
	j LBB137
LBB106:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB108
	j LBB107
LBB107:
	j LBB136
LBB108:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB110
	j LBB109
LBB109:
	j LBB135
LBB110:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB112
	j LBB111
LBB111:
	j LBB134
LBB112:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB114
	j LBB113
LBB113:
	j LBB133
LBB114:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB116
	j LBB115
LBB115:
	j LBB132
LBB116:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB118
	j LBB117
LBB117:
	j LBB131
LBB118:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB120
	j LBB119
LBB119:
	j LBB130
LBB120:
	li a2,3628800
	xor a2,a0,a2
	seqz a2,a2
	bnez a2,LBB122
	j LBB121
LBB121:
	j LBB129
LBB122:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB124
	j LBB123
LBB123:
	j LBB128
LBB124:
	li a2,3628800
	xor a2,a0,a2
	seqz a2,a2
	bnez a2,LBB126
	j LBB125
LBB125:
	j LBB127
LBB126:
	addi a0,a0,1
	j LBB127
LBB127:
	j LBB128
LBB128:
	j LBB129
LBB129:
	j LBB130
LBB130:
	j LBB131
LBB131:
	j LBB132
LBB132:
	j LBB133
LBB133:
	j LBB134
LBB134:
	j LBB135
LBB135:
	j LBB136
LBB136:
	j LBB137
LBB137:
	j LBB138
LBB138:
	j LBB139
LBB139:
	j LBB140
LBB140:
	j LBB141
LBB141:
	j LBB142
LBB142:
	j LBB143
LBB143:
	j LBB144
LBB144:
	j LBB145
LBB145:
	j LBB146
LBB146:
	j LBB147
LBB147:
	j LBB148
LBB148:
	j LBB149
LBB149:
	j LBB150
LBB150:
	j LBB151
LBB151:
	j LBB152
LBB152:
	j LBB153
LBB153:
	j LBB154
LBB154:
	j LBB155
LBB155:
	j LBB156
LBB156:
	j LBB157
LBB157:
	j LBB158
LBB158:
	j LBB159
LBB159:
	j LBB160
LBB160:
	j LBB161
LBB161:
	li a0,1919
	j LBB162
LBB162:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : naivedce
	.globl	dceconst					# start function : dceconst
	.p2align	2
dceconst:
#LBB163:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a1,0
	li a2,0
	li a3,0
	li a4,0
	li a5,0
	j LBB164
LBB164:
	lui a4,%hi(N)
	lw a4,%lo(N)(a4)
	slt a4,a5,a4
	bnez a4,LBB165
	j LBB169
LBB165:
	li a4,0
	j LBB166
LBB166:
	lui a6,%hi(N)
	lw a6,%lo(N)(a6)
	slt a6,a4,a6
	bnez a6,LBB167
	j LBB168
LBB167:
	add a3,a5,a4
	sub a2,a5,a4
	add a1,a5,a4
	sub a1,a1,a5
	mul a6,a1,a1
	lui a1,%hi(N)
	lw a1,%lo(N)(a1)
	div a1,a6,a1
	addi a4,a4,1
	j LBB166
LBB168:
	addi a5,a5,1
	j LBB164
LBB169:
	li a1,0
	li a2,0
	j LBB170
LBB170:
	lui a1,%hi(N)
	lw a1,%lo(N)(a1)
	slt a1,a2,a1
	bnez a1,LBB171
	j LBB172
LBB171:
	lui a1,%hi(N)
	lw a3,%lo(N)(a1)
	li a1,508104
	add a1,a3,a1
	addi a1,a1,111
	addi a1,a1,0
	addi a1,a1,7
	addi a1,a1,0
	addi a1,a1,0
	addi a1,a1,7
	addi a1,a1,0
	addi a1,a1,0
	addi a1,a1,7
	addi a3,a1,0
	li a1,132
	xor a3,a1,a3
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12211342
	xor a1,a3,a1
	addi a1,a1,11
	addi a2,a2,1
	mv a1,a0
	j LBB170
LBB172:
	li a0,114514
	j LBB173
LBB173:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : dceconst
	.globl	main					# start function : main
	.p2align	2
main:
#LBB174:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-80
	call __init__
	call test
	mv s1,a0
	call naivedce
	add s1,s1,a0
	call dceconst
	add a1,s1,a0
	li a0,50997
	sub a0,a1,a0
	j LBB175
LBB175:
	addi sp,sp,80
	lw s1,-12(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
N:
	.word	80

