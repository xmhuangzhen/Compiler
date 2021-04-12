	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	j LBB25
LBB25:
	ret
# end function : __init__
	.globl	tak					# start function : tak
	.p2align	2
tak:
#LBB42:
	mv %0,a0
	mv %1,a1
	mv %2,a2
	mv %3,%1
	mv %4,%0
	slt %5,%3,%4
	bnez %5,LBB43
	j LBB44
LBB43:
	mv %6,%0
	addi %7,%6,-1
	mv %8,%1
	mv %9,%2
	mv a0,%7
	mv a1,%8
	mv a2,%9
	call tak
	mv %10,a0
	mv %11,%1
	addi %12,%11,-1
	mv %13,%2
	mv %14,%0
	mv a0,%12
	mv a1,%13
	mv a2,%14
	call tak
	mv %15,a0
	mv %16,%2
	addi %17,%16,-1
	mv %18,%0
	mv %19,%1
	mv a0,%17
	mv a1,%18
	mv a2,%19
	call tak
	mv %20,a0
	mv a0,%10
	mv a1,%15
	mv a2,%20
	call tak
	mv %21,a0
	li %23,1
	add %22,%23,%21
	mv %24,%22
	j LBB45
LBB44:
	mv %25,%2
	mv %24,%25
	j LBB45
LBB45:
	mv a0,%24
	ret
# end function : tak
	.globl	main					# start function : main
	.p2align	2
main:
#LBB46:
	call __init__
	call getInt
	mv %26,a0
	call getInt
	mv %27,a0
	call getInt
	mv %28,a0
	mv a0,%26
	mv a1,%27
	mv a2,%28
	call tak
	mv %29,a0
	mv a0,%29
	call toString
	mv %30,a0
	mv a0,%30
	call println
	li %32,0
	mv %31,%32
	mv %33,%28
	mv %34,%27
	mv %35,%26
	j LBB47
LBB47:
	mv a0,%31
	ret
# end function : main
.section	.sdata,"aw",@progbits
