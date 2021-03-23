	.text
	.global	foo					# start function : foo
	.p2align	2
foo:
foo_entrance_block66:
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
	li %13,4
	sw stack_13,%13(0)
	la %13,stack_13
	mv a0,%13
	sw stack_13,%13(0)
	call __malloc_foo
	addi %14,%15,0
	sw stack_14,%14(0)
	sw stack_15,%15(0)
	la %14,stack_14
	sb %16,%14(0)
	sw stack_16,%16(0)
	sw stack_14,%14(0)
	j foo_last_block67
	j foo_return_block68
foo_return_block68:
	la %16,stack_16
	mv a0,%16
	sw stack_16,%16(0)
	ret
# end function : foo
	.global	main					# start function : main
	.p2align	2
main:
main_entrance_block69:
	mv %17,s0
	sw stack_17,%17(0)
	mv %18,s1
	sw stack_18,%18(0)
	mv %19,s2
	sw stack_19,%19(0)
	mv %20,s3
	sw stack_20,%20(0)
	mv %21,s4
	sw stack_21,%21(0)
	mv %22,s5
	sw stack_22,%22(0)
	mv %23,s6
	sw stack_23,%23(0)
	mv %24,s7
	sw stack_24,%24(0)
	mv %25,s8
	sw stack_25,%25(0)
	mv %26,s9
	sw stack_26,%26(0)
	mv %27,s10
	sw stack_27,%27(0)
	mv %28,s11
	sw stack_28,%28(0)
	mv %29,ra
	sw stack_29,%29(0)
	call __init__
	call foo
	mv a0,%30
	sw stack_30,%30(0)
	li %32,1
	sw stack_31,%32(0)
	la %32,stack_31
	sb %31,%32(0)
	sw stack_32,%31(0)
	sw stack_31,%32(0)
	li %34,0
	sw stack_33,%34(0)
	la %34,stack_33
	sb %33,%34(0)
	sw stack_34,%33(0)
	sw stack_33,%34(0)
	j main_last_block70
	j main_return_block71
main_return_block71:
	la %33,stack_34
	mv a0,%33
	sw stack_34,%33(0)
	ret
# end function : main
