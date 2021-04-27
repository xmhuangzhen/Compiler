

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
    br i1 %ne66, label %if_then_block6, label %oror_bb9

oror_bb9; preds = %if_then_block3
    %ne69 = icmp ne i32 %e, %r
    br i1 %ne69, label %if_then_block6, label %if_else_block7

if_then_block6; preds = %oror_bb9
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
    br i1 %eq63_i217, label %if_then_block3_i113, label %if_else_block4_i117

if_then_block3_i113; preds = %if_then_block6
    %ne66_i218 = icmp ne i32 %test_ip1_208, %test_ip2_209
    br i1 %ne66_i218, label %if_then_block6_i115, label %oror_bb9_i114

oror_bb9_i114; preds = %if_then_block3_i113
    %ne69_i219 = icmp ne i32 %test_ip2_209, %test_ip3_210
    br i1 %ne69_i219, label %if_then_block6_i115, label %if_else_block7_i116

if_then_block6_i115; preds = %oror_bb9_i114
    %funccal80_i220 = call i32 @test(i32 %test_ip1_208, i32 %test_ip2_209, i32 %test_ip3_210, i32 %test_ip4_211, i32 %test_ip5_212, i32 %test_ip6_213, i32 %test_ip7_214, i32 %test_ip8_215, i32 %test_ip9_216, i32 %test_ip0_207)
    add81_i221 = add i32 %funccal80_i220, 1
    %testreturn_value60_i222=%add81_i221
    br label %test_return_block_i118

if_else_block7_i116; preds = %if_then_block6_i115
    sub87_i223 = sub i32 %test_ip5_212, 1
    sub89_i224 = sub i32 %test_ip6_213, 2
    %funccal94_i225 = call i32 @test(i32 %test_ip1_208, i32 %test_ip2_209, i32 %test_ip3_210, i32 %test_ip4_211, i32 %sub87_i223, i32 %sub89_i224, i32 %test_ip7_214, i32 %test_ip8_215, i32 %test_ip9_216, i32 %test_ip0_207)
    add95_i226 = add i32 %funccal94_i225, 2
    %testreturn_value60_i222=%add95_i226
    br label %test_return_block_i118

if_else_block4_i117; preds = %if_else_block7_i116
    add98_i227 = add i32 %test_ip0_207, %test_ip1_208
    add100_i228 = add i32 %add98_i227, %test_ip0_207
    %testreturn_value60_i222=%add100_i228
    br label %test_return_block_i118

test_return_block_i118; preds = %if_else_block4_i117
    %funccal80=%testreturn_value60_i222
    add81 = add i32 %funccal80, 1
    %testreturn_value60=%add81
    br label %test_return_block

if_else_block7; preds = %test_return_block_i118
    sub87 = sub i32 %y, 1
    sub89 = sub i32 %u, 2
    %test_ip0_229=%w
    %test_ip1_230=%e
    %test_ip2_231=%r
    %test_ip3_232=%t
    %test_ip4_233=%sub87
    %test_ip5_234=%sub89
    %test_ip6_235=%i
    %test_ip7_236=%o
    %test_ip8_237=%p
    %test_ip9_238=%q
    %eq63_i239 = icmp eq i32 %test_ip0_229, %test_ip1_230
    br i1 %eq63_i239, label %if_then_block3_i121, label %if_else_block4_i133

if_then_block3_i121; preds = %if_else_block7
    %ne66_i240 = icmp ne i32 %test_ip1_230, %test_ip2_231
    br i1 %ne66_i240, label %if_then_block6_i123, label %oror_bb9_i122

oror_bb9_i122; preds = %if_then_block3_i121
    %ne69_i241 = icmp ne i32 %test_ip2_231, %test_ip3_232
    br i1 %ne69_i241, label %if_then_block6_i123, label %if_else_block7_i132

if_then_block6_i123; preds = %oror_bb9_i122
    %test_ip0_207_i242=%test_ip1_230
    %test_ip1_208_i243=%test_ip2_231
    %test_ip2_209_i244=%test_ip3_232
    %test_ip3_210_i245=%test_ip4_233
    %test_ip4_211_i246=%test_ip5_234
    %test_ip5_212_i247=%test_ip6_235
    %test_ip6_213_i248=%test_ip7_236
    %test_ip7_214_i249=%test_ip8_237
    %test_ip8_215_i250=%test_ip9_238
    %test_ip9_216_i251=%test_ip0_229
    %eq63_i217_i252 = icmp eq i32 %test_ip0_207_i242, %test_ip1_208_i243
    br i1 %eq63_i217_i252, label %if_then_block3_i113_i125, label %if_else_block4_i117_i129

if_then_block3_i113_i125; preds = %if_then_block6_i123
    %ne66_i218_i253 = icmp ne i32 %test_ip1_208_i243, %test_ip2_209_i244
    br i1 %ne66_i218_i253, label %if_then_block6_i115_i127, label %oror_bb9_i114_i126

oror_bb9_i114_i126; preds = %if_then_block3_i113_i125
    %ne69_i219_i254 = icmp ne i32 %test_ip2_209_i244, %test_ip3_210_i245
    br i1 %ne69_i219_i254, label %if_then_block6_i115_i127, label %if_else_block7_i116_i128

if_then_block6_i115_i127; preds = %oror_bb9_i114_i126
    %funccal80_i220_i255 = call i32 @test(i32 %test_ip1_208_i243, i32 %test_ip2_209_i244, i32 %test_ip3_210_i245, i32 %test_ip4_211_i246, i32 %test_ip5_212_i247, i32 %test_ip6_213_i248, i32 %test_ip7_214_i249, i32 %test_ip8_215_i250, i32 %test_ip9_216_i251, i32 %test_ip0_207_i242)
    add81_i221_i256 = add i32 %funccal80_i220_i255, 1
    %testreturn_value60_i222_i257=%add81_i221_i256
    br label %test_return_block_i118_i130

if_else_block7_i116_i128; preds = %if_then_block6_i115_i127
    sub87_i223_i258 = sub i32 %test_ip5_212_i247, 1
    sub89_i224_i259 = sub i32 %test_ip6_213_i248, 2
    %funccal94_i225_i260 = call i32 @test(i32 %test_ip1_208_i243, i32 %test_ip2_209_i244, i32 %test_ip3_210_i245, i32 %test_ip4_211_i246, i32 %sub87_i223_i258, i32 %sub89_i224_i259, i32 %test_ip7_214_i249, i32 %test_ip8_215_i250, i32 %test_ip9_216_i251, i32 %test_ip0_207_i242)
    add95_i226_i261 = add i32 %funccal94_i225_i260, 2
    %testreturn_value60_i222_i257=%add95_i226_i261
    br label %test_return_block_i118_i130

if_else_block4_i117_i129; preds = %if_else_block7_i116_i128
    add98_i227_i262 = add i32 %test_ip0_207_i242, %test_ip1_208_i243
    add100_i228_i263 = add i32 %add98_i227_i262, %test_ip0_207_i242
    %testreturn_value60_i222_i257=%add100_i228_i263
    br label %test_return_block_i118_i130

test_return_block_i118_i130; preds = %if_else_block4_i117_i129
    %funccal80_i264=%testreturn_value60_i222_i257
    add81_i265 = add i32 %funccal80_i264, 1
    %testreturn_value60_i266=%add81_i265
    br label %test_return_block_i134

if_else_block7_i132; preds = %test_return_block_i118_i130
    sub87_i267 = sub i32 %test_ip5_234, 1
    sub89_i268 = sub i32 %test_ip6_235, 2
    %funccal94_i269 = call i32 @test(i32 %test_ip1_230, i32 %test_ip2_231, i32 %test_ip3_232, i32 %test_ip4_233, i32 %sub87_i267, i32 %sub89_i268, i32 %test_ip7_236, i32 %test_ip8_237, i32 %test_ip9_238, i32 %test_ip0_229)
    add95_i270 = add i32 %funccal94_i269, 2
    %testreturn_value60_i266=%add95_i270
    br label %test_return_block_i134

if_else_block4_i133; preds = %if_else_block7_i132
    add98_i271 = add i32 %test_ip0_229, %test_ip1_230
    add100_i272 = add i32 %add98_i271, %test_ip0_229
    %testreturn_value60_i266=%add100_i272
    br label %test_return_block_i134

test_return_block_i134; preds = %if_else_block4_i133
    %funccal94=%testreturn_value60_i266
    add95 = add i32 %funccal94, 2
    %testreturn_value60=%add95
    br label %test_return_block

if_else_block4; preds = %test_return_block_i134
    add98 = add i32 %q, %w
    add100 = add i32 %add98, %q
    %testreturn_value60=%add100
    br label %test_return_block

test_return_block; preds = %if_else_block4
    ret i32 %testreturn_value60

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i11

__init___entrance_block_i11; preds = %main_entrance_block
    %sum|addr1031=0
    %rng_seed|addr1020=19260817
    br label %for_body_block10

for_body_block10; preds = %__init___entrance_block_i11
    %rng_ip0_18=%rng_seed|addr1020
    %unsigned_shl_ip0_0_i19=%rng_ip0_18
    shl5_i2_i21 = shl i32 %unsigned_shl_ip0_0_i19, 13
    %unsigned_shlreturn_value2_i3_i22=%shl5_i2_i21
    %funccal33_i23=%unsigned_shlreturn_value2_i3_i22
    ashr34_i24 = xor i32 %rng_ip0_18, %funccal33_i23
    %unsigned_shr_ip0_4_i25=%ashr34_i24
    %sge12_i6_i27 = icmp sge i32 %unsigned_shr_ip0_4_i25, 0
    br i1 %sge12_i6_i27, label %if_then_block0_i4_i19, label %if_else_block1_i5_i20

if_then_block0_i4_i19; preds = %for_body_block10
    ashr15_i7_i28 = ashr i32 %unsigned_shr_ip0_4_i25, 17
    %unsigned_shrreturn_value8_i8_i29=%ashr15_i7_i28
    br label %unsigned_shr_return_block_i6_i21

if_else_block1_i5_i20; preds = %if_then_block0_i4_i19
    ashr21_i11_i32 = xor i32 %unsigned_shr_ip0_4_i25, 2147483648
    ashr23_i12_i33 = ashr i32 %ashr21_i11_i32, 17
    or24_i13_i34 = or i32 16384, %ashr23_i12_i33
    %unsigned_shrreturn_value8_i8_i29=%or24_i13_i34
    br label %unsigned_shr_return_block_i6_i21

unsigned_shr_return_block_i6_i21; preds = %if_else_block1_i5_i20
    %funccal38_i35=%unsigned_shrreturn_value8_i8_i29
    ashr39_i36 = xor i32 %ashr34_i24, %funccal38_i35
    %unsigned_shl_ip0_14_i37=%ashr39_i36
    shl5_i16_i39 = shl i32 %unsigned_shl_ip0_14_i37, 5
    %unsigned_shlreturn_value2_i17_i40=%shl5_i16_i39
    %funccal43_i41=%unsigned_shlreturn_value2_i17_i40
    ashr44_i42 = xor i32 %ashr39_i36, %funccal43_i41
    and48_i43 = and i32 %ashr44_i42, 1073741823
    %rngreturn_value26_i44=%and48_i43
    %funccal106=%rngreturn_value26_i44
    %rng_ip0_45=%funccal106
    %unsigned_shl_ip0_0_i46=%rng_ip0_45
    shl5_i2_i48 = shl i32 %unsigned_shl_ip0_0_i46, 13
    %unsigned_shlreturn_value2_i3_i49=%shl5_i2_i48
    %funccal33_i50=%unsigned_shlreturn_value2_i3_i49
    ashr34_i51 = xor i32 %rng_ip0_45, %funccal33_i50
    %unsigned_shr_ip0_4_i52=%ashr34_i51
    %sge12_i6_i54 = icmp sge i32 %unsigned_shr_ip0_4_i52, 0
    br i1 %sge12_i6_i54, label %if_then_block0_i4_i33, label %if_else_block1_i5_i34

if_then_block0_i4_i33; preds = %unsigned_shr_return_block_i6_i21
    ashr15_i7_i55 = ashr i32 %unsigned_shr_ip0_4_i52, 17
    %unsigned_shrreturn_value8_i8_i56=%ashr15_i7_i55
    br label %unsigned_shr_return_block_i6_i35

if_else_block1_i5_i34; preds = %if_then_block0_i4_i33
    ashr21_i11_i59 = xor i32 %unsigned_shr_ip0_4_i52, 2147483648
    ashr23_i12_i60 = ashr i32 %ashr21_i11_i59, 17
    or24_i13_i61 = or i32 16384, %ashr23_i12_i60
    %unsigned_shrreturn_value8_i8_i56=%or24_i13_i61
    br label %unsigned_shr_return_block_i6_i35

unsigned_shr_return_block_i6_i35; preds = %if_else_block1_i5_i34
    %funccal38_i62=%unsigned_shrreturn_value8_i8_i56
    ashr39_i63 = xor i32 %ashr34_i51, %funccal38_i62
    %unsigned_shl_ip0_14_i64=%ashr39_i63
    shl5_i16_i66 = shl i32 %unsigned_shl_ip0_14_i64, 5
    %unsigned_shlreturn_value2_i17_i67=%shl5_i16_i66
    %funccal43_i68=%unsigned_shlreturn_value2_i17_i67
    ashr44_i69 = xor i32 %ashr39_i63, %funccal43_i68
    and48_i70 = and i32 %ashr44_i69, 1073741823
    %rngreturn_value26_i71=%and48_i70
    %funccal109=%rngreturn_value26_i71
    and113 = and i32 %funccal106, 255
    and115 = and i32 %funccal109, 255
    %ne116 = icmp ne i32 %and113, %and115
    br i1 %ne116, label %if_then_block12, label %if_else_block13

if_then_block12; preds = %unsigned_shr_return_block_i6_i35
    %rng_ip0_72=%funccal109
    %unsigned_shl_ip0_0_i73=%rng_ip0_72
    shl5_i2_i75 = shl i32 %unsigned_shl_ip0_0_i73, 13
    %unsigned_shlreturn_value2_i3_i76=%shl5_i2_i75
    %funccal33_i77=%unsigned_shlreturn_value2_i3_i76
    ashr34_i78 = xor i32 %rng_ip0_72, %funccal33_i77
    %unsigned_shr_ip0_4_i79=%ashr34_i78
    %sge12_i6_i81 = icmp sge i32 %unsigned_shr_ip0_4_i79, 0
    br i1 %sge12_i6_i81, label %if_then_block0_i4_i47, label %if_else_block1_i5_i48

if_then_block0_i4_i47; preds = %if_then_block12
    ashr15_i7_i82 = ashr i32 %unsigned_shr_ip0_4_i79, 17
    %unsigned_shrreturn_value8_i8_i83=%ashr15_i7_i82
    br label %unsigned_shr_return_block_i6_i49

if_else_block1_i5_i48; preds = %if_then_block0_i4_i47
    ashr21_i11_i86 = xor i32 %unsigned_shr_ip0_4_i79, 2147483648
    ashr23_i12_i87 = ashr i32 %ashr21_i11_i86, 17
    or24_i13_i88 = or i32 16384, %ashr23_i12_i87
    %unsigned_shrreturn_value8_i8_i83=%or24_i13_i88
    br label %unsigned_shr_return_block_i6_i49

unsigned_shr_return_block_i6_i49; preds = %if_else_block1_i5_i48
    %funccal38_i89=%unsigned_shrreturn_value8_i8_i83
    ashr39_i90 = xor i32 %ashr34_i78, %funccal38_i89
    %unsigned_shl_ip0_14_i91=%ashr39_i90
    shl5_i16_i93 = shl i32 %unsigned_shl_ip0_14_i91, 5
    %unsigned_shlreturn_value2_i17_i94=%shl5_i16_i93
    %funccal43_i95=%unsigned_shlreturn_value2_i17_i94
    ashr44_i96 = xor i32 %ashr39_i90, %funccal43_i95
    and48_i97 = and i32 %ashr44_i96, 1073741823
    %rngreturn_value26_i98=%and48_i97
    %funccal119=%rngreturn_value26_i98
    %rng_ip0_99=%funccal119
    %unsigned_shl_ip0_0_i100=%rng_ip0_99
    shl5_i2_i102 = shl i32 %unsigned_shl_ip0_0_i100, 13
    %unsigned_shlreturn_value2_i3_i103=%shl5_i2_i102
    %funccal33_i104=%unsigned_shlreturn_value2_i3_i103
    ashr34_i105 = xor i32 %rng_ip0_99, %funccal33_i104
    %unsigned_shr_ip0_4_i106=%ashr34_i105
    %sge12_i6_i108 = icmp sge i32 %unsigned_shr_ip0_4_i106, 0
    br i1 %sge12_i6_i108, label %if_then_block0_i4_i61, label %if_else_block1_i5_i62

if_then_block0_i4_i61; preds = %unsigned_shr_return_block_i6_i49
    ashr15_i7_i109 = ashr i32 %unsigned_shr_ip0_4_i106, 17
    %unsigned_shrreturn_value8_i8_i110=%ashr15_i7_i109
    br label %unsigned_shr_return_block_i6_i63

if_else_block1_i5_i62; preds = %if_then_block0_i4_i61
    ashr21_i11_i113 = xor i32 %unsigned_shr_ip0_4_i106, 2147483648
    ashr23_i12_i114 = ashr i32 %ashr21_i11_i113, 17
    or24_i13_i115 = or i32 16384, %ashr23_i12_i114
    %unsigned_shrreturn_value8_i8_i110=%or24_i13_i115
    br label %unsigned_shr_return_block_i6_i63

unsigned_shr_return_block_i6_i63; preds = %if_else_block1_i5_i62
    %funccal38_i116=%unsigned_shrreturn_value8_i8_i110
    ashr39_i117 = xor i32 %ashr34_i105, %funccal38_i116
    %unsigned_shl_ip0_14_i118=%ashr39_i117
    shl5_i16_i120 = shl i32 %unsigned_shl_ip0_14_i118, 5
    %unsigned_shlreturn_value2_i17_i121=%shl5_i16_i120
    %funccal43_i122=%unsigned_shlreturn_value2_i17_i121
    ashr44_i123 = xor i32 %ashr39_i117, %funccal43_i122
    and48_i124 = and i32 %ashr44_i123, 1073741823
    %rngreturn_value26_i125=%and48_i124
    %funccal122=%rngreturn_value26_i125
    %rng_ip0_126=%funccal122
    %unsigned_shl_ip0_0_i127=%rng_ip0_126
    shl5_i2_i129 = shl i32 %unsigned_shl_ip0_0_i127, 13
    %unsigned_shlreturn_value2_i3_i130=%shl5_i2_i129
    %funccal33_i131=%unsigned_shlreturn_value2_i3_i130
    ashr34_i132 = xor i32 %rng_ip0_126, %funccal33_i131
    %unsigned_shr_ip0_4_i133=%ashr34_i132
    %sge12_i6_i135 = icmp sge i32 %unsigned_shr_ip0_4_i133, 0
    br i1 %sge12_i6_i135, label %if_then_block0_i4_i75, label %if_else_block1_i5_i76

if_then_block0_i4_i75; preds = %unsigned_shr_return_block_i6_i63
    ashr15_i7_i136 = ashr i32 %unsigned_shr_ip0_4_i133, 17
    %unsigned_shrreturn_value8_i8_i137=%ashr15_i7_i136
    br label %unsigned_shr_return_block_i6_i77

if_else_block1_i5_i76; preds = %if_then_block0_i4_i75
    ashr21_i11_i140 = xor i32 %unsigned_shr_ip0_4_i133, 2147483648
    ashr23_i12_i141 = ashr i32 %ashr21_i11_i140, 17
    or24_i13_i142 = or i32 16384, %ashr23_i12_i141
    %unsigned_shrreturn_value8_i8_i137=%or24_i13_i142
    br label %unsigned_shr_return_block_i6_i77

unsigned_shr_return_block_i6_i77; preds = %if_else_block1_i5_i76
    %funccal38_i143=%unsigned_shrreturn_value8_i8_i137
    ashr39_i144 = xor i32 %ashr34_i132, %funccal38_i143
    %unsigned_shl_ip0_14_i145=%ashr39_i144
    shl5_i16_i147 = shl i32 %unsigned_shl_ip0_14_i145, 5
    %unsigned_shlreturn_value2_i17_i148=%shl5_i16_i147
    %funccal43_i149=%unsigned_shlreturn_value2_i17_i148
    ashr44_i150 = xor i32 %ashr39_i144, %funccal43_i149
    and48_i151 = and i32 %ashr44_i150, 1073741823
    %rngreturn_value26_i152=%and48_i151
    %funccal125=%rngreturn_value26_i152
    %rng_ip0_153=%funccal125
    %unsigned_shl_ip0_0_i154=%rng_ip0_153
    shl5_i2_i156 = shl i32 %unsigned_shl_ip0_0_i154, 13
    %unsigned_shlreturn_value2_i3_i157=%shl5_i2_i156
    %funccal33_i158=%unsigned_shlreturn_value2_i3_i157
    ashr34_i159 = xor i32 %rng_ip0_153, %funccal33_i158
    %unsigned_shr_ip0_4_i160=%ashr34_i159
    %sge12_i6_i162 = icmp sge i32 %unsigned_shr_ip0_4_i160, 0
    br i1 %sge12_i6_i162, label %if_then_block0_i4_i89, label %if_else_block1_i5_i90

if_then_block0_i4_i89; preds = %unsigned_shr_return_block_i6_i77
    ashr15_i7_i163 = ashr i32 %unsigned_shr_ip0_4_i160, 17
    %unsigned_shrreturn_value8_i8_i164=%ashr15_i7_i163
    br label %unsigned_shr_return_block_i6_i91

if_else_block1_i5_i90; preds = %if_then_block0_i4_i89
    ashr21_i11_i167 = xor i32 %unsigned_shr_ip0_4_i160, 2147483648
    ashr23_i12_i168 = ashr i32 %ashr21_i11_i167, 17
    or24_i13_i169 = or i32 16384, %ashr23_i12_i168
    %unsigned_shrreturn_value8_i8_i164=%or24_i13_i169
    br label %unsigned_shr_return_block_i6_i91

unsigned_shr_return_block_i6_i91; preds = %if_else_block1_i5_i90
    %funccal38_i170=%unsigned_shrreturn_value8_i8_i164
    ashr39_i171 = xor i32 %ashr34_i159, %funccal38_i170
    %unsigned_shl_ip0_14_i172=%ashr39_i171
    shl5_i16_i174 = shl i32 %unsigned_shl_ip0_14_i172, 5
    %unsigned_shlreturn_value2_i17_i175=%shl5_i16_i174
    %funccal43_i176=%unsigned_shlreturn_value2_i17_i175
    ashr44_i177 = xor i32 %ashr39_i171, %funccal43_i176
    and48_i178 = and i32 %ashr44_i177, 1073741823
    %rngreturn_value26_i179=%and48_i178
    %funccal128=%rngreturn_value26_i179
    %rng_ip0_180=%funccal128
    %unsigned_shl_ip0_0_i181=%rng_ip0_180
    shl5_i2_i183 = shl i32 %unsigned_shl_ip0_0_i181, 13
    %unsigned_shlreturn_value2_i3_i184=%shl5_i2_i183
    %funccal33_i185=%unsigned_shlreturn_value2_i3_i184
    ashr34_i186 = xor i32 %rng_ip0_180, %funccal33_i185
    %unsigned_shr_ip0_4_i187=%ashr34_i186
    %sge12_i6_i189 = icmp sge i32 %unsigned_shr_ip0_4_i187, 0
    br i1 %sge12_i6_i189, label %if_then_block0_i4_i103, label %if_else_block1_i5_i104

if_then_block0_i4_i103; preds = %unsigned_shr_return_block_i6_i91
    ashr15_i7_i190 = ashr i32 %unsigned_shr_ip0_4_i187, 17
    %unsigned_shrreturn_value8_i8_i191=%ashr15_i7_i190
    br label %unsigned_shr_return_block_i6_i105

if_else_block1_i5_i104; preds = %if_then_block0_i4_i103
    ashr21_i11_i194 = xor i32 %unsigned_shr_ip0_4_i187, 2147483648
    ashr23_i12_i195 = ashr i32 %ashr21_i11_i194, 17
    or24_i13_i196 = or i32 16384, %ashr23_i12_i195
    %unsigned_shrreturn_value8_i8_i191=%or24_i13_i196
    br label %unsigned_shr_return_block_i6_i105

unsigned_shr_return_block_i6_i105; preds = %if_else_block1_i5_i104
    %funccal38_i197=%unsigned_shrreturn_value8_i8_i191
    ashr39_i198 = xor i32 %ashr34_i186, %funccal38_i197
    %unsigned_shl_ip0_14_i199=%ashr39_i198
    shl5_i16_i201 = shl i32 %unsigned_shl_ip0_14_i199, 5
    %unsigned_shlreturn_value2_i17_i202=%shl5_i16_i201
    %funccal43_i203=%unsigned_shlreturn_value2_i17_i202
    ashr44_i204 = xor i32 %ashr39_i198, %funccal43_i203
    and48_i205 = and i32 %ashr44_i204, 1073741823
    %rngreturn_value26_i206=%and48_i205
    %funccal131=%rngreturn_value26_i206
    and137 = and i32 %funccal119, 3
    ashr139 = ashr i32 %funccal119, 28
    and141 = and i32 %funccal122, 1
    ashr143 = ashr i32 %funccal122, 29
    ashr145 = ashr i32 %funccal125, 25
    and147 = and i32 %funccal125, 31
    ashr149 = ashr i32 %funccal128, 15
    and151 = and i32 %funccal128, 32767
    ashr153 = ashr i32 %funccal131, 15
    and155 = and i32 %funccal131, 32767
    %test_ip0_273=%and137
    %test_ip1_274=%ashr139
    %test_ip2_275=%and141
    %test_ip3_276=%ashr143
    %test_ip4_277=%ashr145
    %test_ip5_278=%and147
    %test_ip6_279=%ashr149
    %test_ip7_280=%and151
    %test_ip8_281=%ashr153
    %test_ip9_282=%and155
    %eq63_i283 = icmp eq i32 %test_ip0_273, %test_ip1_274
    br i1 %eq63_i283, label %if_then_block3_i137, label %if_else_block4_i165

if_then_block3_i137; preds = %unsigned_shr_return_block_i6_i105
    %ne66_i284 = icmp ne i32 %test_ip1_274, %test_ip2_275
    br i1 %ne66_i284, label %if_then_block6_i139, label %oror_bb9_i138

oror_bb9_i138; preds = %if_then_block3_i137
    %ne69_i285 = icmp ne i32 %test_ip2_275, %test_ip3_276
    br i1 %ne69_i285, label %if_then_block6_i139, label %if_else_block7_i148

if_then_block6_i139; preds = %oror_bb9_i138
    %test_ip0_207_i286=%test_ip1_274
    %test_ip1_208_i287=%test_ip2_275
    %test_ip2_209_i288=%test_ip3_276
    %test_ip3_210_i289=%test_ip4_277
    %test_ip4_211_i290=%test_ip5_278
    %test_ip5_212_i291=%test_ip6_279
    %test_ip6_213_i292=%test_ip7_280
    %test_ip7_214_i293=%test_ip8_281
    %test_ip8_215_i294=%test_ip9_282
    %test_ip9_216_i295=%test_ip0_273
    %eq63_i217_i296 = icmp eq i32 %test_ip0_207_i286, %test_ip1_208_i287
    br i1 %eq63_i217_i296, label %if_then_block3_i113_i141, label %if_else_block4_i117_i145

if_then_block3_i113_i141; preds = %if_then_block6_i139
    %ne66_i218_i297 = icmp ne i32 %test_ip1_208_i287, %test_ip2_209_i288
    br i1 %ne66_i218_i297, label %if_then_block6_i115_i143, label %oror_bb9_i114_i142

oror_bb9_i114_i142; preds = %if_then_block3_i113_i141
    %ne69_i219_i298 = icmp ne i32 %test_ip2_209_i288, %test_ip3_210_i289
    br i1 %ne69_i219_i298, label %if_then_block6_i115_i143, label %if_else_block7_i116_i144

if_then_block6_i115_i143; preds = %oror_bb9_i114_i142
    %funccal80_i220_i299 = call i32 @test(i32 %test_ip1_208_i287, i32 %test_ip2_209_i288, i32 %test_ip3_210_i289, i32 %test_ip4_211_i290, i32 %test_ip5_212_i291, i32 %test_ip6_213_i292, i32 %test_ip7_214_i293, i32 %test_ip8_215_i294, i32 %test_ip9_216_i295, i32 %test_ip0_207_i286)
    add81_i221_i300 = add i32 %funccal80_i220_i299, 1
    %testreturn_value60_i222_i301=%add81_i221_i300
    br label %test_return_block_i118_i146

if_else_block7_i116_i144; preds = %if_then_block6_i115_i143
    sub87_i223_i302 = sub i32 %test_ip5_212_i291, 1
    sub89_i224_i303 = sub i32 %test_ip6_213_i292, 2
    %funccal94_i225_i304 = call i32 @test(i32 %test_ip1_208_i287, i32 %test_ip2_209_i288, i32 %test_ip3_210_i289, i32 %test_ip4_211_i290, i32 %sub87_i223_i302, i32 %sub89_i224_i303, i32 %test_ip7_214_i293, i32 %test_ip8_215_i294, i32 %test_ip9_216_i295, i32 %test_ip0_207_i286)
    add95_i226_i305 = add i32 %funccal94_i225_i304, 2
    %testreturn_value60_i222_i301=%add95_i226_i305
    br label %test_return_block_i118_i146

if_else_block4_i117_i145; preds = %if_else_block7_i116_i144
    add98_i227_i306 = add i32 %test_ip0_207_i286, %test_ip1_208_i287
    add100_i228_i307 = add i32 %add98_i227_i306, %test_ip0_207_i286
    %testreturn_value60_i222_i301=%add100_i228_i307
    br label %test_return_block_i118_i146

test_return_block_i118_i146; preds = %if_else_block4_i117_i145
    %funccal80_i308=%testreturn_value60_i222_i301
    add81_i309 = add i32 %funccal80_i308, 1
    %testreturn_value60_i310=%add81_i309
    br label %test_return_block_i166

if_else_block7_i148; preds = %test_return_block_i118_i146
    sub87_i311 = sub i32 %test_ip5_278, 1
    sub89_i312 = sub i32 %test_ip6_279, 2
    %test_ip0_229_i313=%test_ip1_274
    %test_ip1_230_i314=%test_ip2_275
    %test_ip2_231_i315=%test_ip3_276
    %test_ip3_232_i316=%test_ip4_277
    %test_ip4_233_i317=%sub87_i311
    %test_ip5_234_i318=%sub89_i312
    %test_ip6_235_i319=%test_ip7_280
    %test_ip7_236_i320=%test_ip8_281
    %test_ip8_237_i321=%test_ip9_282
    %test_ip9_238_i322=%test_ip0_273
    %eq63_i239_i323 = icmp eq i32 %test_ip0_229_i313, %test_ip1_230_i314
    br i1 %eq63_i239_i323, label %if_then_block3_i121_i150, label %if_else_block4_i133_i162

if_then_block3_i121_i150; preds = %if_else_block7_i148
    %ne66_i240_i324 = icmp ne i32 %test_ip1_230_i314, %test_ip2_231_i315
    br i1 %ne66_i240_i324, label %if_then_block6_i123_i152, label %oror_bb9_i122_i151

oror_bb9_i122_i151; preds = %if_then_block3_i121_i150
    %ne69_i241_i325 = icmp ne i32 %test_ip2_231_i315, %test_ip3_232_i316
    br i1 %ne69_i241_i325, label %if_then_block6_i123_i152, label %if_else_block7_i132_i161

if_then_block6_i123_i152; preds = %oror_bb9_i122_i151
    %test_ip0_207_i242_i326=%test_ip1_230_i314
    %test_ip1_208_i243_i327=%test_ip2_231_i315
    %test_ip2_209_i244_i328=%test_ip3_232_i316
    %test_ip3_210_i245_i329=%test_ip4_233_i317
    %test_ip4_211_i246_i330=%test_ip5_234_i318
    %test_ip5_212_i247_i331=%test_ip6_235_i319
    %test_ip6_213_i248_i332=%test_ip7_236_i320
    %test_ip7_214_i249_i333=%test_ip8_237_i321
    %test_ip8_215_i250_i334=%test_ip9_238_i322
    %test_ip9_216_i251_i335=%test_ip0_229_i313
    %eq63_i217_i252_i336 = icmp eq i32 %test_ip0_207_i242_i326, %test_ip1_208_i243_i327
    br i1 %eq63_i217_i252_i336, label %if_then_block3_i113_i125_i154, label %if_else_block4_i117_i129_i158

if_then_block3_i113_i125_i154; preds = %if_then_block6_i123_i152
    %ne66_i218_i253_i337 = icmp ne i32 %test_ip1_208_i243_i327, %test_ip2_209_i244_i328
    br i1 %ne66_i218_i253_i337, label %if_then_block6_i115_i127_i156, label %oror_bb9_i114_i126_i155

oror_bb9_i114_i126_i155; preds = %if_then_block3_i113_i125_i154
    %ne69_i219_i254_i338 = icmp ne i32 %test_ip2_209_i244_i328, %test_ip3_210_i245_i329
    br i1 %ne69_i219_i254_i338, label %if_then_block6_i115_i127_i156, label %if_else_block7_i116_i128_i157

if_then_block6_i115_i127_i156; preds = %oror_bb9_i114_i126_i155
    %funccal80_i220_i255_i339 = call i32 @test(i32 %test_ip1_208_i243_i327, i32 %test_ip2_209_i244_i328, i32 %test_ip3_210_i245_i329, i32 %test_ip4_211_i246_i330, i32 %test_ip5_212_i247_i331, i32 %test_ip6_213_i248_i332, i32 %test_ip7_214_i249_i333, i32 %test_ip8_215_i250_i334, i32 %test_ip9_216_i251_i335, i32 %test_ip0_207_i242_i326)
    add81_i221_i256_i340 = add i32 %funccal80_i220_i255_i339, 1
    %testreturn_value60_i222_i257_i341=%add81_i221_i256_i340
    br label %test_return_block_i118_i130_i159

if_else_block7_i116_i128_i157; preds = %if_then_block6_i115_i127_i156
    sub87_i223_i258_i342 = sub i32 %test_ip5_212_i247_i331, 1
    sub89_i224_i259_i343 = sub i32 %test_ip6_213_i248_i332, 2
    %funccal94_i225_i260_i344 = call i32 @test(i32 %test_ip1_208_i243_i327, i32 %test_ip2_209_i244_i328, i32 %test_ip3_210_i245_i329, i32 %test_ip4_211_i246_i330, i32 %sub87_i223_i258_i342, i32 %sub89_i224_i259_i343, i32 %test_ip7_214_i249_i333, i32 %test_ip8_215_i250_i334, i32 %test_ip9_216_i251_i335, i32 %test_ip0_207_i242_i326)
    add95_i226_i261_i345 = add i32 %funccal94_i225_i260_i344, 2
    %testreturn_value60_i222_i257_i341=%add95_i226_i261_i345
    br label %test_return_block_i118_i130_i159

if_else_block4_i117_i129_i158; preds = %if_else_block7_i116_i128_i157
    add98_i227_i262_i346 = add i32 %test_ip0_207_i242_i326, %test_ip1_208_i243_i327
    add100_i228_i263_i347 = add i32 %add98_i227_i262_i346, %test_ip0_207_i242_i326
    %testreturn_value60_i222_i257_i341=%add100_i228_i263_i347
    br label %test_return_block_i118_i130_i159

test_return_block_i118_i130_i159; preds = %if_else_block4_i117_i129_i158
    %funccal80_i264_i348=%testreturn_value60_i222_i257_i341
    add81_i265_i349 = add i32 %funccal80_i264_i348, 1
    %testreturn_value60_i266_i350=%add81_i265_i349
    br label %test_return_block_i134_i163

if_else_block7_i132_i161; preds = %test_return_block_i118_i130_i159
    sub87_i267_i351 = sub i32 %test_ip5_234_i318, 1
    sub89_i268_i352 = sub i32 %test_ip6_235_i319, 2
    %funccal94_i269_i353 = call i32 @test(i32 %test_ip1_230_i314, i32 %test_ip2_231_i315, i32 %test_ip3_232_i316, i32 %test_ip4_233_i317, i32 %sub87_i267_i351, i32 %sub89_i268_i352, i32 %test_ip7_236_i320, i32 %test_ip8_237_i321, i32 %test_ip9_238_i322, i32 %test_ip0_229_i313)
    add95_i270_i354 = add i32 %funccal94_i269_i353, 2
    %testreturn_value60_i266_i350=%add95_i270_i354
    br label %test_return_block_i134_i163

if_else_block4_i133_i162; preds = %if_else_block7_i132_i161
    add98_i271_i355 = add i32 %test_ip0_229_i313, %test_ip1_230_i314
    add100_i272_i356 = add i32 %add98_i271_i355, %test_ip0_229_i313
    %testreturn_value60_i266_i350=%add100_i272_i356
    br label %test_return_block_i134_i163

test_return_block_i134_i163; preds = %if_else_block4_i133_i162
    %funccal94_i357=%testreturn_value60_i266_i350
    add95_i358 = add i32 %funccal94_i357, 2
    %testreturn_value60_i310=%add95_i358
    br label %test_return_block_i166

if_else_block4_i165; preds = %test_return_block_i134_i163
    add98_i359 = add i32 %test_ip0_273, %test_ip1_274
    add100_i360 = add i32 %add98_i359, %test_ip0_273
    %testreturn_value60_i310=%add100_i360
    br label %test_return_block_i166

test_return_block_i166; preds = %if_else_block4_i165
    %funccal156=%testreturn_value60_i310
    ashr157 = xor i32 %sum|addr1031, %funccal156
    %sum|addr1031=%ashr157
    %rng_seed|addr1020=%funccal131
    br label %for_body_block10

if_else_block13; preds = %test_return_block_i166
    sub159 = sub i32 %sum|addr1031, 19
    %mainreturn_value101=%sub159
    br label %main_return_block

main_return_block; preds = %if_else_block13
    ret i32 %mainreturn_value101

}

