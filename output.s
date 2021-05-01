	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB0:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB1:
LBB2:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	partition					# start function : partition
	.p2align	2
partition:
#LBB3:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB4:
	slli a3,a2,2
	add a3,a0,a3
	lw a7,0(a3)
	addi a3,a1,-1
LBB5:
	blt a1,a2,LBB6
LBB7:
	addi a1,a3,1
	slli a3,a1,2
	add a3,a0,a3
	lw a5,0(a3)
	slli a3,a1,2
	add a4,a0,a3
	slli a3,a2,2
	add a3,a0,a3
	lw a3,0(a3)
	sw a3,0(a4)
	slli a2,a2,2
	add a0,a0,a2
	sw a5,0(a0)
LBB11:
	mv a0,a1
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB6:
	slli a4,a1,2
	add a4,a0,a4
	lw a4,0(a4)
	ble a4,a7,LBB8
LBB9:
LBB10:
	addi a1,a1,1
	j LBB5
LBB8:
	addi a3,a3,1
	slli a4,a3,2
	add a4,a0,a4
	lw a6,0(a4)
	slli a4,a3,2
	add a5,a0,a4
	slli a4,a1,2
	add a4,a0,a4
	lw a4,0(a4)
	sw a4,0(a5)
	slli a4,a1,2
	add a4,a0,a4
	sw a6,0(a4)
	j LBB10
# end function : partition
	.globl	quick_sort					# start function : quick_sort
	.p2align	2
quick_sort:
#LBB12:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	mv s0,sp
	addi sp,sp,-92
LBB13:
	mv s2,a0
	mv s3,a1
	mv s4,a2
	bge s3,s4,LBB14
LBB15:
	mv a0,s2
	mv a1,s3
	mv a2,s4
	call partition
	mv s5,a0
	addi a2,s5,-1
	mv a0,s2
	mv a1,s3
	call quick_sort
	addi s3,s5,1
	j LBB13
LBB14:
LBB16:
	mv a0,s1
	addi sp,sp,92
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : quick_sort
	.globl	quick_sort_inf					# start function : quick_sort_inf
	.p2align	2
quick_sort_inf:
#LBB17:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-92
LBB18:
	addi a1,a0,-4
	lw a1,0(a1)
	addi a2,a1,-1
	li a1,0
	call quick_sort
LBB19:
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
#LBB20:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	mv s0,sp
	addi sp,sp,-88
LBB21:
	call __init__
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
LBB22:
	blt s1,s3,LBB23
LBB24:
	mv a0,s2
	call quick_sort_inf
	li s1,0
LBB25:
	blt s1,s3,LBB26
LBB27:
	la a0,const_string_no1
	call println
	li a0,0
LBB28:
	addi sp,sp,88
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB26:
	slli a0,s1,2
	add a0,s2,a0
	lw a0,0(a0)
	call toString
	la a1,const_string_no0
	call __string_add
	call print
	addi s1,s1,1
	j LBB25
LBB23:
	slli a0,s1,2
	add s4,s2,a0
	call getInt
	sw a0,0(s4)
	addi s1,s1,1
	j LBB22
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	" "

const_string_no1:
	.asciz	""

