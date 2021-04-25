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
	mv s0,sp
	addi sp,sp,-120
LBB34:
	li s2,0
	li s1,19260817
LBB35:
	slli a0,s1,13
	xor a1,s1,a0
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
	and a4,a1,a0
	mv a0,a4
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
	and a2,a1,a0
	mv a0,a2
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
	srai a3,a0,17
	li a0,16384
	or a0,a0,a3
LBB52:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a3,a1,a0
	mv a0,a3
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
	srai a5,a0,17
	li a0,16384
	or a0,a0,a5
LBB55:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a5,a1,a0
	mv a0,a5
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
	and s1,a1,a0
	andi t1,a4,3
	srai t2,a4,28
	andi a0,a2,1
	srai a1,a2,29
	srai a2,a3,25
	andi a3,a3,31
	srai a4,a5,15
	li a6,32767
	and a5,a5,a6
	srai a6,s1,15
	li a7,32767
	and a7,s1,a7
	beq t1,t2,LBB59
	j LBB60
LBB59:
	bne t2,a0,LBB61
	j LBB62
LBB61:
	li t0,1
	j LBB63
LBB62:
	xor t0,a0,a1
	snez t0,t0
LBB63:
	bnez t0,LBB64
	j LBB65
LBB64:
	beq t2,a0,LBB66
	j LBB67
LBB66:
	bne a0,a1,LBB68
	j LBB69
LBB68:
	li t0,1
	j LBB70
LBB69:
	xor t0,a1,a2
	snez t0,t0
LBB70:
	bnez t0,LBB71
	j LBB72
LBB71:
	sw t1,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,1
	j LBB73
LBB72:
	addi a4,a4,-1
	addi a5,a5,-2
	sw t1,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,2
	j LBB73
LBB67:
	add a0,t2,a0
	add a0,a0,t2
LBB73:
	addi a0,a0,1
	j LBB74
LBB65:
	addi t0,a3,-1
	addi a3,a4,-2
	beq t2,a0,LBB75
	j LBB76
LBB75:
	bne a0,a1,LBB77
	j LBB78
LBB77:
	li a4,1
	j LBB79
LBB78:
	xor a4,a1,a2
	snez a4,a4
LBB79:
	bnez a4,LBB80
	j LBB81
LBB80:
	mv s3,a0
	beq s3,a1,LBB82
	j LBB83
LBB82:
	bne a1,a2,LBB84
	j LBB85
LBB84:
	li a0,1
	j LBB86
LBB85:
	xor a0,a2,t0
	snez a0,a0
LBB86:
	bnez a0,LBB87
	j LBB88
LBB87:
	mv a0,a1
	mv a1,a2
	mv a2,t0
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t1
	sw t2,0(sp)
	sw s3,4(sp)
	call test
	addi a0,a0,1
	j LBB89
LBB88:
	addi a4,a5,-1
	addi a5,a6,-2
	mv a0,a1
	mv a1,a2
	mv a2,t0
	mv a6,a7
	mv a7,t1
	sw t2,0(sp)
	sw s3,4(sp)
	call test
	addi a0,a0,2
	j LBB89
LBB83:
	add a0,s3,a1
	add a0,a0,s3
LBB89:
	addi a0,a0,1
	j LBB90
LBB81:
	addi a4,a3,-1
	addi a5,a5,-2
	mv a3,t0
	sw t1,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,2
	j LBB90
LBB76:
	add a0,t2,a0
	add a0,a0,t2
LBB90:
	addi a0,a0,2
	j LBB74
LBB60:
	add a0,t1,t2
	add a0,a0,t1
LBB74:
	xor s2,s2,a0
	j LBB35
LBB43:
	addi a0,s2,-19
LBB91:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
