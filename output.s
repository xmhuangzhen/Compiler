	.text
	.globl	quick_sort					# start function : quick_sort
	.p2align	2
quick_sort:
#LBB0:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	mv s0,sp
	addi sp,sp,-92
LBB1:
	mv s2,a0
	mv s3,a2
	bge a1,s3,LBB2
LBB3:
	mv a0,a1
	slli a2,s3,2
	add a2,s2,a2
	lw a3,0(a2)
	addi a2,a0,-1
LBB5:
	blt a0,s3,LBB6
LBB7:
	addi s6,a2,1
	slli a0,s6,2
	add a0,s2,a0
	lw a3,0(a0)
	slli a0,s6,2
	add a2,s2,a0
	slli a0,s3,2
	add a0,s2,a0
	lw a0,0(a0)
	sw a0,0(a2)
	slli a0,s3,2
	add a0,s2,a0
	sw a3,0(a0)
	addi s5,s6,-1
LBB11:
	bge a1,s5,LBB12
LBB13:
	mv a3,s2
	mv a0,a1
	slli a2,s5,2
	add a2,a3,a2
	lw a4,0(a2)
	addi a2,a0,-1
LBB15:
	blt a0,s5,LBB16
LBB17:
	addi s4,a2,1
	slli a0,s4,2
	add a0,a3,a0
	lw a4,0(a0)
	slli a0,s4,2
	add a2,a3,a0
	slli a0,s5,2
	add a0,a3,a0
	lw a0,0(a0)
	sw a0,0(a2)
	slli a0,s5,2
	add a0,a3,a0
	sw a4,0(a0)
	addi a2,s4,-1
	mv a0,s2
	call quick_sort
	addi a1,s4,1
	mv a0,s2
	mv a2,s5
	call quick_sort
LBB14:
	addi a1,s6,1
LBB21:
	bge a1,s3,LBB22
LBB23:
	mv a0,a1
	slli a2,s3,2
	add a2,s2,a2
	lw a3,0(a2)
	addi a2,a0,-1
LBB25:
	blt a0,s3,LBB26
LBB27:
	addi s5,a2,1
	slli a0,s5,2
	add a0,s2,a0
	lw a3,0(a0)
	slli a0,s5,2
	add a2,s2,a0
	slli a0,s3,2
	add a0,s2,a0
	lw a0,0(a0)
	sw a0,0(a2)
	slli a0,s3,2
	add a0,s2,a0
	sw a3,0(a0)
	addi s6,s5,-1
LBB31:
	bge a1,s6,LBB32
LBB33:
	mv a3,s2
	mv a0,a1
	slli a2,s6,2
	add a2,a3,a2
	lw a4,0(a2)
	addi a2,a0,-1
LBB35:
	blt a0,s6,LBB36
LBB37:
	addi s4,a2,1
	slli a0,s4,2
	add a0,a3,a0
	lw a4,0(a0)
	slli a0,s4,2
	add a2,a3,a0
	slli a0,s6,2
	add a0,a3,a0
	lw a0,0(a0)
	sw a0,0(a2)
	slli a0,s6,2
	add a0,a3,a0
	sw a4,0(a0)
	addi a2,s4,-1
	mv a0,s2
	call quick_sort
	addi a1,s4,1
	mv a0,s2
	mv a2,s6
	call quick_sort
LBB34:
	addi a1,s5,1
	mv a0,s2
	mv a2,s3
	call quick_sort
LBB24:
LBB4:
	mv a0,s1
	addi sp,sp,92
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB36:
	slli a5,a0,2
	add a5,a3,a5
	lw a5,0(a5)
	ble a5,a4,LBB38
LBB39:
LBB40:
	addi a0,a0,1
	j LBB35
LBB38:
	addi a2,a2,1
	slli a5,a2,2
	add a5,a3,a5
	lw a7,0(a5)
	slli a5,a2,2
	add a6,a3,a5
	slli a5,a0,2
	add a5,a3,a5
	lw a5,0(a5)
	sw a5,0(a6)
	slli a5,a0,2
	add a5,a3,a5
	sw a7,0(a5)
	j LBB40
LBB32:
	j LBB34
LBB26:
	slli a4,a0,2
	add a4,s2,a4
	lw a4,0(a4)
	ble a4,a3,LBB28
LBB29:
LBB30:
	addi a0,a0,1
	j LBB25
LBB28:
	addi a2,a2,1
	slli a4,a2,2
	add a4,s2,a4
	lw a6,0(a4)
	slli a4,a2,2
	add a5,s2,a4
	slli a4,a0,2
	add a4,s2,a4
	lw a4,0(a4)
	sw a4,0(a5)
	slli a4,a0,2
	add a4,s2,a4
	sw a6,0(a4)
	j LBB30
LBB22:
	j LBB24
LBB16:
	slli a5,a0,2
	add a5,a3,a5
	lw a5,0(a5)
	ble a5,a4,LBB18
LBB19:
LBB20:
	addi a0,a0,1
	j LBB15
LBB18:
	addi a2,a2,1
	slli a5,a2,2
	add a5,a3,a5
	lw a7,0(a5)
	slli a5,a2,2
	add a6,a3,a5
	slli a5,a0,2
	add a5,a3,a5
	lw a5,0(a5)
	sw a5,0(a6)
	slli a5,a0,2
	add a5,a3,a5
	sw a7,0(a5)
	j LBB20
LBB12:
	j LBB14
LBB6:
	slli a4,a0,2
	add a4,s2,a4
	lw a4,0(a4)
	ble a4,a3,LBB8
LBB9:
LBB10:
	addi a0,a0,1
	j LBB5
LBB8:
	addi a2,a2,1
	slli a4,a2,2
	add a4,s2,a4
	lw a6,0(a4)
	slli a4,a2,2
	add a5,s2,a4
	slli a4,a0,2
	add a4,s2,a4
	lw a4,0(a4)
	sw a4,0(a5)
	slli a4,a0,2
	add a4,s2,a4
	sw a6,0(a4)
	j LBB10
LBB2:
	j LBB4
# end function : quick_sort
	.globl	main					# start function : main
	.p2align	2
main:
#LBB41:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	mv s0,sp
	addi sp,sp,-92
LBB42:
LBB43:
	call getInt
	mv s3,a0
	li a0,4
	mul a0,s3,a0
	addi a0,a0,4
	call malloc
	sw s3,0(a0)
	addi a0,a0,4
	addi s1,a0,0
	li s2,0
LBB44:
	blt s2,s3,LBB45
LBB46:
	mv s2,s1
	addi a0,s2,-4
	lw a0,0(a0)
	addi s4,a0,-1
LBB47:
	li a0,0
	bge a0,s4,LBB48
LBB49:
	slli a0,s4,2
	add a0,s2,a0
	lw a2,0(a0)
	li a0,0
	li a1,-1
LBB51:
	blt a0,s4,LBB52
LBB53:
	addi s6,a1,1
	slli a0,s6,2
	add a0,s2,a0
	lw a2,0(a0)
	slli a0,s6,2
	add a1,s2,a0
	slli a0,s4,2
	add a0,s2,a0
	lw a0,0(a0)
	sw a0,0(a1)
	slli a0,s4,2
	add a0,s2,a0
	sw a2,0(a0)
	addi s7,s6,-1
LBB57:
	li a0,0
	bge a0,s7,LBB58
LBB59:
	mv a2,s2
	slli a0,s7,2
	add a0,a2,a0
	lw a3,0(a0)
	li a0,0
	li a1,-1
LBB61:
	blt a0,s7,LBB62
LBB63:
	addi s5,a1,1
	slli a0,s5,2
	add a0,a2,a0
	lw a3,0(a0)
	slli a0,s5,2
	add a1,a2,a0
	slli a0,s7,2
	add a0,a2,a0
	lw a0,0(a0)
	sw a0,0(a1)
	slli a0,s7,2
	add a0,a2,a0
	sw a3,0(a0)
	addi a2,s5,-1
	mv a0,s2
	li a1,0
	call quick_sort
	addi a1,s5,1
	mv a0,s2
	mv a2,s7
	call quick_sort
LBB60:
	addi a1,s6,1
LBB67:
	bge a1,s4,LBB68
LBB69:
	mv a0,a1
	slli a2,s4,2
	add a2,s2,a2
	lw a3,0(a2)
	addi a2,a0,-1
LBB71:
	blt a0,s4,LBB72
LBB73:
	addi s6,a2,1
	slli a0,s6,2
	add a0,s2,a0
	lw a3,0(a0)
	slli a0,s6,2
	add a2,s2,a0
	slli a0,s4,2
	add a0,s2,a0
	lw a0,0(a0)
	sw a0,0(a2)
	slli a0,s4,2
	add a0,s2,a0
	sw a3,0(a0)
	addi s7,s6,-1
LBB77:
	bge a1,s7,LBB78
LBB79:
	mv a3,s2
	mv a0,a1
	slli a2,s7,2
	add a2,a3,a2
	lw a4,0(a2)
	addi a2,a0,-1
LBB81:
	blt a0,s7,LBB82
LBB83:
	addi s5,a2,1
	slli a0,s5,2
	add a0,a3,a0
	lw a4,0(a0)
	slli a0,s5,2
	add a2,a3,a0
	slli a0,s7,2
	add a0,a3,a0
	lw a0,0(a0)
	sw a0,0(a2)
	slli a0,s7,2
	add a0,a3,a0
	sw a4,0(a0)
	addi a2,s5,-1
	mv a0,s2
	call quick_sort
	addi a1,s5,1
	mv a0,s2
	mv a2,s7
	call quick_sort
LBB80:
	addi a1,s6,1
	mv a0,s2
	mv a2,s4
	call quick_sort
LBB70:
LBB50:
	li s2,0
LBB87:
	blt s2,s3,LBB88
LBB89:
	la a0,const_string_no1
	call println
	li a0,0
LBB90:
	addi sp,sp,92
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
LBB88:
	slli a0,s2,2
	add a0,s1,a0
	lw a0,0(a0)
	call toString
	la a1,const_string_no0
	call __string_add
	call print
	addi s2,s2,1
	j LBB87
LBB82:
	slli a5,a0,2
	add a5,a3,a5
	lw a5,0(a5)
	ble a5,a4,LBB84
LBB85:
LBB86:
	addi a0,a0,1
	j LBB81
LBB84:
	addi a2,a2,1
	slli a5,a2,2
	add a5,a3,a5
	lw a7,0(a5)
	slli a5,a2,2
	add a6,a3,a5
	slli a5,a0,2
	add a5,a3,a5
	lw a5,0(a5)
	sw a5,0(a6)
	slli a5,a0,2
	add a5,a3,a5
	sw a7,0(a5)
	j LBB86
LBB78:
	j LBB80
LBB72:
	slli a4,a0,2
	add a4,s2,a4
	lw a4,0(a4)
	ble a4,a3,LBB74
LBB75:
LBB76:
	addi a0,a0,1
	j LBB71
LBB74:
	addi a2,a2,1
	slli a4,a2,2
	add a4,s2,a4
	lw a6,0(a4)
	slli a4,a2,2
	add a5,s2,a4
	slli a4,a0,2
	add a4,s2,a4
	lw a4,0(a4)
	sw a4,0(a5)
	slli a4,a0,2
	add a4,s2,a4
	sw a6,0(a4)
	j LBB76
LBB68:
	j LBB70
LBB62:
	slli a4,a0,2
	add a4,a2,a4
	lw a4,0(a4)
	ble a4,a3,LBB64
LBB65:
LBB66:
	addi a0,a0,1
	j LBB61
LBB64:
	addi a1,a1,1
	slli a4,a1,2
	add a4,a2,a4
	lw a6,0(a4)
	slli a4,a1,2
	add a5,a2,a4
	slli a4,a0,2
	add a4,a2,a4
	lw a4,0(a4)
	sw a4,0(a5)
	slli a4,a0,2
	add a4,a2,a4
	sw a6,0(a4)
	j LBB66
LBB58:
	j LBB60
LBB52:
	slli a3,a0,2
	add a3,s2,a3
	lw a3,0(a3)
	ble a3,a2,LBB54
LBB55:
LBB56:
	addi a0,a0,1
	j LBB51
LBB54:
	addi a1,a1,1
	slli a3,a1,2
	add a3,s2,a3
	lw a5,0(a3)
	slli a3,a1,2
	add a4,s2,a3
	slli a3,a0,2
	add a3,s2,a3
	lw a3,0(a3)
	sw a3,0(a4)
	slli a3,a0,2
	add a3,s2,a3
	sw a5,0(a3)
	j LBB56
LBB48:
	j LBB50
LBB45:
	slli a0,s2,2
	add s4,s1,a0
	call getInt
	sw a0,0(s4)
	addi s2,s2,1
	j LBB44
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	" "

const_string_no1:
	.asciz	""

