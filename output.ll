	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	li %0,10000000
	lui %1,%hi(INF)
	sw %0,%lo(INF)(%1)
	j LBB25
LBB25:
	ret
# end function : __init__
	.globl	init					# start function : init
	.p2align	2
init:
#LBB42:
	call getInt
	mv %2,a0
	lui %3,%hi(n)
	sw %2,%lo(n)(%3)
	call getInt
	mv %4,a0
	lui %5,%hi(m)
	sw %4,%lo(m)(%5)
	lui %7,%hi(n)
	lw %6,%lo(n)(%7)
	lui %9,%hi(n)
	lw %8,%lo(n)(%9)
	li %11,4
	mul %10,%6,%11
	addi %12,%10,4
	mv a0,%12
	call malloc
	mv %13,a0
	sw %6,0(%13)
	addi %14,%13,4
	addi %15,%14,0
	addi %16,%13,4
	slli %18,%6,2
	add %17,%15,%18
	j LBB43
LBB43:
	slt %19,%16,%17
	bnez %19,LBB44
	j LBB45
LBB44:
	li %21,4
	mul %20,%8,%21
	addi %22,%20,4
	mv a0,%22
	call malloc
	mv %23,a0
	sw %8,0(%23)
	addi %24,%23,4
	addi %25,%24,0
	sw %25,0(%16)
	addi %26,%16,4
	mv %16,%26
	j LBB43
LBB45:
	lui %27,%hi(a)
	sw %15,%lo(a)(%27)
	li %29,0
	mv %28,%29
	j LBB46
LBB46:
	lui %31,%hi(n)
	lw %30,%lo(n)(%31)
	slt %32,%28,%30
	bnez %32,LBB48
	j LBB47
LBB47:
	mv %33,%28
	j LBB57
LBB48:
	mv %34,%28
	j LBB49
LBB49:
	li %36,0
	mv %35,%36
	mv %37,%34
	j LBB50
LBB50:
	lui %39,%hi(n)
	lw %38,%lo(n)(%39)
	slt %40,%35,%38
	bnez %40,LBB52
	j LBB51
LBB51:
	mv %41,%35
	mv %42,%37
	j LBB55
LBB52:
	mv %43,%35
	mv %44,%37
	j LBB53
LBB53:
	lui %46,%hi(a)
	lw %45,%lo(a)(%46)
	slli %48,%44,2
	add %47,%45,%48
	lw %49,0(%47)
	slli %51,%43,2
	add %50,%49,%51
	lui %53,%hi(INF)
	lw %52,%lo(INF)(%53)
	sw %52,0(%50)
	mv %54,%43
	mv %55,%44
	j LBB54
LBB54:
	addi %56,%54,1
	mv %35,%56
	mv %37,%55
	j LBB50
LBB55:
	mv %57,%41
	mv %58,%42
	j LBB56
LBB56:
	addi %59,%58,1
	mv %28,%59
	j LBB46
LBB57:
	li %61,0
	mv %60,%61
	j LBB58
LBB58:
	lui %63,%hi(n)
	lw %62,%lo(n)(%63)
	slt %64,%60,%62
	bnez %64,LBB60
	j LBB59
LBB59:
	mv %65,%60
	j LBB63
LBB60:
	mv %66,%60
	j LBB61
LBB61:
	lui %68,%hi(a)
	lw %67,%lo(a)(%68)
	slli %70,%66,2
	add %69,%67,%70
	lw %71,0(%69)
	slli %73,%66,2
	add %72,%71,%73
	li %74,0
	sw %74,0(%72)
	mv %75,%66
	j LBB62
LBB62:
	addi %76,%75,1
	mv %60,%76
	j LBB58
LBB63:
	li %78,0
	mv %77,%78
	j LBB64
LBB64:
	lui %80,%hi(m)
	lw %79,%lo(m)(%80)
	slt %81,%77,%79
	bnez %81,LBB66
	j LBB65
LBB65:
	mv %82,%77
	j LBB69
LBB66:
	mv %83,%77
	j LBB67
LBB67:
	call getInt
	mv %84,a0
	call getInt
	mv %85,a0
	call getInt
	mv %86,a0
	lui %88,%hi(a)
	lw %87,%lo(a)(%88)
	slli %90,%84,2
	add %89,%87,%90
	lw %91,0(%89)
	slli %93,%85,2
	add %92,%91,%93
	sw %86,0(%92)
	mv %94,%86
	mv %95,%85
	mv %96,%84
	mv %97,%83
	j LBB68
LBB68:
	addi %98,%97,1
	mv %77,%98
	j LBB64
LBB69:
	mv %99,%82
	j LBB70
LBB70:
	mv a0,%100
	ret
# end function : init
	.globl	main					# start function : main
	.p2align	2
main:
#LBB71:
	call __init__
	call init
	mv %101,a0
	li %103,0
	mv %102,%103
	j LBB72
LBB72:
	lui %105,%hi(n)
	lw %104,%lo(n)(%105)
	slt %106,%102,%104
	bnez %106,LBB74
	j LBB73
LBB73:
	mv %107,%102
	j LBB93
LBB74:
	mv %108,%102
	j LBB75
LBB75:
	mv %109,%108
	li %111,0
	mv %110,%111
	j LBB76
LBB76:
	lui %113,%hi(n)
	lw %112,%lo(n)(%113)
	slt %114,%110,%112
	bnez %114,LBB78
	j LBB77
LBB77:
	mv %115,%109
	mv %116,%110
	j LBB91
LBB78:
	mv %117,%109
	mv %118,%110
	j LBB79
LBB79:
	mv %119,%117
	li %121,0
	mv %120,%121
	mv %122,%118
	j LBB80
LBB80:
	lui %124,%hi(n)
	lw %123,%lo(n)(%124)
	slt %125,%120,%123
	bnez %125,LBB82
	j LBB81
LBB81:
	mv %126,%119
	mv %127,%120
	mv %128,%122
	j LBB89
LBB82:
	mv %129,%119
	mv %130,%120
	mv %131,%122
	j LBB83
LBB83:
	lui %133,%hi(a)
	lw %132,%lo(a)(%133)
	slli %135,%131,2
	add %134,%132,%135
	lw %136,0(%134)
	slli %138,%130,2
	add %137,%136,%138
	lw %139,0(%137)
	lui %141,%hi(a)
	lw %140,%lo(a)(%141)
	slli %143,%131,2
	add %142,%140,%143
	lw %144,0(%142)
	slli %146,%129,2
	add %145,%144,%146
	lw %147,0(%145)
	lui %149,%hi(a)
	lw %148,%lo(a)(%149)
	slli %151,%129,2
	add %150,%148,%151
	lw %152,0(%150)
	slli %154,%130,2
	add %153,%152,%154
	lw %155,0(%153)
	add %156,%147,%155
	slt %157,%156,%139
	bnez %157,LBB85
	j LBB84
LBB84:
	mv %158,%129
	mv %159,%130
	mv %160,%131
	j LBB87
LBB85:
	mv %161,%129
	mv %162,%130
	mv %163,%131
	j LBB86
LBB86:
	lui %165,%hi(a)
	lw %164,%lo(a)(%165)
	slli %167,%163,2
	add %166,%164,%167
	lw %168,0(%166)
	slli %170,%162,2
	add %169,%168,%170
	lui %172,%hi(a)
	lw %171,%lo(a)(%172)
	slli %174,%163,2
	add %173,%171,%174
	lw %175,0(%173)
	slli %177,%161,2
	add %176,%175,%177
	lw %178,0(%176)
	lui %180,%hi(a)
	lw %179,%lo(a)(%180)
	slli %182,%161,2
	add %181,%179,%182
	lw %183,0(%181)
	slli %185,%162,2
	add %184,%183,%185
	lw %186,0(%184)
	add %187,%178,%186
	sw %187,0(%169)
	mv %158,%161
	mv %159,%162
	mv %160,%163
	j LBB87
LBB87:
	mv %188,%158
	mv %189,%159
	mv %190,%160
	j LBB88
LBB88:
	addi %191,%189,1
	mv %119,%188
	mv %120,%191
	mv %122,%190
	j LBB80
LBB89:
	mv %192,%126
	mv %193,%127
	mv %194,%128
	j LBB90
LBB90:
	addi %195,%194,1
	mv %109,%192
	mv %110,%195
	j LBB76
LBB91:
	mv %196,%115
	mv %197,%116
	j LBB92
LBB92:
	addi %198,%196,1
	mv %102,%198
	j LBB72
LBB93:
	mv %199,%107
	li %201,0
	mv %200,%201
	j LBB94
LBB94:
	lui %203,%hi(n)
	lw %202,%lo(n)(%203)
	slt %204,%200,%202
	bnez %204,LBB96
	j LBB95
LBB95:
	mv %205,%199
	mv %206,%200
	j LBB110
LBB96:
	mv %207,%199
	mv %208,%200
	j LBB97
LBB97:
	mv %209,%207
	li %211,0
	mv %210,%211
	mv %212,%208
	j LBB98
LBB98:
	lui %214,%hi(n)
	lw %213,%lo(n)(%214)
	slt %215,%210,%213
	bnez %215,LBB100
	j LBB99
LBB99:
	mv %216,%209
	mv %217,%210
	mv %218,%212
	j LBB108
LBB100:
	mv %219,%209
	mv %220,%210
	mv %221,%212
	j LBB101
LBB101:
	lui %223,%hi(a)
	lw %222,%lo(a)(%223)
	slli %225,%221,2
	add %224,%222,%225
	lw %226,0(%224)
	slli %228,%220,2
	add %227,%226,%228
	lw %229,0(%227)
	lui %231,%hi(INF)
	lw %230,%lo(INF)(%231)
	xor %233,%229,%230
	seqz %232,%233
	bnez %232,LBB103
	j LBB102
LBB102:
	mv %234,%219
	mv %235,%220
	mv %236,%221
	j LBB105
LBB103:
	mv %237,%219
	mv %238,%220
	mv %239,%221
	j LBB104
LBB104:
	la %240,const_string_no0
	mv a0,%240
	call print
	mv %241,%237
	mv %242,%238
	mv %243,%239
	j LBB106
LBB105:
	lui %245,%hi(a)
	lw %244,%lo(a)(%245)
	slli %247,%236,2
	add %246,%244,%247
	lw %248,0(%246)
	slli %250,%235,2
	add %249,%248,%250
	lw %251,0(%249)
	mv a0,%251
	call toString
	mv %252,a0
	mv a0,%252
	call print
	mv %241,%234
	mv %242,%235
	mv %243,%236
	j LBB106
LBB106:
	la %253,const_string_no1
	mv a0,%253
	call print
	mv %254,%241
	mv %255,%242
	mv %256,%243
	j LBB107
LBB107:
	addi %257,%255,1
	mv %209,%254
	mv %210,%257
	mv %212,%256
	j LBB98
LBB108:
	la %258,const_string_no2
	mv a0,%258
	call println
	mv %259,%216
	mv %260,%217
	mv %261,%218
	j LBB109
LBB109:
	addi %262,%261,1
	mv %199,%259
	mv %200,%262
	j LBB94
LBB110:
	li %264,0
	mv %263,%264
	mv %265,%205
	mv %266,%206
	j LBB111
LBB111:
	mv a0,%263
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
INF:
	.word	10000000

	.p2align	2
n:
	.word	0

	.p2align	2
m:
	.word	0

	.p2align	2
a:
	.word	0

const_string_no0:
	.asciz	"-1"

const_string_no1:
	.asciz	" "

const_string_no2:
	.asciz	""

