	.text
	.globl	main					# start function : main
	.p2align	2
main:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-84
LBB1:
	li a0,4
	call malloc
	addi s1,a0,0
	li a0,-1
	sw a0,0(s1)
	lw a1,0(s1)
	li a0,-1
	beq a1,a0,LBB2
	j LBB3
LBB2:
	la a0,const_string_no0
	call println
LBB3:
	lw a0,0(s1)
	call printlnInt
	li a0,0
LBB4:
	addi sp,sp,84
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	"wtf"

