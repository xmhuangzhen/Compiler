	.text
	.globl	cd					# start function : cd
	.p2align	2
cd:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	mv s0,sp
	addi sp,sp,-100
	mv s1,a0
	mv s3,a1
	mv s5,a2
	mv s4,a3
	mv s6,a4
	li a0,1
	beq s1,a0,LBB1
LBB2:
	addi a0,s1,-1
	li a1,1
	beq a0,a1,LBB4
LBB5:
	addi s2,a0,-1
	mv a0,s2
	mv a1,s3
	mv a2,s5
	mv a3,s4
	mv a4,s6
	call cd
	mv s6,a0
	la a0,const_string_no0
	mv a1,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s5
	call __string_add
	call println
	mv a0,s2
	mv a1,s4
	mv a2,s3
	mv a3,s5
	mv a4,s6
	call cd
	addi s2,a0,1
LBB6:
	la a0,const_string_no0
	mv a1,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s4
	call __string_add
	call println
	addi s1,s1,-1
	li a0,1
	beq s1,a0,LBB7
LBB8:
	addi a0,s1,-1
	li a1,1
	beq a0,a1,LBB10
LBB11:
	addi s6,a0,-1
	mv a0,s6
	mv a1,s5
	mv a2,s3
	mv a3,s4
	mv a4,s2
	call cd
	mv s2,a0
	la a0,const_string_no0
	mv a1,s5
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s3
	call __string_add
	call println
	mv a0,s6
	mv a1,s4
	mv a2,s5
	mv a3,s3
	mv a4,s2
	call cd
	addi s2,a0,1
LBB12:
	la a0,const_string_no0
	mv a1,s5
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s4
	call __string_add
	call println
	addi a0,s1,-1
	mv a1,s3
	mv a2,s5
	mv a3,s4
	mv a4,s2
	call cd
	addi a0,a0,1
LBB9:
	addi a0,a0,1
LBB3:
LBB13:
	addi sp,sp,100
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB10:
	la a0,const_string_no0
	mv a1,s5
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s3
	call __string_add
	call println
	addi s2,s2,1
	j LBB12
LBB7:
	la a0,const_string_no0
	mv a1,s5
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s4
	call __string_add
	call println
	addi a0,s2,1
	j LBB9
LBB4:
	la a0,const_string_no0
	mv a1,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s5
	call __string_add
	call println
	addi s2,s6,1
	j LBB6
LBB1:
	la a0,const_string_no0
	mv a1,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s4
	call __string_add
	call println
	addi a0,s6,1
	j LBB3
# end function : cd
	.globl	main					# start function : main
	.p2align	2
main:
#LBB14:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	mv s0,sp
	addi sp,sp,-100
LBB15:
	la s4,const_string_no2
	la s3,const_string_no3
	la s5,const_string_no4
	call getInt
	mv s1,a0
	li a0,1
	beq s1,a0,LBB16
LBB17:
	addi a0,s1,-1
	li a1,1
	beq a0,a1,LBB19
LBB20:
	addi s2,a0,-1
	mv a0,s2
	mv a1,s4
	mv a2,s3
	mv a3,s5
	li a4,0
	call cd
	mv s6,a0
	la a0,const_string_no0
	mv a1,s4
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s3
	call __string_add
	call println
	mv a0,s2
	mv a1,s5
	mv a2,s4
	mv a3,s3
	mv a4,s6
	call cd
	addi s2,a0,1
LBB21:
	la a0,const_string_no0
	mv a1,s4
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s5
	call __string_add
	call println
	addi s1,s1,-1
	li a0,1
	beq s1,a0,LBB22
LBB23:
	addi a0,s1,-1
	li a1,1
	beq a0,a1,LBB25
LBB26:
	addi s6,a0,-1
	mv a0,s6
	mv a1,s3
	mv a2,s4
	mv a3,s5
	mv a4,s2
	call cd
	mv s2,a0
	la a0,const_string_no0
	mv a1,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s4
	call __string_add
	call println
	mv a0,s6
	mv a1,s5
	mv a2,s3
	mv a3,s4
	mv a4,s2
	call cd
	addi s2,a0,1
LBB27:
	la a0,const_string_no0
	mv a1,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s5
	call __string_add
	call println
	addi a0,s1,-1
	mv a1,s4
	mv a2,s3
	mv a3,s5
	mv a4,s2
	call cd
	addi a0,a0,1
LBB24:
	addi a0,a0,1
LBB18:
	call toString
	call println
	li a0,0
LBB28:
	addi sp,sp,100
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB25:
	la a0,const_string_no0
	mv a1,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s4
	call __string_add
	call println
	addi s2,s2,1
	j LBB27
LBB22:
	la a0,const_string_no0
	mv a1,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s5
	call __string_add
	call println
	addi a0,s2,1
	j LBB24
LBB19:
	la a0,const_string_no0
	mv a1,s4
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s3
	call __string_add
	call println
	li s2,1
	j LBB21
LBB16:
	la a0,const_string_no0
	mv a1,s4
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv a1,s5
	call __string_add
	call println
	li a0,1
	j LBB18
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

