	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	j LBB25
LBB25:
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	Cat.greet					# start function : Cat.greet
	.p2align	2
Cat.greet:
#LBB44:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	lw t0,1012(s0)
	mv t0,a0
	sw t0,1012(s0)
	lw t0,1008(s0)
	la t0,const_string_no0
	sw t0,1008(s0)
	lw t0,1008(s0)
	mv a0,t0
	sw t0,1008(s0)
	call println
	j LBB45
LBB45:
	lw t0,1004(s0)
	mv a0,t0
	sw t0,1004(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : Cat.greet
	.globl	Lamb.greet					# start function : Lamb.greet
	.p2align	2
Lamb.greet:
#LBB48:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	lw t0,1012(s0)
	mv t0,a0
	sw t0,1012(s0)
	lw t0,1008(s0)
	la t0,const_string_no1
	sw t0,1008(s0)
	lw t0,1008(s0)
	mv a0,t0
	sw t0,1008(s0)
	call println
	j LBB49
LBB49:
	lw t0,1004(s0)
	mv a0,t0
	sw t0,1004(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : Lamb.greet
	.globl	Animals.Animals					# start function : Animals.Animals
	.p2align	2
Animals.Animals:
#LBB50:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	lw t0,1012(s0)
	mv t0,a0
	sw t0,1012(s0)
	lw t0,1008(s0)
	lw t1,1012(s0)
	mv t0,t1
	sw t0,1008(s0)
	lw t0,1004(s0)
	lw t1,1008(s0)
	addi t0,t1,0
	sw t0,1004(s0)
	lw t0,1000(s0)
	li t0,0
	sw t0,1000(s0)
	lw t0,1000(s0)
	mv a0,t0
	sw t0,1000(s0)
	call malloc
	lw t0,996(s0)
	mv t0,a0
	sw t0,996(s0)
	lw t0,992(s0)
	lw t1,996(s0)
	addi t0,t1,0
	sw t0,992(s0)
	lw t0,992(s0)
	lw t1,1004(s0)
	sw t0,0(t1)
	lw t0,988(s0)
	lw t1,1012(s0)
	mv t0,t1
	sw t0,988(s0)
	lw t0,984(s0)
	lw t1,988(s0)
	addi t0,t1,4
	sw t0,984(s0)
	lw t0,980(s0)
	li t0,0
	sw t0,980(s0)
	lw t0,980(s0)
	mv a0,t0
	sw t0,980(s0)
	call malloc
	lw t0,976(s0)
	mv t0,a0
	sw t0,976(s0)
	lw t0,972(s0)
	lw t1,976(s0)
	addi t0,t1,0
	sw t0,972(s0)
	lw t0,972(s0)
	lw t1,984(s0)
	sw t0,0(t1)
	j LBB51
LBB51:
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : Animals.Animals
	.globl	Animals.greet					# start function : Animals.greet
	.p2align	2
Animals.greet:
#LBB52:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	lw t0,1012(s0)
	mv t0,a0
	sw t0,1012(s0)
	lw t0,1008(s0)
	lw t1,1012(s0)
	mv t0,t1
	sw t0,1008(s0)
	lw t0,1004(s0)
	lw t1,1008(s0)
	addi t0,t1,0
	sw t0,1004(s0)
	lw t0,1000(s0)
	mv a0,t0
	sw t0,1000(s0)
	call Cat.greet
	lw t0,996(s0)
	mv t0,a0
	sw t0,996(s0)
	lw t0,992(s0)
	lw t1,1012(s0)
	mv t0,t1
	sw t0,992(s0)
	lw t0,988(s0)
	lw t1,992(s0)
	addi t0,t1,4
	sw t0,988(s0)
	lw t0,984(s0)
	mv a0,t0
	sw t0,984(s0)
	call Lamb.greet
	lw t0,980(s0)
	mv t0,a0
	sw t0,980(s0)
	j LBB53
LBB53:
	lw t0,976(s0)
	mv a0,t0
	sw t0,976(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : Animals.greet
	.globl	main					# start function : main
	.p2align	2
main:
#LBB54:
	sw ra,-4(sp)
	sw s0,-8(sp)
	addi sp,sp,-1024
	mv s0,sp
	addi sp,sp,-1024
	call __init__
	lw t0,1012(s0)
	li t0,0
	sw t0,1012(s0)
	lw t0,1012(s0)
	mv a0,t0
	sw t0,1012(s0)
	call malloc
	lw t0,1008(s0)
	mv t0,a0
	sw t0,1008(s0)
	lw t0,1004(s0)
	lw t1,1008(s0)
	addi t0,t1,0
	sw t0,1004(s0)
	lw t0,1000(s0)
	li t0,0
	sw t0,1000(s0)
	lw t0,1000(s0)
	mv a0,t0
	sw t0,1000(s0)
	call malloc
	lw t0,996(s0)
	mv t0,a0
	sw t0,996(s0)
	lw t0,992(s0)
	lw t1,996(s0)
	addi t0,t1,0
	sw t0,992(s0)
	lw t0,988(s0)
	li t0,8
	sw t0,988(s0)
	lw t0,988(s0)
	mv a0,t0
	sw t0,988(s0)
	call malloc
	lw t0,984(s0)
	mv t0,a0
	sw t0,984(s0)
	lw t0,980(s0)
	lw t1,984(s0)
	addi t0,t1,0
	sw t0,980(s0)
	lw t0,980(s0)
	mv a0,t0
	sw t0,980(s0)
	call Animals.Animals
	lw t0,976(s0)
	lw t1,980(s0)
	addi t0,t1,0
	sw t0,976(s0)
	lw t0,1004(s0)
	lw t1,976(s0)
	sw t0,0(t1)
	lw t0,972(s0)
	lw t1,980(s0)
	addi t0,t1,4
	sw t0,972(s0)
	lw t0,992(s0)
	lw t1,972(s0)
	sw t0,0(t1)
	lw t0,968(s0)
	mv a0,t0
	sw t0,968(s0)
	call Animals.greet
	lw t0,964(s0)
	mv t0,a0
	sw t0,964(s0)
	j LBB55
LBB55:
	lw t0,960(s0)
	mv a0,t0
	sw t0,960(s0)
	addi sp,sp,1024
	addi sp,sp,1024
	lw s0,-8(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	"MIAOMIAOMIAO"

const_string_no1:
	.asciz	"MIEMIEMIE"

