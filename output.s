	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB36:
	addi sp,sp,-112
	sw ra,108(sp)
	sw s0,104(sp)
	addi s0,sp,112
	lw t0,-12(s0)
	li t0,20
	sw t0,-12(s0)
	lw t0,-16(s0)
	li t0,4
	sw t0,-16(s0)
	lw t0,-20(s0)
	lw t1,-12(s0)
	lw t2,-16(s0)
	mul t0,t1,t2
	sw t0,-20(s0)
	sw t1,-12(s0)
	sw t2,-16(s0)
	lw t0,-24(s0)
	lw t1,-20(s0)
	addi t0,t1,4
	sw t0,-24(s0)
	sw t1,-20(s0)
	lw t0,-24(s0)
	mv a0,t0
	sw t0,-24(s0)
	call malloc
	lw t0,-28(s0)
	mv t0,a0
	sw t0,-28(s0)
	lw t0,-32(s0)
	li t0,20
	sw t0,-32(s0)
	lw t0,-32(s0)
	lw t1,-28(s0)
	sw t0,0(t1)
	sw t0,-32(s0)
	sw t1,-28(s0)
	lw t0,-36(s0)
	lw t1,-28(s0)
	addi t0,t1,4
	sw t0,-36(s0)
	sw t1,-28(s0)
	lui t0,%hi(a)
	lw t1,%lo(a)(t0)
	lw t2,-36(s0)
	mv t1,t2
	lui t0,%hi(a)
	sw t1,%lo(a)(t0)
	sw t2,-36(s0)
	j LBB38
LBB38:
	lw s0,104(sp)
	lw ra,108(sp)
	addi sp,sp,112
	ret
# end function : __init__
	.globl	jud					# start function : jud
	.p2align	2
jud:
#LBB63:
	addi sp,sp,-256
	sw ra,252(sp)
	sw s0,248(sp)
	addi s0,sp,256
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	lw t0,-16(s0)
	lw t1,-20(s0)
	mv t0,t1
	sw t0,-16(s0)
	sw t1,-20(s0)
	lw t0,-24(s0)
	li t0,0
	sw t0,-24(s0)
	lw t0,-20(s0)
	lw t1,-24(s0)
	mv t0,t1
	sw t0,-20(s0)
	sw t1,-24(s0)
LBB64:
	lw t0,-28(s0)
	lw t1,-20(s0)
	mv t0,t1
	sw t0,-28(s0)
	sw t1,-20(s0)
	lw t0,-32(s0)
	lui t1,%hi(n)
	lw t2,%lo(n)(t1)
	mv t0,t2
	sw t0,-32(s0)
	lui t1,%hi(n)
	sw t2,%lo(n)(t1)
	lw t0,-40(s0)
	lw t1,-32(s0)
	div t0,t1,zero
	sw t0,-40(s0)
	sw t1,-32(s0)
	lw t0,-44(s0)
	lw t1,-28(s0)
	lw t2,-40(s0)
	slt t0,t1,t2
	sw t0,-44(s0)
	sw t1,-28(s0)
	sw t2,-40(s0)
	lw t0,-44(s0)
	bnez t0,LBB65
	j LBB75
	sw t0,-44(s0)
LBB65:
	lw t0,-48(s0)
	li t0,0
	sw t0,-48(s0)
	lw t0,-52(s0)
	lw t1,-48(s0)
	mv t0,t1
	sw t0,-52(s0)
	sw t1,-48(s0)
	lw t0,-56(s0)
	lw t1,-60(s0)
	mv t0,t1
	sw t0,-56(s0)
	sw t1,-60(s0)
	lw t0,-64(s0)
	li t0,0
	sw t0,-64(s0)
	lw t0,-60(s0)
	lw t1,-64(s0)
	mv t0,t1
	sw t0,-60(s0)
	sw t1,-64(s0)
LBB66:
	lw t0,-68(s0)
	lw t1,-60(s0)
	mv t0,t1
	sw t0,-68(s0)
	sw t1,-60(s0)
	lw t0,-72(s0)
	addi t0,zero,-1
	sw t0,-72(s0)
	lw t0,-76(s0)
	lw t1,-68(s0)
	lw t2,-72(s0)
	slt t0,t1,t2
	sw t0,-76(s0)
	sw t1,-68(s0)
	sw t2,-72(s0)
	lw t0,-76(s0)
	bnez t0,LBB67
	j LBB71
	sw t0,-76(s0)
LBB67:
	lw t0,-80(s0)
	lui t1,%hi(a)
	lw t2,%lo(a)(t1)
	mv t0,t2
	sw t0,-80(s0)
	lui t1,%hi(a)
	sw t2,%lo(a)(t1)
	lw t0,-84(s0)
	lw t1,-20(s0)
	mv t0,t1
	sw t0,-84(s0)
	sw t1,-20(s0)
	lw t0,-88(s0)
	lw t1,-84(s0)
	mul t0,t1,zero
	sw t0,-88(s0)
	sw t1,-84(s0)
	lw t0,-92(s0)
	lw t1,-60(s0)
	mv t0,t1
	sw t0,-92(s0)
	sw t1,-60(s0)
	lw t0,-96(s0)
	lw t1,-88(s0)
	lw t2,-92(s0)
	add t0,t1,t2
	sw t0,-96(s0)
	sw t1,-88(s0)
	sw t2,-92(s0)
	lw t0,-100(s0)
	lw t1,-96(s0)
	slli t0,t1,2
	sw t0,-100(s0)
	sw t1,-96(s0)
	lw t0,-104(s0)
	lw t1,-80(s0)
	lw t2,-100(s0)
	add t0,t1,t2
	sw t0,-104(s0)
	sw t1,-80(s0)
	sw t2,-100(s0)
	lw t0,-108(s0)
	lw t1,-104(s0)
	mv t0,t1
	sw t0,-108(s0)
	sw t1,-104(s0)
	lw t0,-112(s0)
	lui t1,%hi(a)
	lw t2,%lo(a)(t1)
	mv t0,t2
	sw t0,-112(s0)
	lui t1,%hi(a)
	sw t2,%lo(a)(t1)
	lw t0,-116(s0)
	lw t1,-20(s0)
	mv t0,t1
	sw t0,-116(s0)
	sw t1,-20(s0)
	lw t0,-120(s0)
	lw t1,-116(s0)
	mul t0,t1,zero
	sw t0,-120(s0)
	sw t1,-116(s0)
	lw t0,-124(s0)
	lw t1,-60(s0)
	mv t0,t1
	sw t0,-124(s0)
	sw t1,-60(s0)
	lw t0,-128(s0)
	lw t1,-120(s0)
	lw t2,-124(s0)
	add t0,t1,t2
	sw t0,-128(s0)
	sw t1,-120(s0)
	sw t2,-124(s0)
	lw t0,-132(s0)
	lw t1,-128(s0)
	addi t0,t1,1
	sw t0,-132(s0)
	sw t1,-128(s0)
	lw t0,-136(s0)
	lw t1,-132(s0)
	slli t0,t1,2
	sw t0,-136(s0)
	sw t1,-132(s0)
	lw t0,-140(s0)
	lw t1,-112(s0)
	lw t2,-136(s0)
	add t0,t1,t2
	sw t0,-140(s0)
	sw t1,-112(s0)
	sw t2,-136(s0)
	lw t0,-144(s0)
	lw t1,-140(s0)
	mv t0,t1
	sw t0,-144(s0)
	sw t1,-140(s0)
	lw t0,-148(s0)
	lw t1,-144(s0)
	lw t2,-108(s0)
	slt t0,t1,t2
	sw t0,-148(s0)
	sw t1,-144(s0)
	sw t2,-108(s0)
	lw t0,-148(s0)
	bnez t0,LBB68
	j LBB69
	sw t0,-148(s0)
LBB68:
	lw t0,-152(s0)
	lw t1,-52(s0)
	mv t0,t1
	sw t0,-152(s0)
	sw t1,-52(s0)
	lw t0,-156(s0)
	li t0,1
	sw t0,-156(s0)
	lw t0,-52(s0)
	lw t1,-156(s0)
	mv t0,t1
	sw t0,-52(s0)
	sw t1,-156(s0)
	j LBB69
LBB69:
	j LBB70
LBB70:
	lw t0,-160(s0)
	lw t1,-60(s0)
	mv t0,t1
	sw t0,-160(s0)
	sw t1,-60(s0)
	lw t0,-164(s0)
	lw t1,-160(s0)
	addi t0,t1,1
	sw t0,-164(s0)
	sw t1,-160(s0)
	lw t0,-60(s0)
	lw t1,-164(s0)
	mv t0,t1
	sw t0,-60(s0)
	sw t1,-164(s0)
	j LBB66
LBB71:
	lw t0,-168(s0)
	lw t1,-52(s0)
	mv t0,t1
	sw t0,-168(s0)
	sw t1,-52(s0)
	lw t0,-172(s0)
	lw t1,-168(s0)
	xori t0,t1,1
	sw t0,-172(s0)
	sw t1,-168(s0)
	lw t0,-172(s0)
	bnez t0,LBB72
	j LBB73
	sw t0,-172(s0)
LBB72:
	lw t0,-176(s0)
	li t0,1
	sw t0,-176(s0)
	lw t0,-180(s0)
	lw t1,-176(s0)
	mv t0,t1
	sw t0,-180(s0)
	sw t1,-176(s0)
	j LBB76
LBB73:
	j LBB74
LBB74:
	lw t0,-184(s0)
	lw t1,-20(s0)
	mv t0,t1
	sw t0,-184(s0)
	sw t1,-20(s0)
	lw t0,-188(s0)
	lw t1,-184(s0)
	addi t0,t1,1
	sw t0,-188(s0)
	sw t1,-184(s0)
	lw t0,-20(s0)
	lw t1,-188(s0)
	mv t0,t1
	sw t0,-20(s0)
	sw t1,-188(s0)
	j LBB64
LBB75:
	lw t0,-192(s0)
	li t0,0
	sw t0,-192(s0)
	lw t0,-180(s0)
	lw t1,-192(s0)
	mv t0,t1
	sw t0,-180(s0)
	sw t1,-192(s0)
	j LBB76
LBB76:
	j LBB73
	j LBB77
LBB77:
	lw t0,-180(s0)
	mv a0,t0
	sw t0,-180(s0)
	lw s0,248(sp)
	lw ra,252(sp)
	addi sp,sp,256
	ret
# end function : jud
	.globl	main					# start function : main
	.p2align	2
main:
#LBB78:
	addi sp,sp,-208
	sw ra,204(sp)
	sw s0,200(sp)
	addi s0,sp,208
	call __init__
	lw t0,-12(s0)
	lui t1,%hi(n)
	lw t2,%lo(n)(t1)
	mv t0,t2
	sw t0,-12(s0)
	lui t1,%hi(n)
	sw t2,%lo(n)(t1)
	call getInt
	lw t0,-16(s0)
	mv t0,a0
	sw t0,-16(s0)
	lui t0,%hi(n)
	lw t1,%lo(n)(t0)
	lw t2,-16(s0)
	mv t1,t2
	lui t0,%hi(n)
	sw t1,%lo(n)(t0)
	sw t2,-16(s0)
	lw t0,-20(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-20(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-28(s0)
	li t0,0
	sw t0,-28(s0)
	lui t0,%hi(i)
	lw t1,%lo(i)(t0)
	lw t2,-28(s0)
	mv t1,t2
	lui t0,%hi(i)
	sw t1,%lo(i)(t0)
	sw t2,-28(s0)
LBB79:
	lw t0,-32(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-32(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-36(s0)
	lui t1,%hi(n)
	lw t2,%lo(n)(t1)
	mv t0,t2
	sw t0,-36(s0)
	lui t1,%hi(n)
	sw t2,%lo(n)(t1)
	lw t0,-40(s0)
	lw t1,-32(s0)
	lw t2,-36(s0)
	slt t0,t1,t2
	sw t0,-40(s0)
	sw t1,-32(s0)
	sw t2,-36(s0)
	lw t0,-40(s0)
	bnez t0,LBB80
	j LBB82
	sw t0,-40(s0)
LBB80:
	lw t0,-44(s0)
	lui t1,%hi(a)
	lw t2,%lo(a)(t1)
	mv t0,t2
	sw t0,-44(s0)
	lui t1,%hi(a)
	sw t2,%lo(a)(t1)
	lw t0,-48(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-48(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-52(s0)
	lw t1,-48(s0)
	slli t0,t1,2
	sw t0,-52(s0)
	sw t1,-48(s0)
	lw t0,-56(s0)
	lw t1,-44(s0)
	lw t2,-52(s0)
	add t0,t1,t2
	sw t0,-56(s0)
	sw t1,-44(s0)
	sw t2,-52(s0)
	lw t0,-60(s0)
	lw t1,-56(s0)
	mv t0,t1
	sw t0,-60(s0)
	sw t1,-56(s0)
	call getInt
	lw t0,-64(s0)
	mv t0,a0
	sw t0,-64(s0)
	lw t0,-56(s0)
	lw t1,-64(s0)
	mv t0,t1
	sw t0,-56(s0)
	sw t1,-64(s0)
	j LBB81
LBB81:
	lw t0,-68(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-68(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-72(s0)
	lw t1,-68(s0)
	addi t0,t1,1
	sw t0,-72(s0)
	sw t1,-68(s0)
	lui t0,%hi(i)
	lw t1,%lo(i)(t0)
	lw t2,-72(s0)
	mv t1,t2
	lui t0,%hi(i)
	sw t1,%lo(i)(t0)
	sw t2,-72(s0)
	j LBB79
LBB82:
	lw t0,-76(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-76(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-80(s0)
	lui t1,%hi(n)
	lw t2,%lo(n)(t1)
	mv t0,t2
	sw t0,-80(s0)
	lui t1,%hi(n)
	sw t2,%lo(n)(t1)
	lui t0,%hi(i)
	lw t1,%lo(i)(t0)
	lw t2,-80(s0)
	mv t1,t2
	lui t0,%hi(i)
	sw t1,%lo(i)(t0)
	sw t2,-80(s0)
LBB83:
	lw t0,-84(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-84(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-88(s0)
	li t0,0
	sw t0,-88(s0)
	lw t0,-92(s0)
	lw t1,-88(s0)
	lw t2,-84(s0)
	slt t0,t1,t2
	sw t0,-92(s0)
	sw t1,-88(s0)
	sw t2,-84(s0)
	lw t0,-92(s0)
	bnez t0,LBB84
	j LBB88
	sw t0,-92(s0)
LBB84:
	lw t0,-96(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-96(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-96(s0)
	mv a0,t0
	sw t0,-96(s0)
	call jud
	lw t0,-100(s0)
	mv t0,a0
	sw t0,-100(s0)
	lw t0,-104(s0)
	li t0,0
	sw t0,-104(s0)
	lw t0,-108(s0)
	lw t1,-104(s0)
	lw t2,-100(s0)
	slt t0,t1,t2
	sw t0,-108(s0)
	sw t1,-104(s0)
	sw t2,-100(s0)
	lw t0,-108(s0)
	bnez t0,LBB85
	j LBB86
	sw t0,-108(s0)
LBB85:
	lw t0,-112(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-112(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-112(s0)
	mv a0,t0
	sw t0,-112(s0)
	call toString
	lw t0,-116(s0)
	mv t0,a0
	sw t0,-116(s0)
	lw t0,-116(s0)
	mv a0,t0
	sw t0,-116(s0)
	call print
	lw t0,-120(s0)
	li t0,0
	sw t0,-120(s0)
	lw t0,-124(s0)
	lw t1,-120(s0)
	mv t0,t1
	sw t0,-124(s0)
	sw t1,-120(s0)
	j LBB89
LBB86:
	j LBB87
LBB87:
	lw t0,-128(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-128(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-132(s0)
	lui t1,%hi(i)
	lw t2,%lo(i)(t1)
	mv t0,t2
	sw t0,-132(s0)
	lui t1,%hi(i)
	sw t2,%lo(i)(t1)
	lw t0,-136(s0)
	li t0,2
	sw t0,-136(s0)
	lw t0,-140(s0)
	lw t1,-132(s0)
	lw t2,-136(s0)
	div t0,t1,t2
	sw t0,-140(s0)
	sw t1,-132(s0)
	sw t2,-136(s0)
	lui t0,%hi(i)
	lw t1,%lo(i)(t0)
	lw t2,-140(s0)
	mv t1,t2
	lui t0,%hi(i)
	sw t1,%lo(i)(t0)
	sw t2,-140(s0)
	j LBB83
LBB88:
	lw t0,-144(s0)
	li t0,0
	sw t0,-144(s0)
	lw t0,-124(s0)
	lw t1,-144(s0)
	mv t0,t1
	sw t0,-124(s0)
	sw t1,-144(s0)
	j LBB89
LBB89:
	j LBB86
	j LBB90
LBB90:
	lw t0,-124(s0)
	mv a0,t0
	sw t0,-124(s0)
	lw s0,200(sp)
	lw ra,204(sp)
	addi sp,sp,208
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
n:
	.word	0

	.p2align	2
a:
	.word	0

	.p2align	2
i:
	.word	0

