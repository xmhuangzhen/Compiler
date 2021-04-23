

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
    %test_ip0_207=%w
    %test_ip1_208=%e
    %test_ip2_209=%r
    %test_ip3_210=%t
    %test_ip4_211=%y
    %test_ip5_212=%u
    %test_ip6_213=%i
    %test_ip7_214=%o
    %test_ip8_215=%p
    %test_ip9_216=%q
    %eq63_i217 = icmp eq i32 %test_ip0_207, %test_ip1_208
    br i1 %eq63_i217, label %if_then_block3_i89, label %if_else_block4_i94

if_then_block3_i89; preds = %if_then_block6
    %ne66_i218 = icmp ne i32 %test_ip1_208, %test_ip2_209
    br i1 %ne66_i218, label %oror_dest_block10_i91, label %oror_b_block9_i90

oror_b_block9_i90; preds = %if_then_block3_i89
    %ne69_i219 = icmp ne i32 %test_ip2_209, %test_ip3_210
    br label %oror_dest_block10_i91

oror_dest_block10_i91; preds = %oror_b_block9_i90
    %Oror_70_i220 = phi i1[ true, %if_then_block3_i89], [ %ne69_i219, %oror_b_block9_i90]
    br i1 %Oror_70_i220, label %if_then_block6_i92, label %if_else_block7_i93

if_then_block6_i92; preds = %oror_dest_block10_i91
    %funccal81_i221 = call i32 @test(i32 %test_ip1_208, i32 %test_ip2_209, i32 %test_ip3_210, i32 %test_ip4_211, i32 %test_ip5_212, i32 %test_ip6_213, i32 %test_ip7_214, i32 %test_ip8_215, i32 %test_ip9_216, i32 %test_ip0_207)
    add82_i222 = add i32 %funccal81_i221, 1
    %testreturn_value60_i223=%add82_i222
    br label %test_return_block_i95

if_else_block7_i93; preds = %if_then_block6_i92
    sub88_i224 = sub i32 %test_ip5_212, 1
    sub90_i225 = sub i32 %test_ip6_213, 2
    %funccal95_i226 = call i32 @test(i32 %test_ip1_208, i32 %test_ip2_209, i32 %test_ip3_210, i32 %test_ip4_211, i32 %sub88_i224, i32 %sub90_i225, i32 %test_ip7_214, i32 %test_ip8_215, i32 %test_ip9_216, i32 %test_ip0_207)
    add96_i227 = add i32 %funccal95_i226, 2
    %testreturn_value60_i223=%add96_i227
    br label %test_return_block_i95

if_else_block4_i94; preds = %if_else_block7_i93
    add99_i228 = add i32 %test_ip0_207, %test_ip1_208
    add101_i229 = add i32 %add99_i228, %test_ip0_207
    %testreturn_value60_i223=%add101_i229
    br label %test_return_block_i95

test_return_block_i95; preds = %if_else_block4_i94
    %funccal81=%testreturn_value60_i223
    add82 = add i32 %funccal81, 1
    %testreturn_value60=%add82
    br label %test_return_block

if_else_block7; preds = %test_return_block_i95
    sub88 = sub i32 %y, 1
    sub90 = sub i32 %u, 2
    %test_ip0_230=%w
    %test_ip1_231=%e
    %test_ip2_232=%r
    %test_ip3_233=%t
    %test_ip4_234=%sub88
    %test_ip5_235=%sub90
    %test_ip6_236=%i
    %test_ip7_237=%o
    %test_ip8_238=%p
    %test_ip9_239=%q
    %eq63_i240 = icmp eq i32 %test_ip0_230, %test_ip1_231
    br i1 %eq63_i240, label %if_then_block3_i98, label %if_else_block4_i112

if_then_block3_i98; preds = %if_else_block7
    %ne66_i241 = icmp ne i32 %test_ip1_231, %test_ip2_232
    br i1 %ne66_i241, label %oror_dest_block10_i100, label %oror_b_block9_i99

oror_b_block9_i99; preds = %if_then_block3_i98
    %ne69_i242 = icmp ne i32 %test_ip2_232, %test_ip3_233
    br label %oror_dest_block10_i100

oror_dest_block10_i100; preds = %oror_b_block9_i99
    %Oror_70_i243 = phi i1[ true, %if_then_block3_i98], [ %ne69_i242, %oror_b_block9_i99]
    br i1 %Oror_70_i243, label %if_then_block6_i101, label %if_else_block7_i111

if_then_block6_i101; preds = %oror_dest_block10_i100
    %test_ip0_207_i244=%test_ip1_231
    %test_ip1_208_i245=%test_ip2_232
    %test_ip2_209_i246=%test_ip3_233
    %test_ip3_210_i247=%test_ip4_234
    %test_ip4_211_i248=%test_ip5_235
    %test_ip5_212_i249=%test_ip6_236
    %test_ip6_213_i250=%test_ip7_237
    %test_ip7_214_i251=%test_ip8_238
    %test_ip8_215_i252=%test_ip9_239
    %test_ip9_216_i253=%test_ip0_230
    %eq63_i217_i254 = icmp eq i32 %test_ip0_207_i244, %test_ip1_208_i245
    br i1 %eq63_i217_i254, label %if_then_block3_i89_i103, label %if_else_block4_i94_i108

if_then_block3_i89_i103; preds = %if_then_block6_i101
    %ne66_i218_i255 = icmp ne i32 %test_ip1_208_i245, %test_ip2_209_i246
    br i1 %ne66_i218_i255, label %oror_dest_block10_i91_i105, label %oror_b_block9_i90_i104

oror_b_block9_i90_i104; preds = %if_then_block3_i89_i103
    %ne69_i219_i256 = icmp ne i32 %test_ip2_209_i246, %test_ip3_210_i247
    br label %oror_dest_block10_i91_i105

oror_dest_block10_i91_i105; preds = %oror_b_block9_i90_i104
    %Oror_70_i220_i257 = phi i1[ true, %if_then_block3_i89_i103], [ %ne69_i219_i256, %oror_b_block9_i90_i104]
    br i1 %Oror_70_i220_i257, label %if_then_block6_i92_i106, label %if_else_block7_i93_i107

if_then_block6_i92_i106; preds = %oror_dest_block10_i91_i105
    %funccal81_i221_i258 = call i32 @test(i32 %test_ip1_208_i245, i32 %test_ip2_209_i246, i32 %test_ip3_210_i247, i32 %test_ip4_211_i248, i32 %test_ip5_212_i249, i32 %test_ip6_213_i250, i32 %test_ip7_214_i251, i32 %test_ip8_215_i252, i32 %test_ip9_216_i253, i32 %test_ip0_207_i244)
    add82_i222_i259 = add i32 %funccal81_i221_i258, 1
    %testreturn_value60_i223_i260=%add82_i222_i259
    br label %test_return_block_i95_i109

if_else_block7_i93_i107; preds = %if_then_block6_i92_i106
    sub88_i224_i261 = sub i32 %test_ip5_212_i249, 1
    sub90_i225_i262 = sub i32 %test_ip6_213_i250, 2
    %funccal95_i226_i263 = call i32 @test(i32 %test_ip1_208_i245, i32 %test_ip2_209_i246, i32 %test_ip3_210_i247, i32 %test_ip4_211_i248, i32 %sub88_i224_i261, i32 %sub90_i225_i262, i32 %test_ip7_214_i251, i32 %test_ip8_215_i252, i32 %test_ip9_216_i253, i32 %test_ip0_207_i244)
    add96_i227_i264 = add i32 %funccal95_i226_i263, 2
    %testreturn_value60_i223_i260=%add96_i227_i264
    br label %test_return_block_i95_i109

if_else_block4_i94_i108; preds = %if_else_block7_i93_i107
    add99_i228_i265 = add i32 %test_ip0_207_i244, %test_ip1_208_i245
    add101_i229_i266 = add i32 %add99_i228_i265, %test_ip0_207_i244
    %testreturn_value60_i223_i260=%add101_i229_i266
    br label %test_return_block_i95_i109

test_return_block_i95_i109; preds = %if_else_block4_i94_i108
    %funccal81_i267=%testreturn_value60_i223_i260
    add82_i268 = add i32 %funccal81_i267, 1
    %testreturn_value60_i269=%add82_i268
    br label %test_return_block_i113

if_else_block7_i111; preds = %test_return_block_i95_i109
    sub88_i270 = sub i32 %test_ip5_235, 1
    sub90_i271 = sub i32 %test_ip6_236, 2
    %funccal95_i272 = call i32 @test(i32 %test_ip1_231, i32 %test_ip2_232, i32 %test_ip3_233, i32 %test_ip4_234, i32 %sub88_i270, i32 %sub90_i271, i32 %test_ip7_237, i32 %test_ip8_238, i32 %test_ip9_239, i32 %test_ip0_230)
    add96_i273 = add i32 %funccal95_i272, 2
    %testreturn_value60_i269=%add96_i273
    br label %test_return_block_i113

if_else_block4_i112; preds = %if_else_block7_i111
    add99_i274 = add i32 %test_ip0_230, %test_ip1_231
    add101_i275 = add i32 %add99_i274, %test_ip0_230
    %testreturn_value60_i269=%add101_i275
    br label %test_return_block_i113

test_return_block_i113; preds = %if_else_block4_i112
    %funccal95=%testreturn_value60_i269
    add96 = add i32 %funccal95, 2
    %testreturn_value60=%add96
    br label %test_return_block

if_else_block4; preds = %test_return_block_i113
    add99 = add i32 %q, %w
    add101 = add i32 %add99, %q
    %testreturn_value60=%add101
    br label %test_return_block

test_return_block; preds = %if_else_block4
    ret i32 %testreturn_value60

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %for_body_block11

for_body_block11; preds = %main_entrance_block
    %sum|addr1041 = phi i32[ 0, %main_entrance_block], [ %ashr158, %unsigned_shr_return_block_i5_i83]
    %rng_seed|addr1030 = phi i32[ 19260817, %main_entrance_block], [ %funccal132, %unsigned_shr_return_block_i5_i83]
    %rng_ip0_18=%rng_seed|addr1030
    %unsigned_shl_ip0_0_i19=%rng_ip0_18
    shl5_i2_i21 = shl i32 %unsigned_shl_ip0_0_i19, 13
    %unsigned_shlreturn_value2_i3_i22=%shl5_i2_i21
    %funccal33_i23=%unsigned_shlreturn_value2_i3_i22
    ashr34_i24 = xor i32 %rng_ip0_18, %funccal33_i23
    %unsigned_shr_ip0_4_i25=%ashr34_i24
    %sge12_i6_i27 = icmp sge i32 %unsigned_shr_ip0_4_i25, 0
    br i1 %sge12_i6_i27, label %if_then_block0_i3_i15, label %if_else_block1_i4_i16

if_then_block0_i3_i15; preds = %for_body_block11
    ashr15_i7_i28 = ashr i32 %unsigned_shr_ip0_4_i25, 17
    %unsigned_shrreturn_value8_i8_i29=%ashr15_i7_i28
    br label %unsigned_shr_return_block_i5_i17

if_else_block1_i4_i16; preds = %if_then_block0_i3_i15
    ashr21_i11_i32 = xor i32 %unsigned_shr_ip0_4_i25, 2147483648
    ashr23_i12_i33 = ashr i32 %ashr21_i11_i32, 17
    or24_i13_i34 = or i32 16384, %ashr23_i12_i33
    %unsigned_shrreturn_value8_i8_i29=%or24_i13_i34
    br label %unsigned_shr_return_block_i5_i17

unsigned_shr_return_block_i5_i17; preds = %if_else_block1_i4_i16
    %funccal38_i35=%unsigned_shrreturn_value8_i8_i29
    ashr39_i36 = xor i32 %ashr34_i24, %funccal38_i35
    %unsigned_shl_ip0_14_i37=%ashr39_i36
    shl5_i16_i39 = shl i32 %unsigned_shl_ip0_14_i37, 5
    %unsigned_shlreturn_value2_i17_i40=%shl5_i16_i39
    %funccal43_i41=%unsigned_shlreturn_value2_i17_i40
    ashr44_i42 = xor i32 %ashr39_i36, %funccal43_i41
    and48_i43 = and i32 %ashr44_i42, 1073741823
    %rngreturn_value26_i44=%and48_i43
    %funccal107=%rngreturn_value26_i44
    %rng_ip0_45=%funccal107
    %unsigned_shl_ip0_0_i46=%rng_ip0_45
    shl5_i2_i48 = shl i32 %unsigned_shl_ip0_0_i46, 13
    %unsigned_shlreturn_value2_i3_i49=%shl5_i2_i48
    %funccal33_i50=%unsigned_shlreturn_value2_i3_i49
    ashr34_i51 = xor i32 %rng_ip0_45, %funccal33_i50
    %unsigned_shr_ip0_4_i52=%ashr34_i51
    %sge12_i6_i54 = icmp sge i32 %unsigned_shr_ip0_4_i52, 0
    br i1 %sge12_i6_i54, label %if_then_block0_i3_i26, label %if_else_block1_i4_i27

if_then_block0_i3_i26; preds = %unsigned_shr_return_block_i5_i17
    ashr15_i7_i55 = ashr i32 %unsigned_shr_ip0_4_i52, 17
    %unsigned_shrreturn_value8_i8_i56=%ashr15_i7_i55
    br label %unsigned_shr_return_block_i5_i28

if_else_block1_i4_i27; preds = %if_then_block0_i3_i26
    ashr21_i11_i59 = xor i32 %unsigned_shr_ip0_4_i52, 2147483648
    ashr23_i12_i60 = ashr i32 %ashr21_i11_i59, 17
    or24_i13_i61 = or i32 16384, %ashr23_i12_i60
    %unsigned_shrreturn_value8_i8_i56=%or24_i13_i61
    br label %unsigned_shr_return_block_i5_i28

unsigned_shr_return_block_i5_i28; preds = %if_else_block1_i4_i27
    %funccal38_i62=%unsigned_shrreturn_value8_i8_i56
    ashr39_i63 = xor i32 %ashr34_i51, %funccal38_i62
    %unsigned_shl_ip0_14_i64=%ashr39_i63
    shl5_i16_i66 = shl i32 %unsigned_shl_ip0_14_i64, 5
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

if_then_block13; preds = %unsigned_shr_return_block_i5_i28
    %rng_ip0_72=%funccal110
    %unsigned_shl_ip0_0_i73=%rng_ip0_72
    shl5_i2_i75 = shl i32 %unsigned_shl_ip0_0_i73, 13
    %unsigned_shlreturn_value2_i3_i76=%shl5_i2_i75
    %funccal33_i77=%unsigned_shlreturn_value2_i3_i76
    ashr34_i78 = xor i32 %rng_ip0_72, %funccal33_i77
    %unsigned_shr_ip0_4_i79=%ashr34_i78
    %sge12_i6_i81 = icmp sge i32 %unsigned_shr_ip0_4_i79, 0
    br i1 %sge12_i6_i81, label %if_then_block0_i3_i37, label %if_else_block1_i4_i38

if_then_block0_i3_i37; preds = %if_then_block13
    ashr15_i7_i82 = ashr i32 %unsigned_shr_ip0_4_i79, 17
    %unsigned_shrreturn_value8_i8_i83=%ashr15_i7_i82
    br label %unsigned_shr_return_block_i5_i39

if_else_block1_i4_i38; preds = %if_then_block0_i3_i37
    ashr21_i11_i86 = xor i32 %unsigned_shr_ip0_4_i79, 2147483648
    ashr23_i12_i87 = ashr i32 %ashr21_i11_i86, 17
    or24_i13_i88 = or i32 16384, %ashr23_i12_i87
    %unsigned_shrreturn_value8_i8_i83=%or24_i13_i88
    br label %unsigned_shr_return_block_i5_i39

unsigned_shr_return_block_i5_i39; preds = %if_else_block1_i4_i38
    %funccal38_i89=%unsigned_shrreturn_value8_i8_i83
    ashr39_i90 = xor i32 %ashr34_i78, %funccal38_i89
    %unsigned_shl_ip0_14_i91=%ashr39_i90
    shl5_i16_i93 = shl i32 %unsigned_shl_ip0_14_i91, 5
    %unsigned_shlreturn_value2_i17_i94=%shl5_i16_i93
    %funccal43_i95=%unsigned_shlreturn_value2_i17_i94
    ashr44_i96 = xor i32 %ashr39_i90, %funccal43_i95
    and48_i97 = and i32 %ashr44_i96, 1073741823
    %rngreturn_value26_i98=%and48_i97
    %funccal120=%rngreturn_value26_i98
    %rng_ip0_99=%funccal120
    %unsigned_shl_ip0_0_i100=%rng_ip0_99
    shl5_i2_i102 = shl i32 %unsigned_shl_ip0_0_i100, 13
    %unsigned_shlreturn_value2_i3_i103=%shl5_i2_i102
    %funccal33_i104=%unsigned_shlreturn_value2_i3_i103
    ashr34_i105 = xor i32 %rng_ip0_99, %funccal33_i104
    %unsigned_shr_ip0_4_i106=%ashr34_i105
    %sge12_i6_i108 = icmp sge i32 %unsigned_shr_ip0_4_i106, 0
    br i1 %sge12_i6_i108, label %if_then_block0_i3_i48, label %if_else_block1_i4_i49

if_then_block0_i3_i48; preds = %unsigned_shr_return_block_i5_i39
    ashr15_i7_i109 = ashr i32 %unsigned_shr_ip0_4_i106, 17
    %unsigned_shrreturn_value8_i8_i110=%ashr15_i7_i109
    br label %unsigned_shr_return_block_i5_i50

if_else_block1_i4_i49; preds = %if_then_block0_i3_i48
    ashr21_i11_i113 = xor i32 %unsigned_shr_ip0_4_i106, 2147483648
    ashr23_i12_i114 = ashr i32 %ashr21_i11_i113, 17
    or24_i13_i115 = or i32 16384, %ashr23_i12_i114
    %unsigned_shrreturn_value8_i8_i110=%or24_i13_i115
    br label %unsigned_shr_return_block_i5_i50

unsigned_shr_return_block_i5_i50; preds = %if_else_block1_i4_i49
    %funccal38_i116=%unsigned_shrreturn_value8_i8_i110
    ashr39_i117 = xor i32 %ashr34_i105, %funccal38_i116
    %unsigned_shl_ip0_14_i118=%ashr39_i117
    shl5_i16_i120 = shl i32 %unsigned_shl_ip0_14_i118, 5
    %unsigned_shlreturn_value2_i17_i121=%shl5_i16_i120
    %funccal43_i122=%unsigned_shlreturn_value2_i17_i121
    ashr44_i123 = xor i32 %ashr39_i117, %funccal43_i122
    and48_i124 = and i32 %ashr44_i123, 1073741823
    %rngreturn_value26_i125=%and48_i124
    %funccal123=%rngreturn_value26_i125
    %rng_ip0_126=%funccal123
    %unsigned_shl_ip0_0_i127=%rng_ip0_126
    shl5_i2_i129 = shl i32 %unsigned_shl_ip0_0_i127, 13
    %unsigned_shlreturn_value2_i3_i130=%shl5_i2_i129
    %funccal33_i131=%unsigned_shlreturn_value2_i3_i130
    ashr34_i132 = xor i32 %rng_ip0_126, %funccal33_i131
    %unsigned_shr_ip0_4_i133=%ashr34_i132
    %sge12_i6_i135 = icmp sge i32 %unsigned_shr_ip0_4_i133, 0
    br i1 %sge12_i6_i135, label %if_then_block0_i3_i59, label %if_else_block1_i4_i60

if_then_block0_i3_i59; preds = %unsigned_shr_return_block_i5_i50
    ashr15_i7_i136 = ashr i32 %unsigned_shr_ip0_4_i133, 17
    %unsigned_shrreturn_value8_i8_i137=%ashr15_i7_i136
    br label %unsigned_shr_return_block_i5_i61

if_else_block1_i4_i60; preds = %if_then_block0_i3_i59
    ashr21_i11_i140 = xor i32 %unsigned_shr_ip0_4_i133, 2147483648
    ashr23_i12_i141 = ashr i32 %ashr21_i11_i140, 17
    or24_i13_i142 = or i32 16384, %ashr23_i12_i141
    %unsigned_shrreturn_value8_i8_i137=%or24_i13_i142
    br label %unsigned_shr_return_block_i5_i61

unsigned_shr_return_block_i5_i61; preds = %if_else_block1_i4_i60
    %funccal38_i143=%unsigned_shrreturn_value8_i8_i137
    ashr39_i144 = xor i32 %ashr34_i132, %funccal38_i143
    %unsigned_shl_ip0_14_i145=%ashr39_i144
    shl5_i16_i147 = shl i32 %unsigned_shl_ip0_14_i145, 5
    %unsigned_shlreturn_value2_i17_i148=%shl5_i16_i147
    %funccal43_i149=%unsigned_shlreturn_value2_i17_i148
    ashr44_i150 = xor i32 %ashr39_i144, %funccal43_i149
    and48_i151 = and i32 %ashr44_i150, 1073741823
    %rngreturn_value26_i152=%and48_i151
    %funccal126=%rngreturn_value26_i152
    %rng_ip0_153=%funccal126
    %unsigned_shl_ip0_0_i154=%rng_ip0_153
    shl5_i2_i156 = shl i32 %unsigned_shl_ip0_0_i154, 13
    %unsigned_shlreturn_value2_i3_i157=%shl5_i2_i156
    %funccal33_i158=%unsigned_shlreturn_value2_i3_i157
    ashr34_i159 = xor i32 %rng_ip0_153, %funccal33_i158
    %unsigned_shr_ip0_4_i160=%ashr34_i159
    %sge12_i6_i162 = icmp sge i32 %unsigned_shr_ip0_4_i160, 0
    br i1 %sge12_i6_i162, label %if_then_block0_i3_i70, label %if_else_block1_i4_i71

if_then_block0_i3_i70; preds = %unsigned_shr_return_block_i5_i61
    ashr15_i7_i163 = ashr i32 %unsigned_shr_ip0_4_i160, 17
    %unsigned_shrreturn_value8_i8_i164=%ashr15_i7_i163
    br label %unsigned_shr_return_block_i5_i72

if_else_block1_i4_i71; preds = %if_then_block0_i3_i70
    ashr21_i11_i167 = xor i32 %unsigned_shr_ip0_4_i160, 2147483648
    ashr23_i12_i168 = ashr i32 %ashr21_i11_i167, 17
    or24_i13_i169 = or i32 16384, %ashr23_i12_i168
    %unsigned_shrreturn_value8_i8_i164=%or24_i13_i169
    br label %unsigned_shr_return_block_i5_i72

unsigned_shr_return_block_i5_i72; preds = %if_else_block1_i4_i71
    %funccal38_i170=%unsigned_shrreturn_value8_i8_i164
    ashr39_i171 = xor i32 %ashr34_i159, %funccal38_i170
    %unsigned_shl_ip0_14_i172=%ashr39_i171
    shl5_i16_i174 = shl i32 %unsigned_shl_ip0_14_i172, 5
    %unsigned_shlreturn_value2_i17_i175=%shl5_i16_i174
    %funccal43_i176=%unsigned_shlreturn_value2_i17_i175
    ashr44_i177 = xor i32 %ashr39_i171, %funccal43_i176
    and48_i178 = and i32 %ashr44_i177, 1073741823
    %rngreturn_value26_i179=%and48_i178
    %funccal129=%rngreturn_value26_i179
    %rng_ip0_180=%funccal129
    %unsigned_shl_ip0_0_i181=%rng_ip0_180
    shl5_i2_i183 = shl i32 %unsigned_shl_ip0_0_i181, 13
    %unsigned_shlreturn_value2_i3_i184=%shl5_i2_i183
    %funccal33_i185=%unsigned_shlreturn_value2_i3_i184
    ashr34_i186 = xor i32 %rng_ip0_180, %funccal33_i185
    %unsigned_shr_ip0_4_i187=%ashr34_i186
    %sge12_i6_i189 = icmp sge i32 %unsigned_shr_ip0_4_i187, 0
    br i1 %sge12_i6_i189, label %if_then_block0_i3_i81, label %if_else_block1_i4_i82

if_then_block0_i3_i81; preds = %unsigned_shr_return_block_i5_i72
    ashr15_i7_i190 = ashr i32 %unsigned_shr_ip0_4_i187, 17
    %unsigned_shrreturn_value8_i8_i191=%ashr15_i7_i190
    br label %unsigned_shr_return_block_i5_i83

if_else_block1_i4_i82; preds = %if_then_block0_i3_i81
    ashr21_i11_i194 = xor i32 %unsigned_shr_ip0_4_i187, 2147483648
    ashr23_i12_i195 = ashr i32 %ashr21_i11_i194, 17
    or24_i13_i196 = or i32 16384, %ashr23_i12_i195
    %unsigned_shrreturn_value8_i8_i191=%or24_i13_i196
    br label %unsigned_shr_return_block_i5_i83

unsigned_shr_return_block_i5_i83; preds = %if_else_block1_i4_i82
    %funccal38_i197=%unsigned_shrreturn_value8_i8_i191
    ashr39_i198 = xor i32 %ashr34_i186, %funccal38_i197
    %unsigned_shl_ip0_14_i199=%ashr39_i198
    shl5_i16_i201 = shl i32 %unsigned_shl_ip0_14_i199, 5
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

if_else_block14; preds = %unsigned_shr_return_block_i5_i83
    sub160 = sub i32 %sum|addr1041, 19
    %mainreturn_value102=%sub160
    ret i32 %mainreturn_value102

}

