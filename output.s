	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a1,10000000
	lui a0,%hi(INF)
	sw a1,%lo(INF)(a0)
LBB25:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	EdgeList.init					# start function : EdgeList.init
	.p2align	2
EdgeList.init:
#LBB46:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s2,a0
	mv s3,a1
	mv s4,a2
	addi s5,s2,0
	li a0,4
	mul a0,s4,a0
	addi a0,a0,4
	call malloc
	sw s4,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s5)
	addi s5,s2,4
	li a0,4
	mul a0,s4,a0
	addi a0,a0,4
	call malloc
	sw s4,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s5)
	addi s5,s2,8
	li a0,4
	mul a0,s3,a0
	addi a0,a0,4
	call malloc
	sw s3,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s5)
	li a0,0
LBB47:
	slt a1,a0,s4
	bnez a1,LBB48
	j LBB50
LBB48:
	addi a1,s2,4
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	li a1,-1
	sw a1,0(a2)
LBB49:
	addi a0,a0,1
	j LBB47
LBB50:
	li a0,0
LBB51:
	slt a1,a0,s3
	bnez a1,LBB52
	j LBB54
LBB52:
	addi a1,s2,8
	lw a2,0(a1)
	slli a1,a0,2
	add a2,a2,a1
	li a1,-1
	sw a1,0(a2)
LBB53:
	addi a0,a0,1
	j LBB51
LBB54:
	li a0,0
	sw a0,12(s2)
LBB55:
	mv a0,s1
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw ra,-4(sp)
	ret
# end function : EdgeList.init
	.globl	EdgeList.addEdge					# start function : EdgeList.addEdge
	.p2align	2
EdgeList.addEdge:
#LBB56:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s2,a0
	mv s3,a1
	mv s4,a2
	mv s5,a3
	li a0,12
	call malloc
	addi a2,a0,0
	sw s3,0(a2)
	sw s4,4(a2)
	sw s5,8(a2)
	addi a0,s2,0
	lw a1,0(a0)
	lw a0,12(s2)
	slli a0,a0,2
	add a0,a1,a0
	sw a2,0(a0)
	addi a0,s2,4
	lw a1,0(a0)
	lw a0,12(s2)
	slli a0,a0,2
	add a2,a1,a0
	addi a0,s2,8
	lw a1,0(a0)
	slli a0,s3,2
	add a0,a1,a0
	lw a0,0(a0)
	sw a0,0(a2)
	addi a0,s2,8
	lw a1,0(a0)
	slli a0,s3,2
	add a1,a1,a0
	lw a0,12(s2)
	sw a0,0(a1)
	lw a0,12(s2)
	addi a0,a0,1
	sw a0,12(s2)
LBB57:
	mv a0,s1
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw ra,-4(sp)
	ret
# end function : EdgeList.addEdge
	.globl	EdgeList.nVertices					# start function : EdgeList.nVertices
	.p2align	2
EdgeList.nVertices:
#LBB58:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	addi a0,a0,8
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
LBB59:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : EdgeList.nVertices
	.globl	EdgeList.nEdges					# start function : EdgeList.nEdges
	.p2align	2
EdgeList.nEdges:
#LBB60:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	addi a0,a0,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
LBB61:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : EdgeList.nEdges
	.globl	Array_Node.Array_Node					# start function : Array_Node.Array_Node
	.p2align	2
Array_Node.Array_Node:
#LBB62:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-84
	li a1,0
	sw a1,4(a0)
	addi s1,a0,0
	li a0,68
	call malloc
	li a1,16
	sw a1,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s1)
LBB63:
	addi sp,sp,84
	lw s1,-12(sp)
	lw ra,-4(sp)
	ret
# end function : Array_Node.Array_Node
	.globl	Array_Node.push_back					# start function : Array_Node.push_back
	.p2align	2
Array_Node.push_back:
#LBB64:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s2,a0
	mv s3,a1
	mv a0,s2
	call Array_Node.size
	addi a1,s2,0
	lw a1,0(a1)
	addi a1,a1,-4
	lw a1,0(a1)
	xor a0,a0,a1
	seqz a0,a0
	bnez a0,LBB65
	j LBB66
LBB65:
	mv a0,s2
	call Array_Node.doubleStorage
LBB66:
	addi a0,s2,0
	lw a1,0(a0)
	lw a0,4(s2)
	slli a0,a0,2
	add a0,a1,a0
	sw s3,0(a0)
	lw a0,4(s2)
	addi a0,a0,1
	sw a0,4(s2)
LBB67:
	mv a0,s1
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw ra,-4(sp)
	ret
# end function : Array_Node.push_back
	.globl	Array_Node.pop_back					# start function : Array_Node.pop_back
	.p2align	2
Array_Node.pop_back:
#LBB68:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	lw a1,4(a0)
	addi a1,a1,-1
	sw a1,4(a0)
	addi a1,a0,0
	lw a1,0(a1)
	lw a0,4(a0)
	slli a0,a0,2
	add a0,a1,a0
	lw a0,0(a0)
LBB69:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Array_Node.pop_back
	.globl	Array_Node.back					# start function : Array_Node.back
	.p2align	2
Array_Node.back:
#LBB70:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	addi a1,a0,0
	lw a1,0(a1)
	lw a0,4(a0)
	addi a0,a0,-1
	slli a0,a0,2
	add a0,a1,a0
	lw a0,0(a0)
LBB71:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Array_Node.back
	.globl	Array_Node.front					# start function : Array_Node.front
	.p2align	2
Array_Node.front:
#LBB72:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	addi a0,a0,0
	lw a0,0(a0)
	addi a0,a0,0
	lw a0,0(a0)
LBB73:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Array_Node.front
	.globl	Array_Node.size					# start function : Array_Node.size
	.p2align	2
Array_Node.size:
#LBB74:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	lw a0,4(a0)
LBB75:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Array_Node.size
	.globl	Array_Node.resize					# start function : Array_Node.resize
	.p2align	2
Array_Node.resize:
#LBB76:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s2,a0
	mv s3,a1
LBB77:
	addi a0,s2,0
	lw a0,0(a0)
	addi a0,a0,-4
	lw a0,0(a0)
	slt a0,a0,s3
	bnez a0,LBB78
	j LBB79
LBB78:
	mv a0,s2
	call Array_Node.doubleStorage
	j LBB77
LBB79:
	sw s3,4(s2)
LBB80:
	mv a0,s1
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw ra,-4(sp)
	ret
# end function : Array_Node.resize
	.globl	Array_Node.get					# start function : Array_Node.get
	.p2align	2
Array_Node.get:
#LBB81:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	addi a0,a0,0
	lw a2,0(a0)
	slli a0,a1,2
	add a0,a2,a0
	lw a0,0(a0)
LBB82:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Array_Node.get
	.globl	Array_Node.set					# start function : Array_Node.set
	.p2align	2
Array_Node.set:
#LBB83:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	addi a0,a0,0
	lw a4,0(a0)
	slli a0,a1,2
	add a0,a4,a0
	sw a2,0(a0)
LBB84:
	mv a0,a3
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Array_Node.set
	.globl	Array_Node.swap					# start function : Array_Node.swap
	.p2align	2
Array_Node.swap:
#LBB85:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	addi a4,a0,0
	lw a5,0(a4)
	slli a4,a1,2
	add a4,a5,a4
	lw a6,0(a4)
	addi a4,a0,0
	lw a4,0(a4)
	slli a1,a1,2
	add a5,a4,a1
	addi a1,a0,0
	lw a4,0(a1)
	slli a1,a2,2
	add a1,a4,a1
	lw a1,0(a1)
	sw a1,0(a5)
	addi a0,a0,0
	lw a1,0(a0)
	slli a0,a2,2
	add a0,a1,a0
	sw a6,0(a0)
LBB86:
	mv a0,a3
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Array_Node.swap
	.globl	Array_Node.doubleStorage					# start function : Array_Node.doubleStorage
	.p2align	2
Array_Node.doubleStorage:
#LBB87:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	mv s0,sp
	addi sp,sp,-84
	mv s2,a0
	addi a0,s2,0
	lw s3,0(a0)
	lw s4,4(s2)
	addi s5,s2,0
	addi a0,s3,-4
	lw a1,0(a0)
	li a0,2
	mul s6,a1,a0
	li a0,4
	mul a0,s6,a0
	addi a0,a0,4
	call malloc
	sw s6,0(a0)
	addi a0,a0,4
	addi a0,a0,0
	sw a0,0(s5)
	li a0,0
	sw a0,4(s2)
LBB88:
	lw a0,4(s2)
	xor a0,a0,s4
	snez a0,a0
	bnez a0,LBB89
	j LBB91
LBB89:
	addi a0,s2,0
	lw a1,0(a0)
	lw a0,4(s2)
	slli a0,a0,2
	add a1,a1,a0
	lw a0,4(s2)
	slli a0,a0,2
	add a0,s3,a0
	lw a0,0(a0)
	sw a0,0(a1)
LBB90:
	lw a0,4(s2)
	addi a0,a0,1
	sw a0,4(s2)
	j LBB88
LBB91:
LBB92:
	mv a0,s1
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw ra,-4(sp)
	ret
# end function : Array_Node.doubleStorage
	.globl	Heap_Node.Heap_Node					# start function : Heap_Node.Heap_Node
	.p2align	2
Heap_Node.Heap_Node:
#LBB93:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	mv s0,sp
	addi sp,sp,-84
	addi s2,a0,0
	li a0,8
	call malloc
	addi s1,a0,0
	mv a0,s1
	call Array_Node.Array_Node
	sw s1,0(s2)
LBB94:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw ra,-4(sp)
	ret
# end function : Heap_Node.Heap_Node
	.globl	Heap_Node.push					# start function : Heap_Node.push
	.p2align	2
Heap_Node.push:
#LBB95:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	mv s0,sp
	addi sp,sp,-92
	mv s2,a0
	addi a0,s2,0
	lw a0,0(a0)
	call Array_Node.push_back
	mv a0,s2
	call Heap_Node.size
	addi s4,a0,-1
LBB96:
	li a0,0
	slt a0,a0,s4
	bnez a0,LBB97
	j LBB100
LBB97:
	mv a0,s2
	mv a1,s4
	call Heap_Node.pnt
	mv s3,a0
	addi a0,s2,0
	lw a0,0(a0)
	mv a1,s3
	call Array_Node.get
	call Node.key_
	mv s5,a0
	addi a0,s2,0
	lw a0,0(a0)
	mv a1,s4
	call Array_Node.get
	call Node.key_
	slt a0,s5,a0
	xori a0,a0,1
	bnez a0,LBB98
	j LBB99
LBB98:
	j LBB100
LBB99:
	addi a0,s2,0
	lw a0,0(a0)
	mv a1,s3
	mv a2,s4
	call Array_Node.swap
	mv s4,s3
	j LBB96
LBB100:
LBB101:
	mv a0,s1
	addi sp,sp,92
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw ra,-4(sp)
	ret
# end function : Heap_Node.push
	.globl	Heap_Node.pop					# start function : Heap_Node.pop
	.p2align	2
Heap_Node.pop:
#LBB102:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-92
	mv s2,a0
	addi a0,s2,0
	lw a0,0(a0)
	call Array_Node.front
	mv s1,a0
	addi a0,s2,0
	lw s3,0(a0)
	mv a0,s2
	call Heap_Node.size
	addi a2,a0,-1
	mv a0,s3
	li a1,0
	call Array_Node.swap
	addi a0,s2,0
	lw a0,0(a0)
	call Array_Node.pop_back
	mv a0,s2
	li a1,0
	call Heap_Node.maxHeapify
LBB103:
	mv a0,s1
	addi sp,sp,92
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw ra,-4(sp)
	ret
# end function : Heap_Node.pop
	.globl	Heap_Node.top					# start function : Heap_Node.top
	.p2align	2
Heap_Node.top:
#LBB104:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
	addi a0,a0,0
	lw a0,0(a0)
	call Array_Node.front
LBB105:
	addi sp,sp,84
	lw ra,-4(sp)
	ret
# end function : Heap_Node.top
	.globl	Heap_Node.size					# start function : Heap_Node.size
	.p2align	2
Heap_Node.size:
#LBB106:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-84
	addi a0,a0,0
	lw a0,0(a0)
	call Array_Node.size
LBB107:
	addi sp,sp,84
	lw ra,-4(sp)
	ret
# end function : Heap_Node.size
	.globl	Heap_Node.lchild					# start function : Heap_Node.lchild
	.p2align	2
Heap_Node.lchild:
#LBB108:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a0,2
	mul a0,a1,a0
	addi a0,a0,1
LBB109:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Heap_Node.lchild
	.globl	Heap_Node.rchild					# start function : Heap_Node.rchild
	.p2align	2
Heap_Node.rchild:
#LBB110:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a0,2
	mul a0,a1,a0
	addi a0,a0,2
LBB111:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Heap_Node.rchild
	.globl	Heap_Node.pnt					# start function : Heap_Node.pnt
	.p2align	2
Heap_Node.pnt:
#LBB112:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	addi a1,a1,-1
	li a0,2
	div a0,a1,a0
LBB113:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Heap_Node.pnt
	.globl	Heap_Node.maxHeapify					# start function : Heap_Node.maxHeapify
	.p2align	2
Heap_Node.maxHeapify:
#LBB114:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	sw s7,-36(sp)
	sw s8,-40(sp)
	sw s9,-44(sp)
	mv s0,sp
	addi sp,sp,-92
	mv s1,a0
	mv s2,a1
	mv a1,s2
	mv a0,s1
	call Heap_Node.lchild
	mv s6,a0
	mv a1,s2
	mv a0,s1
	call Heap_Node.rchild
	mv s5,a0
	mv s3,s2
	mv a0,s1
	call Heap_Node.size
	slt s7,s6,a0
	bnez s7,LBB115
	j LBB116
LBB115:
	addi a0,s1,0
	lw a0,0(a0)
	mv a1,s6
	call Array_Node.get
	call Node.key_
	mv s9,a0
	addi a0,s1,0
	lw a0,0(a0)
	mv a1,s3
	call Array_Node.get
	call Node.key_
	slt s9,a0,s9
LBB116:
	and a0,s7,s9
	bnez a0,LBB118
	j LBB117
LBB117:
	j LBB119
LBB118:
	mv s3,s6
LBB119:
	mv a0,s1
	call Heap_Node.size
	slt s7,s5,a0
	bnez s7,LBB120
	j LBB121
LBB120:
	addi a0,s1,0
	lw a0,0(a0)
	mv a1,s5
	call Array_Node.get
	call Node.key_
	mv s6,a0
	addi a0,s1,0
	lw a0,0(a0)
	mv a1,s3
	call Array_Node.get
	call Node.key_
	slt s8,a0,s6
LBB121:
	and a0,s7,s8
	bnez a0,LBB123
	j LBB122
LBB122:
	j LBB124
LBB123:
	mv s3,s5
LBB124:
	xor a0,s3,s2
	seqz a0,a0
	bnez a0,LBB125
	j LBB126
LBB125:
	j LBB127
LBB126:
	addi a0,s1,0
	lw a0,0(a0)
	mv a1,s2
	mv a2,s3
	call Array_Node.swap
	mv a0,s1
	mv a1,s3
	call Heap_Node.maxHeapify
LBB127:
	mv a0,s4
	addi sp,sp,92
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw s7,-36(sp)
	lw s8,-40(sp)
	lw s9,-44(sp)
	lw ra,-4(sp)
	ret
# end function : Heap_Node.maxHeapify
	.globl	Node.key_					# start function : Node.key_
	.p2align	2
Node.key_:
#LBB130:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	lw a1,4(a0)
	li a0,0
	sub a0,a0,a1
LBB131:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : Node.key_
	.globl	init					# start function : init
	.p2align	2
init:
#LBB132:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	mv s0,sp
	addi sp,sp,-96
	call getInt
	lui a1,%hi(n)
	sw a0,%lo(n)(a1)
	call getInt
	lui a1,%hi(m)
	sw a0,%lo(m)(a1)
	li a0,16
	call malloc
	addi a1,a0,0
	lui a0,%hi(g)
	sw a1,%lo(g)(a0)
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	lui a1,%hi(n)
	lw a1,%lo(n)(a1)
	lui a2,%hi(m)
	lw a2,%lo(m)(a2)
	call EdgeList.init
	li s2,0
LBB133:
	lui a0,%hi(m)
	lw a0,%lo(m)(a0)
	slt a0,s2,a0
	bnez a0,LBB134
	j LBB136
LBB134:
	call getInt
	mv s3,a0
	call getInt
	mv s4,a0
	call getInt
	mv a3,a0
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	mv a1,s3
	mv a2,s4
	call EdgeList.addEdge
LBB135:
	addi s2,s2,1
	j LBB133
LBB136:
LBB137:
	mv a0,s1
	addi sp,sp,96
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw ra,-4(sp)
	ret
# end function : init
	.globl	dijkstra					# start function : dijkstra
	.p2align	2
dijkstra:
#LBB138:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	sw s4,-24(sp)
	sw s5,-28(sp)
	sw s6,-32(sp)
	mv s0,sp
	addi sp,sp,-88
	mv s2,a0
	lui a0,%hi(n)
	lw s1,%lo(n)(a0)
	li a0,4
	mul a0,s1,a0
	addi a0,a0,4
	call malloc
	sw s1,0(a0)
	addi a0,a0,4
	addi s5,a0,0
	lui a0,%hi(n)
	lw s1,%lo(n)(a0)
	li a0,4
	mul a0,s1,a0
	addi a0,a0,4
	call malloc
	sw s1,0(a0)
	addi a0,a0,4
	addi s1,a0,0
	li a0,0
LBB139:
	lui a1,%hi(n)
	lw a1,%lo(n)(a1)
	slt a1,a0,a1
	bnez a1,LBB140
	j LBB142
LBB140:
	slli a1,a0,2
	add a2,s1,a1
	lui a1,%hi(INF)
	lw a1,%lo(INF)(a1)
	sw a1,0(a2)
	slli a1,a0,2
	add a2,s5,a1
	li a1,0
	sw a1,0(a2)
LBB141:
	addi a0,a0,1
	j LBB139
LBB142:
	slli a0,s2,2
	add a1,s1,a0
	li a0,0
	sw a0,0(a1)
	li a0,4
	call malloc
	addi s3,a0,0
	mv a0,s3
	call Heap_Node.Heap_Node
	li a0,8
	call malloc
	addi a1,a0,0
	li a0,0
	sw a0,4(a1)
	sw s2,0(a1)
	mv a0,s3
	call Heap_Node.push
LBB143:
	mv a0,s3
	call Heap_Node.size
	li a1,0
	xor a0,a0,a1
	snez a0,a0
	bnez a0,LBB144
	j LBB153
LBB144:
	mv a0,s3
	call Heap_Node.pop
	lw s4,0(a0)
	slli a0,s4,2
	add a0,s5,a0
	lw a1,0(a0)
	li a0,1
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB145
	j LBB146
LBB145:
	j LBB143
LBB146:
	slli a0,s4,2
	add a1,s5,a0
	li a0,1
	sw a0,0(a1)
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	addi a0,a0,8
	lw a1,0(a0)
	slli a0,s4,2
	add a0,a1,a0
	lw s2,0(a0)
LBB147:
	li a0,-1
	xor a0,s2,a0
	snez a0,a0
	bnez a0,LBB148
	j LBB152
LBB148:
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a0,0(a0)
	lw s6,4(a0)
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	addi a0,a0,0
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw a0,0(a0)
	lw a1,8(a0)
	slli a0,s4,2
	add a0,s1,a0
	lw a0,0(a0)
	add a1,a0,a1
	slli a0,s6,2
	add a0,s1,a0
	lw a0,0(a0)
	slt a0,a1,a0
	xori a0,a0,1
	bnez a0,LBB149
	j LBB150
LBB149:
	j LBB151
LBB150:
	slli a0,s6,2
	add a0,s1,a0
	sw a1,0(a0)
	li a0,8
	call malloc
	addi a1,a0,0
	sw s6,0(a1)
	slli a0,s6,2
	add a0,s1,a0
	lw a0,0(a0)
	sw a0,4(a1)
	mv a0,s3
	call Heap_Node.push
LBB151:
	lui a0,%hi(g)
	lw a0,%lo(g)(a0)
	addi a0,a0,4
	lw a1,0(a0)
	slli a0,s2,2
	add a0,a1,a0
	lw s2,0(a0)
	j LBB147
LBB152:
	j LBB143
LBB153:
LBB154:
	mv a0,s1
	addi sp,sp,88
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw s4,-24(sp)
	lw s5,-28(sp)
	lw s6,-32(sp)
	lw ra,-4(sp)
	ret
# end function : dijkstra
	.globl	main					# start function : main
	.p2align	2
main:
#LBB155:
	sw ra,-4(sp)
	sw s1,-12(sp)
	sw s2,-16(sp)
	sw s3,-20(sp)
	mv s0,sp
	addi sp,sp,-84
	call __init__
	call init
	li s1,0
LBB156:
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
	slt a0,s1,a0
	bnez a0,LBB157
	j LBB166
LBB157:
	mv a0,s1
	call dijkstra
	mv s3,a0
	li s2,0
LBB158:
	lui a0,%hi(n)
	lw a0,%lo(n)(a0)
	slt a0,s2,a0
	bnez a0,LBB159
	j LBB164
LBB159:
	slli a0,s2,2
	add a0,s3,a0
	lw a1,0(a0)
	lui a0,%hi(INF)
	lw a0,%lo(INF)(a0)
	xor a0,a1,a0
	seqz a0,a0
	bnez a0,LBB160
	j LBB161
LBB160:
	la a0,const_string_no0
	call print
	j LBB162
LBB161:
	slli a0,s2,2
	add a0,s3,a0
	lw a0,0(a0)
	call toString
	call print
LBB162:
	la a0,const_string_no1
	call print
LBB163:
	addi s2,s2,1
	j LBB158
LBB164:
	la a0,const_string_no2
	call println
LBB165:
	addi s1,s1,1
	j LBB156
LBB166:
	li a0,0
LBB167:
	addi sp,sp,84
	lw s1,-12(sp)
	lw s2,-16(sp)
	lw s3,-20(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
n:
	.word	0

	.p2align	2
m:
	.word	0

	.p2align	2
g:
	.word	0

	.p2align	2
INF:
	.word	10000000

const_string_no0:
	.asciz	"-1"

const_string_no1:
	.asciz	" "

const_string_no2:
	.asciz	""

