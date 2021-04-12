	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	j LBB25
LBB25:
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	vector.init					# start function : vector.init
	.p2align	2
vector.init:
#LBB44:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	mv s2,a0
	mv s3,a1
	li a0,0
	xor a0,s3,a0
	seqz a0,a0
	bnez a0,LBB45
	j LBB46
LBB45:
	li a0,0
	j LBB53
LBB46:
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
	j LBB47
LBB47:
	addi a1,s3,-4
	lw a1,0(a1)
	slt a1,a0,a1
	bnez a1,LBB49
	j LBB48
LBB48:
	j LBB52
LBB49:
	j LBB50
LBB50:
	addi a1,s2,0
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	slli a1,a0,2
	add a1,s3,a1
	lw a1,0(a1)
	sw a1,0(a2)
	j LBB51
LBB51:
	addi a0,a0,1
	j LBB47
LBB52:
	j LBB53
LBB53:
	mv a0,s1
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : vector.init
	.globl	vector.getDim					# start function : vector.getDim
	.p2align	2
vector.getDim:
#LBB54:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	addi a1,a0,0
	lw a2,0(a1)
	li a1,0
	xor a1,a2,a1
	seqz a1,a1
	bnez a1,LBB55
	j LBB56
LBB55:
	li a0,0
	j LBB57
LBB56:
	addi a0,a0,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
	j LBB57
LBB57:
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : vector.getDim
	.globl	vector.dot					# start function : vector.dot
	.p2align	2
vector.dot:
#LBB58:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	mv s3,a0
	mv s4,a1
	li s1,0
	li s2,0
	j LBB59
LBB59:
	mv a0,s3
	call vector.getDim
	slt a0,s2,a0
	bnez a0,LBB61
	j LBB60
LBB60:
	j LBB63
LBB61:
	j LBB62
LBB62:
	addi a0,s3,0
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a2,0(a0)
	addi a0,s4,0
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a0,0(a0)
	mul s1,a2,a0
	addi s2,s2,1
	j LBB59
LBB63:
	mv a0,s1
	j LBB64
LBB64:
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : vector.dot
	.globl	vector.scalarInPlaceMultiply					# start function : vector.scalarInPlaceMultiply
	.p2align	2
vector.scalarInPlaceMultiply:
#LBB65:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	mv s1,a0
	mv s3,a1
	addi a0,s1,0
	lw a1,0(a0)
	li a0,0
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB66
	j LBB67
LBB66:
	li s1,0
	li s2,0
	j LBB74
LBB67:
	li s2,0
	j LBB68
LBB68:
	mv a0,s1
	call vector.getDim
	slt a0,s2,a0
	bnez a0,LBB70
	j LBB69
LBB69:
	j LBB73
LBB70:
	j LBB71
LBB71:
	addi a0,s1,0
	lw a1,0(a0)
	slli a0,s2,2
	add a2,a1,a0
	addi a0,s1,0
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a0,0(a0)
	mul a0,s3,a0
	sw a0,0(a2)
	j LBB72
LBB72:
	addi s2,s2,1
	j LBB68
LBB73:
	j LBB74
LBB74:
	mv a0,s1
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : vector.scalarInPlaceMultiply
	.globl	vector.add					# start function : vector.add
	.p2align	2
vector.add:
#LBB75:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	mv s3,a0
	mv s4,a1
	mv a0,s3
	call vector.getDim
	mv s1,a0
	mv a0,s4
	call vector.getDim
	xor a0,s1,a0
	snez s1,a0
	li a0,0
	xor a0,s1,a0
	seqz a0,a0
	bnez a0,LBB76
	j LBB77
LBB76:
	mv a0,s3
	call vector.getDim
	li a1,0
	xor a0,a0,a1
	seqz s2,a0
	j LBB77
LBB77:
	or a0,s1,s2
	bnez a0,LBB78
	j LBB79
LBB78:
	li a0,0
	li s2,0
	li s1,0
	j LBB86
LBB79:
	li a0,4
	call malloc
	addi s1,a0,0
	addi s5,s1,0
	mv a0,s3
	call vector.getDim
	mv s2,a0
	li a0,4
	mul a0,s2,a0
	addi a0,a0,4
	call malloc
	sw s2,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s5)
	li s2,0
	j LBB80
LBB80:
	mv a0,s3
	call vector.getDim
	slt a0,s2,a0
	bnez a0,LBB82
	j LBB81
LBB81:
	j LBB85
LBB82:
	j LBB83
LBB83:
	addi a0,s1,0
	lw a1,0(a0)
	slli a0,s2,2
	add a3,a1,a0
	addi a0,s3,0
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a2,0(a0)
	addi a0,s4,0
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a0,0(a0)
	add a0,a2,a0
	sw a0,0(a3)
	j LBB84
LBB84:
	addi s2,s2,1
	j LBB80
LBB85:
	mv a0,s1
	j LBB86
LBB86:
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : vector.add
	.globl	vector.set					# start function : vector.set
	.p2align	2
vector.set:
#LBB87:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	mv s1,a0
	mv s2,a1
	mv s3,a2
	mv a0,s1
	call vector.getDim
	slt a0,a0,s2
	bnez a0,LBB88
	j LBB89
LBB88:
	li a0,0
	j LBB90
LBB89:
	addi a0,s1,0
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	sw s3,0(a0)
	li a0,1
	j LBB90
LBB90:
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : vector.set
	.globl	vector.tostring					# start function : vector.tostring
	.p2align	2
vector.tostring:
#LBB91:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	mv s3,a0
	la s1,const_string_no0
	mv a0,s3
	call vector.getDim
	li a1,0
	slt a0,a1,a0
	bnez a0,LBB93
	j LBB92
LBB92:
	j LBB95
LBB93:
	j LBB94
LBB94:
	addi a0,s3,0
	lw a0,0(a0)
	addi a0,a0,0
	lw a0,0(a0)
	call toString
	mv a1,a0
	mv a0,s1
	call __string_add
	mv s1,a0
	j LBB95
LBB95:
	li s2,1
	j LBB96
LBB96:
	mv a0,s3
	call vector.getDim
	slt a0,s2,a0
	bnez a0,LBB98
	j LBB97
LBB97:
	j LBB101
LBB98:
	j LBB99
LBB99:
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
	j LBB100
LBB100:
	addi s2,s2,1
	mv s1,a0
	j LBB96
LBB101:
	la a1,const_string_no2
	mv a0,s1
	call __string_add
	mv a1,a0
	j LBB102
LBB102:
	mv a0,a1
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : vector.tostring
	.globl	vector.copy					# start function : vector.copy
	.p2align	2
vector.copy:
#LBB103:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	mv s2,a0
	mv s3,a1
	li a0,0
	xor a0,s3,a0
	seqz a0,a0
	bnez a0,LBB104
	j LBB105
LBB104:
	li a0,0
	li s1,0
	j LBB115
LBB105:
	mv a0,s3
	call vector.getDim
	li a1,0
	xor a0,a0,a1
	seqz a0,a0
	bnez a0,LBB106
	j LBB107
LBB106:
	addi a1,s2,0
	li a0,0
	sw a0,0(a1)
	li s1,0
	j LBB114
LBB107:
	addi s4,s2,0
	mv a0,s3
	call vector.getDim
	mv s1,a0
	li a0,4
	mul a0,s1,a0
	addi a0,a0,4
	call malloc
	sw s1,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s4)
	li s1,0
	j LBB108
LBB108:
	mv a0,s2
	call vector.getDim
	slt a0,s1,a0
	bnez a0,LBB110
	j LBB109
LBB109:
	j LBB113
LBB110:
	j LBB111
LBB111:
	addi a0,s2,0
	lw a1,0(a0)
	slli a0,s1,2
	add a2,a1,a0
	addi a0,s3,0
	lw a1,0(a0)
	slli a0,s1,2
	add a0,a1,a0
	lw a0,0(a0)
	sw a0,0(a2)
	j LBB112
LBB112:
	addi s1,s1,1
	j LBB108
LBB113:
	j LBB114
LBB114:
	li a0,1
	j LBB115
LBB115:
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : vector.copy
	.globl	main					# start function : main
	.p2align	2
main:
#LBB116:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	call __init__
	li a0,4
	call malloc
	addi s2,a0,0
	li a1,10
	li a0,4
	mul a0,a1,a0
	addi a0,a0,4
	call malloc
	li a1,10
	sw a1,0(a0)
	addi a0,a0,4
	addi s4,a0,0
	li s3,0
	j LBB117
LBB117:
	li a0,10
	slt a0,s3,a0
	bnez a0,LBB119
	j LBB118
LBB118:
	j LBB122
LBB119:
	j LBB120
LBB120:
	slli a0,s3,2
	add a1,s4,a0
	li a0,9
	sub a0,a0,s3
	sw a0,0(a1)
	j LBB121
LBB121:
	addi s3,s3,1
	j LBB117
LBB122:
	mv a0,s2
	mv a1,s4
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
	mv a0,s1
	li a1,3
	li a2,817
	call vector.set
	bnez a0,LBB124
	j LBB123
LBB123:
	j LBB126
LBB124:
	j LBB125
LBB125:
	la a0,const_string_no4
	call println
	j LBB126
LBB126:
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
	mv a0,s2
	mv a1,s1
	call vector.dot
	call toString
	call println
	la a0,const_string_no8
	call print
	li a0,1
	slli a1,a0,3
	mv a0,s1
	call vector.scalarInPlaceMultiply
	call vector.tostring
	call println
	li a0,0
	j LBB127
LBB127:
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
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

