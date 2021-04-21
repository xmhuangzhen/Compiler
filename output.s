	.text
	.globl	vector.init					# start function : vector.init
	.p2align	2
vector.init:
#LBB42:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s2,a0
	mv s3,a1
	li a0,0
	xor a0,s3,a0
	seqz a0,a0
	bnez a0,LBB43
	j LBB44
LBB43:
	j LBB48
LBB44:
	addi s4,s2,0
	addi a0,s3,-4
	lw s5,0(a0)
	li a0,4
	mul a0,s5,a0
	addi a0,a0,4
	call malloc
	sw s5,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s4)
	li a0,0
LBB45:
	addi a1,s3,-4
	lw a1,0(a1)
	slt a1,a0,a1
	bnez a1,LBB46
	j LBB47
LBB46:
	addi a1,s2,0
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	slli a1,a0,2
	add a1,s3,a1
	lw a1,0(a1)
	sw a1,0(a2)
	addi a0,a0,1
	j LBB45
LBB47:
LBB48:
	mv a0,s1
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : vector.init
	.globl	vector.add					# start function : vector.add
	.p2align	2
vector.add:
#LBB49:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s2,a0
	mv s3,a1
LBB50:
	addi a0,s2,0
	lw a1,0(a0)
	li a0,0
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB51
	j LBB52
LBB51:
	li a1,0
	j LBB53
LBB52:
	addi a0,s2,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a1,0(a0)
LBB53:
	addi a0,s3,0
	lw a3,0(a0)
	li a0,0
	xor a0,a3,a0
	seqz a0,a0
	bnez a0,LBB54
	j LBB55
LBB54:
	li a0,0
	j LBB56
LBB55:
	addi a0,s3,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
LBB56:
	xor a0,a1,a0
	snez a3,a0
	bnez a3,LBB61
	j LBB57
LBB57:
	addi a0,s2,0
	lw a1,0(a0)
	li a0,0
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB58
	j LBB59
LBB58:
	li a0,0
	j LBB60
LBB59:
	addi a0,s2,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
LBB60:
	li a1,0
	xor a0,a0,a1
	seqz a2,a0
LBB61:
	or a0,a3,a2
	bnez a0,LBB62
	j LBB63
LBB62:
	li s1,0
	j LBB73
LBB63:
	li a0,4
	call malloc
	addi s1,a0,0
	addi s5,s1,0
	addi a0,s2,0
	lw a1,0(a0)
	li a0,0
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB64
	j LBB65
LBB64:
	li s4,0
	j LBB66
LBB65:
	addi a0,s2,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw s4,0(a0)
LBB66:
	li a0,4
	mul a0,s4,a0
	addi a0,a0,4
	call malloc
	sw s4,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s5)
	li a0,0
LBB67:
	addi a1,s2,0
	lw a2,0(a1)
	li a1,0
	xor a1,a2,a1
	seqz a1,a1
	bnez a1,LBB68
	j LBB69
LBB68:
	li a1,0
	j LBB70
LBB69:
	addi a1,s2,0
	lw a1,0(a1)
	addi a1,a1,-4
	lw a1,0(a1)
LBB70:
	slt a1,a0,a1
	bnez a1,LBB71
	j LBB72
LBB71:
	addi a1,s1,0
	lw a2,0(a1)
	slli a1,a0,2
	add a4,a2,a1
	addi a1,s2,0
	lw a2,0(a1)
	slli a1,a0,2
	add a1,a2,a1
	lw a3,0(a1)
	addi a1,s3,0
	lw a2,0(a1)
	slli a1,a0,2
	add a1,a2,a1
	lw a1,0(a1)
	add a1,a3,a1
	sw a1,0(a4)
	addi a0,a0,1
	j LBB67
LBB72:
LBB73:
	mv a0,s1
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : vector.add
	.globl	vector.tostring					# start function : vector.tostring
	.p2align	2
vector.tostring:
#LBB74:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-88
	mv s3,a0
	la s1,const_string_no0
LBB75:
	addi a0,s3,0
	lw a1,0(a0)
	li a0,0
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB76
	j LBB77
LBB76:
	li a0,0
	j LBB78
LBB77:
	addi a0,s3,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
LBB78:
	li a1,0
	slt a0,a1,a0
	bnez a0,LBB80
	j LBB79
LBB79:
	j LBB81
LBB80:
	addi a0,s3,0
	lw a0,0(a0)
	addi a0,a0,0
	lw a0,0(a0)
	call toString
	mv a1,a0
	mv a0,s1
	call __string_add
	mv s1,a0
LBB81:
	li s2,1
LBB82:
	addi a0,s3,0
	lw a1,0(a0)
	li a0,0
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB83
	j LBB84
LBB83:
	li a0,0
	j LBB85
LBB84:
	addi a0,s3,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
LBB85:
	slt a0,s2,a0
	bnez a0,LBB86
	j LBB87
LBB86:
	la a1,const_string_no1
	mv a0,s1
	call __string_add
	mv s1,a0
	addi a0,s3,0
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a0,0(a0)
	call toString
	mv a1,a0
	mv a0,s1
	call __string_add
	mv s1,a0
	addi s2,s2,1
	j LBB82
LBB87:
	la a1,const_string_no2
	mv a0,s1
	call __string_add
LBB88:
	addi sp,sp,88
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : vector.tostring
	.globl	vector.copy					# start function : vector.copy
	.p2align	2
vector.copy:
#LBB89:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s1,a0
	mv s3,a1
	li a0,0
	xor a0,s3,a0
	seqz a0,a0
	bnez a0,LBB90
	j LBB91
LBB90:
	li a0,0
	j LBB107
LBB91:
	addi a0,s3,0
	lw a1,0(a0)
	li a0,0
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB92
	j LBB93
LBB92:
	li a0,0
	j LBB94
LBB93:
	addi a0,s3,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
LBB94:
	li a1,0
	xor a0,a0,a1
	seqz a0,a0
	bnez a0,LBB95
	j LBB96
LBB95:
	addi a1,s1,0
	li a0,0
	sw a0,0(a1)
	j LBB106
LBB96:
	addi s4,s1,0
	addi a0,s3,0
	lw a1,0(a0)
	li a0,0
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB97
	j LBB98
LBB97:
	li s2,0
	j LBB99
LBB98:
	addi a0,s3,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw s2,0(a0)
LBB99:
	li a0,4
	mul a0,s2,a0
	addi a0,a0,4
	call malloc
	sw s2,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s4)
	li a0,0
LBB100:
	addi a1,s1,0
	lw a2,0(a1)
	li a1,0
	xor a1,a2,a1
	seqz a1,a1
	bnez a1,LBB101
	j LBB102
LBB101:
	li a1,0
	j LBB103
LBB102:
	addi a1,s1,0
	lw a1,0(a1)
	addi a1,a1,-4
	lw a1,0(a1)
LBB103:
	slt a1,a0,a1
	bnez a1,LBB104
	j LBB105
LBB104:
	addi a1,s1,0
	lw a2,0(a1)
	slli a1,a0,2
	add a3,a2,a1
	addi a1,s3,0
	lw a2,0(a1)
	slli a1,a0,2
	add a1,a2,a1
	lw a1,0(a1)
	sw a1,0(a3)
	addi a0,a0,1
	j LBB100
LBB105:
LBB106:
	li a0,1
LBB107:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : vector.copy
	.globl	main					# start function : main
	.p2align	2
main:
#LBB108:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-88
LBB109:
	li a0,4
	call malloc
	addi s2,a0,0
	li a0,44
	call malloc
	li a1,10
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	li a0,0
LBB110:
	li a2,10
	slt a2,a0,a2
	bnez a2,LBB111
	j LBB112
LBB111:
	slli a2,a0,2
	add a3,a1,a2
	li a2,9
	sub a2,a2,a0
	sw a2,0(a3)
	addi a0,a0,1
	j LBB110
LBB112:
	mv a0,s2
	call vector.init
	la a0,const_string_no3
	call print
	mv a0,s2
	call vector.tostring
	call println
	li a0,4
	call malloc
	addi s1,a0,0
	mv a0,s1
	mv a1,s2
	call vector.copy
	mv a1,s1
	li a2,3
	li a3,817
	addi a0,a1,0
	lw a4,0(a0)
	li a0,0
	xor a0,a4,a0
	seqz a0,a0
	bnez a0,LBB113
	j LBB114
LBB113:
	li a0,0
	j LBB115
LBB114:
	addi a0,a1,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
LBB115:
	slt a0,a0,a2
	bnez a0,LBB116
	j LBB117
LBB116:
	li a0,0
	j LBB118
LBB117:
	addi a0,a1,0
	lw a1,0(a0)
	slli a0,a2,2
	add a0,a1,a0
	sw a3,0(a0)
	li a0,1
LBB118:
	bnez a0,LBB119
	j LBB120
LBB119:
	la a0,const_string_no4
	call println
LBB120:
	la a0,const_string_no5
	call print
	mv a0,s1
	call vector.tostring
	call println
	la a0,const_string_no6
	call print
	mv a0,s2
	mv a1,s1
	call vector.add
	call vector.tostring
	call println
	la a0,const_string_no7
	call print
	li a1,0
	li a0,0
LBB121:
	addi a2,s2,0
	lw a3,0(a2)
	li a2,0
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB122
	j LBB123
LBB122:
	li a2,0
	j LBB124
LBB123:
	addi a2,s2,0
	lw a2,0(a2)
	addi a2,a2,-4
	lw a2,0(a2)
LBB124:
	slt a2,a1,a2
	bnez a2,LBB125
	j LBB126
LBB125:
	addi a0,s2,0
	lw a2,0(a0)
	slli a0,a1,2
	add a0,a2,a0
	lw a3,0(a0)
	addi a0,s1,0
	lw a2,0(a0)
	slli a0,a1,2
	add a0,a2,a0
	lw a0,0(a0)
	mul a0,a3,a0
	addi a1,a1,1
	j LBB121
LBB126:
	call toString
	call println
	la a0,const_string_no8
	call print
	li a2,8
	addi a0,s1,0
	lw a1,0(a0)
	li a0,0
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB127
	j LBB128
LBB127:
	li s1,0
	j LBB135
LBB128:
	li a0,0
LBB129:
	addi a1,s1,0
	lw a3,0(a1)
	li a1,0
	xor a1,a3,a1
	seqz a1,a1
	bnez a1,LBB130
	j LBB131
LBB130:
	li a1,0
	j LBB132
LBB131:
	addi a1,s1,0
	lw a1,0(a1)
	addi a1,a1,-4
	lw a1,0(a1)
LBB132:
	slt a1,a0,a1
	bnez a1,LBB133
	j LBB134
LBB133:
	addi a1,s1,0
	lw a3,0(a1)
	slli a1,a0,2
	add a4,a3,a1
	addi a1,s1,0
	lw a3,0(a1)
	slli a1,a0,2
	add a1,a3,a1
	lw a1,0(a1)
	mul a1,a2,a1
	sw a1,0(a4)
	addi a0,a0,1
	j LBB129
LBB134:
LBB135:
	mv a0,s1
	call vector.tostring
	call println
	li a0,0
LBB136:
	addi sp,sp,88
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	"( "

const_string_no1:
	.asciz	", "

const_string_no2:
	.asciz	" )"

const_string_no3:
	.asciz	"vector x: "

const_string_no4:
	.asciz	"excited!"

const_string_no5:
	.asciz	"vector y: "

const_string_no6:
	.asciz	"x + y: "

const_string_no7:
	.asciz	"x * y: "

const_string_no8:
	.asciz	"(1 << 3) * y: "

