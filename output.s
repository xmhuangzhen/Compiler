	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB40:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-84
LBB41:
	li a0,48004
	call malloc
	li a1,12000
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(xlist)
	sw a1,%lo(xlist)(a0)
	li a0,48004
	call malloc
	li a1,12000
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(ylist)
	sw a1,%lo(ylist)(a0)
	li a0,36
	call malloc
	li a1,8
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(dx)
	sw a1,%lo(dx)(a0)
	li a0,40
	call malloc
	li a1,9
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(dy)
	sw a1,%lo(dy)(a0)
	li a1,0
	lui a0,%hi(head)
	sw a1,%lo(head)(a0)
	li a1,0
	lui a0,%hi(tail)
	sw a1,%lo(tail)(a0)
	mv a0,s1
	call malloc
	li a1,106
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	lui a0,%hi(step)
	sw a1,%lo(step)(a0)
	li a1,0
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
LBB42:
	lui a0,%hi(i)
	lw a1,%lo(i)(a0)
	li a0,106
	blt a1,a0,LBB43
	j LBB47
LBB43:
	lui a0,%hi(step)
	lw a1,%lo(step)(a0)
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slli a0,a0,2
	add s2,a1,a0
	mv a0,s1
	call malloc
	li a1,106
	sw a1,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s2)
	li a1,0
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
LBB44:
	lui a0,%hi(j)
	lw a1,%lo(j)(a0)
	li a0,106
	blt a1,a0,LBB45
	j LBB46
LBB45:
	lui a0,%hi(step)
	lw a1,%lo(step)(a0)
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
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	addi a1,a0,1
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
	j LBB44
LBB46:
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	addi a1,a0,1
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
	j LBB42
LBB47:
	call getInt
	lui a1,%hi(N)
	sw a0,%lo(N)(a1)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	addi a1,a0,-1
	lui a0,%hi(targety)
	sw a1,%lo(targety)(a0)
	lui a0,%hi(targety)
	lw a1,%lo(targety)(a0)
	lui a0,%hi(targetx)
	sw a1,%lo(targetx)(a0)
	li a1,0
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
LBB48:
	lui a0,%hi(i)
	lw a1,%lo(i)(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt a1,a0,LBB49
	j LBB53
LBB49:
	li a1,0
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
LBB50:
	lui a0,%hi(j)
	lw a1,%lo(j)(a0)
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt a1,a0,LBB51
	j LBB52
LBB51:
	lui a0,%hi(step)
	lw a1,%lo(step)(a0)
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	slli a0,a0,2
	add a1,a1,a0
	li a0,-1
	sw a0,0(a1)
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	addi a1,a0,1
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
	j LBB50
LBB52:
	lui a0,%hi(i)
	lw a0,%lo(i)(a0)
	addi a1,a0,1
	lui a0,%hi(i)
	sw a1,%lo(i)(a0)
	j LBB48
LBB53:
	lui a0,%hi(dx)
	lw a0,%lo(dx)(a0)
	addi a1,a0,0
	li a0,-2
	sw a0,0(a1)
	lui a0,%hi(dy)
	lw a0,%lo(dy)(a0)
	addi a1,a0,0
	li a0,-1
	sw a0,0(a1)
	lui a0,%hi(dx)
	lw a0,%lo(dx)(a0)
	addi a1,a0,4
	li a0,-2
	sw a0,0(a1)
	lui a0,%hi(dy)
	lw a0,%lo(dy)(a0)
	addi a1,a0,4
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(dx)
	lw a0,%lo(dx)(a0)
	addi a1,a0,8
	li a0,2
	sw a0,0(a1)
	lui a0,%hi(dy)
	lw a0,%lo(dy)(a0)
	addi a1,a0,8
	li a0,-1
	sw a0,0(a1)
	lui a0,%hi(dx)
	lw a0,%lo(dx)(a0)
	addi a1,a0,12
	li a0,2
	sw a0,0(a1)
	lui a0,%hi(dy)
	lw a0,%lo(dy)(a0)
	addi a1,a0,12
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(dx)
	lw a0,%lo(dx)(a0)
	addi a1,a0,16
	li a0,-1
	sw a0,0(a1)
	lui a0,%hi(dy)
	lw a0,%lo(dy)(a0)
	addi a1,a0,16
	li a0,-2
	sw a0,0(a1)
	lui a0,%hi(dx)
	lw a0,%lo(dx)(a0)
	addi a1,a0,20
	li a0,-1
	sw a0,0(a1)
	lui a0,%hi(dy)
	lw a0,%lo(dy)(a0)
	addi a1,a0,20
	li a0,2
	sw a0,0(a1)
	lui a0,%hi(dx)
	lw a0,%lo(dx)(a0)
	addi a1,a0,24
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(dy)
	lw a0,%lo(dy)(a0)
	addi a1,a0,24
	li a0,-2
	sw a0,0(a1)
	lui a0,%hi(dx)
	lw a0,%lo(dx)(a0)
	addi a1,a0,28
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(dy)
	lw a0,%lo(dy)(a0)
	addi a1,a0,28
	li a0,2
	sw a0,0(a1)
LBB54:
	lui a0,%hi(head)
	lw a1,%lo(head)(a0)
	lui a0,%hi(tail)
	lw a0,%lo(tail)(a0)
	ble a1,a0,LBB55
	j LBB80
LBB55:
	lui a0,%hi(xlist)
	lw a1,%lo(xlist)(a0)
	lui a0,%hi(head)
	lw a0,%lo(head)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(x)
	sw a1,%lo(x)(a0)
	lui a0,%hi(ylist)
	lw a1,%lo(ylist)(a0)
	lui a0,%hi(head)
	lw a0,%lo(head)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(y)
	sw a1,%lo(y)(a0)
	lui a0,%hi(step)
	lw a1,%lo(step)(a0)
	lui a0,%hi(x)
	lw a0,%lo(x)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(y)
	lw a0,%lo(y)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(now)
	sw a1,%lo(now)(a0)
	li a1,0
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
LBB56:
	lui a0,%hi(j)
	lw a1,%lo(j)(a0)
	li a0,8
	blt a1,a0,LBB57
	j LBB77
LBB57:
	lui a0,%hi(x)
	lw a2,%lo(x)(a0)
	lui a0,%hi(dx)
	lw a1,%lo(dx)(a0)
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a0,0(a0)
	add a2,a2,a0
	lui a0,%hi(y)
	lw a3,%lo(y)(a0)
	lui a0,%hi(dy)
	lw a1,%lo(dy)(a0)
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a0,0(a0)
	add a1,a3,a0
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt a2,a0,LBB59
	j LBB58
LBB58:
	li a0,0
	j LBB60
LBB59:
	li a0,0
	slt a0,a2,a0
	xori a0,a0,1
LBB60:
	bnez a0,LBB62
	j LBB61
LBB61:
	li a0,0
	j LBB66
LBB62:
	lui a0,%hi(N)
	lw a0,%lo(N)(a0)
	blt a1,a0,LBB64
	j LBB63
LBB63:
	li a0,0
	j LBB65
LBB64:
	li a0,0
	slt a0,a1,a0
	xori a0,a0,1
LBB65:
LBB66:
	bnez a0,LBB68
	j LBB67
LBB67:
	li a0,0
	j LBB69
LBB68:
	lui a0,%hi(step)
	lw a3,%lo(step)(a0)
	slli a0,a2,2
	add a0,a3,a0
	lw a3,0(a0)
	slli a0,a1,2
	add a0,a3,a0
	lw a3,0(a0)
	li a0,-1
	xor a0,a3,a0
	seqz a0,a0
LBB69:
	bnez a0,LBB70
	j LBB76
LBB70:
	lui a0,%hi(tail)
	lw a0,%lo(tail)(a0)
	addi a3,a0,1
	lui a0,%hi(tail)
	sw a3,%lo(tail)(a0)
	lui a0,%hi(xlist)
	lw a3,%lo(xlist)(a0)
	lui a0,%hi(tail)
	lw a0,%lo(tail)(a0)
	slli a0,a0,2
	add a0,a3,a0
	sw a2,0(a0)
	lui a0,%hi(ylist)
	lw a3,%lo(ylist)(a0)
	lui a0,%hi(tail)
	lw a0,%lo(tail)(a0)
	slli a0,a0,2
	add a0,a3,a0
	sw a1,0(a0)
	lui a0,%hi(step)
	lw a3,%lo(step)(a0)
	slli a0,a2,2
	add a0,a3,a0
	lw a3,0(a0)
	slli a0,a1,2
	add a3,a3,a0
	lui a0,%hi(now)
	lw a0,%lo(now)(a0)
	addi a0,a0,1
	sw a0,0(a3)
	lui a0,%hi(targetx)
	lw a0,%lo(targetx)(a0)
	beq a2,a0,LBB72
	j LBB71
LBB71:
	li a0,0
	j LBB73
LBB72:
	lui a0,%hi(targety)
	lw a0,%lo(targety)(a0)
	xor a0,a1,a0
	seqz a0,a0
LBB73:
	bnez a0,LBB74
	j LBB75
LBB74:
	li a1,1
	lui a0,%hi(ok)
	sw a1,%lo(ok)(a0)
LBB75:
LBB76:
	lui a0,%hi(j)
	lw a0,%lo(j)(a0)
	addi a1,a0,1
	lui a0,%hi(j)
	sw a1,%lo(j)(a0)
	j LBB56
LBB77:
	lui a0,%hi(ok)
	lw a1,%lo(ok)(a0)
	li a0,1
	beq a1,a0,LBB78
	j LBB79
LBB78:
	j LBB80
LBB79:
	lui a0,%hi(head)
	lw a0,%lo(head)(a0)
	addi a1,a0,1
	lui a0,%hi(head)
	sw a1,%lo(head)(a0)
	j LBB54
LBB80:
	lui a0,%hi(ok)
	lw a1,%lo(ok)(a0)
	li a0,1
	beq a1,a0,LBB81
	j LBB82
LBB81:
	lui a0,%hi(step)
	lw a1,%lo(step)(a0)
	lui a0,%hi(targetx)
	lw a0,%lo(targetx)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a1,0(a0)
	lui a0,%hi(targety)
	lw a0,%lo(targety)(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a0,0(a0)
	call toString
	call println
	j LBB83
LBB82:
	la a0,const_string_no0
	call print
LBB83:
LBB84:
	li a0,0
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
N:
	.word	0

	.p2align	2
head:
	.word	0

	.p2align	2
startx:
	.word	0

	.p2align	2
starty:
	.word	0

	.p2align	2
targetx:
	.word	0

	.p2align	2
targety:
	.word	0

	.p2align	2
x:
	.word	0

	.p2align	2
y:
	.word	0

	.p2align	2
xlist:
	.word	0

	.p2align	2
ylist:
	.word	0

	.p2align	2
tail:
	.word	0

	.p2align	2
ok:
	.word	0

	.p2align	2
now:
	.word	0

	.p2align	2
dx:
	.word	0

	.p2align	2
dy:
	.word	0

	.p2align	2
step:
	.word	0

	.p2align	2
i:
	.word	0

	.p2align	2
j:
	.word	0

const_string_no0:
	.asciz	"no solution!\n"

