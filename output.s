	.text
	.globl	test					# start function : test
	.p2align	2
test:
#LBB40:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-120
	mv t2,a0
	lw t1,0(s0)
	lw s1,4(s0)
	xor a0,t2,a1
	seqz a0,a0
	bnez a0,LBB41
	j LBB47
LBB41:
	xor a0,a1,a2
	snez a0,a0
	bnez a0,LBB42
	j LBB43
LBB42:
	li a0,1
	j LBB44
LBB43:
	xor a0,a2,a3
	snez a0,a0
LBB44:
	bnez a0,LBB45
	j LBB46
LBB45:
	mv a0,a1
	mv a1,a2
	mv a2,a3
	mv a3,a4
	mv a4,a5
	mv a5,a6
	mv a6,a7
	mv a7,t1
	sw s1,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,1
	j LBB48
LBB46:
	addi t0,a5,-1
	addi a5,a6,-2
	mv a0,a1
	mv a1,a2
	mv a2,a3
	mv a3,a4
	mv a4,t0
	mv a6,a7
	mv a7,t1
	sw s1,0(sp)
	sw t2,4(sp)
	call test
	addi a0,a0,2
	j LBB48
LBB47:
	add a0,t2,a1
	add a0,a0,t2
LBB48:
	addi sp,sp,120
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB49:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-120
LBB50:
	li s1,0
	li s2,19260817
LBB51:
	li a0,13
	sll a0,s2,a0
	xor a1,s2,a0
	li a0,17
	li a2,0
	slt a2,a1,a2
	xori a2,a2,1
	bnez a2,LBB52
	j LBB53
LBB52:
	sra a0,a1,a0
	j LBB54
LBB53:
	li a2,31
	sub a3,a2,a0
	li a2,1
	sll a3,a2,a3
	li a2,-2147483648
	xor a2,a1,a2
	sra a0,a2,a0
	or a0,a3,a0
LBB54:
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
	bnez a3,LBB55
	j LBB56
LBB55:
	sra a0,a1,a0
	j LBB57
LBB56:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a3,a1,a3
	sra a0,a3,a0
	or a0,a4,a0
LBB57:
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
	bnez a1,LBB58
	j LBB74
LBB58:
	li a1,13
	sll a1,a0,a1
	xor a1,a0,a1
	li a0,17
	li a2,0
	slt a2,a1,a2
	xori a2,a2,1
	bnez a2,LBB59
	j LBB60
LBB59:
	sra a0,a1,a0
	j LBB61
LBB60:
	li a2,31
	sub a3,a2,a0
	li a2,1
	sll a3,a2,a3
	li a2,-2147483648
	xor a2,a1,a2
	sra a0,a2,a0
	or a0,a3,a0
LBB61:
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
	bnez a3,LBB62
	j LBB63
LBB62:
	sra a0,a1,a0
	j LBB64
LBB63:
	li a3,31
	sub a4,a3,a0
	li a3,1
	sll a4,a3,a4
	li a3,-2147483648
	xor a3,a1,a3
	sra a0,a3,a0
	or a0,a4,a0
LBB64:
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
	bnez a4,LBB65
	j LBB66
LBB65:
	sra a0,a1,a0
	j LBB67
LBB66:
	li a4,31
	sub a5,a4,a0
	li a4,1
	sll a5,a4,a5
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a5,a0
LBB67:
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
	bnez a4,LBB68
	j LBB69
LBB68:
	sra a0,a1,a0
	j LBB70
LBB69:
	li a4,31
	sub a6,a4,a0
	li a4,1
	sll a6,a4,a6
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a6,a0
LBB70:
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
	bnez a4,LBB71
	j LBB72
LBB71:
	sra a0,a1,a0
	j LBB73
LBB72:
	li a4,31
	sub a6,a4,a0
	li a4,1
	sll a6,a4,a6
	li a4,-2147483648
	xor a4,a1,a4
	sra a0,a4,a0
	or a0,a6,a0
LBB73:
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
	j LBB51
LBB74:
LBB75:
	mv a0,s1
	addi sp,sp,120
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
