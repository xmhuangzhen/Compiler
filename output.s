	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
	li a1,0
	lui a0,%hi(ans)
	sw a1,%lo(ans)(a0)
	li a0,444
	call malloc
	li a1,110
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(visit)
	sw a1,%lo(visit)(a0)
	li a0,444
	call malloc
	li a1,110
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(pre)
	sw a1,%lo(pre)(a0)
	li a0,444
	call malloc
	li a1,110
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(f)
	sw a1,%lo(f)(a0)
LBB25:
	addi sp,sp,84
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	origin					# start function : origin
	.p2align	2
origin:
#LBB42:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s2,a0
	li a0,4
	mul a0,s2,a0
	addi a0,a0,4
	call malloc
	sw s2,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(c)
	sw a1,%lo(c)(a0)
	li a1,0
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
LBB43:
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slt a0,a0,s2
	bnez a0,LBB44
	j LBB50
LBB44:
	lui a0,%hi(c)
	lw a1,%lo(c)(a0)
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slli a0,a0,2
	add s3,a1,a0
	li a0,4
	mul a0,s2,a0
	addi a0,a0,4
	call malloc
	sw s2,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s3)
	li a1,0
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
LBB45:
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	slt a0,a0,s2
	bnez a0,LBB46
	j LBB48
LBB46:
	lui a0,%hi(c)
	lw a1,%lo(c)(a0)
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	slli a0,a0,2
	add a1,a1,a0
	li a0,0
	sw a0,0(a1)
LBB47:
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	addi a1,a0,1
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
	j LBB45
LBB48:
LBB49:
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	addi a1,a0,1
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
	j LBB43
LBB50:
LBB51:
	mv a0,s1
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : origin
	.globl	main					# start function : main
	.p2align	2
main:
#LBB52:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-84
	call __init__
	li a0,110
	call origin
LBB53:
	li a0,99
	li a1,100
	li a3,1
	lui a2,%hi(i)
	sw a3,%lo(i)(a2)
LBB54:
	lui a2,%hi(i)
	lw a3,%lo(i)(a2)
	li a2,49
	slt a2,a2,a3
	xori a2,a2,1
	bnez a2,LBB55
	j LBB61
LBB55:
	li a3,50
	lui a2,%hi(j)
	sw a3,%lo(j)(a2)
LBB56:
	lui a2,%hi(j)
	lw a4,%lo(j)(a2)
	lui a2,%hi(i)
	lw a3,%lo(i)(a2)
	li a2,99
	sub a2,a2,a3
	slt a2,a2,a4
	xori a2,a2,1
	bnez a2,LBB57
	j LBB59
LBB57:
	lui a2,%hi(c)
	lw a3,%lo(c)(a2)
	lui a2,%hi(i)
	lw a2,%lo(i)(a2)
	slli a2,a2,2
	add a2,a3,a2
	lw a3,0(a2)
	lui a2,%hi(j)
	lw a2,%lo(j)(a2)
	slli a2,a2,2
	add a3,a3,a2
	li a2,1
	sw a2,0(a3)
LBB58:
	lui a2,%hi(j)
	lw a2,%lo(j)(a2)
	addi a3,a2,1
	lui a2,%hi(j)
	sw a3,%lo(j)(a2)
	j LBB56
LBB59:
LBB60:
	lui a2,%hi(i)
	lw a2,%lo(i)(a2)
	addi a3,a2,1
	lui a2,%hi(i)
	sw a3,%lo(i)(a2)
	j LBB54
LBB61:
	li a3,1
	lui a2,%hi(i)
	sw a3,%lo(i)(a2)
LBB62:
	lui a2,%hi(i)
	lw a3,%lo(i)(a2)
	li a2,49
	slt a2,a2,a3
	xori a2,a2,1
	bnez a2,LBB63
	j LBB65
LBB63:
	lui a2,%hi(c)
	lw a3,%lo(c)(a2)
	slli a2,a0,2
	add a2,a3,a2
	lw a3,0(a2)
	lui a2,%hi(i)
	lw a2,%lo(i)(a2)
	slli a2,a2,2
	add a3,a3,a2
	li a2,1
	sw a2,0(a3)
LBB64:
	lui a2,%hi(i)
	lw a2,%lo(i)(a2)
	addi a3,a2,1
	lui a2,%hi(i)
	sw a3,%lo(i)(a2)
	j LBB62
LBB65:
	li a2,50
	lui a0,%hi(i)
	sw a2,%lo(i)(a0)
LBB66:
	lui a0,%hi(i)
	lw a2,%lo(i)(a0)
	li a0,98
	slt a0,a0,a2
	xori a0,a0,1
	bnez a0,LBB67
	j LBB69
LBB67:
	lui a0,%hi(c)
	lw a2,%lo(c)(a0)
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slli a0,a0,2
	add a0,a2,a0
	lw a2,0(a0)
	slli a0,a1,2
	add a2,a2,a0
	li a0,1
	sw a0,0(a2)
LBB68:
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	addi a2,a0,1
	lui a0,%hi(i)
	sw a2,%lo(i)(a0)
	j LBB66
LBB69:
LBB70:
LBB71:
	li a1,100
	li a0,99
	li a3,0
	lui a2,%hi(open)
	sw a3,%lo(open)(a2)
	li a3,1
	lui a2,%hi(closed)
	sw a3,%lo(closed)(a2)
	li a3,1
	lui a2,%hi(i)
	sw a3,%lo(i)(a2)
LBB72:
	lui a2,%hi(i)
	lw a2,%lo(i)(a2)
	slt a2,a1,a2
	xori a2,a2,1
	bnez a2,LBB73
	j LBB75
LBB73:
	lui a2,%hi(visit)
	lw a3,%lo(visit)(a2)
	lui a2,%hi(i)
	lw a2,%lo(i)(a2)
	slli a2,a2,2
	add a3,a3,a2
	li a2,0
	sw a2,0(a3)
LBB74:
	lui a2,%hi(i)
	lw a2,%lo(i)(a2)
	addi a3,a2,1
	lui a2,%hi(i)
	sw a3,%lo(i)(a2)
	j LBB72
LBB75:
	lui a2,%hi(f)
	lw a2,%lo(f)(a2)
	addi a2,a2,4
	sw a0,0(a2)
	lui a2,%hi(visit)
	lw a3,%lo(visit)(a2)
	slli a2,a0,2
	add a3,a3,a2
	li a2,1
	sw a2,0(a3)
	lui a2,%hi(pre)
	lw a2,%lo(pre)(a2)
	slli a0,a0,2
	add a2,a2,a0
	li a0,0
	sw a0,0(a2)
	li a0,0
LBB76:
	lui a2,%hi(open)
	lw a3,%lo(open)(a2)
	lui a2,%hi(closed)
	lw a2,%lo(closed)(a2)
	slt a3,a3,a2
	bnez a3,LBB77
	j LBB78
LBB77:
	li a2,0
	xor a2,a0,a2
	seqz s2,a2
LBB78:
	and a2,a3,s2
	bnez a2,LBB79
	j LBB92
LBB79:
	lui a2,%hi(open)
	lw a2,%lo(open)(a2)
	addi a3,a2,1
	lui a2,%hi(open)
	sw a3,%lo(open)(a2)
	lui a2,%hi(f)
	lw a3,%lo(f)(a2)
	lui a2,%hi(open)
	lw a2,%lo(open)(a2)
	slli a2,a2,2
	add a2,a3,a2
	lw a3,0(a2)
	lui a2,%hi(i)
	sw a3,%lo(i)(a2)
	li a3,1
	lui a2,%hi(j)
	sw a3,%lo(j)(a2)
LBB80:
	lui a2,%hi(j)
	lw a2,%lo(j)(a2)
	slt a2,a1,a2
	xori a2,a2,1
	bnez a2,LBB81
	j LBB91
LBB81:
	lui a2,%hi(c)
	lw a3,%lo(c)(a2)
	lui a2,%hi(i)
	lw a2,%lo(i)(a2)
	slli a2,a2,2
	add a2,a3,a2
	lw a3,0(a2)
	lui a2,%hi(j)
	lw a2,%lo(j)(a2)
	slli a2,a2,2
	add a2,a3,a2
	lw a3,0(a2)
	li a2,0
	slt a4,a2,a3
	bnez a4,LBB82
	j LBB83
LBB82:
	lui a2,%hi(visit)
	lw a3,%lo(visit)(a2)
	lui a2,%hi(j)
	lw a2,%lo(j)(a2)
	slli a2,a2,2
	add a2,a3,a2
	lw a3,0(a2)
	li a2,0
	xor a2,a3,a2
	seqz s1,a2
LBB83:
	and a2,a4,s1
	bnez a2,LBB85
	j LBB84
LBB84:
	j LBB89
LBB85:
	lui a2,%hi(visit)
	lw a3,%lo(visit)(a2)
	lui a2,%hi(j)
	lw a2,%lo(j)(a2)
	slli a2,a2,2
	add a3,a3,a2
	li a2,1
	sw a2,0(a3)
	lui a2,%hi(closed)
	lw a2,%lo(closed)(a2)
	addi a3,a2,1
	lui a2,%hi(closed)
	sw a3,%lo(closed)(a2)
	lui a2,%hi(f)
	lw a3,%lo(f)(a2)
	lui a2,%hi(closed)
	lw a2,%lo(closed)(a2)
	slli a2,a2,2
	add a3,a3,a2
	lui a2,%hi(j)
	lw a2,%lo(j)(a2)
	sw a2,0(a3)
	lui a2,%hi(pre)
	lw a3,%lo(pre)(a2)
	lui a2,%hi(j)
	lw a2,%lo(j)(a2)
	slli a2,a2,2
	add a3,a3,a2
	lui a2,%hi(i)
	lw a2,%lo(i)(a2)
	sw a2,0(a3)
	lui a2,%hi(closed)
	lw a2,%lo(closed)(a2)
	xor a2,a2,a1
	seqz a2,a2
	bnez a2,LBB87
	j LBB86
LBB86:
	j LBB88
LBB87:
	li a0,1
LBB88:
LBB89:
LBB90:
	lui a2,%hi(j)
	lw a2,%lo(j)(a2)
	addi a3,a2,1
	lui a2,%hi(j)
	sw a3,%lo(j)(a2)
	j LBB80
LBB91:
	j LBB76
LBB92:
LBB93:
	li a1,0
	slt a0,a1,a0
	bnez a0,LBB94
	j LBB100
LBB94:
LBB95:
	li a0,100
	lui a1,%hi(i)
	sw a0,%lo(i)(a1)
	lui a0,%hi(ans)
	lw a0,%lo(ans)(a0)
	addi a1,a0,1
	lui a0,%hi(ans)
	sw a1,%lo(ans)(a0)
LBB96:
	lui a0,%hi(pre)
	lw a1,%lo(pre)(a0)
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	li a0,0
	slt a0,a0,a1
	bnez a0,LBB97
	j LBB98
LBB97:
	lui a0,%hi(pre)
	lw a1,%lo(pre)(a0)
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
	lui a0,%hi(c)
	lw a1,%lo(c)(a0)
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slli a0,a0,2
	add a1,a1,a0
	lw a0,0(a1)
	addi a0,a0,-1
	sw a0,0(a1)
	lui a0,%hi(c)
	lw a1,%lo(c)(a0)
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	slli a0,a0,2
	add a1,a1,a0
	lw a0,0(a1)
	addi a0,a0,1
	sw a0,0(a1)
	lui a0,%hi(j)
	lw a1,%lo(j)(a0)
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
	j LBB96
LBB98:
LBB99:
	j LBB70
LBB100:
	lui a0,%hi(ans)
	lw a0,%lo(ans)(a0)
LBB101:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
c:
	.word	0

	.p2align	2
ans:
	.word	0

	.p2align	2
visit:
	.word	0

	.p2align	2
pre:
	.word	0

	.p2align	2
f:
	.word	0

	.p2align	2
i:
	.word	0

	.p2align	2
j:
	.word	0

	.p2align	2
open:
	.word	0

	.p2align	2
closed:
	.word	0

