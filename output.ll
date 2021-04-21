

define ReturnType : i32
Parameter : i32 i32 i32 i32 i32 i32 i32 i32 i32 i32  @test(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)
define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter : i32 i32 i32 i32 i32 i32 i32 i32 i32 i32  @test(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32){
test_entrance_block    %eq63 = icmp eq i32 %q, %w
    br i1 %eq63, label %if_then_block3, label %if_else_block4

if_then_block3; preds = %test_entrance_block
    %ne66 = icmp ne i32 %w, %e
    br i1 %ne66, label %oror_dest_block10, label %oror_b_block9

oror_b_block9; preds = %if_then_block3
    %ne69 = icmp ne i32 %e, %r
    br label %oror_dest_block10

oror_dest_block10; preds = %oror_b_block9
    %Oror_70 = phi i1[ true, %if_then_block3], [ %ne69, %oror_b_block9]
    br i1 %Oror_70, label %if_then_block6, label %if_else_block7

if_then_block6; preds = %oror_dest_block10
    %funccal81 = call i32 @test(i32 %w, i32 %e, i32 %r, i32 %t, i32 %y, i32 %u, i32 %i, i32 %o, i32 %p, i32 %q)
    add82 = add i32 %funccal81, 1
    %testreturn_value60=%add82
    br label %test_return_block

if_else_block7; preds = %if_then_block6
    sub88 = sub i32 %y, 1
    sub90 = sub i32 %u, 2
    %funccal95 = call i32 @test(i32 %w, i32 %e, i32 %r, i32 %t, i32 %sub88, i32 %sub90, i32 %i, i32 %o, i32 %p, i32 %q)
    add96 = add i32 %funccal95, 2
    %testreturn_value60=%add96
    br label %test_return_block

if_else_block4; preds = %if_else_block7
    add99 = add i32 %q, %w
    add101 = add i32 %add99, %q
    %testreturn_value60=%add101
    br label %test_return_block

test_return_block; preds = %if_else_block4
    ret i32 %testreturn_value60

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i11

__init___entrance_block_i11; preds = %main_entrance_block
    br label %for_body_block11

for_body_block11; preds = %__init___entrance_block_i11
    %sum|addr1041 = phi i32[ 0, %__init___entrance_block_i11], [ %ashr158, %unsigned_shr_return_block_i6_i105]
    %rng_seed|addr1030 = phi i32[ 19260817, %__init___entrance_block_i11], [ %funccal132, %unsigned_shr_return_block_i6_i105]
    %rng_ip0_18=%rng_seed|addr1030
    %unsigned_shl_ip0_0_i19=%rng_ip0_18
    %unsigned_shl_ip1_1_i20=13
    shl5_i2_i21 = shl i32 %unsigned_shl_ip0_0_i19, %unsigned_shl_ip1_1_i20
    %unsigned_shlreturn_value2_i3_i22=%shl5_i2_i21
    %funccal33_i23=%unsigned_shlreturn_value2_i3_i22
    ashr34_i24 = xor i32 %rng_ip0_18, %funccal33_i23
    %unsigned_shr_ip0_4_i25=%ashr34_i24
    %unsigned_shr_ip1_5_i26=17
    %sge12_i6_i27 = icmp sge i32 %unsigned_shr_ip0_4_i25, 0
    br i1 %sge12_i6_i27, label %if_then_block0_i4_i19, label %if_else_block1_i5_i20

if_then_block0_i4_i19; preds = %for_body_block11
    ashr15_i7_i28 = ashr i32 %unsigned_shr_ip0_4_i25, %unsigned_shr_ip1_5_i26
    %unsigned_shrreturn_value8_i8_i29=%ashr15_i7_i28
    br label %unsigned_shr_return_block_i6_i21

if_else_block1_i5_i20; preds = %if_then_block0_i4_i19
    sub17_i9_i30 = sub i32 31, %unsigned_shr_ip1_5_i26
    shl18_i10_i31 = shl i32 1, %sub17_i9_i30
    ashr21_i11_i32 = xor i32 %unsigned_shr_ip0_4_i25, 2147483648
    ashr23_i12_i33 = ashr i32 %ashr21_i11_i32, %unsigned_shr_ip1_5_i26
    or24_i13_i34 = or i32 %shl18_i10_i31, %ashr23_i12_i33
    %unsigned_shrreturn_value8_i8_i29=%or24_i13_i34
    br label %unsigned_shr_return_block_i6_i21

unsigned_shr_return_block_i6_i21; preds = %if_else_block1_i5_i20
    %funccal38_i35=%unsigned_shrreturn_value8_i8_i29
    ashr39_i36 = xor i32 %ashr34_i24, %funccal38_i35
    %unsigned_shl_ip0_14_i37=%ashr39_i36
    %unsigned_shl_ip1_15_i38=5
    shl5_i16_i39 = shl i32 %unsigned_shl_ip0_14_i37, %unsigned_shl_ip1_15_i38
    %unsigned_shlreturn_value2_i17_i40=%shl5_i16_i39
    %funccal43_i41=%unsigned_shlreturn_value2_i17_i40
    ashr44_i42 = xor i32 %ashr39_i36, %funccal43_i41
    and48_i43 = and i32 %ashr44_i42, 1073741823
    %rngreturn_value26_i44=%and48_i43
    %funccal107=%rngreturn_value26_i44
    %rng_ip0_45=%funccal107
    %unsigned_shl_ip0_0_i46=%rng_ip0_45
    %unsigned_shl_ip1_1_i47=13
    shl5_i2_i48 = shl i32 %unsigned_shl_ip0_0_i46, %unsigned_shl_ip1_1_i47
    %unsigned_shlreturn_value2_i3_i49=%shl5_i2_i48
    %funccal33_i50=%unsigned_shlreturn_value2_i3_i49
    ashr34_i51 = xor i32 %rng_ip0_45, %funccal33_i50
    %unsigned_shr_ip0_4_i52=%ashr34_i51
    %unsigned_shr_ip1_5_i53=17
    %sge12_i6_i54 = icmp sge i32 %unsigned_shr_ip0_4_i52, 0
    br i1 %sge12_i6_i54, label %if_then_block0_i4_i33, label %if_else_block1_i5_i34

if_then_block0_i4_i33; preds = %unsigned_shr_return_block_i6_i21
    ashr15_i7_i55 = ashr i32 %unsigned_shr_ip0_4_i52, %unsigned_shr_ip1_5_i53
    %unsigned_shrreturn_value8_i8_i56=%ashr15_i7_i55
    br label %unsigned_shr_return_block_i6_i35

if_else_block1_i5_i34; preds = %if_then_block0_i4_i33
    sub17_i9_i57 = sub i32 31, %unsigned_shr_ip1_5_i53
    shl18_i10_i58 = shl i32 1, %sub17_i9_i57
    ashr21_i11_i59 = xor i32 %unsigned_shr_ip0_4_i52, 2147483648
    ashr23_i12_i60 = ashr i32 %ashr21_i11_i59, %unsigned_shr_ip1_5_i53
    or24_i13_i61 = or i32 %shl18_i10_i58, %ashr23_i12_i60
    %unsigned_shrreturn_value8_i8_i56=%or24_i13_i61
    br label %unsigned_shr_return_block_i6_i35

unsigned_shr_return_block_i6_i35; preds = %if_else_block1_i5_i34
    %funccal38_i62=%unsigned_shrreturn_value8_i8_i56
    ashr39_i63 = xor i32 %ashr34_i51, %funccal38_i62
    %unsigned_shl_ip0_14_i64=%ashr39_i63
    %unsigned_shl_ip1_15_i65=5
    shl5_i16_i66 = shl i32 %unsigned_shl_ip0_14_i64, %unsigned_shl_ip1_15_i65
    %unsigned_shlreturn_value2_i17_i67=%shl5_i16_i66
    %funccal43_i68=%unsigned_shlreturn_value2_i17_i67
    ashr44_i69 = xor i32 %ashr39_i63, %funccal43_i68
    and48_i70 = and i32 %ashr44_i69, 1073741823
    %rngreturn_value26_i71=%and48_i70
    %funccal110=%rngreturn_value26_i71
    and114 = and i32 %funccal107, 255
    and116 = and i32 %funccal110, 255
    %ne117 = icmp ne i32 %and114, %and116
    br i1 %ne117, label %if_then_block13, label %if_else_block14

if_then_block13; preds = %unsigned_shr_return_block_i6_i35
    %rng_ip0_72=%funccal110
    %unsigned_shl_ip0_0_i73=%rng_ip0_72
    %unsigned_shl_ip1_1_i74=13
    shl5_i2_i75 = shl i32 %unsigned_shl_ip0_0_i73, %unsigned_shl_ip1_1_i74
    %unsigned_shlreturn_value2_i3_i76=%shl5_i2_i75
    %funccal33_i77=%unsigned_shlreturn_value2_i3_i76
    ashr34_i78 = xor i32 %rng_ip0_72, %funccal33_i77
    %unsigned_shr_ip0_4_i79=%ashr34_i78
    %unsigned_shr_ip1_5_i80=17
    %sge12_i6_i81 = icmp sge i32 %unsigned_shr_ip0_4_i79, 0
    br i1 %sge12_i6_i81, label %if_then_block0_i4_i47, label %if_else_block1_i5_i48

if_then_block0_i4_i47; preds = %if_then_block13
    ashr15_i7_i82 = ashr i32 %unsigned_shr_ip0_4_i79, %unsigned_shr_ip1_5_i80
    %unsigned_shrreturn_value8_i8_i83=%ashr15_i7_i82
    br label %unsigned_shr_return_block_i6_i49

if_else_block1_i5_i48; preds = %if_then_block0_i4_i47
    sub17_i9_i84 = sub i32 31, %unsigned_shr_ip1_5_i80
    shl18_i10_i85 = shl i32 1, %sub17_i9_i84
    ashr21_i11_i86 = xor i32 %unsigned_shr_ip0_4_i79, 2147483648
    ashr23_i12_i87 = ashr i32 %ashr21_i11_i86, %unsigned_shr_ip1_5_i80
    or24_i13_i88 = or i32 %shl18_i10_i85, %ashr23_i12_i87
    %unsigned_shrreturn_value8_i8_i83=%or24_i13_i88
    br label %unsigned_shr_return_block_i6_i49

unsigned_shr_return_block_i6_i49; preds = %if_else_block1_i5_i48
    %funccal38_i89=%unsigned_shrreturn_value8_i8_i83
    ashr39_i90 = xor i32 %ashr34_i78, %funccal38_i89
    %unsigned_shl_ip0_14_i91=%ashr39_i90
    %unsigned_shl_ip1_15_i92=5
    shl5_i16_i93 = shl i32 %unsigned_shl_ip0_14_i91, %unsigned_shl_ip1_15_i92
    %unsigned_shlreturn_value2_i17_i94=%shl5_i16_i93
    %funccal43_i95=%unsigned_shlreturn_value2_i17_i94
    ashr44_i96 = xor i32 %ashr39_i90, %funccal43_i95
    and48_i97 = and i32 %ashr44_i96, 1073741823
    %rngreturn_value26_i98=%and48_i97
    %funccal120=%rngreturn_value26_i98
    %rng_ip0_99=%funccal120
    %unsigned_shl_ip0_0_i100=%rng_ip0_99
    %unsigned_shl_ip1_1_i101=13
    shl5_i2_i102 = shl i32 %unsigned_shl_ip0_0_i100, %unsigned_shl_ip1_1_i101
    %unsigned_shlreturn_value2_i3_i103=%shl5_i2_i102
    %funccal33_i104=%unsigned_shlreturn_value2_i3_i103
    ashr34_i105 = xor i32 %rng_ip0_99, %funccal33_i104
    %unsigned_shr_ip0_4_i106=%ashr34_i105
    %unsigned_shr_ip1_5_i107=17
    %sge12_i6_i108 = icmp sge i32 %unsigned_shr_ip0_4_i106, 0
    br i1 %sge12_i6_i108, label %if_then_block0_i4_i61, label %if_else_block1_i5_i62

if_then_block0_i4_i61; preds = %unsigned_shr_return_block_i6_i49
    ashr15_i7_i109 = ashr i32 %unsigned_shr_ip0_4_i106, %unsigned_shr_ip1_5_i107
    %unsigned_shrreturn_value8_i8_i110=%ashr15_i7_i109
    br label %unsigned_shr_return_block_i6_i63

if_else_block1_i5_i62; preds = %if_then_block0_i4_i61
    sub17_i9_i111 = sub i32 31, %unsigned_shr_ip1_5_i107
    shl18_i10_i112 = shl i32 1, %sub17_i9_i111
    ashr21_i11_i113 = xor i32 %unsigned_shr_ip0_4_i106, 2147483648
    ashr23_i12_i114 = ashr i32 %ashr21_i11_i113, %unsigned_shr_ip1_5_i107
    or24_i13_i115 = or i32 %shl18_i10_i112, %ashr23_i12_i114
    %unsigned_shrreturn_value8_i8_i110=%or24_i13_i115
    br label %unsigned_shr_return_block_i6_i63

unsigned_shr_return_block_i6_i63; preds = %if_else_block1_i5_i62
    %funccal38_i116=%unsigned_shrreturn_value8_i8_i110
    ashr39_i117 = xor i32 %ashr34_i105, %funccal38_i116
    %unsigned_shl_ip0_14_i118=%ashr39_i117
    %unsigned_shl_ip1_15_i119=5
    shl5_i16_i120 = shl i32 %unsigned_shl_ip0_14_i118, %unsigned_shl_ip1_15_i119
    %unsigned_shlreturn_value2_i17_i121=%shl5_i16_i120
    %funccal43_i122=%unsigned_shlreturn_value2_i17_i121
    ashr44_i123 = xor i32 %ashr39_i117, %funccal43_i122
    and48_i124 = and i32 %ashr44_i123, 1073741823
    %rngreturn_value26_i125=%and48_i124
    %funccal123=%rngreturn_value26_i125
    %rng_ip0_126=%funccal123
    %unsigned_shl_ip0_0_i127=%rng_ip0_126
    %unsigned_shl_ip1_1_i128=13
    shl5_i2_i129 = shl i32 %unsigned_shl_ip0_0_i127, %unsigned_shl_ip1_1_i128
    %unsigned_shlreturn_value2_i3_i130=%shl5_i2_i129
    %funccal33_i131=%unsigned_shlreturn_value2_i3_i130
    ashr34_i132 = xor i32 %rng_ip0_126, %funccal33_i131
    %unsigned_shr_ip0_4_i133=%ashr34_i132
    %unsigned_shr_ip1_5_i134=17
    %sge12_i6_i135 = icmp sge i32 %unsigned_shr_ip0_4_i133, 0
    br i1 %sge12_i6_i135, label %if_then_block0_i4_i75, label %if_else_block1_i5_i76

if_then_block0_i4_i75; preds = %unsigned_shr_return_block_i6_i63
    ashr15_i7_i136 = ashr i32 %unsigned_shr_ip0_4_i133, %unsigned_shr_ip1_5_i134
    %unsigned_shrreturn_value8_i8_i137=%ashr15_i7_i136
    br label %unsigned_shr_return_block_i6_i77

if_else_block1_i5_i76; preds = %if_then_block0_i4_i75
    sub17_i9_i138 = sub i32 31, %unsigned_shr_ip1_5_i134
    shl18_i10_i139 = shl i32 1, %sub17_i9_i138
    ashr21_i11_i140 = xor i32 %unsigned_shr_ip0_4_i133, 2147483648
    ashr23_i12_i141 = ashr i32 %ashr21_i11_i140, %unsigned_shr_ip1_5_i134
    or24_i13_i142 = or i32 %shl18_i10_i139, %ashr23_i12_i141
    %unsigned_shrreturn_value8_i8_i137=%or24_i13_i142
    br label %unsigned_shr_return_block_i6_i77

unsigned_shr_return_block_i6_i77; preds = %if_else_block1_i5_i76
    %funccal38_i143=%unsigned_shrreturn_value8_i8_i137
    ashr39_i144 = xor i32 %ashr34_i132, %funccal38_i143
    %unsigned_shl_ip0_14_i145=%ashr39_i144
    %unsigned_shl_ip1_15_i146=5
    shl5_i16_i147 = shl i32 %unsigned_shl_ip0_14_i145, %unsigned_shl_ip1_15_i146
    %unsigned_shlreturn_value2_i17_i148=%shl5_i16_i147
    %funccal43_i149=%unsigned_shlreturn_value2_i17_i148
    ashr44_i150 = xor i32 %ashr39_i144, %funccal43_i149
    and48_i151 = and i32 %ashr44_i150, 1073741823
    %rngreturn_value26_i152=%and48_i151
    %funccal126=%rngreturn_value26_i152
    %rng_ip0_153=%funccal126
    %unsigned_shl_ip0_0_i154=%rng_ip0_153
    %unsigned_shl_ip1_1_i155=13
    shl5_i2_i156 = shl i32 %unsigned_shl_ip0_0_i154, %unsigned_shl_ip1_1_i155
    %unsigned_shlreturn_value2_i3_i157=%shl5_i2_i156
    %funccal33_i158=%unsigned_shlreturn_value2_i3_i157
    ashr34_i159 = xor i32 %rng_ip0_153, %funccal33_i158
    %unsigned_shr_ip0_4_i160=%ashr34_i159
    %unsigned_shr_ip1_5_i161=17
    %sge12_i6_i162 = icmp sge i32 %unsigned_shr_ip0_4_i160, 0
    br i1 %sge12_i6_i162, label %if_then_block0_i4_i89, label %if_else_block1_i5_i90

if_then_block0_i4_i89; preds = %unsigned_shr_return_block_i6_i77
    ashr15_i7_i163 = ashr i32 %unsigned_shr_ip0_4_i160, %unsigned_shr_ip1_5_i161
    %unsigned_shrreturn_value8_i8_i164=%ashr15_i7_i163
    br label %unsigned_shr_return_block_i6_i91

if_else_block1_i5_i90; preds = %if_then_block0_i4_i89
    sub17_i9_i165 = sub i32 31, %unsigned_shr_ip1_5_i161
    shl18_i10_i166 = shl i32 1, %sub17_i9_i165
    ashr21_i11_i167 = xor i32 %unsigned_shr_ip0_4_i160, 2147483648
    ashr23_i12_i168 = ashr i32 %ashr21_i11_i167, %unsigned_shr_ip1_5_i161
    or24_i13_i169 = or i32 %shl18_i10_i166, %ashr23_i12_i168
    %unsigned_shrreturn_value8_i8_i164=%or24_i13_i169
    br label %unsigned_shr_return_block_i6_i91

unsigned_shr_return_block_i6_i91; preds = %if_else_block1_i5_i90
    %funccal38_i170=%unsigned_shrreturn_value8_i8_i164
    ashr39_i171 = xor i32 %ashr34_i159, %funccal38_i170
    %unsigned_shl_ip0_14_i172=%ashr39_i171
    %unsigned_shl_ip1_15_i173=5
    shl5_i16_i174 = shl i32 %unsigned_shl_ip0_14_i172, %unsigned_shl_ip1_15_i173
    %unsigned_shlreturn_value2_i17_i175=%shl5_i16_i174
    %funccal43_i176=%unsigned_shlreturn_value2_i17_i175
    ashr44_i177 = xor i32 %ashr39_i171, %funccal43_i176
    and48_i178 = and i32 %ashr44_i177, 1073741823
    %rngreturn_value26_i179=%and48_i178
    %funccal129=%rngreturn_value26_i179
    %rng_ip0_180=%funccal129
    %unsigned_shl_ip0_0_i181=%rng_ip0_180
    %unsigned_shl_ip1_1_i182=13
    shl5_i2_i183 = shl i32 %unsigned_shl_ip0_0_i181, %unsigned_shl_ip1_1_i182
    %unsigned_shlreturn_value2_i3_i184=%shl5_i2_i183
    %funccal33_i185=%unsigned_shlreturn_value2_i3_i184
    ashr34_i186 = xor i32 %rng_ip0_180, %funccal33_i185
    %unsigned_shr_ip0_4_i187=%ashr34_i186
    %unsigned_shr_ip1_5_i188=17
    %sge12_i6_i189 = icmp sge i32 %unsigned_shr_ip0_4_i187, 0
    br i1 %sge12_i6_i189, label %if_then_block0_i4_i103, label %if_else_block1_i5_i104

if_then_block0_i4_i103; preds = %unsigned_shr_return_block_i6_i91
    ashr15_i7_i190 = ashr i32 %unsigned_shr_ip0_4_i187, %unsigned_shr_ip1_5_i188
    %unsigned_shrreturn_value8_i8_i191=%ashr15_i7_i190
    br label %unsigned_shr_return_block_i6_i105

if_else_block1_i5_i104; preds = %if_then_block0_i4_i103
    sub17_i9_i192 = sub i32 31, %unsigned_shr_ip1_5_i188
    shl18_i10_i193 = shl i32 1, %sub17_i9_i192
    ashr21_i11_i194 = xor i32 %unsigned_shr_ip0_4_i187, 2147483648
    ashr23_i12_i195 = ashr i32 %ashr21_i11_i194, %unsigned_shr_ip1_5_i188
    or24_i13_i196 = or i32 %shl18_i10_i193, %ashr23_i12_i195
    %unsigned_shrreturn_value8_i8_i191=%or24_i13_i196
    br label %unsigned_shr_return_block_i6_i105

unsigned_shr_return_block_i6_i105; preds = %if_else_block1_i5_i104
    %funccal38_i197=%unsigned_shrreturn_value8_i8_i191
    ashr39_i198 = xor i32 %ashr34_i186, %funccal38_i197
    %unsigned_shl_ip0_14_i199=%ashr39_i198
    %unsigned_shl_ip1_15_i200=5
    shl5_i16_i201 = shl i32 %unsigned_shl_ip0_14_i199, %unsigned_shl_ip1_15_i200
    %unsigned_shlreturn_value2_i17_i202=%shl5_i16_i201
    %funccal43_i203=%unsigned_shlreturn_value2_i17_i202
    ashr44_i204 = xor i32 %ashr39_i198, %funccal43_i203
    and48_i205 = and i32 %ashr44_i204, 1073741823
    %rngreturn_value26_i206=%and48_i205
    %funccal132=%rngreturn_value26_i206
    and138 = and i32 %funccal120, 3
    ashr140 = ashr i32 %funccal120, 28
    and142 = and i32 %funccal123, 1
    ashr144 = ashr i32 %funccal123, 29
    ashr146 = ashr i32 %funccal126, 25
    and148 = and i32 %funccal126, 31
    ashr150 = ashr i32 %funccal129, 15
    and152 = and i32 %funccal129, 32767
    ashr154 = ashr i32 %funccal132, 15
    and156 = and i32 %funccal132, 32767
    %funccal157 = call i32 @test(i32 %and138, i32 %ashr140, i32 %and142, i32 %ashr144, i32 %ashr146, i32 %and148, i32 %ashr150, i32 %and152, i32 %ashr154, i32 %and156)
    ashr158 = xor i32 %sum|addr1041, %funccal157
    br label %for_body_block11

if_else_block14; preds = %unsigned_shr_return_block_i6_i105
    %mainreturn_value102=%sum|addr1041
    br label %main_return_block

main_return_block; preds = %if_else_block14
    ret i32 %mainreturn_value102

}

