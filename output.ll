
@const_string_no0
@const_string_no1
@const_string_no2
@const_string_no3
@const_string_no4

define ReturnType : i32
Parameter : i32 i8* i8* i8* i32  @cd(i32, i8*, i8*, i8*, i32)
define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter : i32 i8* i8* i8* i32  @cd(i32, i8*, i8*, i8*, i32){
cd_entrance_block    %eq7 = icmp eq i32 %d, 1
    br i1 %eq7, label %if_then_block0, label %if_else_block1

if_then_block0; preds = %cd_entrance_block
    %StringConst8 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add10 = call i8* @__string_add(i8* %StringConst8, i8* %a)
    %StringConst11 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add12 = call i8* @__string_add(i8* %add10, i8* %StringConst11)
    %add14 = call i8* @__string_add(i8* %add12, i8* %c)
    %funccal15 = call void @println(i8* %add14)
    SelfAdd17 = add i32 %sum, 1
    %sum|addr40=%SelfAdd17
    br label %if_dest_block2

if_else_block1; preds = %if_then_block0
    sub20 = sub i32 %d, 1
    %cd_ip0_0=%sub20
    %cd_ip1_1=%a
    %cd_ip2_2=%c
    %cd_ip3_3=%b
    %cd_ip4_4=%sum
    %eq7_i5 = icmp eq i32 %cd_ip0_0, 1
    br i1 %eq7_i5, label %if_then_block0_i4, label %if_else_block1_i5

if_then_block0_i4; preds = %if_else_block1
    %StringConst8_i6 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add10_i7 = call i8* @__string_add(i8* %StringConst8_i6, i8* %cd_ip1_1)
    %StringConst11_i8 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add12_i9 = call i8* @__string_add(i8* %add10_i7, i8* %StringConst11_i8)
    %add14_i10 = call i8* @__string_add(i8* %add12_i9, i8* %cd_ip3_3)
    %funccal15_i11 = call void @println(i8* %add14_i10)
    SelfAdd17_i12 = add i32 %cd_ip4_4, 1
    %sum|addr40_i24=%SelfAdd17_i12
    br label %if_dest_block2_i6

if_else_block1_i5; preds = %if_then_block0_i4
    sub20_i13 = sub i32 %cd_ip0_0, 1
    %funccal25_i14 = call i32 @cd(i32 %sub20_i13, i8* %cd_ip1_1, i8* %cd_ip3_3, i8* %cd_ip2_2, i32 %cd_ip4_4)
    %StringConst26_i15 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add28_i16 = call i8* @__string_add(i8* %StringConst26_i15, i8* %cd_ip1_1)
    %StringConst29_i17 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add30_i18 = call i8* @__string_add(i8* %add28_i16, i8* %StringConst29_i17)
    %add32_i19 = call i8* @__string_add(i8* %add30_i18, i8* %cd_ip3_3)
    %funccal33_i20 = call void @println(i8* %add32_i19)
    %funccal41_i22 = call i32 @cd(i32 %sub20_i13, i8* %cd_ip2_2, i8* %cd_ip1_1, i8* %cd_ip3_3, i32 %funccal25_i14)
    SelfAdd43_i23 = add i32 %funccal41_i22, 1
    %sum|addr40_i24=%SelfAdd43_i23
    br label %if_dest_block2_i6

if_dest_block2_i6; preds = %if_else_block1_i5
    %cdreturn_value5_i25=%sum|addr40_i24
    %funccal25=%cdreturn_value5_i25
    %StringConst26 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add28 = call i8* @__string_add(i8* %StringConst26, i8* %a)
    %StringConst29 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add30 = call i8* @__string_add(i8* %add28, i8* %StringConst29)
    %add32 = call i8* @__string_add(i8* %add30, i8* %c)
    %funccal33 = call void @println(i8* %add32)
    sub36 = sub i32 %d, 1
    %cd_ip0_26=%sub36
    %cd_ip1_27=%b
    %cd_ip2_28=%a
    %cd_ip3_29=%c
    %cd_ip4_30=%funccal25
    %eq7_i31 = icmp eq i32 %cd_ip0_26, 1
    br i1 %eq7_i31, label %if_then_block0_i10, label %if_else_block1_i11

if_then_block0_i10; preds = %if_dest_block2_i6
    %StringConst8_i32 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add10_i33 = call i8* @__string_add(i8* %StringConst8_i32, i8* %cd_ip1_27)
    %StringConst11_i34 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add12_i35 = call i8* @__string_add(i8* %add10_i33, i8* %StringConst11_i34)
    %add14_i36 = call i8* @__string_add(i8* %add12_i35, i8* %cd_ip3_29)
    %funccal15_i37 = call void @println(i8* %add14_i36)
    SelfAdd17_i38 = add i32 %cd_ip4_30, 1
    %sum|addr40_i76=%SelfAdd17_i38
    br label %if_dest_block2_i18

if_else_block1_i11; preds = %if_then_block0_i10
    sub20_i39 = sub i32 %cd_ip0_26, 1
    %cd_ip0_0_i40=%sub20_i39
    %cd_ip1_1_i41=%cd_ip1_27
    %cd_ip2_2_i42=%cd_ip3_29
    %cd_ip3_3_i43=%cd_ip2_28
    %cd_ip4_4_i44=%cd_ip4_30
    %eq7_i5_i45 = icmp eq i32 %cd_ip0_0_i40, 1
    br i1 %eq7_i5_i45, label %if_then_block0_i4_i13, label %if_else_block1_i5_i14

if_then_block0_i4_i13; preds = %if_else_block1_i11
    %StringConst8_i6_i46 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add10_i7_i47 = call i8* @__string_add(i8* %StringConst8_i6_i46, i8* %cd_ip1_1_i41)
    %StringConst11_i8_i48 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add12_i9_i49 = call i8* @__string_add(i8* %add10_i7_i47, i8* %StringConst11_i8_i48)
    %add14_i10_i50 = call i8* @__string_add(i8* %add12_i9_i49, i8* %cd_ip3_3_i43)
    %funccal15_i11_i51 = call void @println(i8* %add14_i10_i50)
    SelfAdd17_i12_i52 = add i32 %cd_ip4_4_i44, 1
    %sum|addr40_i24_i64=%SelfAdd17_i12_i52
    br label %if_dest_block2_i6_i15

if_else_block1_i5_i14; preds = %if_then_block0_i4_i13
    sub20_i13_i53 = sub i32 %cd_ip0_0_i40, 1
    %funccal25_i14_i54 = call i32 @cd(i32 %sub20_i13_i53, i8* %cd_ip1_1_i41, i8* %cd_ip3_3_i43, i8* %cd_ip2_2_i42, i32 %cd_ip4_4_i44)
    %StringConst26_i15_i55 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add28_i16_i56 = call i8* @__string_add(i8* %StringConst26_i15_i55, i8* %cd_ip1_1_i41)
    %StringConst29_i17_i57 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add30_i18_i58 = call i8* @__string_add(i8* %add28_i16_i56, i8* %StringConst29_i17_i57)
    %add32_i19_i59 = call i8* @__string_add(i8* %add30_i18_i58, i8* %cd_ip3_3_i43)
    %funccal33_i20_i60 = call void @println(i8* %add32_i19_i59)
    %funccal41_i22_i62 = call i32 @cd(i32 %sub20_i13_i53, i8* %cd_ip2_2_i42, i8* %cd_ip1_1_i41, i8* %cd_ip3_3_i43, i32 %funccal25_i14_i54)
    SelfAdd43_i23_i63 = add i32 %funccal41_i22_i62, 1
    %sum|addr40_i24_i64=%SelfAdd43_i23_i63
    br label %if_dest_block2_i6_i15

if_dest_block2_i6_i15; preds = %if_else_block1_i5_i14
    %cdreturn_value5_i25_i65=%sum|addr40_i24_i64
    %funccal25_i66=%cdreturn_value5_i25_i65
    %StringConst26_i67 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add28_i68 = call i8* @__string_add(i8* %StringConst26_i67, i8* %cd_ip1_27)
    %StringConst29_i69 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add30_i70 = call i8* @__string_add(i8* %add28_i68, i8* %StringConst29_i69)
    %add32_i71 = call i8* @__string_add(i8* %add30_i70, i8* %cd_ip3_29)
    %funccal33_i72 = call void @println(i8* %add32_i71)
    sub36_i73 = sub i32 %cd_ip0_26, 1
    %funccal41_i74 = call i32 @cd(i32 %sub36_i73, i8* %cd_ip2_28, i8* %cd_ip1_27, i8* %cd_ip3_29, i32 %funccal25_i66)
    SelfAdd43_i75 = add i32 %funccal41_i74, 1
    %sum|addr40_i76=%SelfAdd43_i75
    br label %if_dest_block2_i18

if_dest_block2_i18; preds = %if_dest_block2_i6_i15
    %cdreturn_value5_i77=%sum|addr40_i76
    %funccal41=%cdreturn_value5_i77
    SelfAdd43 = add i32 %funccal41, 1
    %sum|addr40=%SelfAdd43
    br label %if_dest_block2

if_dest_block2; preds = %if_dest_block2_i18
    %cdreturn_value5=%sum|addr40
    br label %cd_return_block

cd_return_block; preds = %if_dest_block2
    ret i32 %cdreturn_value5

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    %StringConst47 = getelementptr [1 x i8], [1 x i8]* @const_string_no2, i32 0, i32 0
    %StringConst49 = getelementptr [1 x i8], [1 x i8]* @const_string_no3, i32 0, i32 0
    %StringConst51 = getelementptr [1 x i8], [1 x i8]* @const_string_no4, i32 0, i32 0
    %funccal53 = call i32 @getInt()
    %cd_ip0_78=%funccal53
    %cd_ip1_79=%StringConst47
    %cd_ip2_80=%StringConst49
    %cd_ip3_81=%StringConst51
    %eq7_i83 = icmp eq i32 %cd_ip0_78, 1
    br i1 %eq7_i83, label %if_then_block0_i22, label %if_else_block1_i23

if_then_block0_i22; preds = %__init___entrance_block_i0
    %StringConst8_i84 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add10_i85 = call i8* @__string_add(i8* %StringConst8_i84, i8* %cd_ip1_79)
    %StringConst11_i86 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add12_i87 = call i8* @__string_add(i8* %add10_i85, i8* %StringConst11_i86)
    %add14_i88 = call i8* @__string_add(i8* %add12_i87, i8* %cd_ip3_81)
    %funccal15_i89 = call void @println(i8* %add14_i88)
    %sum|addr40_i180=1
    br label %if_dest_block2_i42

if_else_block1_i23; preds = %if_then_block0_i22
    sub20_i91 = sub i32 %cd_ip0_78, 1
    %cd_ip0_0_i92=%sub20_i91
    %cd_ip1_1_i93=%cd_ip1_79
    %cd_ip2_2_i94=%cd_ip3_81
    %cd_ip3_3_i95=%cd_ip2_80
    %eq7_i5_i97 = icmp eq i32 %cd_ip0_0_i92, 1
    br i1 %eq7_i5_i97, label %if_then_block0_i4_i25, label %if_else_block1_i5_i26

if_then_block0_i4_i25; preds = %if_else_block1_i23
    %StringConst8_i6_i98 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add10_i7_i99 = call i8* @__string_add(i8* %StringConst8_i6_i98, i8* %cd_ip1_1_i93)
    %StringConst11_i8_i100 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add12_i9_i101 = call i8* @__string_add(i8* %add10_i7_i99, i8* %StringConst11_i8_i100)
    %add14_i10_i102 = call i8* @__string_add(i8* %add12_i9_i101, i8* %cd_ip3_3_i95)
    %funccal15_i11_i103 = call void @println(i8* %add14_i10_i102)
    %sum|addr40_i24_i116=1
    br label %if_dest_block2_i6_i27

if_else_block1_i5_i26; preds = %if_then_block0_i4_i25
    sub20_i13_i105 = sub i32 %cd_ip0_0_i92, 1
    %funccal25_i14_i106 = call i32 @cd(i32 %sub20_i13_i105, i8* %cd_ip1_1_i93, i8* %cd_ip3_3_i95, i8* %cd_ip2_2_i94, i32 0)
    %StringConst26_i15_i107 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add28_i16_i108 = call i8* @__string_add(i8* %StringConst26_i15_i107, i8* %cd_ip1_1_i93)
    %StringConst29_i17_i109 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add30_i18_i110 = call i8* @__string_add(i8* %add28_i16_i108, i8* %StringConst29_i17_i109)
    %add32_i19_i111 = call i8* @__string_add(i8* %add30_i18_i110, i8* %cd_ip3_3_i95)
    %funccal33_i20_i112 = call void @println(i8* %add32_i19_i111)
    %funccal41_i22_i114 = call i32 @cd(i32 %sub20_i13_i105, i8* %cd_ip2_2_i94, i8* %cd_ip1_1_i93, i8* %cd_ip3_3_i95, i32 %funccal25_i14_i106)
    SelfAdd43_i23_i115 = add i32 %funccal41_i22_i114, 1
    %sum|addr40_i24_i116=%SelfAdd43_i23_i115
    br label %if_dest_block2_i6_i27

if_dest_block2_i6_i27; preds = %if_else_block1_i5_i26
    %cdreturn_value5_i25_i117=%sum|addr40_i24_i116
    %funccal25_i118=%cdreturn_value5_i25_i117
    %StringConst26_i119 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add28_i120 = call i8* @__string_add(i8* %StringConst26_i119, i8* %cd_ip1_79)
    %StringConst29_i121 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add30_i122 = call i8* @__string_add(i8* %add28_i120, i8* %StringConst29_i121)
    %add32_i123 = call i8* @__string_add(i8* %add30_i122, i8* %cd_ip3_81)
    %funccal33_i124 = call void @println(i8* %add32_i123)
    sub36_i125 = sub i32 %cd_ip0_78, 1
    %cd_ip0_26_i126=%sub36_i125
    %cd_ip1_27_i127=%cd_ip2_80
    %cd_ip2_28_i128=%cd_ip1_79
    %cd_ip3_29_i129=%cd_ip3_81
    %cd_ip4_30_i130=%funccal25_i118
    %eq7_i31_i131 = icmp eq i32 %cd_ip0_26_i126, 1
    br i1 %eq7_i31_i131, label %if_then_block0_i10_i31, label %if_else_block1_i11_i32

if_then_block0_i10_i31; preds = %if_dest_block2_i6_i27
    %StringConst8_i32_i132 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add10_i33_i133 = call i8* @__string_add(i8* %StringConst8_i32_i132, i8* %cd_ip1_27_i127)
    %StringConst11_i34_i134 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add12_i35_i135 = call i8* @__string_add(i8* %add10_i33_i133, i8* %StringConst11_i34_i134)
    %add14_i36_i136 = call i8* @__string_add(i8* %add12_i35_i135, i8* %cd_ip3_29_i129)
    %funccal15_i37_i137 = call void @println(i8* %add14_i36_i136)
    SelfAdd17_i38_i138 = add i32 %cd_ip4_30_i130, 1
    %sum|addr40_i76_i176=%SelfAdd17_i38_i138
    br label %if_dest_block2_i18_i39

if_else_block1_i11_i32; preds = %if_then_block0_i10_i31
    sub20_i39_i139 = sub i32 %cd_ip0_26_i126, 1
    %cd_ip0_0_i40_i140=%sub20_i39_i139
    %cd_ip1_1_i41_i141=%cd_ip1_27_i127
    %cd_ip2_2_i42_i142=%cd_ip3_29_i129
    %cd_ip3_3_i43_i143=%cd_ip2_28_i128
    %cd_ip4_4_i44_i144=%cd_ip4_30_i130
    %eq7_i5_i45_i145 = icmp eq i32 %cd_ip0_0_i40_i140, 1
    br i1 %eq7_i5_i45_i145, label %if_then_block0_i4_i13_i34, label %if_else_block1_i5_i14_i35

if_then_block0_i4_i13_i34; preds = %if_else_block1_i11_i32
    %StringConst8_i6_i46_i146 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add10_i7_i47_i147 = call i8* @__string_add(i8* %StringConst8_i6_i46_i146, i8* %cd_ip1_1_i41_i141)
    %StringConst11_i8_i48_i148 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add12_i9_i49_i149 = call i8* @__string_add(i8* %add10_i7_i47_i147, i8* %StringConst11_i8_i48_i148)
    %add14_i10_i50_i150 = call i8* @__string_add(i8* %add12_i9_i49_i149, i8* %cd_ip3_3_i43_i143)
    %funccal15_i11_i51_i151 = call void @println(i8* %add14_i10_i50_i150)
    SelfAdd17_i12_i52_i152 = add i32 %cd_ip4_4_i44_i144, 1
    %sum|addr40_i24_i64_i164=%SelfAdd17_i12_i52_i152
    br label %if_dest_block2_i6_i15_i36

if_else_block1_i5_i14_i35; preds = %if_then_block0_i4_i13_i34
    sub20_i13_i53_i153 = sub i32 %cd_ip0_0_i40_i140, 1
    %funccal25_i14_i54_i154 = call i32 @cd(i32 %sub20_i13_i53_i153, i8* %cd_ip1_1_i41_i141, i8* %cd_ip3_3_i43_i143, i8* %cd_ip2_2_i42_i142, i32 %cd_ip4_4_i44_i144)
    %StringConst26_i15_i55_i155 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add28_i16_i56_i156 = call i8* @__string_add(i8* %StringConst26_i15_i55_i155, i8* %cd_ip1_1_i41_i141)
    %StringConst29_i17_i57_i157 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add30_i18_i58_i158 = call i8* @__string_add(i8* %add28_i16_i56_i156, i8* %StringConst29_i17_i57_i157)
    %add32_i19_i59_i159 = call i8* @__string_add(i8* %add30_i18_i58_i158, i8* %cd_ip3_3_i43_i143)
    %funccal33_i20_i60_i160 = call void @println(i8* %add32_i19_i59_i159)
    %funccal41_i22_i62_i162 = call i32 @cd(i32 %sub20_i13_i53_i153, i8* %cd_ip2_2_i42_i142, i8* %cd_ip1_1_i41_i141, i8* %cd_ip3_3_i43_i143, i32 %funccal25_i14_i54_i154)
    SelfAdd43_i23_i63_i163 = add i32 %funccal41_i22_i62_i162, 1
    %sum|addr40_i24_i64_i164=%SelfAdd43_i23_i63_i163
    br label %if_dest_block2_i6_i15_i36

if_dest_block2_i6_i15_i36; preds = %if_else_block1_i5_i14_i35
    %cdreturn_value5_i25_i65_i165=%sum|addr40_i24_i64_i164
    %funccal25_i66_i166=%cdreturn_value5_i25_i65_i165
    %StringConst26_i67_i167 = getelementptr [5 x i8], [5 x i8]* @const_string_no0, i32 0, i32 0
    %add28_i68_i168 = call i8* @__string_add(i8* %StringConst26_i67_i167, i8* %cd_ip1_27_i127)
    %StringConst29_i69_i169 = getelementptr [5 x i8], [5 x i8]* @const_string_no1, i32 0, i32 0
    %add30_i70_i170 = call i8* @__string_add(i8* %add28_i68_i168, i8* %StringConst29_i69_i169)
    %add32_i71_i171 = call i8* @__string_add(i8* %add30_i70_i170, i8* %cd_ip3_29_i129)
    %funccal33_i72_i172 = call void @println(i8* %add32_i71_i171)
    sub36_i73_i173 = sub i32 %cd_ip0_26_i126, 1
    %funccal41_i74_i174 = call i32 @cd(i32 %sub36_i73_i173, i8* %cd_ip2_28_i128, i8* %cd_ip1_27_i127, i8* %cd_ip3_29_i129, i32 %funccal25_i66_i166)
    SelfAdd43_i75_i175 = add i32 %funccal41_i74_i174, 1
    %sum|addr40_i76_i176=%SelfAdd43_i75_i175
    br label %if_dest_block2_i18_i39

if_dest_block2_i18_i39; preds = %if_dest_block2_i6_i15_i36
    %cdreturn_value5_i77_i177=%sum|addr40_i76_i176
    %funccal41_i178=%cdreturn_value5_i77_i177
    SelfAdd43_i179 = add i32 %funccal41_i178, 1
    %sum|addr40_i180=%SelfAdd43_i179
    br label %if_dest_block2_i42

if_dest_block2_i42; preds = %if_dest_block2_i18_i39
    %cdreturn_value5_i181=%sum|addr40_i180
    %funccal59=%cdreturn_value5_i181
    %funccal61 = call i8* @toString(i32 %funccal59)
    %funccal62 = call void @println(i8* %funccal61)
    %mainreturn_value45=0
    br label %main_return_block

main_return_block; preds = %if_dest_block2_i42
    ret i32 %mainreturn_value45

}

