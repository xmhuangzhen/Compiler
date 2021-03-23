	.text
	.global	A.func1					# start function : A.func1
	.p2align	2
A.func1:
A.func1_entrance_block66:
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
	mv a0,%13
	sw stack_13,%13(0)
	mv a1,%14
	sw stack_14,%14(0)
	j A.func1_return_block68
A.func1_return_block68:
	mv a0,%15
	sw stack_15,%15(0)
	ret
# end function : A.func1
	.global	A.func2					# start function : A.func2
	.p2align	2
A.func2:
A.func2_entrance_block69:
	mv %16,s0
	sw stack_16,%16(0)
	mv %17,s1
	sw stack_17,%17(0)
	mv %18,s2
	sw stack_18,%18(0)
	mv %19,s3
	sw stack_19,%19(0)
	mv %20,s4
	sw stack_20,%20(0)
	mv %21,s5
	sw stack_21,%21(0)
	mv %22,s6
	sw stack_22,%22(0)
	mv %23,s7
	sw stack_23,%23(0)
	mv %24,s8
	sw stack_24,%24(0)
	mv %25,s9
	sw stack_25,%25(0)
	mv %26,s10
	sw stack_26,%26(0)
	mv %27,s11
	sw stack_27,%27(0)
	mv %28,ra
	sw stack_28,%28(0)
	mv a0,%29
	sw stack_29,%29(0)
	mv a1,%30
	sw stack_30,%30(0)
	j A.func2_return_block71
A.func2_return_block71:
	mv a0,%31
	sw stack_31,%31(0)
	ret
# end function : A.func2
	.global	A.set					# start function : A.set
	.p2align	2
A.set:
A.set_entrance_block72:
	mv %32,s0
	sw stack_32,%32(0)
	mv %33,s1
	sw stack_33,%33(0)
	mv %34,s2
	sw stack_34,%34(0)
	mv %35,s3
	sw stack_35,%35(0)
	mv %36,s4
	sw stack_36,%36(0)
	mv %37,s5
	sw stack_37,%37(0)
	mv %38,s6
	sw stack_38,%38(0)
	mv %39,s7
	sw stack_39,%39(0)
	mv %40,s8
	sw stack_40,%40(0)
	mv %41,s9
	sw stack_41,%41(0)
	mv %42,s10
	sw stack_42,%42(0)
	mv %43,s11
	sw stack_43,%43(0)
	mv %44,ra
	sw stack_44,%44(0)
	mv a0,%45
	sw stack_45,%45(0)
	mv a1,%46
	sw stack_46,%46(0)
	j A.set_return_block74
A.set_return_block74:
	mv a0,%47
	sw stack_47,%47(0)
	ret
# end function : A.set
	.global	A.copy					# start function : A.copy
	.p2align	2
A.copy:
A.copy_entrance_block75:
	mv %48,s0
	sw stack_48,%48(0)
	mv %49,s1
	sw stack_49,%49(0)
	mv %50,s2
	sw stack_50,%50(0)
	mv %51,s3
	sw stack_51,%51(0)
	mv %52,s4
	sw stack_52,%52(0)
	mv %53,s5
	sw stack_53,%53(0)
	mv %54,s6
	sw stack_54,%54(0)
	mv %55,s7
	sw stack_55,%55(0)
	mv %56,s8
	sw stack_56,%56(0)
	mv %57,s9
	sw stack_57,%57(0)
	mv %58,s10
	sw stack_58,%58(0)
	mv %59,s11
	sw stack_59,%59(0)
	mv %60,ra
	sw stack_60,%60(0)
	mv a0,%61
	sw stack_61,%61(0)
	sb %62,%63(0)
	sw stack_62,%62(0)
	sw stack_63,%63(0)
	j A.copy_last_block76
	j A.copy_return_block77
A.copy_return_block77:
	la %62,stack_62
	mv a0,%62
	sw stack_62,%62(0)
	ret
# end function : A.copy
	.global	A.getThis					# start function : A.getThis
	.p2align	2
A.getThis:
A.getThis_entrance_block78:
	mv %64,s0
	sw stack_64,%64(0)
	mv %65,s1
	sw stack_65,%65(0)
	mv %66,s2
	sw stack_66,%66(0)
	mv %67,s3
	sw stack_67,%67(0)
	mv %68,s4
	sw stack_68,%68(0)
	mv %69,s5
	sw stack_69,%69(0)
	mv %70,s6
	sw stack_70,%70(0)
	mv %71,s7
	sw stack_71,%71(0)
	mv %72,s8
	sw stack_72,%72(0)
	mv %73,s9
	sw stack_73,%73(0)
	mv %74,s10
	sw stack_74,%74(0)
	mv %75,s11
	sw stack_75,%75(0)
	mv %76,ra
	sw stack_76,%76(0)
	call A.getThis
	mv a0,%77
	sw stack_77,%77(0)
	call A.getThis
	mv a0,%78
	sw stack_78,%78(0)
	call A.getThis
	mv a0,%79
	sw stack_79,%79(0)
	call A.getThis
	mv a0,%80
	sw stack_80,%80(0)
	mv a0,%81
	sw stack_81,%81(0)
	call A.copy
	mv a0,%82
	sw stack_82,%82(0)
	la %82,stack_82
	sb %83,%82(0)
	sw stack_83,%83(0)
	sw stack_82,%82(0)
	j A.getThis_last_block79
	j A.getThis_return_block80
A.getThis_return_block80:
	la %83,stack_83
	mv a0,%83
	sw stack_83,%83(0)
	ret
# end function : A.getThis
	.global	main					# start function : main
	.p2align	2
main:
main_entrance_block81:
	mv %84,s0
	sw stack_84,%84(0)
	mv %85,s1
	sw stack_85,%85(0)
	mv %86,s2
	sw stack_86,%86(0)
	mv %87,s3
	sw stack_87,%87(0)
	mv %88,s4
	sw stack_88,%88(0)
	mv %89,s5
	sw stack_89,%89(0)
	mv %90,s6
	sw stack_90,%90(0)
	mv %91,s7
	sw stack_91,%91(0)
	mv %92,s8
	sw stack_92,%92(0)
	mv %93,s9
	sw stack_93,%93(0)
	mv %94,s10
	sw stack_94,%94(0)
	mv %95,s11
	sw stack_95,%95(0)
	mv %96,ra
	sw stack_96,%96(0)
	call __init__
	li %97,2
	sw stack_97,%97(0)
	la %97,stack_97
	mv a0,%97
	sw stack_97,%97(0)
	li %98,3
	sw stack_98,%98(0)
	la %98,stack_98
	mv a1,%98
	sw stack_98,%98(0)
	call A.func1
	mv a0,zero
	li %99,0
	sw stack_99,%99(0)
	la %99,stack_99
	mv a0,%99
	sw stack_99,%99(0)
	li %100,1
	sw stack_100,%100(0)
	la %100,stack_100
	mv a1,%100
	sw stack_100,%100(0)
	call A.set
	mv a0,%101
	sw stack_101,%101(0)
	li %102,1
	sw stack_102,%102(0)
	la %102,stack_102
	mv a0,%102
	sw stack_102,%102(0)
	li %103,0
	sw stack_103,%103(0)
	la %103,stack_103
	mv a1,%103
	sw stack_103,%103(0)
	call A.set
	mv a0,%104
	sw stack_104,%104(0)
	call A.getThis
	mv a0,%105
	sw stack_105,%105(0)
	la %105,stack_105
	mv a0,%105
	sw stack_105,%105(0)
	call A.copy
	mv a0,%106
	sw stack_106,%106(0)
	call A.getThis
	mv a0,%107
	sw stack_107,%107(0)
	call A.getThis
	mv a0,%108
	sw stack_108,%108(0)
	la %108,stack_108
	mv a0,%108
	sw stack_108,%108(0)
	call A.copy
	mv a0,%109
	sw stack_109,%109(0)
	li %111,0
	sw stack_110,%111(0)
	la %111,stack_110
	sb %110,%111(0)
	sw stack_111,%110(0)
	sw stack_110,%111(0)
	j main_last_block82
	j main_return_block83
main_return_block83:
	la %110,stack_111
	mv a0,%110
	sw stack_111,%110(0)
	ret
# end function : main
	.globl	object
	.p2align	2
object:
	.word	0
