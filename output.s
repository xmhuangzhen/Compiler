	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	mv s1,sp
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-40
	mv s0,sp
	addi sp,sp,-40
	j LBB25
LBB25:
	addi sp,sp,40
	addi sp,sp,40
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	work					# start function : work
	.p2align	2
work:
#LBB44:
	mv s1,sp
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-48
	mv s0,sp
	addi sp,sp,-48
	lw t0,36(s0)
	mv t0,a0
	sw t0,36(s0)
	lw t0,32(s0)
	lw t1,36(s0)
	mv t0,t1
	sw t0,32(s0)
	sw t1,36(s0)
	lw t0,28(s0)
	lw t1,32(s0)
	addi t0,t1,0
	sw t0,28(s0)
	sw t1,32(s0)
	lw t0,24(s0)
	lw t1,28(s0)
	mv t0,t1
	sw t0,24(s0)
	sw t1,28(s0)
	lw t0,24(s0)
	mv a0,t0
	sw t0,24(s0)
	call println
	j LBB45
LBB45:
	lw t0,20(s0)
	mv a0,t0
	sw t0,20(s0)
	addi sp,sp,48
	addi sp,sp,48
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : work
	.globl	main					# start function : main
	.p2align	2
main:
#LBB46:
	mv s1,sp
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-64
	mv s0,sp
	addi sp,sp,-64
	call __init__
	lw t0,52(s0)
	lw t1,48(s0)
	mv t0,t1
	sw t0,52(s0)
	sw t1,48(s0)
	lw t0,44(s0)
	li t0,4
	sw t0,44(s0)
	lw t0,44(s0)
	mv a0,t0
	sw t0,44(s0)
	call malloc
	lw t0,40(s0)
	mv t0,a0
	sw t0,40(s0)
	lw t0,36(s0)
	lw t1,40(s0)
	addi t0,t1,0
	sw t0,36(s0)
	sw t1,40(s0)
	lw t0,48(s0)
	lw t1,36(s0)
	mv t0,t1
	sw t0,48(s0)
	sw t1,36(s0)
	lw t0,32(s0)
	lw t1,48(s0)
	mv t0,t1
	sw t0,32(s0)
	sw t1,48(s0)
	lw t0,28(s0)
	lw t1,32(s0)
	addi t0,t1,0
	sw t0,28(s0)
	sw t1,32(s0)
	lw t0,24(s0)
	lw t1,28(s0)
	mv t0,t1
	sw t0,24(s0)
	sw t1,28(s0)
	lw t0,20(s0)
	la t0,const_string_no0
	sw t0,20(s0)
	lw t0,28(s0)
	lw t1,20(s0)
	mv t0,t1
	sw t0,28(s0)
	sw t1,20(s0)
	lw t0,16(s0)
	lw t1,48(s0)
	mv t0,t1
	sw t0,16(s0)
	sw t1,48(s0)
	lw t0,16(s0)
	mv a0,t0
	sw t0,16(s0)
	call work
	lw t0,12(s0)
	mv t0,a0
	sw t0,12(s0)
	lw t0,8(s0)
	li t0,0
	sw t0,8(s0)
	lw t0,4(s0)
	lw t1,8(s0)
	mv t0,t1
	sw t0,4(s0)
	sw t1,8(s0)
	j LBB47
	j LBB47
LBB47:
	lw t0,4(s0)
	mv a0,t0
	sw t0,4(s0)
	addi sp,sp,64
	addi sp,sp,64
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	"abc"

