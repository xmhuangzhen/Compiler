	.text
	.global	__init__					# start function : __init__
	.p2align	2
__init__:
__init___entrance_block36:
	addi sp,sp,-64
	la s0,0(sp)
	mv s0,s0
	sw s0,0(sp)
	la s0,4(sp)
	mv s0,s1
	sw s0,4(sp)
	la s0,8(sp)
	mv s0,s2
	sw s0,8(sp)
	la s0,12(sp)
	mv s0,s3
	sw s0,12(sp)
	la s0,16(sp)
	mv s0,s4
	sw s0,16(sp)
	la s0,20(sp)
	mv s0,s5
	sw s0,20(sp)
	la s0,24(sp)
	mv s0,s6
	sw s0,24(sp)
	la s0,28(sp)
	mv s0,s7
	sw s0,28(sp)
	la s0,32(sp)
	mv s0,s8
	sw s0,32(sp)
	la s0,36(sp)
	mv s0,s9
	sw s0,36(sp)
	la s0,40(sp)
	mv s0,s10
	sw s0,40(sp)
	la s0,44(sp)
	mv s0,s11
	sw s0,44(sp)
	la s0,48(sp)
	mv s0,ra
	sw s0,48(sp)
	j __init___return_block38
__init___return_block38:
	addi sp,sp,64
	ret
# end function : __init__
	.global	main					# start function : main
	.p2align	2
main:
main_entrance_block63:
	addi sp,sp,-80
	la s0,0(sp)
	mv s0,s0
	sw s0,0(sp)
	la s0,4(sp)
	mv s0,s1
	sw s0,4(sp)
	la s0,8(sp)
	mv s0,s2
	sw s0,8(sp)
	la s0,12(sp)
	mv s0,s3
	sw s0,12(sp)
	la s0,16(sp)
	mv s0,s4
	sw s0,16(sp)
	la s0,20(sp)
	mv s0,s5
	sw s0,20(sp)
	la s0,24(sp)
	mv s0,s6
	sw s0,24(sp)
	la s0,28(sp)
	mv s0,s7
	sw s0,28(sp)
	la s0,32(sp)
	mv s0,s8
	sw s0,32(sp)
	la s0,36(sp)
	mv s0,s9
	sw s0,36(sp)
	la s0,40(sp)
	mv s0,s10
	sw s0,40(sp)
	la s0,44(sp)
	mv s0,s11
	sw s0,44(sp)
	la s0,48(sp)
	mv s0,ra
	sw s0,48(sp)
	call __init__
	la s0,52(sp)
	la s0,const_string_no0
	sw s0,52(sp)
	la s0,52(sp)
	mv a0,s0
	sw s0,52(sp)
	call println
	la s0,56(sp)
	li s0,0
	sw s0,56(sp)
	la s0,56(sp)
	la s1,60(sp)
	sb s0,s1
	sw s0,56(sp)
	j main_last_block64
main_last_block64:
	j main_return_block65
main_return_block65:
	la s0,60(sp)
	mv a0,s0
	sw s0,60(sp)
	addi sp,sp,80
	ret
# end function : main
	.globl	const_string_no0
const_string_no0:
	.asciz	"\"\" "

