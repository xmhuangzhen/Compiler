	.text
	.globl	test					# start function : test
	.p2align	2
test:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-120
	mv t1,a0
	mv t0,a1
	mv a0,a2
	mv a1,a3
	mv a2,a4
	mv a3,a5
	mv a4,a6
	mv a5,a7
	lw a6,0(s0)
	lw a7,4(s0)
	beq t1,t0,LBB1
LBB2:
	add a0,t1,t0
	add a0,a0,t1
LBB12:
	addi sp,sp,120
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB1:
	bne t0,a0,LBB3
LBB4:
	bne a0,a1,LBB3
LBB5:
	addi t2,a3,-1
	addi a3,a4,-2
	beq t0,a0,LBB13
LBB14:
	add a0,t0,a0
	add a0,a0,t0
LBB24:
	addi a0,a0,2
	j LBB12
LBB13:
	bne a0,a1,LBB15
LBB16:
	bne a1,a2,LBB15
LBB17:
	addi a4,a3,-1
	addi a5,a5,-2
	mv a3,t2
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB24
LBB15:
	mv s1,a0
	beq s1,a1,LBB18
LBB19:
	add a0,s1,a1
	add a0,a0,s1
LBB23:
	addi a0,a0,1
	j LBB24
LBB18:
	bne a1,a2,LBB20
LBB21:
	bne a2,t2,LBB20
LBB22:
	addi a4,a5,-1
	addi a5,a6,-2
	mv a0,a1
	mv a1,a2
	mv a2,t2
	mv a6,a7
	mv a7,t1
	sw t0,0(sp)
	sw s1,4(sp)
	call test
	addi a0,a0,2
	j LBB23
LBB20:
	mv a0,a1
	mv a1,a2
	mv a2,t2
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t1
	sw t0,0(sp)
	sw s1,4(sp)
	call test
	addi a0,a0,1
	j LBB23
LBB3:
	beq t0,a0,LBB6
LBB7:
	add a0,t0,a0
	add a0,a0,t0
LBB11:
	addi a0,a0,1
	j LBB12
LBB6:
	bne a0,a1,LBB8
LBB9:
	bne a1,a2,LBB8
LBB10:
	addi a4,a4,-1
	addi a5,a5,-2
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB11
LBB8:
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,1
	j LBB11
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB25:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-120
LBB26:
	li s2,0
	li s1,19260817
LBB27:
	slli a0,s1,13
	xor a1,s1,a0
	li a0,0
	bge a1,a0,LBB28
LBB29:
	li a0,-2147483648
	xor a0,a1,a0
	srai a2,a0,17
	li a0,16384
	or a0,a0,a2
LBB30:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a2,a1,a0
	mv a0,a2
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB31
LBB32:
	li a0,-2147483648
	xor a0,a1,a0
	srai a3,a0,17
	li a0,16384
	or a0,a0,a3
LBB33:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a0,a1,a0
	andi a2,a2,255
	andi a1,a0,255
	bne a2,a1,LBB34
LBB35:
	addi a0,s2,-19
LBB75:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB34:
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB36
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
	and a4,a1,a0
	mv a0,a4
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB39
LBB40:
	li a0,-2147483648
	xor a0,a1,a0
	srai a2,a0,17
	li a0,16384
	or a0,a0,a2
LBB41:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a2,a1,a0
	mv a0,a2
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB42
LBB43:
	li a0,-2147483648
	xor a0,a1,a0
	srai a3,a0,17
	li a0,16384
	or a0,a0,a3
LBB44:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a3,a1,a0
	mv a0,a3
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB45
LBB46:
	li a0,-2147483648
	xor a0,a1,a0
	srai a5,a0,17
	li a0,16384
	or a0,a0,a5
LBB47:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a5,a1,a0
	mv a0,a5
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB48
LBB49:
	li a0,-2147483648
	xor a0,a1,a0
	srai a6,a0,17
	li a0,16384
	or a0,a0,a6
LBB50:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and s1,a1,a0
	andi t1,a4,3
	srai s3,a4,28
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
	beq t1,s3,LBB51
LBB52:
	add a0,t1,s3
	add a0,a0,t1
LBB62:
	xor s2,s2,a0
	j LBB27
LBB51:
	bne s3,a0,LBB53
LBB54:
	bne a0,a1,LBB53
LBB55:
	addi t0,a3,-1
	addi a3,a4,-2
	beq s3,a0,LBB63
LBB64:
	add a0,s3,a0
	add a0,a0,s3
LBB74:
	addi a0,a0,2
	j LBB62
LBB63:
	bne a0,a1,LBB65
LBB66:
	bne a1,a2,LBB65
LBB67:
	addi a4,a3,-1
	addi a5,a5,-2
	mv a3,t0
	sw t1,0(sp)
	sw s3,4(sp)
	call test
	addi a0,a0,2
	j LBB74
LBB65:
	mv t2,a0
	beq t2,a1,LBB68
LBB69:
	add a0,t2,a1
	add a0,a0,t2
LBB73:
	addi a0,a0,1
	j LBB74
LBB68:
	bne a1,a2,LBB70
LBB71:
	bne a2,t0,LBB70
LBB72:
	addi a4,a5,-1
	addi a5,a6,-2
	mv a0,a1
	mv a1,a2
	mv a2,t0
	mv a6,a7
	mv a7,t1
	sw s3,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,2
	j LBB73
LBB70:
	mv a0,a1
	mv a1,a2
	mv a2,t0
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t1
	sw s3,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,1
	j LBB73
LBB53:
	beq s3,a0,LBB56
LBB57:
	add a0,s3,a0
	add a0,a0,s3
LBB61:
	addi a0,a0,1
	j LBB62
LBB56:
	bne a0,a1,LBB58
LBB59:
	bne a1,a2,LBB58
LBB60:
	addi a4,a4,-1
	addi a5,a5,-2
	sw t1,0(sp)
	sw s3,4(sp)
	call test
	addi a0,a0,2
	j LBB61
LBB58:
	sw t1,0(sp)
	sw s3,4(sp)
	call test
	addi a0,a0,1
	j LBB61
LBB48:
	srai a0,a1,17
	j LBB50
LBB45:
	srai a0,a1,17
	j LBB47
LBB42:
	srai a0,a1,17
	j LBB44
LBB39:
	srai a0,a1,17
	j LBB41
LBB36:
	srai a0,a1,17
	j LBB38
LBB31:
	srai a0,a1,17
	j LBB33
LBB28:
	srai a0,a1,17
	j LBB30
# end function : main
.section	.sdata,"aw",@progbits
