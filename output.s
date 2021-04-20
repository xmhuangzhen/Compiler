	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB25:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	vector.init					# start function : vector.init
	.p2align	2
vector.init:
#LBB44:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s2,a0
	mv s3,a1
	li a0,0
	xor a0,s3,a0
	seqz a0,a0
	bnez a0,LBB45
	j LBB46
LBB45:
	j LBB51
LBB46:
	addi s4,s2,0
	addi a0,s3,-4
	lw s5,0(a0)
	li a0,4
	mul a0,s5,a0
	addi a0,a0,4
	call malloc
	sw s5,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s4)
	li a0,0
LBB47:
	addi a1,s3,-4
	lw a1,0(a1)
	slt a1,a0,a1
	bnez a1,LBB48
	j LBB50
LBB48:
	addi a1,s2,0
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	slli a1,a0,2
	add a1,s3,a1
	lw a1,0(a1)
	sw a1,0(a2)
LBB49:
	addi a0,a0,1
	j LBB47
LBB50:
LBB51:
	mv a0,s1
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : vector.init
	.globl	vector.getDim					# start function : vector.getDim
	.p2align	2
vector.getDim:
#LBB52:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	addi a1,a0,0
	lw a2,0(a1)
	li a1,0
	xor a1,a2,a1
	seqz a1,a1
	bnez a1,LBB53
	j LBB54
LBB53:
	li a0,0
	j LBB55
LBB54:
	addi a0,a0,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
LBB55:
	addi sp,sp,80
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : vector.getDim
	.globl	vector.tostring					# start function : vector.tostring
	.p2align	2
vector.tostring:
#LBB56:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-88
	mv s3,a0
	la s1,const_string_no0
	mv a0,s3
	call vector.getDim
	li a1,0
	slt a0,a1,a0
	bnez a0,LBB58
	j LBB57
LBB57:
	j LBB59
LBB58:
	addi a0,s3,0
	lw a0,0(a0)
	addi a0,a0,0
	lw a0,0(a0)
	call toString
	mv a1,a0
	mv a0,s1
	call __string_add
	mv s1,a0
LBB59:
	li s2,1
LBB60:
	mv a0,s3
	call vector.getDim
	slt a0,s2,a0
	bnez a0,LBB61
	j LBB63
LBB61:
	la a1,const_string_no1
	mv a0,s1
	call __string_add
	mv s1,a0
	addi a0,s3,0
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a0,0(a0)
	call toString
	mv a1,a0
	mv a0,s1
	call __string_add
LBB62:
	addi s2,s2,1
	mv s1,a0
	j LBB60
LBB63:
	la a1,const_string_no2
	mv a0,s1
	call __string_add
LBB64:
	addi sp,sp,88
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : vector.tostring
	.globl	main					# start function : main
	.p2align	2
main:
#LBB65:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-88
	call __init__
	li a0,4
	call malloc
	addi s1,a0,0
	li a0,44
	call malloc
	li a1,10
	sw a1,0(a0)
	addi a0,a0,4
	addi a1,a0,0
	li a0,0
LBB66:
	li a2,10
	slt a2,a0,a2
	bnez a2,LBB67
	j LBB69
LBB67:
	slli a2,a0,2
	add a3,a1,a2
	li a2,9
	sub a2,a2,a0
	sw a2,0(a3)
LBB68:
	addi a0,a0,1
	j LBB66
LBB69:
	mv a0,s1
	call vector.init
	la a0,const_string_no3
	call print
	mv a0,s1
	call vector.tostring
	call println
	li a0,0
LBB70:
	addi sp,sp,88
	lw s1,-12(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	"( "

const_string_no1:
	.asciz	", "

const_string_no2:
	.asciz	" )"

const_string_no3:
	.asciz	"vector x: "

