	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-84
LBB1:
LBB2:
LBB3:
	li s1,0
LBB4:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s1,a0,LBB5
LBB6:
LBB13:
	li s1,0
LBB14:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s1,a0,LBB15
LBB16:
LBB23:
	lui a0,%hi(N)
	lw a1,%lo(N)(a0)
	li a0,2
	div s1,a1,a0
LBB24:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s1,a0,LBB25
LBB26:
LBB33:
	li s1,0
LBB34:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s1,a0,LBB35
LBB36:
LBB47:
	li s1,0
LBB48:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s1,a0,LBB49
LBB50:
LBB61:
	li s1,0
LBB62:
	lui a0,%hi(P)
	lw a0,%lo(P)(a0)
	blt s1,a0,LBB63
LBB64:
	li a0,0
LBB80:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB63:
LBB65:
	li s2,0
LBB66:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt s2,a0,LBB67
LBB68:
LBB79:
	addi s1,s1,1
	j LBB62
LBB67:
LBB69:
	mv s3,s2
LBB70:
	lui a0,%hi(M)
	lw a0,%lo(M)(a0)
LBB71:
	li a1,2
	mul a1,s2,a1
	blt a1,a0,LBB72
LBB73:
	li a1,2
	mul a1,a1,a0
	li a0,2
	mul a0,a0,s2
	sub a0,a1,a0
LBB74:
	blt s3,a0,LBB75
LBB76:
LBB78:
	addi s2,s2,1
	j LBB66
LBB75:
	lui a0,%hi(P)
	lw a0,%lo(P)(a0)
	mul a0,s2,a0
	add a0,a0,s3
	call printInt
LBB77:
	addi s3,s3,1
	j LBB70
LBB72:
	li a0,2
	mul a0,s2,a0
	j LBB74
LBB49:
LBB51:
	mv s2,s1
LBB52:
	lui a0,%hi(M)
	lw a0,%lo(M)(a0)
LBB53:
	li a1,2
	mul a1,s1,a1
	blt a1,a0,LBB54
LBB55:
	li a1,2
	mul a1,a1,a0
	li a0,2
	mul a0,a0,s1
	sub a0,a1,a0
LBB56:
	blt s2,a0,LBB57
LBB58:
LBB60:
	addi s1,s1,1
	j LBB48
LBB57:
	lui a0,%hi(P)
	lw a0,%lo(P)(a0)
	mul a0,s1,a0
	add a0,a0,s2
	call printInt
LBB59:
	addi s2,s2,1
	j LBB52
LBB54:
	li a0,2
	mul a0,s1,a0
	j LBB56
LBB35:
LBB37:
	mv s2,s1
LBB38:
	lui a0,%hi(M)
	lw a0,%lo(M)(a0)
LBB39:
	li a1,2
	mul a1,s1,a1
	blt a1,a0,LBB40
LBB41:
LBB42:
	blt s2,a0,LBB43
LBB44:
LBB46:
	addi s1,s1,1
	j LBB34
LBB43:
	lui a0,%hi(P)
	lw a0,%lo(P)(a0)
	mul a0,s1,a0
	add a0,a0,s2
	call printInt
LBB45:
	addi s2,s2,1
	j LBB38
LBB40:
	li a0,2
	mul a0,s1,a0
	j LBB42
LBB25:
LBB27:
	mv s2,s1
LBB28:
	lui a0,%hi(M)
	lw a1,%lo(M)(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	add a0,a1,a0
	blt s2,a0,LBB29
LBB30:
LBB32:
	addi s1,s1,1
	j LBB24
LBB29:
	lui a0,%hi(P)
	lw a0,%lo(P)(a0)
	mul a1,s1,a0
	lui a0,%hi(Q)
	lw a0,%lo(Q)(a0)
	mul a0,s2,a0
	add a0,a1,a0
	call printInt
LBB31:
	addi s2,s2,1
	j LBB28
LBB15:
LBB17:
	mv s2,s1
LBB18:
	lui a0,%hi(M)
	lw a0,%lo(M)(a0)
	blt s2,a0,LBB19
LBB20:
LBB22:
	addi s1,s1,1
	j LBB14
LBB19:
	lui a0,%hi(P)
	lw a0,%lo(P)(a0)
	mul a0,s1,a0
	add a0,a0,s2
	call printInt
LBB21:
	addi s2,s2,1
	j LBB18
LBB5:
LBB7:
	li s2,0
LBB8:
	lui a0,%hi(M)
	lw a0,%lo(M)(a0)
	blt s2,a0,LBB9
LBB10:
LBB12:
	addi s1,s1,1
	j LBB4
LBB9:
	lui a0,%hi(P)
	lw a0,%lo(P)(a0)
	mul a0,s1,a0
	add a0,a0,s2
	call printInt
LBB11:
	addi s2,s2,1
	j LBB8
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
M:
	.word	0

	.p2align	2
N:
	.word	0

	.p2align	2
P:
	.word	0

	.p2align	2
Q:
	.word	0

