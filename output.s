	.text
	.global	main					# start function : main
	.p2align	2
main:
main_entrance_block63:
	mv %0,s0
	sw stack_0,%0(0)
	mv %1,s1
	sw stack_1,%1(0)
	mv %2,s2
	sw stack_2,%2(0)
	mv %3,s3
	sw stack_3,%3(0)
	mv %4,s4
	sw stack_4,%4(0)
	mv %5,s5
	sw stack_5,%5(0)
	mv %6,s6
	sw stack_6,%6(0)
	mv %7,s7
	sw stack_7,%7(0)
	mv %8,s8
	sw stack_8,%8(0)
	mv %9,s9
	sw stack_9,%9(0)
	mv %10,s10
	sw stack_10,%10(0)
	mv %11,s11
	sw stack_11,%11(0)
	mv %12,ra
	sw stack_12,%12(0)
	call __init__
	call getInt
	sb %13,%14(0)
	sw stack_13,%13(0)
	sw stack_14,%14(0)
	li %16,0
	sw stack_15,%16(0)
	la %16,stack_15
	sb %15,%16(0)
	sw stack_16,%15(0)
	sw stack_15,%16(0)
for_cond_block164:
	slt %17,%18,%19
	sw stack_17,%17(0)
	sw stack_18,%18(0)
	sw stack_19,%19(0)
for_body_block365:
	call getInt
	sb %20,%21(0)
	sw stack_20,%20(0)
	sw stack_21,%21(0)
	call getInt
	sb %22,%23(0)
	sw stack_22,%22(0)
	sw stack_23,%23(0)
	call getInt
	sb %24,%25(0)
	sw stack_24,%24(0)
	sw stack_25,%25(0)
	add %26,%27,%28
	sw stack_26,%26(0)
	sw stack_27,%27(0)
	sw stack_28,%28(0)
	la %26,stack_26
	sb %29,%26(0)
	sw stack_29,%29(0)
	sw stack_26,%26(0)
	add %30,%31,%32
	sw stack_30,%30(0)
	sw stack_31,%31(0)
	sw stack_32,%32(0)
	la %30,stack_30
	sb %33,%30(0)
	sw stack_33,%33(0)
	sw stack_30,%30(0)
	add %34,%35,%36
	sw stack_34,%34(0)
	sw stack_35,%35(0)
	sw stack_36,%36(0)
	la %34,stack_34
	sb %37,%34(0)
	sw stack_37,%37(0)
	sw stack_34,%34(0)
	j for_step_block266
for_step_block266:
	addi %38,%39,1
	sw stack_38,%38(0)
	sw stack_39,%39(0)
	la %39,stack_39
	la %38,stack_38
	sb %39,%38(0)
	sw stack_39,%39(0)
	sw stack_38,%38(0)
	j for_cond_block164
for_dest_block467:
	li %42,0
	sw stack_40,%42(0)
	la %42,stack_40
	xor %43,%41,%42
	sw stack_41,%43(0)
	sw stack_42,%41(0)
	sw stack_40,%42(0)
	la %43,stack_41
	seqz %40,%43
	sw stack_43,%40(0)
	sw stack_41,%43(0)
andand_b_block1068:
	li %46,0
	sw stack_44,%46(0)
	la %46,stack_44
	xor %47,%45,%46
	sw stack_45,%47(0)
	sw stack_46,%45(0)
	sw stack_44,%46(0)
	la %47,stack_45
	seqz %44,%47
	sw stack_47,%44(0)
	sw stack_45,%47(0)
	j andand_dest_block1169
andand_dest_block1169:
	j andand_b_block870
andand_b_block870:
	li %50,0
	sw stack_48,%50(0)
	la %50,stack_48
	xor %51,%49,%50
	sw stack_49,%51(0)
	sw stack_50,%49(0)
	sw stack_48,%50(0)
	la %51,stack_49
	seqz %48,%51
	sw stack_51,%48(0)
	sw stack_49,%51(0)
	j andand_dest_block971
andand_dest_block971:
	j if_then_block572
if_then_block572:
	la %52,const_string_no0
	sw stack_52,%52(0)
	la %52,stack_52
	mv a0,%52
	sw stack_52,%52(0)
	call print
	j if_dest_block776
if_else_block673:
	la %53,const_string_no1
	sw stack_53,%53(0)
	la %53,stack_53
	mv a0,%53
	sw stack_53,%53(0)
	call print
	j if_dest_block776
main_return_block75:
	mv a0,%54
	sw stack_54,%54(0)
	ret
# end function : main
	.globl	p
	.p2align	2
p:
	.word	0

	.globl	q
	.p2align	2
q:
	.word	0

	.globl	r
	.p2align	2
r:
	.word	0

	.globl	x
	.p2align	2
x:
	.word	0

	.globl	y
	.p2align	2
y:
	.word	0

	.globl	z
	.p2align	2
z:
	.word	0

	.globl	n
	.p2align	2
n:
	.word	0

	.globl	i
	.p2align	2
i:
	.word	0

	.globl	const_string_no0
const_string_no0:
	.asciz	"\"YES\" "

	.globl	const_string_no1
const_string_no1:
	.asciz	"\"NO\" "

