	.text
	.globl	show					# start function : show
	.p2align	2
show:
#LBB40:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-88
	li s2,0
LBB41:
	lui a0,%hi(now)
	lw a0,%lo(now)(a0)
	slt a0,s2,a0
	bnez a0,LBB42
	j LBB44
LBB42:
	lui a0,%hi(a)
	lw a1,%lo(a)(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a0,0(a0)
	call toString
	la a1,const_string_no0
	call __string_add
	call print
LBB43:
	addi s2,s2,1
	j LBB41
LBB44:
	la a0,const_string_no1
	call println
LBB45:
	mv a0,s1
	addi sp,sp,88
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw ra,-4(sp)
	ret
# end function : show
	.globl	win					# start function : win
	.p2align	2
win:
#LBB46:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
	li a0,404
	call malloc
	li a1,100
	sw a1,0(a0)
	addi a0,a0,4
	addi a2,a0,0
	lui a0,%hi(now)
	lw a1,%lo(now)(a0)
	lui a0,%hi(h)
	lw a0,%lo(h)(a0)
	xor a0,a1,a0
	snez a0,a0
	bnez a0,LBB47
	j LBB48
LBB47:
	li a0,0
	j LBB69
LBB48:
	li a0,0
LBB49:
	lui a1,%hi(now)
	lw a1,%lo(now)(a1)
	slt a1,a0,a1
	bnez a1,LBB50
	j LBB52
LBB50:
	slli a1,a0,2
	add a4,a2,a1
	lui a1,%hi(a)
	lw a3,%lo(a)(a1)
	slli a1,a0,2
	add a1,a3,a1
	lw a1,0(a1)
	sw a1,0(a4)
LBB51:
	addi a0,a0,1
	j LBB49
LBB52:
	li a0,0
LBB53:
	lui a1,%hi(now)
	lw a1,%lo(now)(a1)
	addi a1,a1,-1
	slt a1,a0,a1
	bnez a1,LBB54
	j LBB62
LBB54:
	addi a1,a0,1
LBB55:
	lui a3,%hi(now)
	lw a3,%lo(now)(a3)
	slt a3,a1,a3
	bnez a3,LBB56
	j LBB60
LBB56:
	slli a3,a0,2
	add a3,a2,a3
	lw a4,0(a3)
	slli a3,a1,2
	add a3,a2,a3
	lw a3,0(a3)
	slt a3,a3,a4
	bnez a3,LBB57
	j LBB58
LBB57:
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
LBB58:
LBB59:
	addi a1,a1,1
	j LBB55
LBB60:
LBB61:
	addi a0,a0,1
	j LBB53
LBB62:
	li a0,0
LBB63:
	lui a1,%hi(now)
	lw a1,%lo(now)(a1)
	slt a1,a0,a1
	bnez a1,LBB64
	j LBB68
LBB64:
	slli a1,a0,2
	add a1,a2,a1
	lw a3,0(a1)
	addi a1,a0,1
	xor a1,a3,a1
	snez a1,a1
	bnez a1,LBB65
	j LBB66
LBB65:
	li a0,0
	j LBB69
LBB66:
LBB67:
	addi a0,a0,1
	j LBB63
LBB68:
	li a0,1
LBB69:
	addi sp,sp,84
	lw ra,-4(sp)
	ret
# end function : win
	.globl	main					# start function : main
	.p2align	2
main:
#LBB70:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-88
LBB71:
	li a1,48271
	lui a0,%hi(A)
	sw a1,%lo(A)(a0)
	li a1,2147483647
	lui a0,%hi(M)
	sw a1,%lo(M)(a0)
	li a1,1
	lui a0,%hi(seed)
	sw a1,%lo(seed)(a0)
LBB72:
LBB73:
	li a1,210
	lui a0,%hi(n)
	sw a1,%lo(n)(a0)
	li a1,0
	lui a0,%hi(h)
	sw a1,%lo(h)(a0)
	li a0,404
	call malloc
	li a1,100
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(a)
	sw a1,%lo(a)(a0)
	lui a0,%hi(M)
	lw a1,%lo(M)(a0)
	lui a0,%hi(A)
	lw a0,%lo(A)(a0)
	div a1,a1,a0
	lui a0,%hi(Q)
	sw a1,%lo(Q)(a0)
	lui a0,%hi(M)
	lw a1,%lo(M)(a0)
	lui a0,%hi(A)
	lw a0,%lo(A)(a0)
	rem a1,a1,a0
	lui a0,%hi(R)
	sw a1,%lo(R)(a0)
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
LBB74:
LBB75:
	lui a1,%hi(h)
	lw a1,%lo(h)(a1)
	slt a1,a0,a1
	xori a1,a1,1
	bnez a1,LBB76
	j LBB80
LBB76:
	lui a1,%hi(h)
	lw a2,%lo(h)(a1)
	lui a1,%hi(h)
	lw a1,%lo(h)(a1)
	addi a1,a1,1
	mul a2,a2,a1
	li a1,2
	div a1,a2,a1
	xor a1,a0,a1
	seqz a1,a1
	bnez a1,LBB77
	j LBB78
LBB77:
	li a0,1
	j LBB81
LBB78:
LBB79:
	lui a1,%hi(h)
	lw a1,%lo(h)(a1)
	addi a2,a1,1
	lui a1,%hi(h)
	sw a2,%lo(h)(a1)
	j LBB75
LBB80:
	li a0,0
LBB81:
LBB82:
	li a1,1
	xor a0,a1,a0
	bnez a0,LBB83
	j LBB84
LBB83:
	la a0,const_string_no2
	call println
	li a0,1
	j LBB170
LBB84:
	la a0,const_string_no3
	call println
LBB85:
	li a0,3654898
	lui a1,%hi(seed)
	sw a0,%lo(seed)(a1)
LBB86:
LBB87:
LBB88:
	lui a0,%hi(A)
	lw a2,%lo(A)(a0)
	lui a0,%hi(seed)
	lw a1,%lo(seed)(a0)
	lui a0,%hi(Q)
	lw a0,%lo(Q)(a0)
	rem a0,a1,a0
	mul a3,a2,a0
	lui a0,%hi(R)
	lw a2,%lo(R)(a0)
	lui a0,%hi(seed)
	lw a1,%lo(seed)(a0)
	lui a0,%hi(Q)
	lw a0,%lo(Q)(a0)
	div a0,a1,a0
	mul a0,a2,a0
	sub a1,a3,a0
	li a0,0
	slt a0,a1,a0
	xori a0,a0,1
	bnez a0,LBB89
	j LBB90
LBB89:
	lui a0,%hi(seed)
	sw a1,%lo(seed)(a0)
	j LBB91
LBB90:
	lui a0,%hi(M)
	lw a0,%lo(M)(a0)
	add a1,a1,a0
	lui a0,%hi(seed)
	sw a1,%lo(seed)(a0)
LBB91:
	lui a0,%hi(seed)
	lw a0,%lo(seed)(a0)
LBB92:
LBB93:
	li a1,10
	rem a0,a0,a1
	addi a1,a0,1
	lui a0,%hi(now)
	sw a1,%lo(now)(a0)
	lui a0,%hi(now)
	lw a0,%lo(now)(a0)
	call toString
	call println
	li a0,0
	li a1,0
LBB94:
	lui a2,%hi(now)
	lw a2,%lo(now)(a2)
	addi a2,a2,-1
	slt a2,a1,a2
	bnez a2,LBB95
	j LBB112
LBB95:
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a1,2
	add a3,a3,a2
LBB96:
	lui a2,%hi(A)
	lw a5,%lo(A)(a2)
	lui a2,%hi(seed)
	lw a4,%lo(seed)(a2)
	lui a2,%hi(Q)
	lw a2,%lo(Q)(a2)
	rem a2,a4,a2
	mul a6,a5,a2
	lui a2,%hi(R)
	lw a5,%lo(R)(a2)
	lui a2,%hi(seed)
	lw a4,%lo(seed)(a2)
	lui a2,%hi(Q)
	lw a2,%lo(Q)(a2)
	div a2,a4,a2
	mul a2,a5,a2
	sub a4,a6,a2
	li a2,0
	slt a2,a4,a2
	xori a2,a2,1
	bnez a2,LBB97
	j LBB98
LBB97:
	lui a2,%hi(seed)
	sw a4,%lo(seed)(a2)
	j LBB99
LBB98:
	lui a2,%hi(M)
	lw a2,%lo(M)(a2)
	add a4,a4,a2
	lui a2,%hi(seed)
	sw a4,%lo(seed)(a2)
LBB99:
	lui a2,%hi(seed)
	lw a2,%lo(seed)(a2)
LBB100:
LBB101:
	li a4,10
	rem a2,a2,a4
	addi a2,a2,1
	sw a2,0(a3)
LBB102:
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a1,2
	add a2,a3,a2
	lw a2,0(a2)
	add a3,a2,a0
	lui a2,%hi(n)
	lw a2,%lo(n)(a2)
	slt a2,a2,a3
	bnez a2,LBB103
	j LBB110
LBB103:
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a1,2
	add a3,a3,a2
LBB104:
	lui a2,%hi(A)
	lw a5,%lo(A)(a2)
	lui a2,%hi(seed)
	lw a4,%lo(seed)(a2)
	lui a2,%hi(Q)
	lw a2,%lo(Q)(a2)
	rem a2,a4,a2
	mul a6,a5,a2
	lui a2,%hi(R)
	lw a5,%lo(R)(a2)
	lui a2,%hi(seed)
	lw a4,%lo(seed)(a2)
	lui a2,%hi(Q)
	lw a2,%lo(Q)(a2)
	div a2,a4,a2
	mul a2,a5,a2
	sub a4,a6,a2
	li a2,0
	slt a2,a4,a2
	xori a2,a2,1
	bnez a2,LBB105
	j LBB106
LBB105:
	lui a2,%hi(seed)
	sw a4,%lo(seed)(a2)
	j LBB107
LBB106:
	lui a2,%hi(M)
	lw a2,%lo(M)(a2)
	add a4,a4,a2
	lui a2,%hi(seed)
	sw a4,%lo(seed)(a2)
LBB107:
	lui a2,%hi(seed)
	lw a2,%lo(seed)(a2)
LBB108:
LBB109:
	li a4,10
	rem a2,a2,a4
	addi a2,a2,1
	sw a2,0(a3)
	j LBB102
LBB110:
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a1,2
	add a2,a3,a2
	lw a2,0(a2)
	add a0,a0,a2
LBB111:
	addi a1,a1,1
	j LBB94
LBB112:
	lui a1,%hi(a)
	lw a2,%lo(a)(a1)
	lui a1,%hi(now)
	lw a1,%lo(now)(a1)
	addi a1,a1,-1
	slli a1,a1,2
	add a2,a2,a1
	lui a1,%hi(n)
	lw a1,%lo(n)(a1)
	sub a0,a1,a0
	sw a0,0(a2)
	call show
LBB113:
	li a0,0
LBB114:
	lui a1,%hi(now)
	lw a1,%lo(now)(a1)
	slt a1,a0,a1
	bnez a1,LBB115
	j LBB128
LBB115:
	lui a1,%hi(a)
	lw a2,%lo(a)(a1)
	slli a1,a0,2
	add a1,a2,a1
	lw a2,0(a1)
	li a1,0
	xor a1,a2,a1
	seqz a1,a1
	bnez a1,LBB116
	j LBB126
LBB116:
	addi a1,a0,1
LBB117:
	lui a2,%hi(now)
	lw a2,%lo(now)(a2)
	slt a2,a1,a2
	bnez a2,LBB118
	j LBB125
LBB118:
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a1,2
	add a2,a3,a2
	lw a3,0(a2)
	li a2,0
	xor a2,a3,a2
	snez a2,a2
	bnez a2,LBB119
	j LBB123
LBB119:
LBB120:
	mv a2,a0
	lui a3,%hi(a)
	lw a4,%lo(a)(a3)
	slli a3,a2,2
	add a3,a4,a3
	lw a5,0(a3)
	lui a3,%hi(a)
	lw a3,%lo(a)(a3)
	slli a2,a2,2
	add a4,a3,a2
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a1,2
	add a2,a3,a2
	lw a2,0(a2)
	sw a2,0(a4)
	lui a2,%hi(a)
	lw a2,%lo(a)(a2)
	slli a1,a1,2
	add a1,a2,a1
	sw a5,0(a1)
LBB121:
LBB122:
	j LBB125
LBB123:
LBB124:
	addi a1,a1,1
	j LBB117
LBB125:
LBB126:
LBB127:
	addi a0,a0,1
	j LBB114
LBB128:
	li a0,0
LBB129:
	lui a1,%hi(now)
	lw a1,%lo(now)(a1)
	slt a1,a0,a1
	bnez a1,LBB130
	j LBB134
LBB130:
	lui a1,%hi(a)
	lw a2,%lo(a)(a1)
	slli a1,a0,2
	add a1,a2,a1
	lw a2,0(a1)
	li a1,0
	xor a1,a2,a1
	seqz a1,a1
	bnez a1,LBB131
	j LBB132
LBB131:
	lui a1,%hi(now)
	sw a0,%lo(now)(a1)
	j LBB134
LBB132:
LBB133:
	addi a0,a0,1
	j LBB129
LBB134:
LBB135:
LBB136:
	li s1,0
LBB137:
	call win
	li a1,1
	xor a0,a1,a0
	bnez a0,LBB138
	j LBB169
LBB138:
	la s2,const_string_no4
	addi s1,s1,1
	mv a0,s1
	call toString
	mv a1,a0
	mv a0,s2
	call __string_add
	la a1,const_string_no5
	call __string_add
	call println
LBB139:
	li a0,0
LBB140:
	lui a1,%hi(now)
	lw a1,%lo(now)(a1)
	slt a1,a0,a1
	bnez a1,LBB141
	j LBB142
LBB141:
	lui a1,%hi(a)
	lw a2,%lo(a)(a1)
	slli a1,a0,2
	add a2,a2,a1
	lw a1,0(a2)
	addi a1,a1,-1
	sw a1,0(a2)
	addi a0,a0,1
	j LBB140
LBB142:
	lui a0,%hi(a)
	lw a1,%lo(a)(a0)
	lui a0,%hi(now)
	lw a0,%lo(now)(a0)
	slli a0,a0,2
	add a1,a1,a0
	lui a0,%hi(now)
	lw a0,%lo(now)(a0)
	sw a0,0(a1)
	lui a0,%hi(now)
	lw a0,%lo(now)(a0)
	addi a1,a0,1
	lui a0,%hi(now)
	sw a1,%lo(now)(a0)
LBB143:
LBB144:
LBB145:
	li a0,0
LBB146:
	lui a1,%hi(now)
	lw a1,%lo(now)(a1)
	slt a1,a0,a1
	bnez a1,LBB147
	j LBB160
LBB147:
	lui a1,%hi(a)
	lw a2,%lo(a)(a1)
	slli a1,a0,2
	add a1,a2,a1
	lw a2,0(a1)
	li a1,0
	xor a1,a2,a1
	seqz a1,a1
	bnez a1,LBB148
	j LBB158
LBB148:
	addi a1,a0,1
LBB149:
	lui a2,%hi(now)
	lw a2,%lo(now)(a2)
	slt a2,a1,a2
	bnez a2,LBB150
	j LBB157
LBB150:
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a1,2
	add a2,a3,a2
	lw a3,0(a2)
	li a2,0
	xor a2,a3,a2
	snez a2,a2
	bnez a2,LBB151
	j LBB155
LBB151:
LBB152:
	mv a2,a0
	lui a3,%hi(a)
	lw a4,%lo(a)(a3)
	slli a3,a2,2
	add a3,a4,a3
	lw a5,0(a3)
	lui a3,%hi(a)
	lw a3,%lo(a)(a3)
	slli a2,a2,2
	add a4,a3,a2
	lui a2,%hi(a)
	lw a3,%lo(a)(a2)
	slli a2,a1,2
	add a2,a3,a2
	lw a2,0(a2)
	sw a2,0(a4)
	lui a2,%hi(a)
	lw a2,%lo(a)(a2)
	slli a1,a1,2
	add a1,a2,a1
	sw a5,0(a1)
LBB153:
LBB154:
	j LBB157
LBB155:
LBB156:
	addi a1,a1,1
	j LBB149
LBB157:
LBB158:
LBB159:
	addi a0,a0,1
	j LBB146
LBB160:
	li a0,0
LBB161:
	lui a1,%hi(now)
	lw a1,%lo(now)(a1)
	slt a1,a0,a1
	bnez a1,LBB162
	j LBB166
LBB162:
	lui a1,%hi(a)
	lw a2,%lo(a)(a1)
	slli a1,a0,2
	add a1,a2,a1
	lw a2,0(a1)
	li a1,0
	xor a1,a2,a1
	seqz a1,a1
	bnez a1,LBB163
	j LBB164
LBB163:
	lui a1,%hi(now)
	sw a0,%lo(now)(a1)
	j LBB166
LBB164:
LBB165:
	addi a0,a0,1
	j LBB161
LBB166:
LBB167:
LBB168:
	call show
	j LBB137
LBB169:
	la s2,const_string_no6
	mv a0,s1
	call toString
	mv a1,a0
	mv a0,s2
	call __string_add
	la a1,const_string_no7
	call __string_add
	call println
	li a0,0
LBB170:
	addi sp,sp,88
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
n:
	.word	0

	.p2align	2
h:
	.word	0

	.p2align	2
now:
	.word	0

	.p2align	2
a:
	.word	0

	.p2align	2
A:
	.word	48271

	.p2align	2
M:
	.word	2147483647

	.p2align	2
Q:
	.word	0

	.p2align	2
R:
	.word	0

	.p2align	2
seed:
	.word	1

const_string_no0:
	.asciz	" "

const_string_no1:
	.asciz	""

const_string_no2:
	.asciz	"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i"

const_string_no3:
	.asciz	"Let's start!"

const_string_no4:
	.asciz	"step "

const_string_no5:
	.asciz	":"

const_string_no6:
	.asciz	"Total: "

const_string_no7:
	.asciz	" step(s)"

