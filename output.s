	.text
	.globl	test					# start function : test
	.p2align	2
test:
#LBB40:
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
	beq t1,t0,LBB41
	j LBB71
LBB41:
	bne t0,a0,LBB42
	j LBB43
LBB42:
	li t2,1
	j LBB44
LBB43:
	xor t2,a0,a1
	snez t2,t2
LBB44:
	bnez t2,LBB45
	j LBB54
LBB45:
	beq t0,a0,LBB46
	j LBB52
LBB46:
	bne a0,a1,LBB47
	j LBB48
LBB47:
	li t2,1
	j LBB49
LBB48:
	xor t2,a1,a2
	snez t2,t2
LBB49:
	bnez t2,LBB50
	j LBB51
LBB50:
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,1
	j LBB53
LBB51:
	addi a4,a4,-1
	addi a5,a5,-2
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB53
LBB52:
	add a0,t0,a0
	add a0,a0,t0
LBB53:
	addi a0,a0,1
	j LBB72
LBB54:
	addi t2,a3,-1
	addi a3,a4,-2
	beq t0,a0,LBB55
	j LBB69
LBB55:
	bne a0,a1,LBB56
	j LBB57
LBB56:
	li a4,1
	j LBB58
LBB57:
	xor a4,a1,a2
	snez a4,a4
LBB58:
	bnez a4,LBB59
	j LBB68
LBB59:
	mv s1,a0
	beq s1,a1,LBB60
	j LBB66
LBB60:
	bne a1,a2,LBB61
	j LBB62
LBB61:
	li a0,1
	j LBB63
LBB62:
	xor a0,a2,t2
	snez a0,a0
LBB63:
	bnez a0,LBB64
	j LBB65
LBB64:
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
	j LBB67
LBB65:
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
	j LBB67
LBB66:
	add a0,s1,a1
	add a0,a0,s1
LBB67:
	addi a0,a0,1
	j LBB70
LBB68:
	addi a4,a3,-1
	addi a5,a5,-2
	mv a3,t2
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB70
LBB69:
	add a0,t0,a0
	add a0,a0,t0
LBB70:
	addi a0,a0,2
	j LBB72
LBB71:
	add a0,t1,t0
	add a0,a0,t1
LBB72:
	addi sp,sp,120
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB73:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-120
LBB74:
	li s2,0
	li s1,19260817
LBB75:
	slli a0,s1,13
	xor a1,s1,a0
	li a0,0
	bge a1,a0,LBB76
	j LBB77
LBB76:
	srai a0,a1,17
	j LBB78
LBB77:
	li a0,-2147483648
	xor a0,a1,a0
	srai a2,a0,17
	li a0,16384
	or a0,a0,a2
LBB78:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a2,a1,a0
	mv a0,a2
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB79
	j LBB80
LBB79:
	srai a0,a1,17
	j LBB81
LBB80:
	li a0,-2147483648
	xor a0,a1,a0
	srai a3,a0,17
	li a0,16384
	or a0,a0,a3
LBB81:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a0,a1,a0
	andi a2,a2,255
	andi a1,a0,255
	bne a2,a1,LBB82
	j LBB98
LBB82:
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB83
	j LBB84
LBB83:
	srai a0,a1,17
	j LBB85
LBB84:
	li a0,-2147483648
	xor a0,a1,a0
	srai a2,a0,17
	li a0,16384
	or a0,a0,a2
LBB85:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a2,a1,a0
	mv a0,a2
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB86
	j LBB87
LBB86:
	srai a0,a1,17
	j LBB88
LBB87:
	li a0,-2147483648
	xor a0,a1,a0
	srai a3,a0,17
	li a0,16384
	or a0,a0,a3
LBB88:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a3,a1,a0
	mv a0,a3
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB89
	j LBB90
LBB89:
	srai a0,a1,17
	j LBB91
LBB90:
	li a0,-2147483648
	xor a0,a1,a0
	srai a4,a0,17
	li a0,16384
	or a0,a0,a4
LBB91:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a5,a1,a0
	mv a0,a5
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB92
	j LBB93
LBB92:
	srai a0,a1,17
	j LBB94
LBB93:
	li a0,-2147483648
	xor a0,a1,a0
	srai a4,a0,17
	li a0,16384
	or a0,a0,a4
LBB94:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and a7,a1,a0
	mv a0,a7
	slli a1,a0,13
	xor a1,a0,a1
	li a0,0
	bge a1,a0,LBB95
	j LBB96
LBB95:
	srai a0,a1,17
	j LBB97
LBB96:
	li a0,-2147483648
	xor a0,a1,a0
	srai a4,a0,17
	li a0,16384
	or a0,a0,a4
LBB97:
	xor a0,a1,a0
	slli a1,a0,5
	xor a1,a0,a1
	li a0,1073741823
	and s1,a1,a0
	andi a0,a2,3
	srai a1,a2,28
	andi a2,a3,1
	srai a3,a3,29
	srai a4,a5,25
	andi a5,a5,31
	srai a6,a7,15
	li t0,32767
	and a7,a7,t0
	srai t1,s1,15
	li t0,32767
	and t0,s1,t0
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	xor s2,s2,a0
	j LBB75
LBB98:
	addi a0,s2,-19
LBB99:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
