	.text
	.globl	A					# start function : A
	.p2align	2
A:
#LBB40:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB41:
LBB42:
LBB43:
	addi a0,a0,7
LBB44:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : A
	.globl	main					# start function : main
	.p2align	2
main:
#LBB45:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
LBB46:
LBB47:
LBB48:
LBB49:
	li a1,1000
	slt a1,a0,a1
	bnez a1,LBB50
	j LBB93
LBB50:
LBB51:
LBB52:
LBB53:
LBB54:
	addi a0,a0,7
LBB55:
LBB56:
LBB57:
LBB58:
LBB59:
LBB60:
	addi a0,a0,7
LBB61:
LBB62:
LBB63:
LBB64:
LBB65:
LBB66:
	addi a0,a0,7
LBB67:
LBB68:
LBB69:
LBB70:
LBB71:
LBB72:
	addi a0,a0,7
LBB73:
LBB74:
LBB75:
LBB76:
LBB77:
LBB78:
	addi a0,a0,7
LBB79:
LBB80:
LBB81:
LBB82:
LBB83:
LBB84:
	addi a0,a0,7
LBB85:
LBB86:
LBB87:
LBB88:
LBB89:
LBB90:
	addi a0,a0,7
LBB91:
LBB92:
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	call A
	j LBB94
LBB93:
	j LBB95
LBB94:
	j LBB49
LBB95:
LBB96:
	addi sp,sp,84
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
