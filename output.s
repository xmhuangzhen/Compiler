	.text
	.globl	gcd2					# start function : gcd2
	.p2align	2
gcd2:
#LBB0:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-88
	rem a3,a0,a1
	li a2,0
	beq a3,a2,LBB1
	j LBB2
LBB1:
	j LBB3
LBB2:
	rem a0,a0,a1
	rem a3,a1,a0
	li a2,0
	beq a3,a2,LBB4
	j LBB5
LBB4:
	j LBB6
LBB5:
	rem a1,a1,a0
	rem a3,a0,a1
	li a2,0
	beq a3,a2,LBB7
	j LBB8
LBB7:
	j LBB9
LBB8:
	rem a0,a0,a1
	rem a3,a1,a0
	li a2,0
	beq a3,a2,LBB10
	j LBB11
LBB10:
	j LBB12
LBB11:
	rem a1,a1,a0
	rem a3,a0,a1
	li a2,0
	beq a3,a2,LBB13
	j LBB14
LBB13:
	j LBB15
LBB14:
	rem a0,a0,a1
	rem a3,a1,a0
	li a2,0
	beq a3,a2,LBB16
	j LBB17
LBB16:
	j LBB18
LBB17:
	rem a1,a1,a0
	rem a3,a0,a1
	li a2,0
	beq a3,a2,LBB19
	j LBB20
LBB19:
	j LBB21
LBB20:
	rem a0,a0,a1
	rem a3,a1,a0
	li a2,0
	beq a3,a2,LBB22
	j LBB23
LBB22:
	j LBB24
LBB23:
	rem a1,a1,a0
	rem a3,a0,a1
	li a2,0
	beq a3,a2,LBB25
	j LBB26
LBB25:
	j LBB27
LBB26:
	rem a0,a0,a1
	rem a3,a1,a0
	li a2,0
	beq a3,a2,LBB28
	j LBB29
LBB28:
	j LBB30
LBB29:
	rem a1,a1,a0
	rem a3,a0,a1
	li a2,0
	beq a3,a2,LBB31
	j LBB32
LBB31:
	j LBB33
LBB32:
	rem a0,a0,a1
	rem a3,a1,a0
	li a2,0
	beq a3,a2,LBB34
	j LBB35
LBB34:
	j LBB36
LBB35:
	rem a1,a1,a0
	rem a3,a0,a1
	li a2,0
	beq a3,a2,LBB37
	j LBB38
LBB37:
	j LBB39
LBB38:
	rem a0,a0,a1
	rem a3,a1,a0
	li a2,0
	beq a3,a2,LBB40
	j LBB41
LBB40:
	j LBB42
LBB41:
	rem a1,a1,a0
	rem a3,a0,a1
	li a2,0
	beq a3,a2,LBB43
	j LBB44
LBB43:
	j LBB45
LBB44:
	rem a0,a0,a1
	rem a3,a1,a0
	li a2,0
	beq a3,a2,LBB46
	j LBB47
LBB46:
	j LBB48
LBB47:
	rem a1,a1,a0
	call gcd2
LBB48:
	mv a1,a0
LBB45:
	mv a0,a1
LBB42:
	mv a1,a0
LBB39:
	mv a0,a1
LBB36:
	mv a1,a0
LBB33:
	mv a0,a1
LBB30:
	mv a1,a0
LBB27:
	mv a0,a1
LBB24:
	mv a1,a0
LBB21:
	mv a0,a1
LBB18:
	mv a1,a0
LBB15:
	mv a0,a1
LBB12:
	mv a1,a0
LBB9:
	mv a0,a1
LBB6:
	mv a1,a0
LBB3:
	mv a0,a1
	addi sp,sp,88
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : gcd2
	.globl	main					# start function : main
	.p2align	2
main:
#LBB49:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
LBB50:
	li a0,1
	call toString
	call println
	li a0,1029
	call toString
	call println
	li a0,171
	call toString
	call println
	li a0,0
LBB51:
	addi sp,sp,84
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
