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
	li a1,2
	li a2,1
	li a0,0
	li a4,0
	j LBB43
LBB43:
	li a3,200
	slt a3,a4,a3
	bnez a3,LBB44
	j LBB51
LBB44:
	add a3,a2,a1
	add a5,a2,a1
	xor a5,a5,a3
	seqz a5,a5
	bnez a5,LBB46
	j LBB45
LBB45:
	mv a5,a1
	mv a6,a2
	j LBB50
LBB46:
	mv a5,a1
	mv a6,a2
	mul a7,a1,a1
	mul a7,a7,a1
	mul a7,a7,a1
	mul a7,a7,a1
	mul a7,a7,a1
	mul a7,a7,a1
	mul a7,a7,a1
	mul a7,a7,a1
	mul t1,a7,a1
	add a7,a2,a2
	add t0,a7,a1
	add a7,a2,a2
	add a7,a7,a1
	mul t0,t0,a7
	add a7,a2,a2
	add a7,a7,a1
	mul t0,t0,a7
	add a7,a2,a2
	add a7,a7,a1
	mul t0,t0,a7
	add a7,a2,a2
	add a7,a7,a1
	mul a7,t0,a7
	xor a7,t1,a7
	seqz a7,a7
	bnez a7,LBB48
	j LBB47
LBB47:
	j LBB49
LBB48:
	addi a4,a4,1
	addi a0,a0,1
	j LBB49
LBB49:
	j LBB50
LBB50:
	addi a4,a4,1
	j LBB43
LBB51:
	mv a3,a0
	j LBB52
LBB52:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : test
	.globl	naivedce					# start function : naivedce
	.p2align	2
naivedce:
#LBB53:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	j LBB723
	li a0,114514
	j LBB54
LBB54:
	li a1,1
	li a2,0
	li a0,1
	li t0,0
	j LBB55
LBB55:
	li a3,100
	slt a3,a3,a0
	xori a3,a3,1
	bnez a3,LBB56
	j LBB57
LBB56:
	add a2,a2,a0
	addi a0,a0,1
	j LBB55
LBB57:
	j LBB58
LBB58:
	li a3,1
	slt a3,a0,a3
	xori a3,a3,1
	bnez a3,LBB59
	j LBB60
LBB59:
	add a2,a2,a0
	addi a0,a0,-1
	j LBB58
LBB60:
	addi a3,a0,1
	j LBB61
LBB61:
	li a0,10
	slt a0,a0,a3
	xori a0,a0,1
	bnez a0,LBB62
	j LBB63
LBB62:
	mul a1,a1,a3
	addi a3,a3,1
	j LBB61
LBB63:
	xor a0,a7,a5
	snez a0,a0
	bnez a0,LBB65
	j LBB64
LBB64:
	j LBB708
LBB65:
	xor a0,a7,a4
	snez a0,a0
	bnez a0,LBB67
	j LBB66
LBB66:
	j LBB707
LBB67:
	add t1,a7,a5
	add a0,a5,a7
	xor a0,t1,a0
	seqz a0,a0
	bnez a0,LBB69
	j LBB68
LBB68:
	j LBB706
LBB69:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB71
	j LBB70
LBB70:
	j LBB705
LBB71:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB73
	j LBB72
LBB72:
	j LBB704
LBB73:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB75
	j LBB74
LBB74:
	j LBB703
LBB75:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB77
	j LBB76
LBB76:
	j LBB702
LBB77:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB79
	j LBB78
LBB78:
	j LBB701
LBB79:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB81
	j LBB80
LBB80:
	j LBB700
LBB81:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB83
	j LBB82
LBB82:
	j LBB699
LBB83:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB85
	j LBB84
LBB84:
	j LBB698
LBB85:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB87
	j LBB86
LBB86:
	j LBB697
LBB87:
	xor a0,a7,a5
	snez a0,a0
	bnez a0,LBB89
	j LBB88
LBB88:
	j LBB696
LBB89:
	xor a0,a7,a4
	snez a0,a0
	bnez a0,LBB91
	j LBB90
LBB90:
	j LBB695
LBB91:
	add t1,a7,a5
	add a0,a5,a7
	xor a0,t1,a0
	seqz a0,a0
	bnez a0,LBB93
	j LBB92
LBB92:
	j LBB694
LBB93:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB95
	j LBB94
LBB94:
	j LBB693
LBB95:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB97
	j LBB96
LBB96:
	j LBB692
LBB97:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB99
	j LBB98
LBB98:
	j LBB691
LBB99:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB101
	j LBB100
LBB100:
	j LBB690
LBB101:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB103
	j LBB102
LBB102:
	j LBB689
LBB103:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB105
	j LBB104
LBB104:
	j LBB688
LBB105:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB107
	j LBB106
LBB106:
	j LBB687
LBB107:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB109
	j LBB108
LBB108:
	j LBB686
LBB109:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB111
	j LBB110
LBB110:
	j LBB685
LBB111:
	xor a0,a7,a5
	snez a0,a0
	bnez a0,LBB113
	j LBB112
LBB112:
	j LBB684
LBB113:
	xor a0,a7,a4
	snez a0,a0
	bnez a0,LBB115
	j LBB114
LBB114:
	j LBB683
LBB115:
	add t1,a7,a5
	add a0,a5,a7
	xor a0,t1,a0
	seqz a0,a0
	bnez a0,LBB117
	j LBB116
LBB116:
	j LBB682
LBB117:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB119
	j LBB118
LBB118:
	j LBB681
LBB119:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB121
	j LBB120
LBB120:
	j LBB680
LBB121:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB123
	j LBB122
LBB122:
	j LBB679
LBB123:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB125
	j LBB124
LBB124:
	j LBB678
LBB125:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB127
	j LBB126
LBB126:
	j LBB677
LBB127:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB129
	j LBB128
LBB128:
	j LBB676
LBB129:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB131
	j LBB130
LBB130:
	j LBB675
LBB131:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB133
	j LBB132
LBB132:
	j LBB674
LBB133:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB135
	j LBB134
LBB134:
	j LBB673
LBB135:
	xor a0,a7,a5
	snez a0,a0
	bnez a0,LBB137
	j LBB136
LBB136:
	j LBB672
LBB137:
	xor a0,a7,a4
	snez a0,a0
	bnez a0,LBB139
	j LBB138
LBB138:
	j LBB671
LBB139:
	add t1,a7,a5
	add a0,a5,a7
	xor a0,t1,a0
	seqz a0,a0
	bnez a0,LBB141
	j LBB140
LBB140:
	j LBB670
LBB141:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB143
	j LBB142
LBB142:
	j LBB669
LBB143:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB145
	j LBB144
LBB144:
	j LBB668
LBB145:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB147
	j LBB146
LBB146:
	j LBB667
LBB147:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB149
	j LBB148
LBB148:
	j LBB666
LBB149:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB151
	j LBB150
LBB150:
	j LBB665
LBB151:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB153
	j LBB152
LBB152:
	j LBB664
LBB153:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB155
	j LBB154
LBB154:
	j LBB663
LBB155:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB157
	j LBB156
LBB156:
	j LBB662
LBB157:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB159
	j LBB158
LBB158:
	j LBB661
LBB159:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB161
	j LBB160
LBB160:
	j LBB660
LBB161:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB163
	j LBB162
LBB162:
	j LBB659
LBB163:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB165
	j LBB164
LBB164:
	j LBB658
LBB165:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB167
	j LBB166
LBB166:
	j LBB657
LBB167:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB169
	j LBB168
LBB168:
	j LBB656
LBB169:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB171
	j LBB170
LBB170:
	j LBB655
LBB171:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB173
	j LBB172
LBB172:
	j LBB654
LBB173:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB175
	j LBB174
LBB174:
	j LBB653
LBB175:
	xor a0,a7,a5
	snez a0,a0
	bnez a0,LBB177
	j LBB176
LBB176:
	j LBB652
LBB177:
	xor a0,a7,a4
	snez a0,a0
	bnez a0,LBB179
	j LBB178
LBB178:
	j LBB651
LBB179:
	add t1,a7,a5
	add a0,a5,a7
	xor a0,t1,a0
	seqz a0,a0
	bnez a0,LBB181
	j LBB180
LBB180:
	j LBB650
LBB181:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB183
	j LBB182
LBB182:
	j LBB649
LBB183:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB185
	j LBB184
LBB184:
	j LBB648
LBB185:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB187
	j LBB186
LBB186:
	j LBB647
LBB187:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB189
	j LBB188
LBB188:
	j LBB646
LBB189:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB191
	j LBB190
LBB190:
	j LBB645
LBB191:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB193
	j LBB192
LBB192:
	j LBB644
LBB193:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB195
	j LBB194
LBB194:
	j LBB643
LBB195:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB197
	j LBB196
LBB196:
	j LBB642
LBB197:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB199
	j LBB198
LBB198:
	j LBB641
LBB199:
	xor a0,a7,a5
	snez a0,a0
	bnez a0,LBB201
	j LBB200
LBB200:
	j LBB640
LBB201:
	xor a0,a7,a4
	snez a0,a0
	bnez a0,LBB203
	j LBB202
LBB202:
	j LBB639
LBB203:
	add t1,a7,a5
	add a0,a5,a7
	xor a0,t1,a0
	seqz a0,a0
	bnez a0,LBB205
	j LBB204
LBB204:
	j LBB638
LBB205:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB207
	j LBB206
LBB206:
	j LBB637
LBB207:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB209
	j LBB208
LBB208:
	j LBB636
LBB209:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB211
	j LBB210
LBB210:
	j LBB635
LBB211:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB213
	j LBB212
LBB212:
	j LBB634
LBB213:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB215
	j LBB214
LBB214:
	j LBB633
LBB215:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB217
	j LBB216
LBB216:
	j LBB632
LBB217:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB219
	j LBB218
LBB218:
	j LBB631
LBB219:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB221
	j LBB220
LBB220:
	j LBB630
LBB221:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB223
	j LBB222
LBB222:
	j LBB629
LBB223:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB225
	j LBB224
LBB224:
	j LBB628
LBB225:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB227
	j LBB226
LBB226:
	j LBB627
LBB227:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB229
	j LBB228
LBB228:
	j LBB626
LBB229:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB231
	j LBB230
LBB230:
	j LBB625
LBB231:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB233
	j LBB232
LBB232:
	j LBB624
LBB233:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB235
	j LBB234
LBB234:
	j LBB623
LBB235:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB237
	j LBB236
LBB236:
	j LBB622
LBB237:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB239
	j LBB238
LBB238:
	j LBB621
LBB239:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB241
	j LBB240
LBB240:
	j LBB620
LBB241:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB243
	j LBB242
LBB242:
	j LBB619
LBB243:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB245
	j LBB244
LBB244:
	j LBB618
LBB245:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB247
	j LBB246
LBB246:
	j LBB617
LBB247:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB249
	j LBB248
LBB248:
	j LBB616
LBB249:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB251
	j LBB250
LBB250:
	j LBB615
LBB251:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB253
	j LBB252
LBB252:
	j LBB614
LBB253:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB255
	j LBB254
LBB254:
	j LBB613
LBB255:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB257
	j LBB256
LBB256:
	j LBB612
LBB257:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB259
	j LBB258
LBB258:
	j LBB611
LBB259:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB261
	j LBB260
LBB260:
	j LBB610
LBB261:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB263
	j LBB262
LBB262:
	j LBB609
LBB263:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB265
	j LBB264
LBB264:
	j LBB608
LBB265:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB267
	j LBB266
LBB266:
	j LBB607
LBB267:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB269
	j LBB268
LBB268:
	j LBB606
LBB269:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB271
	j LBB270
LBB270:
	j LBB605
LBB271:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB273
	j LBB272
LBB272:
	j LBB604
LBB273:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB275
	j LBB274
LBB274:
	j LBB603
LBB275:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB277
	j LBB276
LBB276:
	j LBB602
LBB277:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB279
	j LBB278
LBB278:
	j LBB601
LBB279:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB281
	j LBB280
LBB280:
	j LBB600
LBB281:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB283
	j LBB282
LBB282:
	j LBB599
LBB283:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB285
	j LBB284
LBB284:
	j LBB598
LBB285:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB287
	j LBB286
LBB286:
	j LBB597
LBB287:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB289
	j LBB288
LBB288:
	j LBB596
LBB289:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB291
	j LBB290
LBB290:
	j LBB595
LBB291:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB293
	j LBB292
LBB292:
	j LBB594
LBB293:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB295
	j LBB294
LBB294:
	j LBB593
LBB295:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB297
	j LBB296
LBB296:
	j LBB592
LBB297:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB299
	j LBB298
LBB298:
	j LBB591
LBB299:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB301
	j LBB300
LBB300:
	j LBB590
LBB301:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB303
	j LBB302
LBB302:
	j LBB589
LBB303:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB305
	j LBB304
LBB304:
	j LBB588
LBB305:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB307
	j LBB306
LBB306:
	j LBB587
LBB307:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB309
	j LBB308
LBB308:
	j LBB586
LBB309:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB311
	j LBB310
LBB310:
	j LBB585
LBB311:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB313
	j LBB312
LBB312:
	j LBB584
LBB313:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB315
	j LBB314
LBB314:
	j LBB583
LBB315:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB317
	j LBB316
LBB316:
	j LBB582
LBB317:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB319
	j LBB318
LBB318:
	j LBB581
LBB319:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB321
	j LBB320
LBB320:
	j LBB580
LBB321:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB323
	j LBB322
LBB322:
	j LBB579
LBB323:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB325
	j LBB324
LBB324:
	j LBB578
LBB325:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB327
	j LBB326
LBB326:
	j LBB577
LBB327:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB329
	j LBB328
LBB328:
	j LBB576
LBB329:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB331
	j LBB330
LBB330:
	j LBB575
LBB331:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB333
	j LBB332
LBB332:
	j LBB574
LBB333:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB335
	j LBB334
LBB334:
	j LBB573
LBB335:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB337
	j LBB336
LBB336:
	j LBB572
LBB337:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB339
	j LBB338
LBB338:
	j LBB571
LBB339:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB341
	j LBB340
LBB340:
	j LBB570
LBB341:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB343
	j LBB342
LBB342:
	j LBB569
LBB343:
	li a0,3628800
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB345
	j LBB344
LBB344:
	j LBB568
LBB345:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB347
	j LBB346
LBB346:
	j LBB567
LBB347:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB349
	j LBB348
LBB348:
	j LBB566
LBB349:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB351
	j LBB350
LBB350:
	j LBB565
LBB351:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB353
	j LBB352
LBB352:
	j LBB564
LBB353:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB355
	j LBB354
LBB354:
	j LBB563
LBB355:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB357
	j LBB356
LBB356:
	j LBB562
LBB357:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB359
	j LBB358
LBB358:
	j LBB561
LBB359:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB361
	j LBB360
LBB360:
	j LBB560
LBB361:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB363
	j LBB362
LBB362:
	j LBB559
LBB363:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB365
	j LBB364
LBB364:
	j LBB558
LBB365:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB367
	j LBB366
LBB366:
	j LBB557
LBB367:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB369
	j LBB368
LBB368:
	j LBB556
LBB369:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB371
	j LBB370
LBB370:
	j LBB555
LBB371:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB373
	j LBB372
LBB372:
	j LBB554
LBB373:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB375
	j LBB374
LBB374:
	j LBB553
LBB375:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB377
	j LBB376
LBB376:
	j LBB552
LBB377:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB379
	j LBB378
LBB378:
	j LBB551
LBB379:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB381
	j LBB380
LBB380:
	j LBB550
LBB381:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB383
	j LBB382
LBB382:
	j LBB549
LBB383:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB385
	j LBB384
LBB384:
	j LBB548
LBB385:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB387
	j LBB386
LBB386:
	j LBB547
LBB387:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB389
	j LBB388
LBB388:
	j LBB546
LBB389:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB391
	j LBB390
LBB390:
	j LBB545
LBB391:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB393
	j LBB392
LBB392:
	j LBB544
LBB393:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB395
	j LBB394
LBB394:
	j LBB543
LBB395:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB397
	j LBB396
LBB396:
	j LBB542
LBB397:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB399
	j LBB398
LBB398:
	j LBB541
LBB399:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB401
	j LBB400
LBB400:
	j LBB540
LBB401:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB403
	j LBB402
LBB402:
	j LBB539
LBB403:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB405
	j LBB404
LBB404:
	j LBB538
LBB405:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB407
	j LBB406
LBB406:
	j LBB537
LBB407:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB409
	j LBB408
LBB408:
	j LBB536
LBB409:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB411
	j LBB410
LBB410:
	j LBB535
LBB411:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB413
	j LBB412
LBB412:
	j LBB534
LBB413:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB415
	j LBB414
LBB414:
	j LBB533
LBB415:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB417
	j LBB416
LBB416:
	j LBB532
LBB417:
	li a0,10100
	xor a0,a2,a0
	seqz a0,a0
	bnez a0,LBB419
	j LBB418
LBB418:
	j LBB531
LBB419:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB421
	j LBB420
LBB420:
	j LBB530
LBB421:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB423
	j LBB422
LBB422:
	j LBB529
LBB423:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB425
	j LBB424
LBB424:
	j LBB528
LBB425:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB427
	j LBB426
LBB426:
	j LBB527
LBB427:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB429
	j LBB428
LBB428:
	j LBB526
LBB429:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB431
	j LBB430
LBB430:
	j LBB525
LBB431:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB433
	j LBB432
LBB432:
	j LBB524
LBB433:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB435
	j LBB434
LBB434:
	j LBB523
LBB435:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB437
	j LBB436
LBB436:
	j LBB522
LBB437:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB439
	j LBB438
LBB438:
	j LBB521
LBB439:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB441
	j LBB440
LBB440:
	j LBB520
LBB441:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB443
	j LBB442
LBB442:
	j LBB519
LBB443:
	li a0,3628800
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB445
	j LBB444
LBB444:
	j LBB518
LBB445:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB447
	j LBB446
LBB446:
	j LBB517
LBB447:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB449
	j LBB448
LBB448:
	j LBB516
LBB449:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB451
	j LBB450
LBB450:
	j LBB515
LBB451:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB453
	j LBB452
LBB452:
	j LBB514
LBB453:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB455
	j LBB454
LBB454:
	j LBB513
LBB455:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB457
	j LBB456
LBB456:
	j LBB512
LBB457:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB459
	j LBB458
LBB458:
	j LBB511
LBB459:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB461
	j LBB460
LBB460:
	j LBB510
LBB461:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB463
	j LBB462
LBB462:
	j LBB509
LBB463:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB465
	j LBB464
LBB464:
	j LBB508
LBB465:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB467
	j LBB466
LBB466:
	j LBB507
LBB467:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB469
	j LBB468
LBB468:
	j LBB506
LBB469:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB471
	j LBB470
LBB470:
	j LBB505
LBB471:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB473
	j LBB472
LBB472:
	j LBB504
LBB473:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB475
	j LBB474
LBB474:
	j LBB503
LBB475:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB477
	j LBB476
LBB476:
	j LBB502
LBB477:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB479
	j LBB478
LBB478:
	j LBB501
LBB479:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB481
	j LBB480
LBB480:
	j LBB500
LBB481:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB483
	j LBB482
LBB482:
	j LBB499
LBB483:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB485
	j LBB484
LBB484:
	j LBB498
LBB485:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB487
	j LBB486
LBB486:
	j LBB497
LBB487:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB489
	j LBB488
LBB488:
	j LBB496
LBB489:
	xor a0,a7,a7
	seqz a0,a0
	bnez a0,LBB491
	j LBB490
LBB490:
	j LBB495
LBB491:
	xor a0,a4,a4
	seqz a0,a0
	bnez a0,LBB493
	j LBB492
LBB492:
	j LBB494
LBB493:
	addi a4,a4,-1
	j LBB494
LBB494:
	j LBB495
LBB495:
	j LBB496
LBB496:
	j LBB497
LBB497:
	j LBB498
LBB498:
	j LBB499
LBB499:
	j LBB500
LBB500:
	j LBB501
LBB501:
	j LBB502
LBB502:
	j LBB503
LBB503:
	j LBB504
LBB504:
	j LBB505
LBB505:
	j LBB506
LBB506:
	j LBB507
LBB507:
	j LBB508
LBB508:
	j LBB509
LBB509:
	j LBB510
LBB510:
	j LBB511
LBB511:
	j LBB512
LBB512:
	j LBB513
LBB513:
	j LBB514
LBB514:
	j LBB515
LBB515:
	j LBB516
LBB516:
	j LBB517
LBB517:
	addi a1,a1,1
	j LBB518
LBB518:
	j LBB519
LBB519:
	j LBB520
LBB520:
	j LBB521
LBB521:
	j LBB522
LBB522:
	j LBB523
LBB523:
	j LBB524
LBB524:
	j LBB525
LBB525:
	j LBB526
LBB526:
	j LBB527
LBB527:
	j LBB528
LBB528:
	j LBB529
LBB529:
	j LBB530
LBB530:
	j LBB531
LBB531:
	j LBB532
LBB532:
	j LBB533
LBB533:
	j LBB534
LBB534:
	j LBB535
LBB535:
	j LBB536
LBB536:
	j LBB537
LBB537:
	j LBB538
LBB538:
	j LBB539
LBB539:
	j LBB540
LBB540:
	j LBB541
LBB541:
	j LBB542
LBB542:
	j LBB543
LBB543:
	j LBB544
LBB544:
	j LBB545
LBB545:
	j LBB546
LBB546:
	j LBB547
LBB547:
	j LBB548
LBB548:
	j LBB549
LBB549:
	j LBB550
LBB550:
	j LBB551
LBB551:
	j LBB552
LBB552:
	j LBB553
LBB553:
	j LBB554
LBB554:
	j LBB555
LBB555:
	j LBB556
LBB556:
	j LBB557
LBB557:
	j LBB558
LBB558:
	j LBB559
LBB559:
	j LBB560
LBB560:
	j LBB561
LBB561:
	j LBB562
LBB562:
	j LBB563
LBB563:
	j LBB564
LBB564:
	j LBB565
LBB565:
	j LBB566
LBB566:
	j LBB567
LBB567:
	j LBB568
LBB568:
	j LBB569
LBB569:
	j LBB570
LBB570:
	j LBB571
LBB571:
	j LBB572
LBB572:
	j LBB573
LBB573:
	j LBB574
LBB574:
	j LBB575
LBB575:
	j LBB576
LBB576:
	j LBB577
LBB577:
	j LBB578
LBB578:
	j LBB579
LBB579:
	j LBB580
LBB580:
	j LBB581
LBB581:
	j LBB582
LBB582:
	j LBB583
LBB583:
	j LBB584
LBB584:
	j LBB585
LBB585:
	j LBB586
LBB586:
	j LBB587
LBB587:
	j LBB588
LBB588:
	j LBB589
LBB589:
	j LBB590
LBB590:
	j LBB591
LBB591:
	j LBB592
LBB592:
	j LBB593
LBB593:
	j LBB594
LBB594:
	j LBB595
LBB595:
	j LBB596
LBB596:
	j LBB597
LBB597:
	j LBB598
LBB598:
	j LBB599
LBB599:
	j LBB600
LBB600:
	j LBB601
LBB601:
	j LBB602
LBB602:
	j LBB603
LBB603:
	j LBB604
LBB604:
	j LBB605
LBB605:
	j LBB606
LBB606:
	j LBB607
LBB607:
	j LBB608
LBB608:
	j LBB609
LBB609:
	j LBB610
LBB610:
	j LBB611
LBB611:
	j LBB612
LBB612:
	j LBB613
LBB613:
	j LBB614
LBB614:
	j LBB615
LBB615:
	j LBB616
LBB616:
	j LBB617
LBB617:
	j LBB618
LBB618:
	j LBB619
LBB619:
	j LBB620
LBB620:
	j LBB621
LBB621:
	j LBB622
LBB622:
	j LBB623
LBB623:
	j LBB624
LBB624:
	j LBB625
LBB625:
	j LBB626
LBB626:
	j LBB627
LBB627:
	j LBB628
LBB628:
	j LBB629
LBB629:
	j LBB630
LBB630:
	j LBB631
LBB631:
	j LBB632
LBB632:
	j LBB633
LBB633:
	j LBB634
LBB634:
	j LBB635
LBB635:
	j LBB636
LBB636:
	j LBB637
LBB637:
	j LBB638
LBB638:
	j LBB639
LBB639:
	j LBB640
LBB640:
	j LBB641
LBB641:
	j LBB642
LBB642:
	j LBB643
LBB643:
	j LBB644
LBB644:
	j LBB645
LBB645:
	j LBB646
LBB646:
	j LBB647
LBB647:
	j LBB648
LBB648:
	j LBB649
LBB649:
	j LBB650
LBB650:
	j LBB651
LBB651:
	j LBB652
LBB652:
	j LBB653
LBB653:
	j LBB654
LBB654:
	j LBB655
LBB655:
	j LBB656
LBB656:
	j LBB657
LBB657:
	j LBB658
LBB658:
	j LBB659
LBB659:
	j LBB660
LBB660:
	j LBB661
LBB661:
	j LBB662
LBB662:
	j LBB663
LBB663:
	j LBB664
LBB664:
	j LBB665
LBB665:
	j LBB666
LBB666:
	j LBB667
LBB667:
	j LBB668
LBB668:
	j LBB669
LBB669:
	j LBB670
LBB670:
	j LBB671
LBB671:
	j LBB672
LBB672:
	j LBB673
LBB673:
	j LBB674
LBB674:
	j LBB675
LBB675:
	j LBB676
LBB676:
	j LBB677
LBB677:
	j LBB678
LBB678:
	j LBB679
LBB679:
	j LBB680
LBB680:
	j LBB681
LBB681:
	j LBB682
LBB682:
	j LBB683
LBB683:
	j LBB684
LBB684:
	j LBB685
LBB685:
	j LBB686
LBB686:
	j LBB687
LBB687:
	j LBB688
LBB688:
	j LBB689
LBB689:
	j LBB690
LBB690:
	j LBB691
LBB691:
	j LBB692
LBB692:
	j LBB693
LBB693:
	j LBB694
LBB694:
	j LBB695
LBB695:
	j LBB696
LBB696:
	j LBB697
LBB697:
	j LBB698
LBB698:
	j LBB699
LBB699:
	j LBB700
LBB700:
	j LBB701
LBB701:
	j LBB702
LBB702:
	j LBB703
LBB703:
	j LBB704
LBB704:
	j LBB705
LBB705:
	j LBB706
LBB706:
	j LBB707
LBB707:
	j LBB708
LBB708:
	li a0,1919
	j LBB709
LBB709:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : naivedce
	.globl	dceconst					# start function : dceconst
	.p2align	2
dceconst:
#LBB710:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a0,114514
	li a2,0
	j LBB711
LBB711:
	lui a4,%hi(N)
	lw a4,%lo(N)(a4)
	slt a4,a2,a4
	bnez a4,LBB712
	j LBB716
LBB712:
	li a4,0
	j LBB713
LBB713:
	lui a5,%hi(N)
	lw a5,%lo(N)(a5)
	slt a5,a4,a5
	bnez a5,LBB714
	j LBB715
LBB714:
	add a7,a2,a4
	sub a6,a2,a4
	add a5,a2,a4
	sub a5,a5,a2
	mul t0,a5,a5
	lui a5,%hi(N)
	lw a5,%lo(N)(a5)
	div a5,t0,a5
	addi a4,a4,1
	j LBB713
LBB715:
	addi a2,a2,1
	j LBB711
LBB716:
	li a2,0
	j LBB717
LBB717:
	lui a4,%hi(N)
	lw a4,%lo(N)(a4)
	slt a4,a2,a4
	bnez a4,LBB718
	j LBB719
LBB718:
	li a4,234
	mul a4,a1,a4
	addi a4,a4,111
	addi a4,a4,0
	addi a4,a4,7
	addi a4,a4,0
	addi a4,a4,0
	addi a4,a4,7
	addi a4,a4,0
	addi a4,a4,0
	addi a4,a4,7
	addi a5,a4,0
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a7,a5,a4
	lui a4,%hi(N)
	lw a5,%lo(N)(a4)
	li a4,508104
	add a4,a5,a4
	addi a4,a4,111
	addi a4,a4,0
	addi a4,a4,7
	addi a4,a4,0
	addi a4,a4,0
	addi a4,a4,7
	addi a6,a4,0
	li a4,5
	div a5,a1,a4
	li a4,6
	mul a4,a5,a4
	add a4,a6,a4
	addi a4,a4,7
	addi a4,a4,0
	xor a5,a7,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a5,a5,a4
	li a4,12719578
	xor a6,a5,a4
	li a4,12
	mul a5,a1,a4
	li a4,12211342
	add a4,a4,a5
	xor a4,a6,a4
	addi a4,a4,11
	addi a2,a2,1
	j LBB717
LBB719:
	mv a1,a0
	j LBB720
LBB720:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : dceconst
	.globl	main					# start function : main
	.p2align	2
main:
#LBB721:
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
	j LBB722
LBB722:
	addi sp,sp,80
	lw s1,-12(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
N:
	.word	80

