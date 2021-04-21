	.text
	.globl	test					# start function : test
	.p2align	2
test:
#LBB40:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-120
	mv t2,a0
	mv t1,a1
	mv t0,a2
	mv a1,a3
	mv a2,a4
	mv a3,a5
	mv a4,a6
	mv a5,a7
	lw a6,0(s0)
	lw a7,4(s0)
	xor s3,t2,t1
	seqz s3,s3
	bnez s3,LBB41
	j LBB67
LBB41:
	xor s3,t1,t0
	snez s3,s3
	bnez a0,LBB43
	j LBB42
LBB42:
	xor s1,t0,a1
	snez s1,s1
LBB43:
	or s1,s3,s1
	bnez s1,LBB44
	j LBB52
LBB44:
	xor s1,t1,t0
	seqz s1,s1
	bnez s1,LBB45
	j LBB50
LBB45:
	xor s1,t0,a1
	snez s1,s1
	bnez a0,LBB47
	j LBB46
LBB46:
	xor a0,a1,a2
	snez a0,a0
LBB47:
	or a0,s1,a0
	bnez a0,LBB48
	j LBB49
LBB48:
	mv a0,t0
	sw t2,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,1
	j LBB51
LBB49:
	addi a4,a4,-1
	addi a5,a5,-2
	mv a0,t0
	sw t2,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,2
	j LBB51
LBB50:
	add a0,t1,t0
	add a0,a0,t1
LBB51:
	addi a0,a0,1
	j LBB68
LBB52:
	addi s1,a3,-1
	addi a3,a4,-2
	xor a4,t1,t0
	seqz a4,a4
	bnez a4,LBB53
	j LBB65
LBB53:
	xor a4,t0,a1
	snez s3,a4
	bnez a0,LBB55
	j LBB54
LBB54:
	xor a4,a1,a2
	snez s2,a4
LBB55:
	or a4,s3,s2
	bnez a4,LBB56
	j LBB64
LBB56:
	xor a4,t0,a1
	seqz a4,a4
	bnez a4,LBB57
	j LBB62
LBB57:
	xor a4,a1,a2
	snez a4,a4
	bnez a0,LBB59
	j LBB58
LBB58:
	xor a0,a2,s1
	snez a0,a0
LBB59:
	or a0,a4,a0
	bnez a0,LBB60
	j LBB61
LBB60:
	mv a0,a1
	mv a1,a2
	mv a2,s1
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t2
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,1
	j LBB63
LBB61:
	addi a4,a5,-1
	addi a5,a6,-2
	mv a0,a1
	mv a1,a2
	mv a2,s1
	mv a6,a7
	mv a7,t2
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	addi a0,a0,2
	j LBB63
LBB62:
	add a0,t0,a1
	add a0,a0,t0
LBB63:
	addi a0,a0,1
	j LBB66
LBB64:
	addi a4,a3,-1
	addi a5,a5,-2
	mv a0,t0
	mv a3,s1
	sw t2,0(sp)
	sw t1,4(sp)
	call test
	addi a0,a0,2
	j LBB66
LBB65:
	add a0,t1,t0
	add a0,a0,t1
LBB66:
	addi a0,a0,2
	j LBB68
LBB67:
	add a0,t2,t1
	add a0,a0,t2
LBB68:
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB69:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-120
LBB70:
	li s2,19260817
	li s1,0
LBB71:
	li a0,13
	sll a0,s2,a0
	xor a1,s2,a0
	li a0,17
	li a2,0
	slt a2,a1,a2
	xori a2,a2,1
	bnez a2,LBB72
	j LBB73
LBB72:
	sra a0,a1,a0
	j LBB74
LBB73:
	li a2,31
	sub a3,a2,a0
	li a2,1
	sll a3,a2,a3
	li a2,-2147483648
	xor a2,a1,a2
	sra a0,a2,a0
	or a0,a3,a0
LBB74:
	xor a0,a1,a0
	li a1,5
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,1073741823
	and a2,a1,a0
	mv a0,a2
	li a1,13
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB75
	j LBB76
LBB75:
	sra a0,a1,a0
	j LBB77
LBB76:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a3,a1,a3
	sra a0,a3,a0
	or a0,a4,a0
LBB77:
	xor a0,a1,a0
	li a1,5
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,1073741823
	and a0,a1,a0
	andi a2,a2,255
	andi a1,a0,255
	xor a1,a2,a1
	snez a1,a1
	bnez a1,LBB78
	j LBB94
LBB78:
	li a1,13
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,17
	li a2,0
	slt a2,a1,a2
	xori a2,a2,1
	bnez a2,LBB79
	j LBB80
LBB79:
	sra a0,a1,a0
	j LBB81
LBB80:
	li a2,31
	sub a3,a2,a0
	li a2,1
	sll a3,a2,a3
	li a2,-2147483648
	xor a2,a1,a2
	sra a0,a2,a0
	or a0,a3,a0
LBB81:
	xor a0,a1,a0
	li a1,5
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,1073741823
	and a2,a1,a0
	mv a0,a2
	li a1,13
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,17
	li a3,0
	slt a3,a1,a3
	xori a3,a3,1
	bnez a3,LBB82
	j LBB83
LBB82:
	sra a0,a1,a0
	j LBB84
LBB83:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a3,a1,a3
	sra a0,a3,a0
	or a0,a4,a0
LBB84:
	xor a0,a1,a0
	li a1,5
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,1073741823
	and a3,a1,a0
	mv a0,a3
	li a1,13
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB85
	j LBB86
LBB85:
	sra a0,a1,a0
	j LBB87
LBB86:
	li a4,31
	sub a5,a4,a0
	li a4,1
	sll a5,a4,a5
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a5,a0
LBB87:
	xor a0,a1,a0
	li a1,5
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,1073741823
	and a5,a1,a0
	mv a0,a5
	li a1,13
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB88
	j LBB89
LBB88:
	sra a0,a1,a0
	j LBB90
LBB89:
	li a4,31
	sub a6,a4,a0
	li a4,1
	sll a6,a4,a6
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a6,a0
LBB90:
	xor a0,a1,a0
	li a1,5
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,1073741823
	and a7,a1,a0
	mv a0,a7
	li a1,13
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,17
	li a4,0
	slt a4,a1,a4
	xori a4,a4,1
	bnez a4,LBB91
	j LBB92
LBB91:
	sra a0,a1,a0
	j LBB93
LBB92:
	li a4,31
	sub a6,a4,a0
	li a4,1
	sll a6,a4,a6
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a6,a0
LBB93:
	xor a0,a1,a0
	li a1,5
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,1073741823
	and s2,a1,a0
	andi a0,a2,3
	srai a1,a2,28
	andi a2,a3,1
	srai a3,a3,29
	srai a4,a5,25
	andi a5,a5,31
	srai a6,a7,15
	li t0,32767
	and a7,a7,t0
	srai t1,s2,15
	li t0,32767
	and t0,s2,t0
	sw t1,0(sp)
	sw t0,4(sp)
	call test
	xor s1,s1,a0
	j LBB71
LBB94:
LBB95:
	mv a0,s1
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
