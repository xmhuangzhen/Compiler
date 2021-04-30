	.text
	.globl	quick_sort					# start function : quick_sort
	.p2align	2
quick_sort:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	mv s0,sp
	addi sp,sp,-92
LBB1:
	mv s3,a0
	mv s4,a2
	bge a1,s4,LBB2
LBB3:
	mv a2,a1
	slli a0,s4,2
	add a0,s3,a0
	lw a3,0(a0)
	addi a0,a2,-1
LBB5:
	blt a2,s4,LBB6
LBB7:
	addi s2,a0,1
	slli a0,s2,2
	add a0,s3,a0
	lw a3,0(a0)
	slli a0,s2,2
	add a2,s3,a0
	slli a0,s4,2
	add a0,s3,a0
	lw a0,0(a0)
	sw a0,0(a2)
	slli a0,s4,2
	add a0,s3,a0
	sw a3,0(a0)
	addi a2,s2,-1
	mv a0,s3
	call quick_sort
	addi a1,s2,1
	mv a0,s3
	mv a2,s4
	j LBB1
LBB4:
	mv a0,s1
	addi sp,sp,92
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB6:
	slli a4,a2,2
	add a4,s3,a4
	lw a4,0(a4)
	ble a4,a3,LBB8
LBB9:
LBB10:
	addi a2,a2,1
	j LBB5
LBB8:
	addi a0,a0,1
	slli a4,a0,2
	add a4,s3,a4
	lw a6,0(a4)
	slli a4,a0,2
	add a5,s3,a4
	slli a4,a2,2
	add a4,s3,a4
	lw a4,0(a4)
	sw a4,0(a5)
	slli a4,a2,2
	add a4,s3,a4
	sw a6,0(a4)
	j LBB10
LBB2:
	j LBB4
# end function : quick_sort
	.globl	quick_sort_inf					# start function : quick_sort_inf
	.p2align	2
quick_sort_inf:
#LBB11:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-92
LBB12:
	addi a1,a0,-4
	lw a1,0(a1)
	addi a2,a1,-1
	li a1,0
	call quick_sort
LBB13:
	mv a0,s1
	addi sp,sp,92
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : quick_sort_inf
	.globl	main					# start function : main
	.p2align	2
main:
#LBB14:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	mv s0,sp
	addi sp,sp,-88
LBB15:
LBB16:
	call getInt
	mv s3,a0
	li a0,4
	mul a0,s3,a0
	addi a0,a0,4
	call malloc
	sw s3,0(a0)
	addi a0,a0,4
	addi s2,a0,0
	li s1,0
LBB17:
	blt s1,s3,LBB18
LBB19:
	mv a0,s2
	call quick_sort_inf
	li s1,0
LBB20:
	blt s1,s3,LBB21
LBB22:
	la a0,const_string_no1
	call println
	li a0,0
LBB23:
	addi sp,sp,88
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB21:
	slli a0,s1,2
	add a0,s2,a0
	lw a0,0(a0)
	call toString
	la a1,const_string_no0
	call __string_add
	call print
	addi s1,s1,1
	j LBB20
LBB18:
	slli a0,s1,2
	add s4,s2,a0
	call getInt
	sw a0,0(s4)
	addi s1,s1,1
	j LBB17
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	" "

const_string_no1:
	.asciz	""

