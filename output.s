	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	j LBB25
LBB25:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	test					# start function : test
	.p2align	2
test:
#LBB42:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a0,0
	li a1,0
	j LBB43
LBB43:
	li a2,200
	slt a2,a1,a2
	bnez a2,LBB44
	j LBB45
LBB44:
	addi a1,a1,1
	addi a0,a0,1
	addi a1,a1,1
	j LBB43
LBB45:
	j LBB46
LBB46:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : test
	.globl	main					# start function : main
	.p2align	2
main:
#LBB47:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	call __init__
	call test
	addi a0,a0,-100
	j LBB48
LBB48:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
