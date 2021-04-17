

define ReturnType : i32
Parameter : i32  @rng(i32*)
define ReturnType : i32
Parameter : i32 i32 i32 i32 i32 i32 i32 i32 i32 i32  @test(i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter : i32  @rng(i32*){
rng_entrance_block    %Id_load24 = load i32, i32* %rng_seed
    br label %unsigned_shl_entrance_block_i0

unsigned_shl_entrance_block_i0; preds = %rng_entrance_block
    %unsigned_shl_ip0_0=%Id_load24
    %unsigned_shl_ip1_1=13
    %Id_load1_i2 = load i32, i32* %unsigned_shl_ip0_0
    %Id_load2_i3 = load i32, i32* %unsigned_shl_ip1_1
    shl3_i4 = shl i32 %Id_load1_i2, %Id_load2_i3
    %unsigned_shlreturn_value0_i5=%shl3_i4
    br label %unsigned_shl_return_block_i1

unsigned_shl_return_block_i1; preds = %unsigned_shl_entrance_block_i0
    br label %rng_entrance_block_AB_2

rng_entrance_block_AB_2; preds = %unsigned_shl_return_block_i1
    %funccal28=%unsigned_shlreturn_value0_i5
    ashr29 = xor i32 %Id_load24, %funccal28
    br label %unsigned_shr_entrance_block_i3

unsigned_shr_entrance_block_i3; preds = %rng_entrance_block_AB_2
    %unsigned_shr_ip0_6=%ashr29
    %unsigned_shr_ip1_7=17
    %Id_load7_i8 = load i32, i32* %unsigned_shr_ip0_6
    %sge8_i9 = icmp sge i32 %Id_load7_i8, 0
    br i1 %sge8_i9, label %if_then_block0_i4, label %if_else_block1_i5

if_then_block0_i4; preds = %unsigned_shr_entrance_block_i3
    %Id_load9_i10 = load i32, i32* %unsigned_shr_ip0_6
    %Id_load10_i11 = load i32, i32* %unsigned_shr_ip1_7
    ashr11_i12 = ashr i32 %Id_load9_i10, %Id_load10_i11
    %unsigned_shrreturn_value4_i13=%ashr11_i12
    br label %unsigned_shr_return_block_i6

if_else_block1_i5; preds = %if_then_block0_i4
    %Id_load12_i14 = load i32, i32* %unsigned_shr_ip1_7
    sub13_i15 = sub i32 31, %Id_load12_i14
    shl14_i16 = shl i32 1, %sub13_i15
    %Id_load15_i17 = load i32, i32* %unsigned_shr_ip0_6
    ashr17_i18 = xor i32 %Id_load15_i17, 2147483648
    %Id_load18_i19 = load i32, i32* %unsigned_shr_ip1_7
    ashr19_i20 = ashr i32 %ashr17_i18, %Id_load18_i19
    or20_i21 = or i32 %shl14_i16, %ashr19_i20
    %unsigned_shrreturn_value4_i13=%or20_i21
    br label %unsigned_shr_return_block_i6

unsigned_shr_return_block_i6; preds = %if_else_block1_i5
    br label %rng_entrance_block_AB_2_AB_7

rng_entrance_block_AB_2_AB_7; preds = %unsigned_shr_return_block_i6
    %funccal33=%unsigned_shrreturn_value4_i13
    ashr34 = xor i32 %ashr29, %funccal33
    br label %unsigned_shl_entrance_block_i8

unsigned_shl_entrance_block_i8; preds = %rng_entrance_block_AB_2_AB_7
    %unsigned_shl_ip0_22=%ashr34
    %unsigned_shl_ip1_23=5
    %Id_load1_i24 = load i32, i32* %unsigned_shl_ip0_22
    %Id_load2_i25 = load i32, i32* %unsigned_shl_ip1_23
    shl3_i26 = shl i32 %Id_load1_i24, %Id_load2_i25
    %unsigned_shlreturn_value0_i27=%shl3_i26
    br label %unsigned_shl_return_block_i9

unsigned_shl_return_block_i9; preds = %unsigned_shl_entrance_block_i8
    br label %rng_entrance_block_AB_2_AB_7_AB_10

rng_entrance_block_AB_2_AB_7_AB_10; preds = %unsigned_shl_return_block_i9
    %funccal38=%unsigned_shlreturn_value0_i27
    ashr39 = xor i32 %ashr34, %funccal38
    and43 = and i32 %ashr39, 1073741823
    %rngreturn_value21=%and43
    br label %rng_return_block

rng_return_block; preds = %rng_entrance_block_AB_2_AB_7_AB_10
    ret i32 %rngreturn_value21

}

define ReturnType : i32
Parameter : i32 i32 i32 i32 i32 i32 i32 i32 i32 i32  @test(i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*){
test_entrance_block    %Id_load46 = load i32, i32* %q
    %Id_load47 = load i32, i32* %w
    %eq48 = icmp eq i32 %Id_load46, %Id_load47
    br i1 %eq48, label %if_then_block3, label %if_else_block4

if_then_block3; preds = %test_entrance_block
    %Id_load49 = load i32, i32* %w
    %Id_load50 = load i32, i32* %e
    %ne51 = icmp ne i32 %Id_load49, %Id_load50
    %lhs_compare_52 = icmp eq i1 %ne51, 0
    br i1 %lhs_compare_52, label %oror_b_block9, label %oror_dest_block10

oror_b_block9; preds = %if_then_block3
    %Id_load53 = load i32, i32* %e
    %Id_load54 = load i32, i32* %r
    %ne55 = icmp ne i32 %Id_load53, %Id_load54
    br label %oror_dest_block10

oror_dest_block10; preds = %oror_b_block9
    Oror_56 = or i1 %ne51, %ne55
    br i1 %Oror_56, label %if_then_block6, label %if_else_block7

if_then_block6; preds = %oror_dest_block10
    %Id_load57 = load i32, i32* %w
    %Id_load58 = load i32, i32* %e
    %Id_load59 = load i32, i32* %r
    %Id_load60 = load i32, i32* %t
    %Id_load61 = load i32, i32* %y
    %Id_load62 = load i32, i32* %u
    %Id_load63 = load i32, i32* %i
    %Id_load64 = load i32, i32* %o
    %Id_load65 = load i32, i32* %p
    %Id_load66 = load i32, i32* %q
    %funccal67 = call i32 @test(i32 %Id_load57, i32 %Id_load58, i32 %Id_load59, i32 %Id_load60, i32 %Id_load61, i32 %Id_load62, i32 %Id_load63, i32 %Id_load64, i32 %Id_load65, i32 %Id_load66)
    add68 = add i32 %funccal67, 1
    %testreturn_value45=%add68
    br label %test_return_block

if_else_block7; preds = %if_then_block6
    %Id_load69 = load i32, i32* %w
    %Id_load70 = load i32, i32* %e
    %Id_load71 = load i32, i32* %r
    %Id_load72 = load i32, i32* %t
    %Id_load73 = load i32, i32* %y
    sub74 = sub i32 %Id_load73, 1
    %Id_load75 = load i32, i32* %u
    sub76 = sub i32 %Id_load75, 2
    %Id_load77 = load i32, i32* %i
    %Id_load78 = load i32, i32* %o
    %Id_load79 = load i32, i32* %p
    %Id_load80 = load i32, i32* %q
    %funccal81 = call i32 @test(i32 %Id_load69, i32 %Id_load70, i32 %Id_load71, i32 %Id_load72, i32 %sub74, i32 %sub76, i32 %Id_load77, i32 %Id_load78, i32 %Id_load79, i32 %Id_load80)
    add82 = add i32 %funccal81, 2
    %testreturn_value45=%add82
    br label %test_return_block

if_else_block4; preds = %if_else_block7
    %Id_load83 = load i32, i32* %q
    %Id_load84 = load i32, i32* %w
    add85 = add i32 %Id_load83, %Id_load84
    %Id_load86 = load i32, i32* %q
    add87 = add i32 %add85, %Id_load86
    %testreturn_value45=%add87
    br label %test_return_block

test_return_block; preds = %if_else_block4
    ret i32 %testreturn_value45

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i11

__init___entrance_block_i11; preds = %main_entrance_block
    br label %__init___return_block_i12

__init___return_block_i12; preds = %__init___entrance_block_i11
    br label %main_entrance_block_AB_13

main_entrance_block_AB_13; preds = %__init___return_block_i12
    %sum|addr901=0
    %rng_seed|addr890=19260817
    br label %for_body_block11

for_body_block11; preds = %main_entrance_block_AB_13
    br label %rng_entrance_block_i14

rng_entrance_block_i14; preds = %for_body_block11
    %rng_ip0_28=%rng_seed|addr890
    %Id_load24_i29 = load i32, i32* %rng_ip0_28
    br label %unsigned_shl_entrance_block_i0_i15

unsigned_shl_entrance_block_i0_i15; preds = %rng_entrance_block_i14
    %unsigned_shl_ip0_0_i30=%Id_load24_i29
    %unsigned_shl_ip1_1_i31=13
    %Id_load1_i2_i32 = load i32, i32* %unsigned_shl_ip0_0_i30
    %Id_load2_i3_i33 = load i32, i32* %unsigned_shl_ip1_1_i31
    shl3_i4_i34 = shl i32 %Id_load1_i2_i32, %Id_load2_i3_i33
    %unsigned_shlreturn_value0_i5_i35=%shl3_i4_i34
    br label %unsigned_shl_return_block_i1_i16

unsigned_shl_return_block_i1_i16; preds = %unsigned_shl_entrance_block_i0_i15
    br label %rng_entrance_block_AB_2_i17

rng_entrance_block_AB_2_i17; preds = %unsigned_shl_return_block_i1_i16
    %funccal28_i36=%unsigned_shlreturn_value0_i5_i35
    ashr29_i37 = xor i32 %Id_load24_i29, %funccal28_i36
    br label %unsigned_shr_entrance_block_i3_i18

unsigned_shr_entrance_block_i3_i18; preds = %rng_entrance_block_AB_2_i17
    %unsigned_shr_ip0_6_i38=%ashr29_i37
    %unsigned_shr_ip1_7_i39=17
    %Id_load7_i8_i40 = load i32, i32* %unsigned_shr_ip0_6_i38
    %sge8_i9_i41 = icmp sge i32 %Id_load7_i8_i40, 0
    br i1 %sge8_i9_i41, label %if_then_block0_i4_i19, label %if_else_block1_i5_i20

if_then_block0_i4_i19; preds = %unsigned_shr_entrance_block_i3_i18
    %Id_load9_i10_i42 = load i32, i32* %unsigned_shr_ip0_6_i38
    %Id_load10_i11_i43 = load i32, i32* %unsigned_shr_ip1_7_i39
    ashr11_i12_i44 = ashr i32 %Id_load9_i10_i42, %Id_load10_i11_i43
    %unsigned_shrreturn_value4_i13_i45=%ashr11_i12_i44
    br label %unsigned_shr_return_block_i6_i21

if_else_block1_i5_i20; preds = %if_then_block0_i4_i19
    %Id_load12_i14_i46 = load i32, i32* %unsigned_shr_ip1_7_i39
    sub13_i15_i47 = sub i32 31, %Id_load12_i14_i46
    shl14_i16_i48 = shl i32 1, %sub13_i15_i47
    %Id_load15_i17_i49 = load i32, i32* %unsigned_shr_ip0_6_i38
    ashr17_i18_i50 = xor i32 %Id_load15_i17_i49, 2147483648
    %Id_load18_i19_i51 = load i32, i32* %unsigned_shr_ip1_7_i39
    ashr19_i20_i52 = ashr i32 %ashr17_i18_i50, %Id_load18_i19_i51
    or20_i21_i53 = or i32 %shl14_i16_i48, %ashr19_i20_i52
    %unsigned_shrreturn_value4_i13_i45=%or20_i21_i53
    br label %unsigned_shr_return_block_i6_i21

unsigned_shr_return_block_i6_i21; preds = %if_else_block1_i5_i20
    br label %rng_entrance_block_AB_2_AB_7_i22

rng_entrance_block_AB_2_AB_7_i22; preds = %unsigned_shr_return_block_i6_i21
    %funccal33_i54=%unsigned_shrreturn_value4_i13_i45
    ashr34_i55 = xor i32 %ashr29_i37, %funccal33_i54
    br label %unsigned_shl_entrance_block_i8_i23

unsigned_shl_entrance_block_i8_i23; preds = %rng_entrance_block_AB_2_AB_7_i22
    %unsigned_shl_ip0_22_i56=%ashr34_i55
    %unsigned_shl_ip1_23_i57=5
    %Id_load1_i24_i58 = load i32, i32* %unsigned_shl_ip0_22_i56
    %Id_load2_i25_i59 = load i32, i32* %unsigned_shl_ip1_23_i57
    shl3_i26_i60 = shl i32 %Id_load1_i24_i58, %Id_load2_i25_i59
    %unsigned_shlreturn_value0_i27_i61=%shl3_i26_i60
    br label %unsigned_shl_return_block_i9_i24

unsigned_shl_return_block_i9_i24; preds = %unsigned_shl_entrance_block_i8_i23
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i25

rng_entrance_block_AB_2_AB_7_AB_10_i25; preds = %unsigned_shl_return_block_i9_i24
    %funccal38_i62=%unsigned_shlreturn_value0_i27_i61
    ashr39_i63 = xor i32 %ashr34_i55, %funccal38_i62
    and43_i64 = and i32 %ashr39_i63, 1073741823
    %rngreturn_value21_i65=%and43_i64
    br label %rng_return_block_i26

rng_return_block_i26; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i25
    br label %for_body_block11_AB_27

for_body_block11_AB_27; preds = %rng_return_block_i26
    %funccal93=%rngreturn_value21_i65
    br label %rng_entrance_block_i28

rng_entrance_block_i28; preds = %for_body_block11_AB_27
    %rng_ip0_66=%funccal93
    %Id_load24_i67 = load i32, i32* %rng_ip0_66
    br label %unsigned_shl_entrance_block_i0_i29

unsigned_shl_entrance_block_i0_i29; preds = %rng_entrance_block_i28
    %unsigned_shl_ip0_0_i68=%Id_load24_i67
    %unsigned_shl_ip1_1_i69=13
    %Id_load1_i2_i70 = load i32, i32* %unsigned_shl_ip0_0_i68
    %Id_load2_i3_i71 = load i32, i32* %unsigned_shl_ip1_1_i69
    shl3_i4_i72 = shl i32 %Id_load1_i2_i70, %Id_load2_i3_i71
    %unsigned_shlreturn_value0_i5_i73=%shl3_i4_i72
    br label %unsigned_shl_return_block_i1_i30

unsigned_shl_return_block_i1_i30; preds = %unsigned_shl_entrance_block_i0_i29
    br label %rng_entrance_block_AB_2_i31

rng_entrance_block_AB_2_i31; preds = %unsigned_shl_return_block_i1_i30
    %funccal28_i74=%unsigned_shlreturn_value0_i5_i73
    ashr29_i75 = xor i32 %Id_load24_i67, %funccal28_i74
    br label %unsigned_shr_entrance_block_i3_i32

unsigned_shr_entrance_block_i3_i32; preds = %rng_entrance_block_AB_2_i31
    %unsigned_shr_ip0_6_i76=%ashr29_i75
    %unsigned_shr_ip1_7_i77=17
    %Id_load7_i8_i78 = load i32, i32* %unsigned_shr_ip0_6_i76
    %sge8_i9_i79 = icmp sge i32 %Id_load7_i8_i78, 0
    br i1 %sge8_i9_i79, label %if_then_block0_i4_i33, label %if_else_block1_i5_i34

if_then_block0_i4_i33; preds = %unsigned_shr_entrance_block_i3_i32
    %Id_load9_i10_i80 = load i32, i32* %unsigned_shr_ip0_6_i76
    %Id_load10_i11_i81 = load i32, i32* %unsigned_shr_ip1_7_i77
    ashr11_i12_i82 = ashr i32 %Id_load9_i10_i80, %Id_load10_i11_i81
    %unsigned_shrreturn_value4_i13_i83=%ashr11_i12_i82
    br label %unsigned_shr_return_block_i6_i35

if_else_block1_i5_i34; preds = %if_then_block0_i4_i33
    %Id_load12_i14_i84 = load i32, i32* %unsigned_shr_ip1_7_i77
    sub13_i15_i85 = sub i32 31, %Id_load12_i14_i84
    shl14_i16_i86 = shl i32 1, %sub13_i15_i85
    %Id_load15_i17_i87 = load i32, i32* %unsigned_shr_ip0_6_i76
    ashr17_i18_i88 = xor i32 %Id_load15_i17_i87, 2147483648
    %Id_load18_i19_i89 = load i32, i32* %unsigned_shr_ip1_7_i77
    ashr19_i20_i90 = ashr i32 %ashr17_i18_i88, %Id_load18_i19_i89
    or20_i21_i91 = or i32 %shl14_i16_i86, %ashr19_i20_i90
    %unsigned_shrreturn_value4_i13_i83=%or20_i21_i91
    br label %unsigned_shr_return_block_i6_i35

unsigned_shr_return_block_i6_i35; preds = %if_else_block1_i5_i34
    br label %rng_entrance_block_AB_2_AB_7_i36

rng_entrance_block_AB_2_AB_7_i36; preds = %unsigned_shr_return_block_i6_i35
    %funccal33_i92=%unsigned_shrreturn_value4_i13_i83
    ashr34_i93 = xor i32 %ashr29_i75, %funccal33_i92
    br label %unsigned_shl_entrance_block_i8_i37

unsigned_shl_entrance_block_i8_i37; preds = %rng_entrance_block_AB_2_AB_7_i36
    %unsigned_shl_ip0_22_i94=%ashr34_i93
    %unsigned_shl_ip1_23_i95=5
    %Id_load1_i24_i96 = load i32, i32* %unsigned_shl_ip0_22_i94
    %Id_load2_i25_i97 = load i32, i32* %unsigned_shl_ip1_23_i95
    shl3_i26_i98 = shl i32 %Id_load1_i24_i96, %Id_load2_i25_i97
    %unsigned_shlreturn_value0_i27_i99=%shl3_i26_i98
    br label %unsigned_shl_return_block_i9_i38

unsigned_shl_return_block_i9_i38; preds = %unsigned_shl_entrance_block_i8_i37
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i39

rng_entrance_block_AB_2_AB_7_AB_10_i39; preds = %unsigned_shl_return_block_i9_i38
    %funccal38_i100=%unsigned_shlreturn_value0_i27_i99
    ashr39_i101 = xor i32 %ashr34_i93, %funccal38_i100
    and43_i102 = and i32 %ashr39_i101, 1073741823
    %rngreturn_value21_i103=%and43_i102
    br label %rng_return_block_i40

rng_return_block_i40; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i39
    br label %for_body_block11_AB_27_AB_41

for_body_block11_AB_27_AB_41; preds = %rng_return_block_i40
    %funccal96=%rngreturn_value21_i103
    and100 = and i32 %funccal93, 255
    and102 = and i32 %funccal96, 255
    %ne103 = icmp ne i32 %and100, %and102
    br i1 %ne103, label %if_then_block13, label %if_else_block14

if_then_block13; preds = %for_body_block11_AB_27_AB_41
    br label %rng_entrance_block_i42

rng_entrance_block_i42; preds = %if_then_block13
    %rng_ip0_104=%funccal96
    %Id_load24_i105 = load i32, i32* %rng_ip0_104
    br label %unsigned_shl_entrance_block_i0_i43

unsigned_shl_entrance_block_i0_i43; preds = %rng_entrance_block_i42
    %unsigned_shl_ip0_0_i106=%Id_load24_i105
    %unsigned_shl_ip1_1_i107=13
    %Id_load1_i2_i108 = load i32, i32* %unsigned_shl_ip0_0_i106
    %Id_load2_i3_i109 = load i32, i32* %unsigned_shl_ip1_1_i107
    shl3_i4_i110 = shl i32 %Id_load1_i2_i108, %Id_load2_i3_i109
    %unsigned_shlreturn_value0_i5_i111=%shl3_i4_i110
    br label %unsigned_shl_return_block_i1_i44

unsigned_shl_return_block_i1_i44; preds = %unsigned_shl_entrance_block_i0_i43
    br label %rng_entrance_block_AB_2_i45

rng_entrance_block_AB_2_i45; preds = %unsigned_shl_return_block_i1_i44
    %funccal28_i112=%unsigned_shlreturn_value0_i5_i111
    ashr29_i113 = xor i32 %Id_load24_i105, %funccal28_i112
    br label %unsigned_shr_entrance_block_i3_i46

unsigned_shr_entrance_block_i3_i46; preds = %rng_entrance_block_AB_2_i45
    %unsigned_shr_ip0_6_i114=%ashr29_i113
    %unsigned_shr_ip1_7_i115=17
    %Id_load7_i8_i116 = load i32, i32* %unsigned_shr_ip0_6_i114
    %sge8_i9_i117 = icmp sge i32 %Id_load7_i8_i116, 0
    br i1 %sge8_i9_i117, label %if_then_block0_i4_i47, label %if_else_block1_i5_i48

if_then_block0_i4_i47; preds = %unsigned_shr_entrance_block_i3_i46
    %Id_load9_i10_i118 = load i32, i32* %unsigned_shr_ip0_6_i114
    %Id_load10_i11_i119 = load i32, i32* %unsigned_shr_ip1_7_i115
    ashr11_i12_i120 = ashr i32 %Id_load9_i10_i118, %Id_load10_i11_i119
    %unsigned_shrreturn_value4_i13_i121=%ashr11_i12_i120
    br label %unsigned_shr_return_block_i6_i49

if_else_block1_i5_i48; preds = %if_then_block0_i4_i47
    %Id_load12_i14_i122 = load i32, i32* %unsigned_shr_ip1_7_i115
    sub13_i15_i123 = sub i32 31, %Id_load12_i14_i122
    shl14_i16_i124 = shl i32 1, %sub13_i15_i123
    %Id_load15_i17_i125 = load i32, i32* %unsigned_shr_ip0_6_i114
    ashr17_i18_i126 = xor i32 %Id_load15_i17_i125, 2147483648
    %Id_load18_i19_i127 = load i32, i32* %unsigned_shr_ip1_7_i115
    ashr19_i20_i128 = ashr i32 %ashr17_i18_i126, %Id_load18_i19_i127
    or20_i21_i129 = or i32 %shl14_i16_i124, %ashr19_i20_i128
    %unsigned_shrreturn_value4_i13_i121=%or20_i21_i129
    br label %unsigned_shr_return_block_i6_i49

unsigned_shr_return_block_i6_i49; preds = %if_else_block1_i5_i48
    br label %rng_entrance_block_AB_2_AB_7_i50

rng_entrance_block_AB_2_AB_7_i50; preds = %unsigned_shr_return_block_i6_i49
    %funccal33_i130=%unsigned_shrreturn_value4_i13_i121
    ashr34_i131 = xor i32 %ashr29_i113, %funccal33_i130
    br label %unsigned_shl_entrance_block_i8_i51

unsigned_shl_entrance_block_i8_i51; preds = %rng_entrance_block_AB_2_AB_7_i50
    %unsigned_shl_ip0_22_i132=%ashr34_i131
    %unsigned_shl_ip1_23_i133=5
    %Id_load1_i24_i134 = load i32, i32* %unsigned_shl_ip0_22_i132
    %Id_load2_i25_i135 = load i32, i32* %unsigned_shl_ip1_23_i133
    shl3_i26_i136 = shl i32 %Id_load1_i24_i134, %Id_load2_i25_i135
    %unsigned_shlreturn_value0_i27_i137=%shl3_i26_i136
    br label %unsigned_shl_return_block_i9_i52

unsigned_shl_return_block_i9_i52; preds = %unsigned_shl_entrance_block_i8_i51
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i53

rng_entrance_block_AB_2_AB_7_AB_10_i53; preds = %unsigned_shl_return_block_i9_i52
    %funccal38_i138=%unsigned_shlreturn_value0_i27_i137
    ashr39_i139 = xor i32 %ashr34_i131, %funccal38_i138
    and43_i140 = and i32 %ashr39_i139, 1073741823
    %rngreturn_value21_i141=%and43_i140
    br label %rng_return_block_i54

rng_return_block_i54; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i53
    br label %if_then_block13_AB_55

if_then_block13_AB_55; preds = %rng_return_block_i54
    %funccal106=%rngreturn_value21_i141
    br label %rng_entrance_block_i56

rng_entrance_block_i56; preds = %if_then_block13_AB_55
    %rng_ip0_142=%funccal106
    %Id_load24_i143 = load i32, i32* %rng_ip0_142
    br label %unsigned_shl_entrance_block_i0_i57

unsigned_shl_entrance_block_i0_i57; preds = %rng_entrance_block_i56
    %unsigned_shl_ip0_0_i144=%Id_load24_i143
    %unsigned_shl_ip1_1_i145=13
    %Id_load1_i2_i146 = load i32, i32* %unsigned_shl_ip0_0_i144
    %Id_load2_i3_i147 = load i32, i32* %unsigned_shl_ip1_1_i145
    shl3_i4_i148 = shl i32 %Id_load1_i2_i146, %Id_load2_i3_i147
    %unsigned_shlreturn_value0_i5_i149=%shl3_i4_i148
    br label %unsigned_shl_return_block_i1_i58

unsigned_shl_return_block_i1_i58; preds = %unsigned_shl_entrance_block_i0_i57
    br label %rng_entrance_block_AB_2_i59

rng_entrance_block_AB_2_i59; preds = %unsigned_shl_return_block_i1_i58
    %funccal28_i150=%unsigned_shlreturn_value0_i5_i149
    ashr29_i151 = xor i32 %Id_load24_i143, %funccal28_i150
    br label %unsigned_shr_entrance_block_i3_i60

unsigned_shr_entrance_block_i3_i60; preds = %rng_entrance_block_AB_2_i59
    %unsigned_shr_ip0_6_i152=%ashr29_i151
    %unsigned_shr_ip1_7_i153=17
    %Id_load7_i8_i154 = load i32, i32* %unsigned_shr_ip0_6_i152
    %sge8_i9_i155 = icmp sge i32 %Id_load7_i8_i154, 0
    br i1 %sge8_i9_i155, label %if_then_block0_i4_i61, label %if_else_block1_i5_i62

if_then_block0_i4_i61; preds = %unsigned_shr_entrance_block_i3_i60
    %Id_load9_i10_i156 = load i32, i32* %unsigned_shr_ip0_6_i152
    %Id_load10_i11_i157 = load i32, i32* %unsigned_shr_ip1_7_i153
    ashr11_i12_i158 = ashr i32 %Id_load9_i10_i156, %Id_load10_i11_i157
    %unsigned_shrreturn_value4_i13_i159=%ashr11_i12_i158
    br label %unsigned_shr_return_block_i6_i63

if_else_block1_i5_i62; preds = %if_then_block0_i4_i61
    %Id_load12_i14_i160 = load i32, i32* %unsigned_shr_ip1_7_i153
    sub13_i15_i161 = sub i32 31, %Id_load12_i14_i160
    shl14_i16_i162 = shl i32 1, %sub13_i15_i161
    %Id_load15_i17_i163 = load i32, i32* %unsigned_shr_ip0_6_i152
    ashr17_i18_i164 = xor i32 %Id_load15_i17_i163, 2147483648
    %Id_load18_i19_i165 = load i32, i32* %unsigned_shr_ip1_7_i153
    ashr19_i20_i166 = ashr i32 %ashr17_i18_i164, %Id_load18_i19_i165
    or20_i21_i167 = or i32 %shl14_i16_i162, %ashr19_i20_i166
    %unsigned_shrreturn_value4_i13_i159=%or20_i21_i167
    br label %unsigned_shr_return_block_i6_i63

unsigned_shr_return_block_i6_i63; preds = %if_else_block1_i5_i62
    br label %rng_entrance_block_AB_2_AB_7_i64

rng_entrance_block_AB_2_AB_7_i64; preds = %unsigned_shr_return_block_i6_i63
    %funccal33_i168=%unsigned_shrreturn_value4_i13_i159
    ashr34_i169 = xor i32 %ashr29_i151, %funccal33_i168
    br label %unsigned_shl_entrance_block_i8_i65

unsigned_shl_entrance_block_i8_i65; preds = %rng_entrance_block_AB_2_AB_7_i64
    %unsigned_shl_ip0_22_i170=%ashr34_i169
    %unsigned_shl_ip1_23_i171=5
    %Id_load1_i24_i172 = load i32, i32* %unsigned_shl_ip0_22_i170
    %Id_load2_i25_i173 = load i32, i32* %unsigned_shl_ip1_23_i171
    shl3_i26_i174 = shl i32 %Id_load1_i24_i172, %Id_load2_i25_i173
    %unsigned_shlreturn_value0_i27_i175=%shl3_i26_i174
    br label %unsigned_shl_return_block_i9_i66

unsigned_shl_return_block_i9_i66; preds = %unsigned_shl_entrance_block_i8_i65
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i67

rng_entrance_block_AB_2_AB_7_AB_10_i67; preds = %unsigned_shl_return_block_i9_i66
    %funccal38_i176=%unsigned_shlreturn_value0_i27_i175
    ashr39_i177 = xor i32 %ashr34_i169, %funccal38_i176
    and43_i178 = and i32 %ashr39_i177, 1073741823
    %rngreturn_value21_i179=%and43_i178
    br label %rng_return_block_i68

rng_return_block_i68; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i67
    br label %if_then_block13_AB_55_AB_69

if_then_block13_AB_55_AB_69; preds = %rng_return_block_i68
    %funccal109=%rngreturn_value21_i179
    br label %rng_entrance_block_i70

rng_entrance_block_i70; preds = %if_then_block13_AB_55_AB_69
    %rng_ip0_180=%funccal109
    %Id_load24_i181 = load i32, i32* %rng_ip0_180
    br label %unsigned_shl_entrance_block_i0_i71

unsigned_shl_entrance_block_i0_i71; preds = %rng_entrance_block_i70
    %unsigned_shl_ip0_0_i182=%Id_load24_i181
    %unsigned_shl_ip1_1_i183=13
    %Id_load1_i2_i184 = load i32, i32* %unsigned_shl_ip0_0_i182
    %Id_load2_i3_i185 = load i32, i32* %unsigned_shl_ip1_1_i183
    shl3_i4_i186 = shl i32 %Id_load1_i2_i184, %Id_load2_i3_i185
    %unsigned_shlreturn_value0_i5_i187=%shl3_i4_i186
    br label %unsigned_shl_return_block_i1_i72

unsigned_shl_return_block_i1_i72; preds = %unsigned_shl_entrance_block_i0_i71
    br label %rng_entrance_block_AB_2_i73

rng_entrance_block_AB_2_i73; preds = %unsigned_shl_return_block_i1_i72
    %funccal28_i188=%unsigned_shlreturn_value0_i5_i187
    ashr29_i189 = xor i32 %Id_load24_i181, %funccal28_i188
    br label %unsigned_shr_entrance_block_i3_i74

unsigned_shr_entrance_block_i3_i74; preds = %rng_entrance_block_AB_2_i73
    %unsigned_shr_ip0_6_i190=%ashr29_i189
    %unsigned_shr_ip1_7_i191=17
    %Id_load7_i8_i192 = load i32, i32* %unsigned_shr_ip0_6_i190
    %sge8_i9_i193 = icmp sge i32 %Id_load7_i8_i192, 0
    br i1 %sge8_i9_i193, label %if_then_block0_i4_i75, label %if_else_block1_i5_i76

if_then_block0_i4_i75; preds = %unsigned_shr_entrance_block_i3_i74
    %Id_load9_i10_i194 = load i32, i32* %unsigned_shr_ip0_6_i190
    %Id_load10_i11_i195 = load i32, i32* %unsigned_shr_ip1_7_i191
    ashr11_i12_i196 = ashr i32 %Id_load9_i10_i194, %Id_load10_i11_i195
    %unsigned_shrreturn_value4_i13_i197=%ashr11_i12_i196
    br label %unsigned_shr_return_block_i6_i77

if_else_block1_i5_i76; preds = %if_then_block0_i4_i75
    %Id_load12_i14_i198 = load i32, i32* %unsigned_shr_ip1_7_i191
    sub13_i15_i199 = sub i32 31, %Id_load12_i14_i198
    shl14_i16_i200 = shl i32 1, %sub13_i15_i199
    %Id_load15_i17_i201 = load i32, i32* %unsigned_shr_ip0_6_i190
    ashr17_i18_i202 = xor i32 %Id_load15_i17_i201, 2147483648
    %Id_load18_i19_i203 = load i32, i32* %unsigned_shr_ip1_7_i191
    ashr19_i20_i204 = ashr i32 %ashr17_i18_i202, %Id_load18_i19_i203
    or20_i21_i205 = or i32 %shl14_i16_i200, %ashr19_i20_i204
    %unsigned_shrreturn_value4_i13_i197=%or20_i21_i205
    br label %unsigned_shr_return_block_i6_i77

unsigned_shr_return_block_i6_i77; preds = %if_else_block1_i5_i76
    br label %rng_entrance_block_AB_2_AB_7_i78

rng_entrance_block_AB_2_AB_7_i78; preds = %unsigned_shr_return_block_i6_i77
    %funccal33_i206=%unsigned_shrreturn_value4_i13_i197
    ashr34_i207 = xor i32 %ashr29_i189, %funccal33_i206
    br label %unsigned_shl_entrance_block_i8_i79

unsigned_shl_entrance_block_i8_i79; preds = %rng_entrance_block_AB_2_AB_7_i78
    %unsigned_shl_ip0_22_i208=%ashr34_i207
    %unsigned_shl_ip1_23_i209=5
    %Id_load1_i24_i210 = load i32, i32* %unsigned_shl_ip0_22_i208
    %Id_load2_i25_i211 = load i32, i32* %unsigned_shl_ip1_23_i209
    shl3_i26_i212 = shl i32 %Id_load1_i24_i210, %Id_load2_i25_i211
    %unsigned_shlreturn_value0_i27_i213=%shl3_i26_i212
    br label %unsigned_shl_return_block_i9_i80

unsigned_shl_return_block_i9_i80; preds = %unsigned_shl_entrance_block_i8_i79
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i81

rng_entrance_block_AB_2_AB_7_AB_10_i81; preds = %unsigned_shl_return_block_i9_i80
    %funccal38_i214=%unsigned_shlreturn_value0_i27_i213
    ashr39_i215 = xor i32 %ashr34_i207, %funccal38_i214
    and43_i216 = and i32 %ashr39_i215, 1073741823
    %rngreturn_value21_i217=%and43_i216
    br label %rng_return_block_i82

rng_return_block_i82; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i81
    br label %if_then_block13_AB_55_AB_69_AB_83

if_then_block13_AB_55_AB_69_AB_83; preds = %rng_return_block_i82
    %funccal112=%rngreturn_value21_i217
    %funccal115 = call i32 @rng(i32 %funccal112)
    %funccal118 = call i32 @rng(i32 %funccal115)
    and124 = and i32 %funccal106, 3
    ashr126 = ashr i32 %funccal106, 28
    and128 = and i32 %funccal109, 1
    ashr130 = ashr i32 %funccal109, 29
    ashr132 = ashr i32 %funccal112, 25
    and134 = and i32 %funccal112, 31
    ashr136 = ashr i32 %funccal115, 15
    and138 = and i32 %funccal115, 32767
    ashr140 = ashr i32 %funccal118, 15
    and142 = and i32 %funccal118, 32767
    %funccal143 = call i32 @test(i32 %and124, i32 %ashr126, i32 %and128, i32 %ashr130, i32 %ashr132, i32 %and134, i32 %ashr136, i32 %and138, i32 %ashr140, i32 %and142)
    ashr144 = xor i32 %sum|addr901, %funccal143
    br label %if_dest_block15

if_else_block14; preds = %if_then_block13_AB_55_AB_69_AB_83
    br label %for_dest_block12

if_dest_block15; preds = %if_else_block14
    %sum|addr901=%ashr144
    %rng_seed|addr890=%funccal118
    br label %for_body_block11

for_dest_block12; preds = %if_dest_block15
    %mainreturn_value88=%sum|addr901
    br label %main_return_block

main_return_block; preds = %for_dest_block12
    ret i32 %mainreturn_value88

}

