	.text
	.globl	point.cross					# start function : point.cross
	.p2align	2
point.cross:
#LBB40:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s1,a0
	mv s2,a1
	li a0,12
	call malloc
	addi a0,a0,0
LBB41:
	mv a1,a0
	li a2,0
	sw a2,0(a1)
	li a2,0
	sw a2,4(a1)
	li a2,0
	sw a2,8(a1)
LBB42:
LBB43:
	lw a2,4(s1)
	lw a1,8(s2)
	mul a3,a2,a1
	lw a2,8(s1)
	lw a1,4(s2)
	mul a1,a2,a1
	sub a2,a3,a1
	lw a3,8(s1)
	lw a1,0(s2)
	mul a4,a3,a1
	lw a3,0(s1)
	lw a1,8(s2)
	mul a1,a3,a1
	sub a3,a4,a1
	lw a4,0(s1)
	lw a1,4(s2)
	mul a5,a4,a1
	lw a4,4(s1)
	lw a1,0(s2)
	mul a1,a4,a1
	sub a4,a5,a1
LBB44:
	mv a1,a0
	sw a2,0(a1)
	sw a3,4(a1)
	sw a4,8(a1)
LBB45:
LBB46:
LBB47:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : point.cross
	.globl	point.printPoint					# start function : point.printPoint
	.p2align	2
point.printPoint:
#LBB48:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-88
	mv s2,a0
	la s3,const_string_no0
	lw a0,0(s2)
	call toString
	mv a1,a0
	mv a0,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv s3,a0
	lw a0,4(s2)
	call toString
	mv a1,a0
	mv a0,s3
	call __string_add
	la a1,const_string_no1
	call __string_add
	mv s3,a0
	lw a0,8(s2)
	call toString
	mv a1,a0
	mv a0,s3
	call __string_add
	la a1,const_string_no2
	call __string_add
	call println
LBB49:
	mv a0,s1
	addi sp,sp,88
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : point.printPoint
	.globl	main					# start function : main
	.p2align	2
main:
#LBB50:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	mv s0,sp
	addi sp,sp,-88
LBB51:
LBB52:
LBB53:
	li a0,12
	call malloc
	addi s3,a0,0
LBB54:
	mv a0,s3
	li a1,0
	sw a1,0(a0)
	li a1,0
	sw a1,4(a0)
	li a1,0
	sw a1,8(a0)
LBB55:
LBB56:
	li a0,12
	call malloc
	addi s1,a0,0
LBB57:
	mv a0,s1
	li a1,0
	sw a1,0(a0)
	li a1,0
	sw a1,4(a0)
	li a1,0
	sw a1,8(a0)
LBB58:
LBB59:
	li a0,12
	call malloc
	addi s4,a0,0
LBB60:
	mv a0,s4
	li a1,0
	sw a1,0(a0)
	li a1,0
	sw a1,4(a0)
	li a1,0
	sw a1,8(a0)
LBB61:
LBB62:
	li a0,12
	call malloc
	addi s2,a0,0
LBB63:
	mv a0,s2
	li a1,0
	sw a1,0(a0)
	li a1,0
	sw a1,4(a0)
	li a1,0
	sw a1,8(a0)
LBB64:
LBB65:
	mv a0,s3
	call point.printPoint
LBB66:
	mv a0,s3
	li a1,849
	li a2,-463
	li a3,480
	sw a1,0(a0)
	sw a2,4(a0)
	sw a3,8(a0)
LBB67:
LBB68:
LBB69:
	mv a0,s1
	li a1,-208
	li a2,585
	li a3,-150
	sw a1,0(a0)
	sw a2,4(a0)
	sw a3,8(a0)
LBB70:
LBB71:
LBB72:
	mv a0,s4
	li a1,360
	li a2,-670
	li a3,-742
	sw a1,0(a0)
	sw a2,4(a0)
	sw a3,8(a0)
LBB73:
LBB74:
LBB75:
	mv a0,s2
	li a1,-29
	li a2,-591
	li a3,-960
	sw a1,0(a0)
	sw a2,4(a0)
	sw a3,8(a0)
LBB76:
LBB77:
LBB78:
	mv a0,s3
	mv a1,s1
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	add a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	add a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	add a0,a3,a0
	sw a0,8(a2)
LBB79:
LBB80:
LBB81:
	mv a0,s1
	mv a1,s4
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	add a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	add a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	add a0,a3,a0
	sw a0,8(a2)
LBB82:
LBB83:
LBB84:
	mv a0,s2
	mv a1,s4
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	add a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	add a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	add a0,a3,a0
	sw a0,8(a2)
LBB85:
LBB86:
LBB87:
	mv a0,s4
	mv a1,s3
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	sub a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	sub a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	sub a0,a3,a0
	sw a0,8(a2)
LBB88:
LBB89:
LBB90:
	mv a0,s1
	mv a1,s2
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	sub a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	sub a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	sub a0,a3,a0
	sw a0,8(a2)
LBB91:
LBB92:
LBB93:
	mv a0,s2
	mv a1,s4
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	sub a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	sub a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	sub a0,a3,a0
	sw a0,8(a2)
LBB94:
LBB95:
LBB96:
	mv a0,s4
	mv a1,s1
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	add a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	add a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	add a0,a3,a0
	sw a0,8(a2)
LBB97:
LBB98:
LBB99:
	mv a0,s3
	mv a1,s1
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	add a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	add a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	add a0,a3,a0
	sw a0,8(a2)
LBB100:
LBB101:
LBB102:
	mv a0,s1
	mv a1,s1
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	add a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	add a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	add a0,a3,a0
	sw a0,8(a2)
LBB103:
LBB104:
LBB105:
	mv a0,s4
	mv a1,s4
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	add a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	add a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	add a0,a3,a0
	sw a0,8(a2)
LBB106:
LBB107:
LBB108:
	mv a0,s3
	mv a1,s2
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	sub a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	sub a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	sub a0,a3,a0
	sw a0,8(a2)
LBB109:
LBB110:
LBB111:
	mv a0,s3
	mv a1,s1
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	add a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	add a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	add a0,a3,a0
	sw a0,8(a2)
LBB112:
LBB113:
LBB114:
	mv a0,s1
	mv a1,s4
	mv a2,a0
	lw a4,0(a0)
	lw a3,0(a1)
	sub a3,a4,a3
	sw a3,0(a2)
	mv a2,a0
	lw a4,4(a0)
	lw a3,4(a1)
	sub a3,a4,a3
	sw a3,4(a2)
	mv a2,a0
	lw a3,8(a0)
	lw a0,8(a1)
	sub a0,a3,a0
	sw a0,8(a2)
LBB115:
LBB116:
LBB117:
	mv a0,s3
	lw a2,0(a0)
	lw a1,0(a0)
	mul a3,a2,a1
	lw a2,4(a0)
	lw a1,4(a0)
	mul a1,a2,a1
	add a2,a3,a1
	lw a1,8(a0)
	lw a0,8(a0)
	mul a0,a1,a0
	add a0,a2,a0
LBB118:
LBB119:
	call toString
	call println
LBB120:
	mv a0,s1
	lw a2,0(a0)
	lw a1,0(a0)
	mul a3,a2,a1
	lw a2,4(a0)
	lw a1,4(a0)
	mul a1,a2,a1
	add a2,a3,a1
	lw a1,8(a0)
	lw a0,8(a0)
	mul a0,a1,a0
	add a0,a2,a0
LBB121:
LBB122:
	call toString
	call println
LBB123:
	mv a0,s1
	mv a1,s4
	lw a3,0(a0)
	lw a2,0(a1)
	sub a4,a3,a2
	lw a3,0(a0)
	lw a2,0(a1)
	sub a2,a3,a2
	mul a5,a4,a2
	lw a3,4(a0)
	lw a2,4(a1)
	sub a4,a3,a2
	lw a3,4(a0)
	lw a2,4(a1)
	sub a2,a3,a2
	mul a2,a4,a2
	add a4,a5,a2
	lw a3,8(a0)
	lw a2,8(a1)
	sub a3,a3,a2
	lw a2,8(a0)
	lw a0,8(a1)
	sub a0,a2,a0
	mul a0,a3,a0
	add a0,a4,a0
LBB124:
LBB125:
	call toString
	call println
LBB126:
	mv a0,s2
	mv a1,s3
	lw a3,0(a0)
	lw a2,0(a1)
	sub a4,a3,a2
	lw a3,0(a0)
	lw a2,0(a1)
	sub a2,a3,a2
	mul a5,a4,a2
	lw a3,4(a0)
	lw a2,4(a1)
	sub a4,a3,a2
	lw a3,4(a0)
	lw a2,4(a1)
	sub a2,a3,a2
	mul a2,a4,a2
	add a4,a5,a2
	lw a3,8(a0)
	lw a2,8(a1)
	sub a3,a3,a2
	lw a2,8(a0)
	lw a0,8(a1)
	sub a0,a2,a0
	mul a0,a3,a0
	add a0,a4,a0
LBB127:
LBB128:
	call toString
	call println
LBB129:
	mv a0,s4
	mv a1,s3
	lw a3,0(a0)
	lw a2,0(a1)
	mul a4,a3,a2
	lw a3,4(a0)
	lw a2,4(a1)
	mul a2,a3,a2
	add a3,a4,a2
	lw a2,8(a0)
	lw a0,8(a1)
	mul a0,a2,a0
	add a0,a3,a0
LBB130:
LBB131:
	call toString
	call println
	mv a0,s1
	mv a1,s2
	call point.cross
	call point.printPoint
	mv a0,s3
	call point.printPoint
	mv a0,s1
	call point.printPoint
	mv a0,s4
	call point.printPoint
	mv a0,s2
	call point.printPoint
	li a0,0
LBB132:
	addi sp,sp,88
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	mv s0,sp
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
const_string_no0:
	.asciz	"("

const_string_no1:
	.asciz	", "

const_string_no2:
	.asciz	")"

