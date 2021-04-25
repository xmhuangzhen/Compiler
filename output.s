	.text
	.globl	tak					# start function : tak
	.p2align	2
tak:
#LBB0:
	sw ra,-4(sp)
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
	addi sp,sp,-140
	sw a0,-88(s0)
	mv s2,a1
	mv s4,a2
	lw a0,-88(s0)
	blt s2,a0,LBB1
	j LBB2
LBB1:
	lw a0,-88(s0)
	addi a0,a0,-1
	mv s11,a0
	blt s2,s11,LBB3
	j LBB4
LBB3:
	addi a0,s11,-1
	mv s5,a0
	mv s3,s2
	mv s7,s4
	blt s3,s5,LBB5
	j LBB6
LBB5:
	addi a0,s5,-1
	mv s9,a0
	mv s1,s7
	blt s3,s9,LBB7
	j LBB8
LBB7:
	addi a0,s9,-1
	mv a1,s3
	mv a2,s1
	call tak
	mv s8,a0
	addi a0,s3,-1
	mv a1,s1
	mv a2,s9
	call tak
	mv s6,a0
	addi a0,s1,-1
	mv a1,s9
	mv a2,s3
	call tak
	mv a2,a0
	mv a0,s8
	mv a1,s6
	call tak
	li a1,1
	add a0,a1,a0
	j LBB9
LBB8:
	mv a0,s1
LBB9:
	sw a0,-104(s0)
	addi a0,s3,-1
	mv s8,a0
	mv s9,s7
	mv s1,s5
	blt s9,s8,LBB10
	j LBB11
LBB10:
	addi a0,s8,-1
	mv s6,a0
	blt s9,s6,LBB12
	j LBB13
LBB12:
	addi a0,s6,-1
	mv a1,s9
	mv a2,s1
	call tak
	sw a0,-68(s0)
	addi a0,s9,-1
	mv a1,s1
	mv a2,s6
	call tak
	mv s10,a0
	addi a0,s1,-1
	mv a1,s6
	mv a2,s9
	call tak
	mv a2,a0
	lw a0,-68(s0)
	mv a1,s10
	call tak
	li a1,1
	add a0,a1,a0
	j LBB14
LBB13:
	mv a0,s1
LBB14:
	mv s10,a0
	addi a0,s9,-1
	mv a1,s1
	mv a2,s8
	call tak
	mv s6,a0
	addi a0,s1,-1
	mv a1,s8
	mv a2,s9
	call tak
	mv a2,a0
	mv a0,s10
	mv a1,s6
	call tak
	li a1,1
	add a0,a1,a0
	j LBB15
LBB11:
	mv a0,s1
LBB15:
	sw a0,-96(s0)
	addi a0,s7,-1
	mv s1,a0
	mv s6,s5
	mv s5,s3
	blt s6,s1,LBB16
	j LBB17
LBB16:
	addi a0,s1,-1
	mv s9,a0
	mv s3,s5
	blt s6,s9,LBB18
	j LBB19
LBB18:
	addi a0,s9,-1
	mv a1,s6
	mv a2,s3
	call tak
	mv s7,a0
	addi a0,s6,-1
	mv a1,s3
	mv a2,s9
	call tak
	mv s8,a0
	addi a0,s3,-1
	mv a1,s9
	mv a2,s6
	call tak
	mv a2,a0
	mv a0,s7
	mv a1,s8
	call tak
	li a1,1
	add a0,a1,a0
	j LBB20
LBB19:
	mv a0,s3
LBB20:
	sw a0,-84(s0)
	addi a0,s6,-1
	mv s8,a0
	mv s9,s5
	blt s9,s8,LBB21
	j LBB22
LBB21:
	addi a0,s8,-1
	mv s7,a0
	mv s3,s1
	blt s9,s7,LBB23
	j LBB24
LBB23:
	addi a0,s7,-1
	mv a1,s9
	mv a2,s3
	call tak
	sw a0,-64(s0)
	addi a0,s9,-1
	mv a1,s3
	mv a2,s7
	call tak
	mv s10,a0
	addi a0,s3,-1
	mv a1,s7
	mv a2,s9
	call tak
	mv a2,a0
	lw a0,-64(s0)
	mv a1,s10
	call tak
	li a1,1
	add a0,a1,a0
	j LBB25
LBB24:
	mv a0,s3
LBB25:
	mv s7,a0
	addi a0,s9,-1
	mv a1,s1
	mv a2,s8
	call tak
	mv s3,a0
	addi a0,s1,-1
	mv a1,s8
	mv a2,s9
	call tak
	mv a2,a0
	mv a0,s7
	mv a1,s3
	call tak
	li a1,1
	add s3,a1,a0
	j LBB26
LBB22:
	mv s3,s1
LBB26:
	addi a0,s5,-1
	mv a1,s1
	mv a2,s6
	call tak
	mv a2,a0
	lw a0,-84(s0)
	mv a1,s3
	call tak
	li a1,1
	add a0,a1,a0
	j LBB27
LBB17:
	mv a0,s5
LBB27:
	lw s3,-104(s0)
	lw s1,-96(s0)
	mv s5,a0
	blt s1,s3,LBB28
	j LBB29
LBB28:
	addi a0,s3,-1
	mv s7,a0
	blt s1,s7,LBB30
	j LBB31
LBB30:
	addi a0,s7,-1
	mv a1,s1
	mv a2,s5
	call tak
	mv s8,a0
	addi a0,s1,-1
	mv a1,s5
	mv a2,s7
	call tak
	mv s6,a0
	addi a0,s5,-1
	mv a1,s7
	mv a2,s1
	call tak
	mv a2,a0
	mv a0,s8
	mv a1,s6
	call tak
	li a1,1
	add a0,a1,a0
	j LBB32
LBB31:
	mv a0,s5
LBB32:
	sw a0,-100(s0)
	addi a0,s1,-1
	mv s8,a0
	mv s6,s5
	mv s9,s3
	blt s6,s8,LBB33
	j LBB34
LBB33:
	addi a0,s8,-1
	mv s7,a0
	blt s6,s7,LBB35
	j LBB36
LBB35:
	addi a0,s7,-1
	mv a1,s6
	mv a2,s9
	call tak
	sw a0,-60(s0)
	addi a0,s6,-1
	mv a1,s9
	mv a2,s7
	call tak
	mv s10,a0
	addi a0,s9,-1
	mv a1,s7
	mv a2,s6
	call tak
	mv a2,a0
	lw a0,-60(s0)
	mv a1,s10
	call tak
	li a1,1
	add a0,a1,a0
	j LBB37
LBB36:
	mv a0,s9
LBB37:
	mv s10,a0
	addi a0,s6,-1
	mv a1,s9
	mv a2,s8
	call tak
	mv s7,a0
	addi a0,s9,-1
	mv a1,s8
	mv a2,s6
	call tak
	mv a2,a0
	mv a0,s10
	mv a1,s7
	call tak
	li a1,1
	add a0,a1,a0
	j LBB38
LBB34:
	mv a0,s9
LBB38:
	sw a0,-92(s0)
	addi a0,s5,-1
	mv s9,a0
	mv s5,s3
	blt s5,s9,LBB39
	j LBB40
LBB39:
	addi a0,s9,-1
	mv s7,a0
	blt s5,s7,LBB41
	j LBB42
LBB41:
	addi a0,s7,-1
	mv a1,s5
	mv a2,s1
	call tak
	mv s3,a0
	addi a0,s5,-1
	mv a1,s1
	mv a2,s7
	call tak
	mv s6,a0
	addi a0,s1,-1
	mv a1,s7
	mv a2,s5
	call tak
	mv a2,a0
	mv a0,s3
	mv a1,s6
	call tak
	li a1,1
	add a0,a1,a0
	j LBB43
LBB42:
	mv a0,s1
LBB43:
	sw a0,-80(s0)
	addi a0,s5,-1
	mv s6,a0
	blt s1,s6,LBB44
	j LBB45
LBB44:
	addi a0,s6,-1
	mv s7,a0
	mv s3,s1
	mv s8,s9
	blt s3,s7,LBB46
	j LBB47
LBB46:
	addi a0,s7,-1
	mv a1,s3
	mv a2,s8
	call tak
	sw a0,-56(s0)
	addi a0,s3,-1
	mv a1,s8
	mv a2,s7
	call tak
	mv s10,a0
	addi a0,s8,-1
	mv a1,s7
	mv a2,s3
	call tak
	mv a2,a0
	lw a0,-56(s0)
	mv a1,s10
	call tak
	li a1,1
	add a0,a1,a0
	j LBB48
LBB47:
	mv a0,s8
LBB48:
	mv s7,a0
	addi a0,s1,-1
	mv a1,s9
	mv a2,s6
	call tak
	mv s3,a0
	addi a0,s9,-1
	mv a1,s6
	mv a2,s1
	call tak
	mv a2,a0
	mv a0,s7
	mv a1,s3
	call tak
	li a1,1
	add s3,a1,a0
	j LBB49
LBB45:
	mv s3,s9
LBB49:
	addi a0,s1,-1
	mv a1,s9
	mv a2,s5
	call tak
	mv a2,a0
	lw a0,-80(s0)
	mv a1,s3
	call tak
	li a1,1
	add a2,a1,a0
	j LBB50
LBB40:
	mv a2,s1
LBB50:
	lw a0,-100(s0)
	lw a1,-92(s0)
	call tak
	li a1,1
	add a0,a1,a0
	j LBB51
LBB29:
	mv a0,s5
LBB51:
	li a1,1
	add s1,a1,a0
	j LBB52
LBB6:
	mv s1,s7
LBB52:
	addi a0,s2,-1
	mv a1,s4
	mv a2,s11
	call tak
	mv s3,a0
	addi a0,s4,-1
	mv a1,s11
	mv a2,s2
	call tak
	mv a2,a0
	mv a0,s1
	mv a1,s3
	call tak
	li a1,1
	add a0,a1,a0
	j LBB53
LBB4:
	mv a0,s4
LBB53:
	sw a0,-76(s0)
	addi s6,s2,-1
	mv s3,s4
	lw s1,-88(s0)
	blt s3,s6,LBB54
	j LBB55
LBB54:
	addi s9,s6,-1
	mv s5,s1
	blt s3,s9,LBB56
	j LBB57
LBB56:
	addi a0,s9,-1
	mv a1,s3
	mv a2,s5
	call tak
	mv s8,a0
	addi a0,s3,-1
	mv a1,s5
	mv a2,s9
	call tak
	mv s7,a0
	addi a0,s5,-1
	mv a1,s9
	mv a2,s3
	call tak
	mv a2,a0
	mv a0,s8
	mv a1,s7
	call tak
	li a1,1
	add s5,a1,a0
	j LBB58
LBB57:
LBB58:
	addi a0,s3,-1
	mv a1,s1
	mv a2,s6
	call tak
	mv s7,a0
	addi a0,s1,-1
	mv a1,s6
	mv a2,s3
	call tak
	mv a2,a0
	mv a0,s5
	mv a1,s7
	call tak
	li a1,1
	add s1,a1,a0
	j LBB59
LBB55:
LBB59:
	mv s5,s1
	addi a0,s4,-1
	mv s1,a0
	lw s6,-88(s0)
	mv s3,s2
	blt s6,s1,LBB60
	j LBB61
LBB60:
	addi s8,s1,-1
	mv s2,s6
	mv s4,s3
	blt s2,s8,LBB62
	j LBB63
LBB62:
	addi a0,s8,-1
	mv a1,s2
	mv a2,s4
	call tak
	mv s7,a0
	addi a0,s2,-1
	mv a1,s4
	mv a2,s8
	call tak
	mv s9,a0
	addi a0,s4,-1
	mv a1,s8
	mv a2,s2
	call tak
	mv a2,a0
	mv a0,s7
	mv a1,s9
	call tak
	li a1,1
	add s4,a1,a0
	j LBB64
LBB63:
LBB64:
	mv s9,s4
	addi a0,s6,-1
	mv s7,a0
	blt s3,s7,LBB65
	j LBB66
LBB65:
	addi a0,s7,-1
	mv s8,a0
	mv s4,s3
	mv s2,s1
	blt s4,s8,LBB67
	j LBB68
LBB67:
	addi a0,s8,-1
	mv a1,s4
	mv a2,s2
	call tak
	mv s11,a0
	addi a0,s4,-1
	mv a1,s2
	mv a2,s8
	call tak
	mv s10,a0
	addi a0,s2,-1
	mv a1,s8
	mv a2,s4
	call tak
	mv a2,a0
	mv a0,s11
	mv a1,s10
	call tak
	li a1,1
	add a0,a1,a0
	j LBB69
LBB68:
	mv a0,s2
LBB69:
	mv s4,a0
	addi a0,s3,-1
	mv a1,s1
	mv a2,s7
	call tak
	mv s2,a0
	addi a0,s1,-1
	mv a1,s7
	mv a2,s3
	call tak
	mv a2,a0
	mv a0,s4
	mv a1,s2
	call tak
	li a1,1
	add s2,a1,a0
	j LBB70
LBB66:
	mv s2,s1
LBB70:
	addi a0,s3,-1
	mv a1,s1
	mv a2,s6
	call tak
	mv a2,a0
	mv a0,s9
	mv a1,s2
	call tak
	li a1,1
	add a0,a1,a0
	j LBB71
LBB61:
	mv a0,s3
LBB71:
	lw s3,-76(s0)
	mv s2,s5
	mv s4,a0
	blt s2,s3,LBB72
	j LBB73
LBB72:
	addi s7,s3,-1
	mv s1,s2
	mv s5,s4
	blt s1,s7,LBB74
	j LBB75
LBB74:
	addi a0,s7,-1
	mv a1,s1
	mv a2,s5
	call tak
	mv s6,a0
	addi a0,s1,-1
	mv a1,s5
	mv a2,s7
	call tak
	mv s8,a0
	addi a0,s5,-1
	mv a1,s7
	mv a2,s1
	call tak
	mv a2,a0
	mv a0,s6
	mv a1,s8
	call tak
	li a1,1
	add s5,a1,a0
	j LBB76
LBB75:
LBB76:
	sw s5,-72(s0)
	addi a0,s2,-1
	mv s8,a0
	mv s1,s3
	blt s4,s8,LBB77
	j LBB78
LBB77:
	addi a0,s8,-1
	mv s6,a0
	mv s5,s4
	blt s5,s6,LBB79
	j LBB80
LBB79:
	addi a0,s6,-1
	mv a1,s5
	mv a2,s1
	call tak
	mv s9,a0
	addi a0,s5,-1
	mv a1,s1
	mv a2,s6
	call tak
	mv s7,a0
	addi a0,s1,-1
	mv a1,s6
	mv a2,s5
	call tak
	mv a2,a0
	mv a0,s9
	mv a1,s7
	call tak
	li a1,1
	add s5,a1,a0
	j LBB81
LBB80:
	mv s5,s1
LBB81:
	addi a0,s4,-1
	mv a1,s1
	mv a2,s8
	call tak
	mv s6,a0
	addi a0,s1,-1
	mv a1,s8
	mv a2,s4
	call tak
	mv a2,a0
	mv a0,s5
	mv a1,s6
	call tak
	li a1,1
	add a0,a1,a0
	j LBB82
LBB78:
	mv a0,s1
LBB82:
	mv s8,a0
	addi a0,s4,-1
	mv s1,a0
	mv s5,s3
	mv s9,s2
	blt s5,s1,LBB83
	j LBB84
LBB83:
	addi s6,s1,-1
	mv s2,s5
	mv s3,s9
	blt s2,s6,LBB85
	j LBB86
LBB85:
	addi a0,s6,-1
	mv a1,s2
	mv a2,s3
	call tak
	mv s4,a0
	addi a0,s2,-1
	mv a1,s3
	mv a2,s6
	call tak
	mv s7,a0
	addi a0,s3,-1
	mv a1,s6
	mv a2,s2
	call tak
	mv a2,a0
	mv a0,s4
	mv a1,s7
	call tak
	li a1,1
	add s3,a1,a0
	j LBB87
LBB86:
LBB87:
	addi a0,s5,-1
	mv s7,a0
	mv s2,s1
	blt s9,s7,LBB88
	j LBB89
LBB88:
	addi a0,s7,-1
	mv s6,a0
	mv s4,s9
	blt s4,s6,LBB90
	j LBB91
LBB90:
	addi a0,s6,-1
	mv a1,s4
	mv a2,s2
	call tak
	mv s11,a0
	addi a0,s4,-1
	mv a1,s2
	mv a2,s6
	call tak
	mv s10,a0
	addi a0,s2,-1
	mv a1,s6
	mv a2,s4
	call tak
	mv a2,a0
	mv a0,s11
	mv a1,s10
	call tak
	li a1,1
	add a0,a1,a0
	j LBB92
LBB91:
	mv a0,s2
LBB92:
	mv s6,a0
	addi a0,s9,-1
	mv a1,s2
	mv a2,s7
	call tak
	mv s4,a0
	addi a0,s2,-1
	mv a1,s7
	mv a2,s9
	call tak
	mv a2,a0
	mv a0,s6
	mv a1,s4
	call tak
	li a1,1
	add s2,a1,a0
	j LBB93
LBB89:
LBB93:
	addi a0,s9,-1
	mv a1,s1
	mv a2,s5
	call tak
	mv a2,a0
	mv a0,s3
	mv a1,s2
	call tak
	li a1,1
	add a2,a1,a0
	j LBB94
LBB84:
	mv a2,s9
LBB94:
	lw a0,-72(s0)
	mv a1,s8
	call tak
	li a1,1
	add a0,a1,a0
	j LBB95
LBB73:
	mv a0,s4
LBB95:
	li a1,1
	add a0,a1,a0
	j LBB96
LBB2:
	mv a0,s4
LBB96:
	addi sp,sp,140
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
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : tak
	.globl	main					# start function : main
	.p2align	2
main:
#LBB97:
	sw ra,-4(sp)
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
	addi sp,sp,-92
LBB98:
	call getInt
	mv s2,a0
	call getInt
	mv s1,a0
	call getInt
	mv s4,a0
	blt s1,s2,LBB99
	j LBB100
LBB99:
	addi s6,s2,-1
	mv s3,s4
	blt s1,s6,LBB101
	j LBB102
LBB101:
	addi a0,s6,-1
	mv a1,s1
	mv a2,s3
	call tak
	mv s5,a0
	addi a0,s1,-1
	mv a1,s3
	mv a2,s6
	call tak
	mv s7,a0
	addi a0,s3,-1
	mv a1,s6
	mv a2,s1
	call tak
	mv a2,a0
	mv a0,s5
	mv a1,s7
	call tak
	li a1,1
	add s3,a1,a0
	j LBB103
LBB102:
LBB103:
	sw s3,-60(s0)
	addi a0,s1,-1
	mv s7,a0
	mv s5,s4
	mv s3,s2
	blt s5,s7,LBB104
	j LBB105
LBB104:
	addi a0,s7,-1
	mv s6,a0
	blt s5,s6,LBB106
	j LBB107
LBB106:
	addi a0,s6,-1
	mv a1,s5
	mv a2,s3
	call tak
	mv s9,a0
	addi a0,s5,-1
	mv a1,s3
	mv a2,s6
	call tak
	mv s8,a0
	addi a0,s3,-1
	mv a1,s6
	mv a2,s5
	call tak
	mv a2,a0
	mv a0,s9
	mv a1,s8
	call tak
	li a1,1
	add s6,a1,a0
	j LBB108
LBB107:
	mv s6,s3
LBB108:
	addi a0,s5,-1
	mv a1,s3
	mv a2,s7
	call tak
	mv s8,a0
	addi a0,s3,-1
	mv a1,s7
	mv a2,s5
	call tak
	mv a2,a0
	mv a0,s6
	mv a1,s8
	call tak
	li a1,1
	add a0,a1,a0
	j LBB109
LBB105:
	mv a0,s3
LBB109:
	mv s6,a0
	addi a0,s4,-1
	mv s8,a0
	mv s9,s2
	blt s9,s8,LBB110
	j LBB111
LBB110:
	addi s5,s8,-1
	mv s2,s9
	mv s3,s1
	blt s2,s5,LBB112
	j LBB113
LBB112:
	addi a0,s5,-1
	mv a1,s2
	mv a2,s3
	call tak
	mv s4,a0
	addi a0,s2,-1
	mv a1,s3
	mv a2,s5
	call tak
	mv s7,a0
	addi a0,s3,-1
	mv a1,s5
	mv a2,s2
	call tak
	mv a2,a0
	mv a0,s4
	mv a1,s7
	call tak
	li a1,1
	add s3,a1,a0
	j LBB114
LBB113:
LBB114:
	mv s7,s3
	addi a0,s9,-1
	mv s4,a0
	mv s3,s8
	blt s1,s4,LBB115
	j LBB116
LBB115:
	addi a0,s4,-1
	mv s5,a0
	mv s2,s1
	blt s2,s5,LBB117
	j LBB118
LBB117:
	addi a0,s5,-1
	mv a1,s2
	mv a2,s3
	call tak
	mv s11,a0
	addi a0,s2,-1
	mv a1,s3
	mv a2,s5
	call tak
	mv s10,a0
	addi a0,s3,-1
	mv a1,s5
	mv a2,s2
	call tak
	mv a2,a0
	mv a0,s11
	mv a1,s10
	call tak
	li a1,1
	add a0,a1,a0
	j LBB119
LBB118:
	mv a0,s3
LBB119:
	mv s5,a0
	addi a0,s1,-1
	mv a1,s3
	mv a2,s4
	call tak
	mv s2,a0
	addi a0,s3,-1
	mv a1,s4
	mv a2,s1
	call tak
	mv a2,a0
	mv a0,s5
	mv a1,s2
	call tak
	li a1,1
	add s2,a1,a0
	j LBB120
LBB116:
	mv s2,s3
LBB120:
	addi a0,s1,-1
	mv a1,s8
	mv a2,s9
	call tak
	mv a2,a0
	mv a0,s7
	mv a1,s2
	call tak
	li a1,1
	add a0,a1,a0
	j LBB121
LBB111:
	mv a0,s1
LBB121:
	lw s1,-60(s0)
	mv s2,s6
	mv s4,a0
	blt s2,s1,LBB122
	j LBB123
LBB122:
	addi s6,s1,-1
	mv s3,s4
	blt s2,s6,LBB124
	j LBB125
LBB124:
	addi a0,s6,-1
	mv a1,s2
	mv a2,s3
	call tak
	mv s5,a0
	addi a0,s2,-1
	mv a1,s3
	mv a2,s6
	call tak
	mv s7,a0
	addi a0,s3,-1
	mv a1,s6
	mv a2,s2
	call tak
	mv a2,a0
	mv a0,s5
	mv a1,s7
	call tak
	li a1,1
	add s3,a1,a0
	j LBB126
LBB125:
LBB126:
	sw s3,-56(s0)
	addi a0,s2,-1
	mv s8,a0
	mv s5,s4
	mv s3,s1
	blt s5,s8,LBB127
	j LBB128
LBB127:
	addi a0,s8,-1
	mv s9,a0
	blt s5,s9,LBB129
	j LBB130
LBB129:
	addi a0,s9,-1
	mv a1,s5
	mv a2,s3
	call tak
	mv s6,a0
	addi a0,s5,-1
	mv a1,s3
	mv a2,s9
	call tak
	mv s7,a0
	addi a0,s3,-1
	mv a1,s9
	mv a2,s5
	call tak
	mv a2,a0
	mv a0,s6
	mv a1,s7
	call tak
	li a1,1
	add s6,a1,a0
	j LBB131
LBB130:
	mv s6,s3
LBB131:
	addi a0,s5,-1
	mv a1,s3
	mv a2,s8
	call tak
	mv s7,a0
	addi a0,s3,-1
	mv a1,s8
	mv a2,s5
	call tak
	mv a2,a0
	mv a0,s6
	mv a1,s7
	call tak
	li a1,1
	add a0,a1,a0
	j LBB132
LBB128:
	mv a0,s3
LBB132:
	mv s9,a0
	addi a0,s4,-1
	mv s3,a0
	mv s4,s1
	mv s1,s2
	blt s4,s3,LBB133
	j LBB134
LBB133:
	addi s7,s3,-1
	mv s2,s4
	mv s5,s1
	blt s2,s7,LBB135
	j LBB136
LBB135:
	addi a0,s7,-1
	mv a1,s2
	mv a2,s5
	call tak
	mv s6,a0
	addi a0,s2,-1
	mv a1,s5
	mv a2,s7
	call tak
	mv s8,a0
	addi a0,s5,-1
	mv a1,s7
	mv a2,s2
	call tak
	mv a2,a0
	mv a0,s6
	mv a1,s8
	call tak
	li a1,1
	add s5,a1,a0
	j LBB137
LBB136:
LBB137:
	mv s8,s5
	addi a0,s4,-1
	mv s7,a0
	mv s5,s3
	blt s1,s7,LBB138
	j LBB139
LBB138:
	addi a0,s7,-1
	mv s6,a0
	mv s2,s1
	blt s2,s6,LBB140
	j LBB141
LBB140:
	addi a0,s6,-1
	mv a1,s2
	mv a2,s5
	call tak
	mv s11,a0
	addi a0,s2,-1
	mv a1,s5
	mv a2,s6
	call tak
	mv s10,a0
	addi a0,s5,-1
	mv a1,s6
	mv a2,s2
	call tak
	mv a2,a0
	mv a0,s11
	mv a1,s10
	call tak
	li a1,1
	add a0,a1,a0
	j LBB142
LBB141:
	mv a0,s5
LBB142:
	mv s6,a0
	addi a0,s1,-1
	mv a1,s5
	mv a2,s7
	call tak
	mv s2,a0
	addi a0,s5,-1
	mv a1,s7
	mv a2,s1
	call tak
	mv a2,a0
	mv a0,s6
	mv a1,s2
	call tak
	li a1,1
	add s2,a1,a0
	j LBB143
LBB139:
	mv s2,s5
LBB143:
	addi a0,s1,-1
	mv a1,s3
	mv a2,s4
	call tak
	mv a2,a0
	mv a0,s8
	mv a1,s2
	call tak
	li a1,1
	add a2,a1,a0
	j LBB144
LBB134:
	mv a2,s1
LBB144:
	lw a0,-56(s0)
	mv a1,s9
	call tak
	li a1,1
	add a0,a1,a0
	j LBB145
LBB123:
	mv a0,s4
LBB145:
	li a1,1
	add a0,a1,a0
	j LBB146
LBB100:
	mv a0,s4
LBB146:
	call toString
	call println
	li a0,0
LBB147:
	addi sp,sp,92
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
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
