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
	.globl	gcd					# start function : gcd
	.p2align	2
gcd:
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
	addi sp,sp,-304
	sw a4,-72(s0)
	sw a5,-68(s0)
	sw a6,-64(s0)
	sw a7,-60(s0)
	lw a4,0(s0)
	sw a4,-56(s0)
	lw s11,4(s0)
	lw s10,8(s0)
	lw s9,12(s0)
	lw s1,16(s0)
	lw s7,20(s0)
	lw s4,24(s0)
	lw s5,28(s0)
	lw s6,32(s0)
	lw s3,36(s0)
	lw s8,40(s0)
	lw s2,44(s0)
	lw a4,48(s0)
	sw a4,-96(s0)
	lw a4,52(s0)
	sw a4,-100(s0)
	lw a4,56(s0)
	sw a4,-104(s0)
	lw a4,60(s0)
	sw a4,-120(s0)
	lw a4,64(s0)
	sw a4,-124(s0)
	lw a4,68(s0)
	sw a4,-128(s0)
	lw a4,72(s0)
	sw a4,-132(s0)
	lw a4,76(s0)
	sw a4,-136(s0)
	lw a4,80(s0)
	sw a4,-140(s0)
	lw a4,84(s0)
	sw a4,-144(s0)
	lw a4,88(s0)
	sw a4,-152(s0)
	lw a4,92(s0)
	sw a4,-148(s0)
	li a5,0
	j LBB43
LBB43:
	li a4,10
	slt a4,a4,a5
	xori a4,a4,1
	bnez a4,LBB45
	j LBB44
LBB44:
	j LBB48
LBB45:
	j LBB46
LBB46:
	add a6,a2,a3
	lw a4,-72(s0)
	add a6,a6,a4
	lw a4,-68(s0)
	add a6,a6,a4
	lw a4,-64(s0)
	add a6,a6,a4
	lw a4,-60(s0)
	add a6,a6,a4
	lw a4,-56(s0)
	add a6,a6,a4
	mv a4,s11
	add a6,a6,a4
	mv a4,s10
	add a6,a6,a4
	mv a4,s9
	add a6,a6,a4
	mv a4,s1
	add a6,a6,a4
	mv a4,s7
	add a6,a6,a4
	mv a4,s4
	add a6,a6,a4
	mv a4,s5
	add a6,a6,a4
	mv a4,s6
	add a6,a6,a4
	mv a4,s3
	add a6,a6,a4
	mv a4,s8
	add a6,a6,a4
	mv a4,s2
	add a6,a6,a4
	lw a4,-96(s0)
	add a6,a6,a4
	lw a4,-100(s0)
	add a6,a6,a4
	lw a4,-104(s0)
	add a6,a6,a4
	lw a4,-120(s0)
	add a6,a6,a4
	lw a4,-124(s0)
	add a6,a6,a4
	lw a4,-128(s0)
	add a6,a6,a4
	lw a4,-132(s0)
	add a6,a6,a4
	lw a4,-136(s0)
	add a6,a6,a4
	lw a4,-140(s0)
	add a6,a6,a4
	lw a4,-144(s0)
	add a6,a6,a4
	lw a4,-152(s0)
	add a6,a6,a4
	lw a4,-148(s0)
	add a6,a6,a4
	li a4,100
	rem a4,a6,a4
	sw a4,-156(s0)
	j LBB47
LBB47:
	addi a5,a5,1
	j LBB43
LBB48:
	rem a3,a0,a1
	li a2,0
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB50
	j LBB49
LBB49:
	sw a5,-116(s0)
	j LBB52
LBB50:
	j LBB51
LBB51:
	j LBB53
LBB52:
	sw a1,-112(s0)
	rem a0,a0,a1
	sw a0,-108(s0)
	li a0,10
	li a1,68
	li a2,0
	li a3,2
	li a4,4
	li a5,6
	li a6,8
	li a7,10
	li t0,12
	sw t0,0(sp)
	li t0,14
	sw t0,4(sp)
	li t0,16
	sw t0,8(sp)
	li t0,18
	sw t0,12(sp)
	li t0,20
	sw t0,16(sp)
	li t0,22
	sw t0,20(sp)
	li t0,24
	sw t0,24(sp)
	li t0,26
	sw t0,28(sp)
	li t0,28
	sw t0,32(sp)
	li t0,30
	sw t0,36(sp)
	li t0,32
	sw t0,40(sp)
	li t0,34
	sw t0,44(sp)
	li t0,36
	sw t0,48(sp)
	li t0,38
	sw t0,52(sp)
	li t0,40
	sw t0,56(sp)
	li t0,42
	sw t0,60(sp)
	li t0,44
	sw t0,64(sp)
	li t0,46
	sw t0,68(sp)
	li t0,48
	sw t0,72(sp)
	li t0,50
	sw t0,76(sp)
	li t0,52
	sw t0,80(sp)
	li t0,54
	sw t0,84(sp)
	li t0,56
	sw t0,88(sp)
	li t0,58
	sw t0,92(sp)
	call gcd
	mv a3,a0
	lw a4,-72(s0)
	lw a5,-68(s0)
	lw a6,-64(s0)
	lw a7,-60(s0)
	lw a0,-56(s0)
	sw a0,-92(s0)
	sw s11,-88(s0)
	sw s10,-84(s0)
	sw s9,-80(s0)
	sw s1,-76(s0)
	sw s7,-160(s0)
	mv ra,s4
	mv t6,s5
	mv t5,s6
	mv t0,s3
	mv t1,s8
	mv t2,s2
	lw s3,-96(s0)
	lw s9,-100(s0)
	lw s10,-104(s0)
	lw s4,-120(s0)
	lw s5,-124(s0)
	lw t3,-128(s0)
	lw s2,-132(s0)
	lw s8,-136(s0)
	lw s6,-140(s0)
	lw s7,-144(s0)
	lw s1,-152(s0)
	lw s11,-148(s0)
	lw a0,-112(s0)
	lw a1,-108(s0)
	lw a2,-156(s0)
	lw t4,-92(s0)
	sw t4,0(sp)
	lw t4,-88(s0)
	sw t4,4(sp)
	lw t4,-84(s0)
	sw t4,8(sp)
	lw t4,-80(s0)
	sw t4,12(sp)
	lw t4,-76(s0)
	sw t4,16(sp)
	lw t4,-160(s0)
	sw t4,20(sp)
	sw ra,24(sp)
	sw t6,28(sp)
	sw t5,32(sp)
	sw t0,36(sp)
	sw t1,40(sp)
	sw t2,44(sp)
	sw s3,48(sp)
	sw s9,52(sp)
	sw s10,56(sp)
	sw s4,60(sp)
	sw s5,64(sp)
	sw t3,68(sp)
	sw s2,72(sp)
	sw s8,76(sp)
	sw s6,80(sp)
	sw s7,84(sp)
	sw s1,88(sp)
	sw s11,92(sp)
	call gcd1
	mv a1,a0
	lw a5,-116(s0)
	j LBB53
LBB53:
	mv a0,a1
	addi sp,sp,304
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
# end function : gcd
	.globl	gcd1					# start function : gcd1
	.p2align	2
gcd1:
#LBB54:
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
	addi sp,sp,-272
	mv s10,a2
	lw s4,0(s0)
	lw s5,4(s0)
	lw s3,8(s0)
	lw s7,12(s0)
	lw s6,16(s0)
	lw s8,20(s0)
	lw s2,24(s0)
	lw s1,28(s0)
	lw t2,32(s0)
	lw t1,36(s0)
	lw t0,40(s0)
	lw a2,44(s0)
	lw s9,48(s0)
	lw s11,52(s0)
	lw t4,56(s0)
	lw t3,60(s0)
	sw t3,-120(s0)
	lw t3,64(s0)
	sw t3,-64(s0)
	lw t3,68(s0)
	sw t3,-88(s0)
	lw t3,72(s0)
	sw t3,-92(s0)
	lw t3,76(s0)
	sw t3,-96(s0)
	lw t3,80(s0)
	sw t3,-100(s0)
	lw t3,84(s0)
	sw t3,-104(s0)
	lw t3,88(s0)
	sw t3,-112(s0)
	lw t3,92(s0)
	sw t3,-108(s0)
	add s10,s10,a3
	add s10,s10,a4
	add s10,s10,a5
	add s10,s10,a6
	add s10,s10,a7
	add s10,s10,s4
	add s10,s10,s5
	add s10,s10,s3
	add s10,s10,s7
	add s10,s10,s6
	add s10,s10,s8
	add s10,s10,s2
	add s10,s10,s1
	add s10,s10,t2
	add s10,s10,t1
	add s10,s10,t0
	add s10,s10,a2
	add t3,s10,s9
	mv s10,s11
	add t3,t3,s10
	mv s10,t4
	add t3,t3,s10
	lw s10,-120(s0)
	add t3,t3,s10
	lw s10,-64(s0)
	add t3,t3,s10
	lw s10,-88(s0)
	add t3,t3,s10
	lw s10,-92(s0)
	add t3,t3,s10
	lw s10,-96(s0)
	add t3,t3,s10
	lw s10,-100(s0)
	add t3,t3,s10
	lw s10,-104(s0)
	add t3,t3,s10
	lw s10,-112(s0)
	add t3,t3,s10
	lw s10,-108(s0)
	add t3,t3,s10
	li s10,100
	rem s10,t3,s10
	rem t5,a0,a1
	li t3,0
	xor t3,t5,t3
	seqz t3,t3
	bnez t3,LBB56
	j LBB55
LBB55:
	sw s10,-56(s0)
	j LBB58
LBB56:
	mv a2,s10
	j LBB57
LBB57:
	mv a0,a1
	j LBB59
LBB58:
	sw a1,-84(s0)
	mv s10,a0
	mv a0,a1
	rem a1,s10,a0
	sw s4,-80(s0)
	sw s5,-76(s0)
	sw s3,-72(s0)
	sw s7,-68(s0)
	sw s6,-60(s0)
	sw s8,-116(s0)
	mv ra,s2
	mv t6,s1
	mv t5,t2
	mv t3,t1
	mv s6,t0
	mv s10,a2
	mv s2,s11
	mv t1,t4
	lw s8,-120(s0)
	lw s11,-64(s0)
	lw s7,-88(s0)
	lw s4,-92(s0)
	lw s3,-96(s0)
	lw t2,-100(s0)
	lw t0,-104(s0)
	lw s1,-112(s0)
	lw s5,-108(s0)
	lw a0,-84(s0)
	lw a2,-56(s0)
	lw t4,-80(s0)
	sw t4,0(sp)
	lw t4,-76(s0)
	sw t4,4(sp)
	lw t4,-72(s0)
	sw t4,8(sp)
	lw t4,-68(s0)
	sw t4,12(sp)
	lw t4,-60(s0)
	sw t4,16(sp)
	lw t4,-116(s0)
	sw t4,20(sp)
	sw ra,24(sp)
	sw t6,28(sp)
	sw t5,32(sp)
	sw t3,36(sp)
	sw s6,40(sp)
	sw s10,44(sp)
	sw s9,48(sp)
	sw s2,52(sp)
	sw t1,56(sp)
	sw s8,60(sp)
	sw s11,64(sp)
	sw s7,68(sp)
	sw s4,72(sp)
	sw s3,76(sp)
	sw t2,80(sp)
	sw t0,84(sp)
	sw s1,88(sp)
	sw s5,92(sp)
	call gcd2
	lw a2,-56(s0)
	j LBB59
LBB59:
	addi sp,sp,272
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
# end function : gcd1
	.globl	gcd2					# start function : gcd2
	.p2align	2
gcd2:
#LBB60:
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
	addi sp,sp,-272
	lw s6,0(s0)
	lw s2,4(s0)
	lw s5,8(s0)
	lw s3,12(s0)
	lw s7,16(s0)
	lw s4,20(s0)
	lw s1,24(s0)
	lw t2,28(s0)
	lw t1,32(s0)
	lw t0,36(s0)
	lw s8,40(s0)
	lw s10,44(s0)
	lw t3,48(s0)
	lw t4,52(s0)
	lw s9,56(s0)
	sw s9,-124(s0)
	lw s9,60(s0)
	sw s9,-64(s0)
	lw s9,64(s0)
	sw s9,-88(s0)
	lw s9,68(s0)
	sw s9,-92(s0)
	lw s9,72(s0)
	sw s9,-96(s0)
	lw s9,76(s0)
	sw s9,-100(s0)
	lw s9,80(s0)
	sw s9,-104(s0)
	lw s9,84(s0)
	sw s9,-108(s0)
	lw s9,88(s0)
	sw s9,-116(s0)
	lw s9,92(s0)
	sw s9,-112(s0)
	add s9,a2,a3
	add s9,s9,a4
	add s9,s9,a5
	add s9,s9,a6
	add s9,s9,a7
	add s9,s9,s6
	add s9,s9,s2
	add s9,s9,s5
	add s9,s9,s3
	add s9,s9,s7
	add s9,s9,s4
	add s9,s9,s1
	add s9,s9,t2
	add s9,s9,t1
	add s9,s9,t0
	add s11,s9,s8
	mv s9,s10
	add s11,s11,s9
	mv s9,t3
	add s11,s11,s9
	mv s9,t4
	add s11,s11,s9
	lw s9,-124(s0)
	add s11,s11,s9
	lw s9,-64(s0)
	add s11,s11,s9
	lw s9,-88(s0)
	add s11,s11,s9
	lw s9,-92(s0)
	add s11,s11,s9
	lw s9,-96(s0)
	add s11,s11,s9
	lw s9,-100(s0)
	add s11,s11,s9
	lw s9,-104(s0)
	add s11,s11,s9
	lw s9,-108(s0)
	add s11,s11,s9
	lw s9,-116(s0)
	add s11,s11,s9
	lw s9,-112(s0)
	add s11,s11,s9
	li s9,100
	rem s9,s11,s9
	rem t5,a0,a1
	li s11,0
	xor s11,t5,s11
	seqz s11,s11
	bnez s11,LBB62
	j LBB61
LBB61:
	sw s9,-84(s0)
	j LBB64
LBB62:
	mv a2,s9
	j LBB63
LBB63:
	mv a0,a1
	j LBB65
LBB64:
	sw a1,-80(s0)
	mv s9,a0
	mv a0,a1
	rem a1,s9,a0
	sw s6,-76(s0)
	sw s2,-72(s0)
	sw s5,-68(s0)
	sw s3,-60(s0)
	sw s7,-56(s0)
	sw s4,-120(s0)
	mv ra,s1
	mv t6,t2
	mv t5,t1
	mv s11,t0
	mv s9,s8
	mv t0,s10
	mv s7,t3
	mv s3,t4
	lw s6,-124(s0)
	lw s2,-64(s0)
	lw s10,-88(s0)
	lw s4,-92(s0)
	lw s8,-96(s0)
	lw t1,-100(s0)
	lw s1,-104(s0)
	lw t2,-108(s0)
	lw s5,-116(s0)
	lw t3,-112(s0)
	lw a0,-80(s0)
	lw t4,-76(s0)
	sw t4,0(sp)
	lw t4,-72(s0)
	sw t4,4(sp)
	lw t4,-68(s0)
	sw t4,8(sp)
	lw t4,-60(s0)
	sw t4,12(sp)
	lw t4,-56(s0)
	sw t4,16(sp)
	lw t4,-120(s0)
	sw t4,20(sp)
	sw ra,24(sp)
	sw t6,28(sp)
	sw t5,32(sp)
	sw s11,36(sp)
	sw s9,40(sp)
	sw t0,44(sp)
	sw s7,48(sp)
	sw s3,52(sp)
	sw s6,56(sp)
	sw s2,60(sp)
	sw s10,64(sp)
	sw s4,68(sp)
	sw s8,72(sp)
	sw t1,76(sp)
	sw s1,80(sp)
	sw t2,84(sp)
	sw s5,88(sp)
	sw t3,92(sp)
	call gcd
	lw a2,-84(s0)
	j LBB65
LBB65:
	addi sp,sp,272
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
# end function : gcd2
	.globl	main					# start function : main
	.p2align	2
main:
#LBB66:
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
	addi sp,sp,-208
	call __init__
	li a0,10
	li a1,1
	li a2,0
	li a3,2
	li a4,4
	li a5,6
	li a6,8
	li a7,10
	li t0,12
	sw t0,0(sp)
	li t0,14
	sw t0,4(sp)
	li t0,16
	sw t0,8(sp)
	li t0,18
	sw t0,12(sp)
	li t0,20
	sw t0,16(sp)
	li t0,22
	sw t0,20(sp)
	li t0,24
	sw t0,24(sp)
	li t0,26
	sw t0,28(sp)
	li t0,28
	sw t0,32(sp)
	li t0,30
	sw t0,36(sp)
	li t0,32
	sw t0,40(sp)
	li t0,34
	sw t0,44(sp)
	li t0,36
	sw t0,48(sp)
	li t0,38
	sw t0,52(sp)
	li t0,40
	sw t0,56(sp)
	li t0,42
	sw t0,60(sp)
	li t0,44
	sw t0,64(sp)
	li t0,46
	sw t0,68(sp)
	li t0,48
	sw t0,72(sp)
	li t0,50
	sw t0,76(sp)
	li t0,52
	sw t0,80(sp)
	li t0,54
	sw t0,84(sp)
	li t0,56
	sw t0,88(sp)
	li t0,58
	sw t0,92(sp)
	call gcd
	addi a0,a0,1024
	call toString
	call println
	li a0,0
	j LBB67
LBB67:
	addi sp,sp,208
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
