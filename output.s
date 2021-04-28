	.text
	.globl	search					# start function : search
	.p2align	2
search:
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
	mv s0,sp
	addi sp,sp,-84
	mv s5,a0
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	beq s5,a0,LBB1
LBB2:
	li s6,0
LBB13:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s6,a0,LBB14
LBB15:
LBB12:
LBB77:
	mv a0,s7
	addi sp,sp,84
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
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB14:
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s6,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB16
LBB17:
	addi s6,s6,1
	j LBB13
LBB16:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add a0,s6,s5
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB18
	j LBB17
LBB18:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s6,a0
	addi a0,a0,-1
	sub a0,a0,s5
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB19
	j LBB17
LBB19:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s6,a0
	addi a0,a0,-1
	sub a0,a0,s5
	slli a0,a0,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add a0,s6,s5
	slli a0,a0,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s6,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(col)
	lw a1,%lo(col)(a0)
	slli a0,s5,2
	add a0,a1,a0
	sw s6,0(a0)
	addi s4,s5,1
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	beq s4,a0,LBB20
LBB21:
	li s3,0
LBB32:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s3,a0,LBB33
LBB34:
LBB31:
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s6,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add a0,s6,s5
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s6,a0
	addi a0,a0,-1
	sub a0,a0,s5
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	j LBB17
LBB33:
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s3,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB35
LBB36:
	addi s3,s3,1
	j LBB32
LBB35:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add a0,s3,s4
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB37
	j LBB36
LBB37:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s3,a0
	addi a0,a0,-1
	sub a0,a0,s4
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB38
	j LBB36
LBB38:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s3,a0
	addi a0,a0,-1
	sub a0,a0,s4
	slli a0,a0,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add a0,s3,s4
	slli a0,a0,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s3,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(col)
	lw a1,%lo(col)(a0)
	slli a0,s4,2
	add a0,a1,a0
	sw s3,0(a0)
	addi s1,s4,1
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	beq s1,a0,LBB39
LBB40:
	li s2,0
LBB51:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s2,a0,LBB52
LBB53:
LBB50:
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s3,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add a0,s3,s4
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s3,a0
	addi a0,a0,-1
	sub a0,a0,s4
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	j LBB36
LBB52:
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB54
LBB55:
	addi s2,s2,1
	j LBB51
LBB54:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add a0,s2,s1
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB56
	j LBB55
LBB56:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s2,a0
	addi a0,a0,-1
	sub a0,a0,s1
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB57
	j LBB55
LBB57:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s2,a0
	addi a0,a0,-1
	sub a0,a0,s1
	slli a0,a0,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add a0,s2,s1
	slli a0,a0,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s2,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(col)
	lw a1,%lo(col)(a0)
	slli a0,s1,2
	add a0,a1,a0
	sw s2,0(a0)
	addi s9,s1,1
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	beq s9,a0,LBB58
LBB59:
	li s8,0
LBB70:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s8,a0,LBB71
LBB72:
LBB69:
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s2,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add a0,s2,s1
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s2,a0
	addi a0,a0,-1
	sub a0,a0,s1
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	j LBB55
LBB71:
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s8,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB73
LBB74:
	addi s8,s8,1
	j LBB70
LBB73:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add a0,s8,s9
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB75
	j LBB74
LBB75:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s8,a0
	addi a0,a0,-1
	sub a0,a0,s9
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB76
	j LBB74
LBB76:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s8,a0
	addi a0,a0,-1
	sub a0,a0,s9
	slli a0,a0,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	add s10,s8,s9
	slli a0,s10,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s8,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(col)
	lw a1,%lo(col)(a0)
	slli a0,s9,2
	add a0,a1,a0
	sw s8,0(a0)
	addi a0,s9,1
	call search
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s8,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	slli a0,s10,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s8,a0
	addi a0,a0,-1
	sub a0,a0,s9
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	j LBB74
LBB58:
	li s8,0
LBB60:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s8,a0,LBB61
LBB62:
	la a0,const_string_no2
	call println
	j LBB69
LBB61:
	li s9,0
LBB63:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s9,a0,LBB64
LBB65:
	la a0,const_string_no2
	call println
	addi s8,s8,1
	j LBB60
LBB64:
	lui a0,%hi(col)
	lw a1,%lo(col)(a0)
	slli a0,s8,2
	add a0,a1,a0
	lw a0,0(a0)
	beq a0,s9,LBB66
LBB67:
	la a0,const_string_no1
	call print
LBB68:
	addi s9,s9,1
	j LBB63
LBB66:
	la a0,const_string_no0
	call print
	j LBB68
LBB39:
	li s1,0
LBB41:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s1,a0,LBB42
LBB43:
	la a0,const_string_no2
	call println
	j LBB50
LBB42:
	li s2,0
LBB44:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s2,a0,LBB45
LBB46:
	la a0,const_string_no2
	call println
	addi s1,s1,1
	j LBB41
LBB45:
	lui a0,%hi(col)
	lw a1,%lo(col)(a0)
	slli a0,s1,2
	add a0,a1,a0
	lw a0,0(a0)
	beq a0,s2,LBB47
LBB48:
	la a0,const_string_no1
	call print
LBB49:
	addi s2,s2,1
	j LBB44
LBB47:
	la a0,const_string_no0
	call print
	j LBB49
LBB20:
	li s1,0
LBB22:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s1,a0,LBB23
LBB24:
	la a0,const_string_no2
	call println
	j LBB31
LBB23:
	li s2,0
LBB25:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s2,a0,LBB26
LBB27:
	la a0,const_string_no2
	call println
	addi s1,s1,1
	j LBB22
LBB26:
	lui a0,%hi(col)
	lw a1,%lo(col)(a0)
	slli a0,s1,2
	add a0,a1,a0
	lw a0,0(a0)
	beq a0,s2,LBB28
LBB29:
	la a0,const_string_no1
	call print
LBB30:
	addi s2,s2,1
	j LBB25
LBB28:
	la a0,const_string_no0
	call print
	j LBB30
LBB1:
	li s1,0
LBB3:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s1,a0,LBB4
LBB5:
	la a0,const_string_no2
	call println
	j LBB12
LBB4:
	li s2,0
LBB6:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s2,a0,LBB7
LBB8:
	la a0,const_string_no2
	call println
	addi s1,s1,1
	j LBB3
LBB7:
	lui a0,%hi(col)
	lw a1,%lo(col)(a0)
	slli a0,s1,2
	add a0,a1,a0
	lw a0,0(a0)
	beq a0,s2,LBB9
LBB10:
	la a0,const_string_no1
	call print
LBB11:
	addi s2,s2,1
	j LBB6
LBB9:
	la a0,const_string_no0
	call print
	j LBB11
# end function : search
	.globl	main					# start function : main
	.p2align	2
main:
#LBB78:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-84
LBB79:
	li a1,8
	lui a0,%hi(N)
	sw a1,%lo(N)(a0)
	li a0,36
	call malloc
	li a1,8
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(row)
	sw a1,%lo(row)(a0)
	li a0,36
	call malloc
	li a1,8
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(col)
	sw a1,%lo(col)(a0)
	li a0,12
	call malloc
	li a1,2
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(d)
	sw a1,%lo(d)(a0)
	li a0,0
LBB80:
	li a1,8
	blt a0,a1,LBB81
LBB82:
	li s1,0
LBB83:
	li a0,2
	blt s1,a0,LBB84
LBB85:
	lui a0,%hi(N)
	lw a1,%lo(N)(a0)
	li a0,0
	beq a0,a1,LBB89
LBB90:
	li s1,0
LBB101:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s1,a0,LBB102
LBB103:
LBB100:
	li a0,0
LBB127:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB102:
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s1,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB104
LBB105:
	addi s1,s1,1
	j LBB101
LBB104:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	addi a0,s1,0
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB106
	j LBB105
LBB106:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s1,a0
	addi a0,a0,-1
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB107
	j LBB105
LBB107:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s1,a0
	addi a0,a0,-1
	slli a0,a0,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	addi a0,s1,0
	slli a0,a0,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s1,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(col)
	lw a0,%lo(col)(a0)
	addi a0,a0,0
	sw s1,0(a0)
	lui a0,%hi(N)
	lw a1,%lo(N)(a0)
	li a0,1
	beq a0,a1,LBB108
LBB109:
	li s2,0
LBB120:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s2,a0,LBB121
LBB122:
LBB119:
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s1,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	addi a0,s1,0
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s1,a0
	addi a0,a0,-1
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	j LBB105
LBB121:
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB123
LBB124:
	addi s2,s2,1
	j LBB120
LBB123:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	addi a0,s2,1
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB125
	j LBB124
LBB125:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s2,a0
	addi a0,a0,-2
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	beq a1,a0,LBB126
	j LBB124
LBB126:
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s2,a0
	addi a0,a0,-2
	slli a0,a0,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	addi s3,s2,1
	slli a0,s3,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s2,2
	add a1,a1,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(col)
	lw a0,%lo(col)(a0)
	addi a0,a0,4
	sw s2,0(a0)
	li a0,2
	call search
	lui a0,%hi(row)
	lw a1,%lo(row)(a0)
	slli a0,s2,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	slli a0,s3,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	lui a0,%hi(d)
	lw a0,%lo(d)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,s2,a0
	addi a0,a0,-2
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
	j LBB124
LBB108:
	li s2,0
LBB110:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s2,a0,LBB111
LBB112:
	la a0,const_string_no2
	call println
	j LBB119
LBB111:
	li s3,0
LBB113:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s3,a0,LBB114
LBB115:
	la a0,const_string_no2
	call println
	addi s2,s2,1
	j LBB110
LBB114:
	lui a0,%hi(col)
	lw a1,%lo(col)(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a0,0(a0)
	beq a0,s3,LBB116
LBB117:
	la a0,const_string_no1
	call print
LBB118:
	addi s3,s3,1
	j LBB113
LBB116:
	la a0,const_string_no0
	call print
	j LBB118
LBB89:
	li s1,0
LBB91:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s1,a0,LBB92
LBB93:
	la a0,const_string_no2
	call println
	j LBB100
LBB92:
	li s2,0
LBB94:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s2,a0,LBB95
LBB96:
	la a0,const_string_no2
	call println
	addi s1,s1,1
	j LBB91
LBB95:
	lui a0,%hi(col)
	lw a1,%lo(col)(a0)
	slli a0,s1,2
	add a0,a1,a0
	lw a0,0(a0)
	beq a0,s2,LBB97
LBB98:
	la a0,const_string_no1
	call print
LBB99:
	addi s2,s2,1
	j LBB94
LBB97:
	la a0,const_string_no0
	call print
	j LBB99
LBB84:
	lui a0,%hi(d)
	lw a1,%lo(d)(a0)
	slli a0,s1,2
	add s2,a1,a0
	li a0,64
	call malloc
	li a1,15
	sw a1,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s2)
	li a0,0
LBB86:
	li a1,15
	blt a0,a1,LBB87
LBB88:
	addi s1,s1,1
	j LBB83
LBB87:
	lui a1,%hi(d)
	lw a2,%lo(d)(a1)
	slli a1,s1,2
	add a1,a2,a1
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	li a1,0
	sw a1,0(a2)
	addi a0,a0,1
	j LBB86
LBB81:
	lui a1,%hi(row)
	lw a2,%lo(row)(a1)
	slli a1,a0,2
	add a2,a2,a1
	li a1,0
	sw a1,0(a2)
	lui a1,%hi(col)
	lw a2,%lo(col)(a1)
	slli a1,a0,2
	add a2,a2,a1
	li a1,0
	sw a1,0(a2)
	addi a0,a0,1
	j LBB80
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
N:
	.word	8

	.p2align	2
row:
	.word	0

	.p2align	2
col:
	.word	0

	.p2align	2
d:
	.word	0

const_string_no0:
	.asciz	" O"

const_string_no1:
	.asciz	" ."

const_string_no2:
	.asciz	""

