	.text
	.globl	cd					# start function : cd
	.p2align	2
cd:
#LBB40:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	mv s0,sp
	addi sp,sp,-100
	mv s2,a0
	mv s3,a1
	mv s5,a2
	mv s4,a3
	mv s1,a4
	li a0,1
	xor a0,s2,a0
	seqz a0,a0
	bnez a0,LBB41
	j LBB42
LBB41:
	la a0,const_string_no0
	mv a1,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s4
	call __string_add
	call println
	addi s1,s1,1
	j LBB43
LBB42:
	addi a0,s2,-1
	mv a1,s3
	mv a2,s4
	mv a3,s5
	mv a4,s1
	call cd
	mv s1,a0
	la a0,const_string_no0
	mv a1,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s4
	call __string_add
	call println
	addi a0,s2,-1
	mv a1,s5
	mv a2,s3
	mv a3,s4
	mv a4,s1
	call cd
	mv s1,a0
	addi s1,s1,1
LBB43:
LBB44:
	mv a0,s1
	addi sp,sp,100
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : cd
	.globl	main					# start function : main
	.p2align	2
main:
#LBB45:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-100
LBB46:
LBB47:
LBB48:
	la s1,const_string_no2
	la s2,const_string_no3
	la s3,const_string_no4
	call getInt
	mv a1,s1
	mv a2,s2
	mv a3,s3
	li a4,0
	call cd
	call toString
	call println
	li a0,0
LBB49:
	addi sp,sp,100
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	"move "

const_string_no1:
	.asciz	" --> "

const_string_no2:
	.asciz	"A"

const_string_no3:
	.asciz	"B"

const_string_no4:
	.asciz	"C"

