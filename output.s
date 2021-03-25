	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB36:
	addi sp,sp,-80
	sw ra,76(sp)
	sw s0,72(sp)
	addi s0,sp,80
	j LBB38
LBB38:
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : __init__
	.globl	E.E					# start function : E.E
	.p2align	2
E.E:
#LBB63:
	addi sp,sp,-80
	sw ra,76(sp)
	sw s0,72(sp)
	addi s0,sp,80
	lw t0,-12(s0)
	lw t1,-16(s0)
	addi t0,t1,0
	sw t0,-12(s0)
	sw t1,-16(s0)
	lw t0,-20(s0)
	li t0,7
	sw t0,-20(s0)
	lw t0,-20(s0)
	lw t1,-12(s0)
	mv t1,t0
	sw t0,-20(s0)
	sw t1,-12(s0)
	j LBB65
LBB65:
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : E.E
	.globl	E.getSelf					# start function : E.getSelf
	.p2align	2
E.getSelf:
#LBB66:
	addi sp,sp,-80
	sw ra,76(sp)
	sw s0,72(sp)
	addi s0,sp,80
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	lw t0,-16(s0)
	lw t1,-20(s0)
	mv t1,t0
	sw t0,-16(s0)
	sw t1,-20(s0)
	j LBB67
LBB67:
	j LBB68
LBB68:
	lw t0,-20(s0)
	mv a0,t0
	sw t0,-20(s0)
	lw s0,72(sp)
	lw ra,76(sp)
	addi sp,sp,80
	ret
# end function : E.getSelf
	.globl	bad_func_0					# start function : bad_func_0
	.p2align	2
bad_func_0:
#LBB69:
	addi sp,sp,-112
	sw ra,108(sp)
	sw s0,104(sp)
	addi s0,sp,112
	lw t0,-12(s0)
	li t0,0
	sw t0,-12(s0)
	lw t0,-12(s0)
	lw t1,-16(s0)
	mv t1,t0
	sw t0,-12(s0)
	sw t1,-16(s0)
LBB70:
	lw t0,-20(s0)
	li t0,10
	sw t0,-20(s0)
	lw t0,-24(s0)
	lw t1,-20(s0)
	lw t2,-16(s0)
	slt t0,t1,t2
	sw t0,-24(s0)
	sw t1,-20(s0)
	sw t2,-16(s0)
	lw t0,-28(s0)
	lw t1,-24(s0)
	xori t0,t1,1
	sw t0,-28(s0)
	sw t1,-24(s0)
	lw t0,-28(s0)
	bnez t0,LBB71
	j LBB73
	sw t0,-28(s0)
LBB71:
	lw t0,-32(s0)
	lw t0,const_string_no0
	sw t0,-32(s0)
	lw t0,-32(s0)
	mv a0,t0
	sw t0,-32(s0)
	call println
	lw t0,-36(s0)
	lw t0,const_string_no1
	sw t0,-36(s0)
	lw t0,-36(s0)
	lw t1,-40(s0)
	mv t1,t0
	sw t0,-36(s0)
	sw t1,-40(s0)
	lw t0,-40(s0)
	mv a0,t0
	sw t0,-40(s0)
	call println
	j LBB72
LBB72:
	lw t0,-44(s0)
	lw t1,-16(s0)
	addi t0,t1,1
	sw t0,-44(s0)
	sw t1,-16(s0)
	lw t0,-44(s0)
	lw t1,-16(s0)
	mv t1,t0
	sw t0,-44(s0)
	sw t1,-16(s0)
	j LBB70
LBB73:
	j LBB75
LBB75:
	lw t0,-48(s0)
	mv a0,t0
	sw t0,-48(s0)
	lw s0,104(sp)
	lw ra,108(sp)
	addi sp,sp,112
	ret
# end function : bad_func_0
	.globl	bad_func_1					# start function : bad_func_1
	.p2align	2
bad_func_1:
#LBB76:
	addi sp,sp,-144
	sw ra,140(sp)
	sw s0,136(sp)
	addi s0,sp,144
	lw t0,-12(s0)
	mv t0,a0
	sw t0,-12(s0)
	lw t0,-16(s0)
	mv t0,a1
	sw t0,-16(s0)
	lw t0,-20(s0)
	mv t0,a2
	sw t0,-20(s0)
	lw t0,-24(s0)
	lw t1,-16(s0)
	lw t2,-20(s0)
	xor t0,t1,t2
	sw t0,-24(s0)
	sw t1,-16(s0)
	sw t2,-20(s0)
	lw t0,-28(s0)
	lw t1,-24(s0)
	seqz t0,t1
	sw t0,-28(s0)
	sw t1,-24(s0)
	lw t0,-28(s0)
	bnez t0,LBB77
	j LBB78
	sw t0,-28(s0)
LBB77:
	lw t0,-32(s0)
	lw t0,const_string_no2
	sw t0,-32(s0)
	lw t0,-12(s0)
	mv a0,t0
	sw t0,-12(s0)
	call toString
	lw t0,-32(s0)
	mv a0,t0
	sw t0,-32(s0)
	lw t0,-36(s0)
	mv a1,t0
	sw t0,-36(s0)
	call __string_add
	lw t0,-40(s0)
	mv a0,t0
	sw t0,-40(s0)
	call println
	j LBB79
LBB78:
	lw t0,-44(s0)
	lw t1,-16(s0)
	lw t2,-20(s0)
	add t0,t1,t2
	sw t0,-44(s0)
	sw t1,-16(s0)
	sw t2,-20(s0)
	lw t0,-48(s0)
	lw t1,-44(s0)
	srai t0,t1,1
	sw t0,-48(s0)
	sw t1,-44(s0)
	lw t0,-48(s0)
	lw t1,-52(s0)
	mv t1,t0
	sw t0,-48(s0)
	sw t1,-52(s0)
	lw t0,-56(s0)
	lw t1,-12(s0)
	slli t0,t1,1
	sw t0,-56(s0)
	sw t1,-12(s0)
	lw t0,-56(s0)
	mv a0,t0
	sw t0,-56(s0)
	lw t0,-16(s0)
	mv a1,t0
	sw t0,-16(s0)
	lw t0,-52(s0)
	mv a2,t0
	sw t0,-52(s0)
	call bad_func_1
	lw t0,-60(s0)
	mv t0,a0
	sw t0,-60(s0)
	lw t0,-64(s0)
	lw t1,-12(s0)
	slli t0,t1,1
	sw t0,-64(s0)
	sw t1,-12(s0)
	lw t0,-68(s0)
	lw t1,-64(s0)
	ori t0,t1,1
	sw t0,-68(s0)
	sw t1,-64(s0)
	lw t0,-72(s0)
	lw t1,-52(s0)
	addi t0,t1,1
	sw t0,-72(s0)
	sw t1,-52(s0)
	lw t0,-68(s0)
	mv a0,t0
	sw t0,-68(s0)
	lw t0,-72(s0)
	mv a1,t0
	sw t0,-72(s0)
	lw t0,-20(s0)
	mv a2,t0
	sw t0,-20(s0)
	call bad_func_1
	lw t0,-76(s0)
	mv t0,a0
	sw t0,-76(s0)
	j LBB80
LBB79:
	j LBB78
LBB80:
	lw t0,-80(s0)
	mv a0,t0
	sw t0,-80(s0)
	lw s0,136(sp)
	lw ra,140(sp)
	addi sp,sp,144
	ret
# end function : bad_func_1
	.globl	bad_func_2					# start function : bad_func_2
	.p2align	2
bad_func_2:
#LBB81:
	addi sp,sp,-192
	sw ra,188(sp)
	sw s0,184(sp)
	addi s0,sp,192
	lw t0,-12(s0)
	li t0,2
	sw t0,-12(s0)
	lw t0,-16(s0)
	lw t1,-12(s0)
	addi t0,t1,-4
	sw t0,-16(s0)
	sw t1,-12(s0)
	lw t0,-20(s0)
	lw t1,-16(s0)
	addi t0,t1,4
	sw t0,-20(s0)
	sw t1,-16(s0)
	lw t0,-20(s0)
	mv a0,t0
	sw t0,-20(s0)
	call malloc
	lw t0,-24(s0)
	lw t1,-28(s0)
	addi t0,t1,0
	sw t0,-24(s0)
	sw t1,-28(s0)
	lw t0,-32(s0)
	li t0,2
	sw t0,-32(s0)
	lw t0,-32(s0)
	lw t1,-24(s0)
	mv t1,t0
	sw t0,-32(s0)
	sw t1,-24(s0)
	lw t0,-36(s0)
	lw t1,-24(s0)
	mv t0,t1
	sw t0,-36(s0)
	sw t1,-24(s0)
	j LBB82
LBB82:
	lw t0,-40(s0)
	lw t1,-24(s0)
	addi t0,t1,8
	sw t0,-40(s0)
	sw t1,-24(s0)
	lw t0,-44(s0)
	lw t1,-40(s0)
	lw t2,-36(s0)
	xor t0,t1,t2
	sw t0,-44(s0)
	sw t1,-40(s0)
	sw t2,-36(s0)
	lw t0,-48(s0)
	lw t1,-44(s0)
	snez t0,t1
	sw t0,-48(s0)
	sw t1,-44(s0)
	lw t0,-48(s0)
	bnez t0,LBB83
	j LBB84
	sw t0,-48(s0)
LBB83:
	lw t0,-52(s0)
	lw t1,-36(s0)
	addi t0,t1,4
	sw t0,-52(s0)
	sw t1,-36(s0)
	lw t0,-56(s0)
	li t0,3
	sw t0,-56(s0)
	lw t0,-60(s0)
	lw t1,-56(s0)
	addi t0,t1,-4
	sw t0,-60(s0)
	sw t1,-56(s0)
	lw t0,-64(s0)
	lw t1,-60(s0)
	addi t0,t1,4
	sw t0,-64(s0)
	sw t1,-60(s0)
	lw t0,-64(s0)
	mv a0,t0
	sw t0,-64(s0)
	call malloc
	lw t0,-68(s0)
	lw t1,-72(s0)
	addi t0,t1,0
	sw t0,-68(s0)
	sw t1,-72(s0)
	lw t0,-76(s0)
	li t0,3
	sw t0,-76(s0)
	lw t0,-76(s0)
	lw t1,-68(s0)
	mv t1,t0
	sw t0,-76(s0)
	sw t1,-68(s0)
	lw t0,-68(s0)
	lw t1,-36(s0)
	mv t0,t1
	sw t0,-68(s0)
	sw t1,-36(s0)
	j LBB82
LBB84:
	lw t0,-24(s0)
	lw t1,-80(s0)
	mv t1,t0
	sw t0,-24(s0)
	sw t1,-80(s0)
	lw t0,-84(s0)
	lw t1,-88(s0)
	addi t0,t1,0
	sw t0,-84(s0)
	sw t1,-88(s0)
	lw t0,-92(s0)
	lw t1,-84(s0)
	addi t0,t1,-4
	sw t0,-92(s0)
	sw t1,-84(s0)
	lw t0,-92(s0)
	lw t1,-96(s0)
	mv t1,t0
	sw t0,-92(s0)
	sw t1,-96(s0)
	lw t0,-100(s0)
	lw t0,const_string_no3
	sw t0,-100(s0)
	lw t0,-100(s0)
	mv a0,t0
	sw t0,-100(s0)
	call print
	lw t0,-104(s0)
	li t0,0
	sw t0,-104(s0)
	lw t0,-104(s0)
	lw t1,-108(s0)
	mv t1,t0
	sw t0,-104(s0)
	sw t1,-108(s0)
	lw t0,-112(s0)
	li t0,-223
	sw t0,-112(s0)
	lw t0,-112(s0)
	lw t1,-116(s0)
	mv t1,t0
	sw t0,-112(s0)
	sw t1,-116(s0)
	lw t0,-120(s0)
	lw t0,const_string_no4
	sw t0,-120(s0)
	lw t0,-120(s0)
	lw t1,-124(s0)
	mv t1,t0
	sw t0,-120(s0)
	sw t1,-124(s0)
	j LBB86
LBB86:
	lw t0,-128(s0)
	mv a0,t0
	sw t0,-128(s0)
	lw s0,184(sp)
	lw ra,188(sp)
	addi sp,sp,192
	ret
# end function : bad_func_2
	.globl	bad_func_3					# start function : bad_func_3
	.p2align	2
bad_func_3:
#LBB87:
	addi sp,sp,-128
	sw ra,124(sp)
	addi s0,sp,128
	sw s0,120(sp)
LBB88:
	lw t0,-12(s0)
	li t0,1
	sw t0,-12(s0)
	lw t0,-12(s0)
	bnez t0,LBB89
	j LBB90
	sw t0,-12(s0)
LBB89:
	j LBB90
LBB90:
	j LBB91
LBB91:
	lw t0,-16(s0)
	li t0,1
	sw t0,-16(s0)
	lw t0,-20(s0)
	lw t1,-16(s0)
	xori t0,t1,1
	sw t0,-20(s0)
	sw t1,-16(s0)
	j LBB92
LBB92:
	j LBB93
LBB93:
	j LBB88
	j LBB94
	j LBB95
LBB94:
	lw t0,-24(s0)
	li t0,4
	sw t0,-24(s0)
	lw t0,-24(s0)
	mv a0,t0
	sw t0,-24(s0)
	call malloc
	lw t0,-28(s0)
	lw t1,-32(s0)
	addi t0,t1,0
	sw t0,-28(s0)
	sw t1,-32(s0)
	lw t0,-28(s0)
	mv a0,t0
	sw t0,-28(s0)
	call E.E
	lw t0,-28(s0)
	lw t1,-36(s0)
	mv t1,t0
	sw t0,-28(s0)
	sw t1,-36(s0)
	call E.getSelf
	lw t0,-40(s0)
	mv t0,a0
	sw t0,-40(s0)
	call E.getSelf
	lw t0,-44(s0)
	mv t0,a0
	sw t0,-44(s0)
	call E.getSelf
	lw t0,-48(s0)
	mv t0,a0
	sw t0,-48(s0)
	call E.getSelf
	lw t0,-52(s0)
	mv t0,a0
	sw t0,-52(s0)
	lw t0,-56(s0)
	lw t1,-52(s0)
	addi t0,t1,0
	sw t0,-56(s0)
	sw t1,-52(s0)
	lw t0,-56(s0)
	mv a0,t0
	sw t0,-56(s0)
	call toString
	lw t0,-60(s0)
	mv a0,t0
	sw t0,-60(s0)
	call println
	j LBB96
LBB95:
	j LBB88
LBB96:
	lw t0,-64(s0)
	mv a0,t0
	sw t0,-64(s0)
	lw s0,120(sp)
	lw ra,124(sp)
	addi sp,sp,128
	ret
# end function : bad_func_3
	.globl	bad_func_4					# start function : bad_func_4
	.p2align	2
bad_func_4:
#LBB97:
	addi sp,sp,-256
	sw ra,252(sp)
	sw s0,248(sp)
	addi s0,sp,256
	call getInt
	lw t0,-12(s0)
	lw t1,-16(s0)
	mv t1,t0
	sw t0,-12(s0)
	sw t1,-16(s0)
	lw t0,-16(s0)
	mv a0,t0
	sw t0,-16(s0)
	call toString
LBB98:
	lw t0,-20(s0)
	li t0,1
	sw t0,-20(s0)
	lw t0,-20(s0)
	bnez t0,LBB99
	j LBB114
	sw t0,-20(s0)
LBB99:
	call getString
	lw t0,-24(s0)
	lw t1,-28(s0)
	mv t1,t0
	sw t0,-24(s0)
	sw t1,-28(s0)
	lw t0,-32(s0)
	li t0,3
	sw t0,-32(s0)
	lw t0,-32(s0)
	mv a0,t0
	sw t0,-32(s0)
	call __string_ord
	lw t0,-36(s0)
	mv a0,t0
	sw t0,-36(s0)
	call toString
	lw t0,-40(s0)
	mv a0,t0
	sw t0,-40(s0)
	call println
	call __string_length
	lw t0,-44(s0)
	lw t1,-48(s0)
	xori t0,t1,-1
	sw t0,-44(s0)
	sw t1,-48(s0)
	lw t0,-52(s0)
	lw t1,-44(s0)
	xori t0,t1,-1
	sw t0,-52(s0)
	sw t1,-44(s0)
	lw t0,-52(s0)
	lw t1,-56(s0)
	mv t1,t0
	sw t0,-52(s0)
	sw t1,-56(s0)
LBB100:
	lw t0,-60(s0)
	li t0,1
	sw t0,-60(s0)
	lw t0,-60(s0)
	bnez t0,LBB101
	j LBB113
	sw t0,-60(s0)
LBB101:
	lw t0,-64(s0)
	mv a0,t0
	sw t0,-64(s0)
	call toString
LBB102:
	lw t0,-68(s0)
	lw t0,const_string_no5
	sw t0,-68(s0)
	lw t0,-72(s0)
	lw t0,const_string_no6
	sw t0,-72(s0)
	lw t0,-68(s0)
	mv a0,t0
	sw t0,-68(s0)
	lw t0,-72(s0)
	mv a1,t0
	sw t0,-72(s0)
	call __string_add
	lw t0,-76(s0)
	lw t0,const_string_no7
	sw t0,-76(s0)
	lw t0,-80(s0)
	mv a0,t0
	sw t0,-80(s0)
	lw t0,-76(s0)
	mv a1,t0
	sw t0,-76(s0)
	call __string_sge
	lw t0,-84(s0)
	bnez t0,LBB103
	j LBB112
	sw t0,-84(s0)
LBB103:
	lw t0,-88(s0)
	li t0,3
	sw t0,-88(s0)
	lw t0,-92(s0)
	lw t1,-88(s0)
	addi t0,t1,-4
	sw t0,-92(s0)
	sw t1,-88(s0)
	lw t0,-96(s0)
	lw t1,-92(s0)
	addi t0,t1,4
	sw t0,-96(s0)
	sw t1,-92(s0)
	lw t0,-96(s0)
	mv a0,t0
	sw t0,-96(s0)
	call malloc
	lw t0,-100(s0)
	lw t1,-104(s0)
	addi t0,t1,0
	sw t0,-100(s0)
	sw t1,-104(s0)
	lw t0,-108(s0)
	li t0,3
	sw t0,-108(s0)
	lw t0,-108(s0)
	lw t1,-100(s0)
	mv t1,t0
	sw t0,-108(s0)
	sw t1,-100(s0)
	lw t0,-112(s0)
	lw t1,-100(s0)
	mv t0,t1
	sw t0,-112(s0)
	sw t1,-100(s0)
	j LBB104
LBB104:
	lw t0,-116(s0)
	lw t1,-100(s0)
	addi t0,t1,12
	sw t0,-116(s0)
	sw t1,-100(s0)
	lw t0,-120(s0)
	lw t1,-116(s0)
	lw t2,-112(s0)
	xor t0,t1,t2
	sw t0,-120(s0)
	sw t1,-116(s0)
	sw t2,-112(s0)
	lw t0,-124(s0)
	lw t1,-120(s0)
	snez t0,t1
	sw t0,-124(s0)
	sw t1,-120(s0)
	lw t0,-124(s0)
	bnez t0,LBB105
	j LBB106
	sw t0,-124(s0)
LBB105:
	lw t0,-128(s0)
	lw t1,-112(s0)
	addi t0,t1,4
	sw t0,-128(s0)
	sw t1,-112(s0)
	lw t0,-132(s0)
	li t0,3
	sw t0,-132(s0)
	lw t0,-136(s0)
	lw t1,-132(s0)
	addi t0,t1,-4
	sw t0,-136(s0)
	sw t1,-132(s0)
	lw t0,-140(s0)
	lw t1,-136(s0)
	addi t0,t1,4
	sw t0,-140(s0)
	sw t1,-136(s0)
	lw t0,-140(s0)
	mv a0,t0
	sw t0,-140(s0)
	call malloc
	lw t0,-144(s0)
	lw t1,-148(s0)
	addi t0,t1,0
	sw t0,-144(s0)
	sw t1,-148(s0)
	lw t0,-152(s0)
	li t0,3
	sw t0,-152(s0)
	lw t0,-152(s0)
	lw t1,-144(s0)
	mv t1,t0
	sw t0,-152(s0)
	sw t1,-144(s0)
	lw t0,-144(s0)
	lw t1,-112(s0)
	mv t0,t1
	sw t0,-144(s0)
	sw t1,-112(s0)
	j LBB104
LBB106:
	lw t0,-100(s0)
	lw t1,-156(s0)
	mv t1,t0
	sw t0,-100(s0)
	sw t1,-156(s0)
	lw t0,-160(s0)
	lw t1,-164(s0)
	addi t0,t1,0
	sw t0,-160(s0)
	sw t1,-164(s0)
	lw t0,-168(s0)
	lw t1,-160(s0)
	addi t0,t1,-4
	sw t0,-168(s0)
	sw t1,-160(s0)
	lw t0,-172(s0)
	li t0,0
	sw t0,-172(s0)
	lw t0,-176(s0)
	lw t1,-156(s0)
	lw t2,-172(s0)
	xor t0,t1,t2
	sw t0,-176(s0)
	sw t1,-156(s0)
	sw t2,-172(s0)
	lw t0,-180(s0)
	lw t1,-176(s0)
	snez t0,t1
	sw t0,-180(s0)
	sw t1,-176(s0)
	lw t0,-180(s0)
	bnez t0,LBB107
	j LBB108
	sw t0,-180(s0)
LBB107:
	j LBB109
LBB108:
	j LBB109
LBB109:
	lw t0,-184(s0)
	lw t1,-156(s0)
	addi t0,t1,4
	sw t0,-184(s0)
	sw t1,-156(s0)
	lw t0,-188(s0)
	lw t1,-184(s0)
	addi t0,t1,8
	sw t0,-188(s0)
	sw t1,-184(s0)
	lw t0,-188(s0)
	bnez t0,LBB110
	j LBB111
	sw t0,-188(s0)
LBB110:
	lw t0,-192(s0)
	lw t0,const_string_no8
	sw t0,-192(s0)
	lw t0,-192(s0)
	mv a0,t0
	sw t0,-192(s0)
	call println
	j LBB111
LBB111:
	j LBB102
LBB112:
	j LBB100
LBB113:
	j LBB98
LBB114:
	j LBB116
LBB116:
	lw t0,-196(s0)
	mv a0,t0
	sw t0,-196(s0)
	lw s0,248(sp)
	lw ra,252(sp)
	addi sp,sp,256
	ret
# end function : bad_func_4
	.globl	main					# start function : main
	.p2align	2
main:
#LBB117:
	addi sp,sp,-96
	sw ra,92(sp)
	sw s0,88(sp)
	addi s0,sp,96
	call __init__
	lw t0,-12(s0)
	li t0,1
	sw t0,-12(s0)
	lw t0,-12(s0)
	lw t1,-16(s0)
	mv t1,t0
	sw t0,-12(s0)
	sw t1,-16(s0)
	lw t0,-20(s0)
	li t0,1
	sw t0,-20(s0)
	lw t0,-20(s0)
	bnez t0,LBB118
	j LBB119
	sw t0,-20(s0)
LBB118:
	lw t0,-16(s0)
	mv a0,t0
	sw t0,-16(s0)
	call toString
	call __string_parseInt
	j LBB119
LBB119:
	j LBB121
LBB121:
	lw t0,-24(s0)
	mv a0,t0
	sw t0,-24(s0)
	lw s0,88(sp)
	lw ra,92(sp)
	addi sp,sp,96
	ret
# end function : main
	.globl	const_string_no0
const_string_no0:
	.asciz	"\"aha\" "

	.globl	const_string_no1
const_string_no1:
	.asciz	"\"what's this?\" "

	.globl	const_string_no2
const_string_no2:
	.asciz	"\"x is: \" "

	.globl	const_string_no3
const_string_no3:
	.asciz	"\"\"\"\"\n\" "

	.globl	const_string_no4
const_string_no4:
	.asciz	"\"false\" "

	.globl	const_string_no5
const_string_no5:
	.asciz	"\"asd\" "

	.globl	const_string_no6
const_string_no6:
	.asciz	"\"sad\" "

	.globl	const_string_no7
const_string_no7:
	.asciz	"\"fads\" "

	.globl	const_string_no8
const_string_no8:
	.asciz	"\"wow\" "

