	.text
	.global	main					# start function : main
	.p2align	2
main:
main_entrance_block0:
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
	li %14,5
	sw stack_13,%14(0)
	la %14,stack_13
	sb %13,%14(0)
	sw stack_14,%13(0)
	sw stack_13,%14(0)
	addi %15,%16,1
	sw stack_15,%15(0)
	sw stack_16,%16(0)
	la %16,stack_16
	la %15,stack_15
	sb %16,%15(0)
	sw stack_16,%16(0)
	sw stack_15,%15(0)
	la %15,stack_15
	sb %17,%15(0)
	sw stack_17,%17(0)
	sw stack_15,%15(0)
	sb %18,%19(0)
	sw stack_18,%18(0)
	sw stack_19,%19(0)
	add %20,%21,%22
	sw stack_20,%20(0)
	sw stack_21,%21(0)
	sw stack_22,%22(0)
	la %20,stack_20
	add %23,%20,%24
	sw stack_23,%23(0)
	sw stack_20,%20(0)
	sw stack_24,%24(0)
	la %23,stack_23
	sb %25,%23(0)
	sw stack_25,%25(0)
	sw stack_23,%23(0)
	j main_last_block1
	j main_return_block2
main_return_block2:
	la %25,stack_25
	mv a0,%25
	sw stack_25,%25(0)
	ret
# end function : main
