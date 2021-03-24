	.text
	.global	__init__					# start function : __init__
	.p2align	2
__init__:
__init___entrance_block36:
	addi sp,sp,-64
	la s0,0(sp)
	mv s0,s0
	sw s0,0(sp)
	la s0,4(sp)
	mv s0,s1
	sw s0,4(sp)
	la s0,8(sp)
	mv s0,s2
	sw s0,8(sp)
	la s0,12(sp)
	mv s0,s3
	sw s0,12(sp)
	la s0,16(sp)
	mv s0,s4
	sw s0,16(sp)
	la s0,20(sp)
	mv s0,s5
	sw s0,20(sp)
	la s0,24(sp)
	mv s0,s6
	sw s0,24(sp)
	la s0,28(sp)
	mv s0,s7
	sw s0,28(sp)
	la s0,32(sp)
	mv s0,s8
	sw s0,32(sp)
	la s0,36(sp)
	mv s0,s9
	sw s0,36(sp)
	la s0,40(sp)
	mv s0,s10
	sw s0,40(sp)
	la s0,44(sp)
	mv s0,s11
	sw s0,44(sp)
	la s0,48(sp)
	mv s0,ra
	sw s0,48(sp)
	j __init___return_block38
__init___return_block38:
	addi sp,sp,64
	ret
# end function : __init__
	.global	abs					# start function : abs
	.p2align	2
abs:
abs_entrance_block63:
	addi sp,sp,-96
	la s0,0(sp)
	mv s0,s0
	sw s0,0(sp)
	la s0,4(sp)
	mv s0,s1
	sw s0,4(sp)
	la s0,8(sp)
	mv s0,s2
	sw s0,8(sp)
	la s0,12(sp)
	mv s0,s3
	sw s0,12(sp)
	la s0,16(sp)
	mv s0,s4
	sw s0,16(sp)
	la s0,20(sp)
	mv s0,s5
	sw s0,20(sp)
	la s0,24(sp)
	mv s0,s6
	sw s0,24(sp)
	la s0,28(sp)
	mv s0,s7
	sw s0,28(sp)
	la s0,32(sp)
	mv s0,s8
	sw s0,32(sp)
	la s0,36(sp)
	mv s0,s9
	sw s0,36(sp)
	la s0,40(sp)
	mv s0,s10
	sw s0,40(sp)
	la s0,44(sp)
	mv s0,s11
	sw s0,44(sp)
	la s0,48(sp)
	mv s0,ra
	sw s0,48(sp)
	la s0,52(sp)
	mv a0,s0
	sw s0,52(sp)
	la s0,56(sp)
	li s0,0
	sw s0,56(sp)
	la s0,60(sp)
	la s1,56(sp)
	la s2,64(sp)
	slt s0,s1,s2
	sw s0,60(sp)
if_then_block064:
	la s0,68(sp)
	la s1,72(sp)
	sb s0,s1
	sw s0,68(sp)
	j abs_last_block66
if_dest_block165:
	la s0,76(sp)
	li s0,1
	sw s0,76(sp)
	la s0,80(sp)
	la s1,76(sp)
	la s2,84(sp)
	sub s0,s1,s2
	sw s0,80(sp)
	la s0,80(sp)
	la s1,72(sp)
	sb s0,s1
	sw s0,80(sp)
	j abs_last_block66
abs_last_block66:
	j if_dest_block165
	j abs_return_block67
abs_return_block67:
	la s0,72(sp)
	mv a0,s0
	sw s0,72(sp)
	addi sp,sp,96
	ret
# end function : abs
	.global	main					# start function : main
	.p2align	2
main:
main_entrance_block68:
	addi sp,sp,-64
	la s0,0(sp)
	mv s0,s0
	sw s0,0(sp)
	la s0,4(sp)
	mv s0,s1
	sw s0,4(sp)
	la s0,8(sp)
	mv s0,s2
	sw s0,8(sp)
	la s0,12(sp)
	mv s0,s3
	sw s0,12(sp)
	la s0,16(sp)
	mv s0,s4
	sw s0,16(sp)
	la s0,20(sp)
	mv s0,s5
	sw s0,20(sp)
	la s0,24(sp)
	mv s0,s6
	sw s0,24(sp)
	la s0,28(sp)
	mv s0,s7
	sw s0,28(sp)
	la s0,32(sp)
	mv s0,s8
	sw s0,32(sp)
	la s0,36(sp)
	mv s0,s9
	sw s0,36(sp)
	la s0,40(sp)
	mv s0,s10
	sw s0,40(sp)
	la s0,44(sp)
	mv s0,s11
	sw s0,44(sp)
	la s0,48(sp)
	mv s0,ra
	sw s0,48(sp)
	call __init__
	la s0,52(sp)
	li s0,0
	sw s0,52(sp)
	la s0,52(sp)
	la s1,56(sp)
	sb s0,s1
	sw s0,52(sp)
	j main_last_block69
main_last_block69:
	j main_return_block70
main_return_block70:
	la s0,56(sp)
	mv a0,s0
	sw s0,56(sp)
	addi sp,sp,64
	ret
# end function : main
