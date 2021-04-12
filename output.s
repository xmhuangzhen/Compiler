	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	j LBB25
LBB25:
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	tak					# start function : tak
	.p2align	2
tak:
#LBB42:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	mv s2,a0
	mv s3,a1
	mv s1,a2
	slt a0,s3,s2
	bnez a0,LBB43
	j LBB44
LBB43:
	addi a0,s2,-1
	mv a1,s3
	mv a2,s1
	call tak
	mv s4,a0
	addi a0,s3,-1
	mv a1,s1
	mv a2,s2
	call tak
	mv s5,a0
	addi a0,s1,-1
	mv a1,s2
	mv a2,s3
	call tak
	mv a2,a0
	mv a0,s4
	mv a1,s5
	call tak
	li a1,1
	add s1,a1,a0
	j LBB45
LBB44:
	j LBB45
LBB45:
	mv a0,s1
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : tak
	.globl	main					# start function : main
	.p2align	2
main:
#LBB46:
	sw ra,-4(sp)
	sw s0,-8(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	sw s10,-48(sp)
	sw s11,-52(sp)
	mv s0,sp
	addi sp,sp,-80
	call __init__
	call getInt
	mv s1,a0
	call getInt
	mv s2,a0
	call getInt
	mv s3,a0
	mv a0,s1
	mv a1,s2
	mv a2,s3
	call tak
	call toString
	call println
	li a0,0
	j LBB47
LBB47:
	addi sp,sp,80
	lw s0,-8(sp)
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw s10,-48(sp)
	lw s11,-52(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
