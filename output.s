	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB36:
	addi sp,sp,-64
	lw s0,0(sp)
	mv s0,s0
	sw s0,0(sp)
	lw s0,4(sp)
	mv s0,s1
	sw s0,4(sp)
	lw s0,8(sp)
	mv s0,s2
	sw s0,8(sp)
	lw s0,12(sp)
	mv s0,s3
	sw s0,12(sp)
	lw s0,16(sp)
	mv s0,s4
	sw s0,16(sp)
	lw s0,20(sp)
	mv s0,s5
	sw s0,20(sp)
	lw s0,24(sp)
	mv s0,s6
	sw s0,24(sp)
	lw s0,28(sp)
	mv s0,s7
	sw s0,28(sp)
	lw s0,32(sp)
	mv s0,s8
	sw s0,32(sp)
	lw s0,36(sp)
	mv s0,s9
	sw s0,36(sp)
	lw s0,40(sp)
	mv s0,s10
	sw s0,40(sp)
	lw s0,44(sp)
	mv s0,s11
	sw s0,44(sp)
	lw s0,48(sp)
	mv s0,ra
	sw s0,48(sp)
	j LBB38
LBB38:
	lw s0,48(sp)
	mv ra,s0
	sw s0,48(sp)
	addi sp,sp,64
	ret
# end function : __init__
	.globl	main					# start function : main
	.p2align	2
main:
#LBB63:
	addi sp,sp,-128
	lw s0,0(sp)
	mv s0,s0
	sw s0,0(sp)
	lw s0,4(sp)
	mv s0,s1
	sw s0,4(sp)
	lw s0,8(sp)
	mv s0,s2
	sw s0,8(sp)
	lw s0,12(sp)
	mv s0,s3
	sw s0,12(sp)
	lw s0,16(sp)
	mv s0,s4
	sw s0,16(sp)
	lw s0,20(sp)
	mv s0,s5
	sw s0,20(sp)
	lw s0,24(sp)
	mv s0,s6
	sw s0,24(sp)
	lw s0,28(sp)
	mv s0,s7
	sw s0,28(sp)
	lw s0,32(sp)
	mv s0,s8
	sw s0,32(sp)
	lw s0,36(sp)
	mv s0,s9
	sw s0,36(sp)
	lw s0,40(sp)
	mv s0,s10
	sw s0,40(sp)
	lw s0,44(sp)
	mv s0,s11
	sw s0,44(sp)
	lw s0,48(sp)
	mv s0,ra
	sw s0,48(sp)
	call __init__
	call getInt
	lw s0,52(sp)
	lui s0,%hi(n)
	sw s0,52(sp)
	lw s0,56(sp)
	lw s1,52(sp)
	mv s1,s0
	sw s0,56(sp)
	sw s1,52(sp)
	call getInt
	lw s0,60(sp)
	lui s0,%hi(m)
	sw s0,60(sp)
	lw s0,64(sp)
	lw s1,60(sp)
	mv s1,s0
	sw s0,64(sp)
	sw s1,60(sp)
	call getInt
	lw s0,68(sp)
	lui s0,%hi(a)
	sw s0,68(sp)
	lw s0,72(sp)
	lw s1,68(sp)
	mv s1,s0
	sw s0,72(sp)
	sw s1,68(sp)
	lw s0,76(sp)
	add s0,m,a
	sw s0,76(sp)
	lw s0,80(sp)
	lw s1,76(sp)
	addi s0,s1,-1
	sw s0,80(sp)
	sw s1,76(sp)
	lw s0,84(sp)
	lw s1,80(sp)
	div s0,s1,a
	sw s0,84(sp)
	sw s1,80(sp)
	lw s0,88(sp)
	add s0,n,a
	sw s0,88(sp)
	lw s0,92(sp)
	lw s1,88(sp)
	addi s0,s1,-1
	sw s0,92(sp)
	sw s1,88(sp)
	lw s0,96(sp)
	lw s1,92(sp)
	div s0,s1,a
	sw s0,96(sp)
	sw s1,92(sp)
	lw s0,100(sp)
	lw s1,84(sp)
	lw s2,96(sp)
	mul s0,s1,s2
	sw s0,100(sp)
	sw s1,84(sp)
	sw s2,96(sp)
	lw s0,100(sp)
	mv a0,s0
	sw s0,100(sp)
	call toString
	lw s0,104(sp)
	mv a0,s0
	sw s0,104(sp)
	call print
	lw s0,108(sp)
	li s0,0
	sw s0,108(sp)
	lw s0,108(sp)
	lw s1,112(sp)
	mv s1,s0
	sw s0,108(sp)
	sw s1,112(sp)
	j LBB64
LBB64:
	j LBB65
LBB65:
	lw s0,112(sp)
	mv a0,s0
	sw s0,112(sp)
	lw s0,48(sp)
	mv ra,s0
	sw s0,48(sp)
	addi sp,sp,128
	ret
# end function : main
	.globl	n
	.p2align	2
n:
	.word	0

	.globl	m
	.p2align	2
m:
	.word	0

	.globl	a
	.p2align	2
a:
	.word	0

