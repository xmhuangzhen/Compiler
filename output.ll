	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	j LBB25
LBB25:
	ret
# end function : __init__
	.globl	main					# start function : main
	.p2align	2
main:
#LBB42:
	call __init__
	call getInt
	mv %0,a0
	li %2,4
	mul %1,%0,%2
	addi %3,%1,4
	mv a0,%3
	call malloc
	mv %4,a0
	sw %0,0(%4)
	addi %5,%4,4
	addi %6,%5,0
	addi %7,%4,4
	slli %9,%0,2
	add %8,%6,%9
	mv %10,%0
	j LBB43
LBB43:
	slt %11,%7,%8
	bnez %11,LBB45
	j LBB44
LBB44:
	mv %12,%10
	j LBB47
LBB45:
	mv %13,%10
	j LBB46
LBB46:
	li %15,4
	mul %14,%0,%15
	addi %16,%14,4
	mv a0,%16
	call malloc
	mv %17,a0
	sw %0,0(%17)
	addi %18,%17,4
	addi %19,%18,0
	sw %19,0(%7)
	addi %20,%7,4
	mv %7,%20
	mv %10,%13
	j LBB43
LBB47:
	lui %21,%hi(a)
	sw %6,%lo(a)(%21)
	lui %23,%hi(a)
	lw %22,%lo(a)(%23)
	addi %24,%22,4
	lw %25,0(%24)
	addi %26,%25,0
	li %27,123
	sw %27,0(%26)
	lui %29,%hi(a)
	lw %28,%lo(a)(%29)
	addi %30,%28,4
	lw %31,0(%30)
	addi %32,%31,0
	lw %33,0(%32)
	mv %34,%33
	mv %35,%12
	j LBB48
LBB48:
	mv a0,%34
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
a:
	.word	0

