

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
    br i1 %eq63_i217, label %if_then_block3_i113, label %if_else_block4_i118

if_then_block3_i113; preds = %if_then_block6
    %ne66_i218 = icmp ne i32 %test_ip1_208, %test_ip2_209
    br i1 %ne66_i218, label %oror_dest_block10_i115, label %oror_b_block9_i114

oror_b_block9_i114; preds = %if_then_block3_i113
    %ne69_i219 = icmp ne i32 %test_ip2_209, %test_ip3_210
    br label %oror_dest_block10_i115

oror_dest_block10_i115; preds = %oror_b_block9_i114
    %Oror_70_i220 = phi i1[ true, %if_then_block3_i113], [ %ne69_i219, %oror_b_block9_i114]
    br i1 %Oror_70_i220, label %if_then_block6_i116, label %if_else_block7_i117

if_then_block6_i116; preds = %oror_dest_block10_i115
    %funccal81_i221 = call i32 @test(i32 %test_ip1_208, i32 %test_ip2_209, i32 %test_ip3_210, i32 %test_ip4_211, i32 %test_ip5_212, i32 %test_ip6_213, i32 %test_ip7_214, i32 %test_ip8_215, i32 %test_ip9_216, i32 %test_ip0_207)
    add82_i222 = add i32 %funccal81_i221, 1
    %testreturn_value60_i223=%add82_i222
    br label %test_return_block_i119

if_else_block7_i117; preds = %if_then_block6_i116
    sub88_i224 = sub i32 %test_ip5_212, 1
    sub90_i225 = sub i32 %test_ip6_213, 2
    %funccal95_i226 = call i32 @test(i32 %test_ip1_208, i32 %test_ip2_209, i32 %test_ip3_210, i32 %test_ip4_211, i32 %sub88_i224, i32 %sub90_i225, i32 %test_ip7_214, i32 %test_ip8_215, i32 %test_ip9_216, i32 %test_ip0_207)
    add96_i227 = add i32 %funccal95_i226, 2
    %testreturn_value60_i223=%add96_i227
    br label %test_return_block_i119

if_else_block4_i118; preds = %if_else_block7_i117
    add99_i228 = add i32 %test_ip0_207, %test_ip1_208
    add101_i229 = add i32 %add99_i228, %test_ip0_207
    %testreturn_value60_i223=%add101_i229
    br label %test_return_block_i119

test_return_block_i119; preds = %if_else_block4_i118
    %funccal81=%testreturn_value60_i223
    add82 = add i32 %funccal81, 1
    %testreturn_value60=%add82
    br label %test_return_block

if_else_block7; preds = %test_return_block_i119
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
    br i1 %eq63_i240, label %if_then_block3_i122, label %if_else_block4_i136

if_then_block3_i122; preds = %if_else_block7
    %ne66_i241 = icmp ne i32 %test_ip1_231, %test_ip2_232
    br i1 %ne66_i241, label %oror_dest_block10_i124, label %oror_b_block9_i123

oror_b_block9_i123; preds = %if_then_block3_i122
    %ne69_i242 = icmp ne i32 %test_ip2_232, %test_ip3_233
    br label %oror_dest_block10_i124

oror_dest_block10_i124; preds = %oror_b_block9_i123
    %Oror_70_i243 = phi i1[ true, %if_then_block3_i122], [ %ne69_i242, %oror_b_block9_i123]
    br i1 %Oror_70_i243, label %if_then_block6_i125, label %if_else_block7_i135

if_then_block6_i125; preds = %oror_dest_block10_i124
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
    br i1 %eq63_i217_i254, label %if_then_block3_i113_i127, label %if_else_block4_i118_i132

if_then_block3_i113_i127; preds = %if_then_block6_i125
    %ne66_i218_i255 = icmp ne i32 %test_ip1_208_i245, %test_ip2_209_i246
    br i1 %ne66_i218_i255, label %oror_dest_block10_i115_i129, label %oror_b_block9_i114_i128

oror_b_block9_i114_i128; preds = %if_then_block3_i113_i127
    %ne69_i219_i256 = icmp ne i32 %test_ip2_209_i246, %test_ip3_210_i247
    br label %oror_dest_block10_i115_i129

oror_dest_block10_i115_i129; preds = %oror_b_block9_i114_i128
    %Oror_70_i220_i257 = phi i1[ true, %if_then_block3_i113_i127], [ %ne69_i219_i256, %oror_b_block9_i114_i128]
    br i1 %Oror_70_i220_i257, label %if_then_block6_i116_i130, label %if_else_block7_i117_i131

if_then_block6_i116_i130; preds = %oror_dest_block10_i115_i129
    %funccal81_i221_i258 = call i32 @test(i32 %test_ip1_208_i245, i32 %test_ip2_209_i246, i32 %test_ip3_210_i247, i32 %test_ip4_211_i248, i32 %test_ip5_212_i249, i32 %test_ip6_213_i250, i32 %test_ip7_214_i251, i32 %test_ip8_215_i252, i32 %test_ip9_216_i253, i32 %test_ip0_207_i244)
    add82_i222_i259 = add i32 %funccal81_i221_i258, 1
    %testreturn_value60_i223_i260=%add82_i222_i259
    br label %test_return_block_i119_i133

if_else_block7_i117_i131; preds = %if_then_block6_i116_i130
    sub88_i224_i261 = sub i32 %test_ip5_212_i249, 1
    sub90_i225_i262 = sub i32 %test_ip6_213_i250, 2
    %funccal95_i226_i263 = call i32 @test(i32 %test_ip1_208_i245, i32 %test_ip2_209_i246, i32 %test_ip3_210_i247, i32 %test_ip4_211_i248, i32 %sub88_i224_i261, i32 %sub90_i225_i262, i32 %test_ip7_214_i251, i32 %test_ip8_215_i252, i32 %test_ip9_216_i253, i32 %test_ip0_207_i244)
    add96_i227_i264 = add i32 %funccal95_i226_i263, 2
    %testreturn_value60_i223_i260=%add96_i227_i264
    br label %test_return_block_i119_i133

if_else_block4_i118_i132; preds = %if_else_block7_i117_i131
    add99_i228_i265 = add i32 %test_ip0_207_i244, %test_ip1_208_i245
    add101_i229_i266 = add i32 %add99_i228_i265, %test_ip0_207_i244
    %testreturn_value60_i223_i260=%add101_i229_i266
    br label %test_return_block_i119_i133

test_return_block_i119_i133; preds = %if_else_block4_i118_i132
    %funccal81_i267=%testreturn_value60_i223_i260
    add82_i268 = add i32 %funccal81_i267, 1
    %testreturn_value60_i269=%add82_i268
    br label %test_return_block_i137

if_else_block7_i135; preds = %test_return_block_i119_i133
    sub88_i270 = sub i32 %test_ip5_235, 1
    sub90_i271 = sub i32 %test_ip6_236, 2
    %funccal95_i272 = call i32 @test(i32 %test_ip1_231, i32 %test_ip2_232, i32 %test_ip3_233, i32 %test_ip4_234, i32 %sub88_i270, i32 %sub90_i271, i32 %test_ip7_237, i32 %test_ip8_238, i32 %test_ip9_239, i32 %test_ip0_230)
    add96_i273 = add i32 %funccal95_i272, 2
    %testreturn_value60_i269=%add96_i273
    br label %test_return_block_i137

if_else_block4_i136; preds = %if_else_block7_i135
    add99_i274 = add i32 %test_ip0_230, %test_ip1_231
    add101_i275 = add i32 %add99_i274, %test_ip0_230
    %testreturn_value60_i269=%add101_i275
    br label %test_return_block_i137

test_return_block_i137; preds = %if_else_block4_i136
    %funccal95=%testreturn_value60_i269
    add96 = add i32 %funccal95, 2
    %testreturn_value60=%add96
    br label %test_return_block

if_else_block4; preds = %test_return_block_i137
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
    %rng_seed|addr1030 = phi i32[ 19260817, %__init___entrance_block_i11], [ %funccal132, %test_return_block_i173]
    %sum|addr1041 = phi i32[ 0, %__init___entrance_block_i11], [ %ashr158, %test_return_block_i173]
    %rng_ip0_18=%rng_seed|addr1030
    %unsigned_shl_ip0_0_i19=%rng_ip0_18
    shl5_i2_i21 = shl i32 %unsigned_shl_ip0_0_i19, 13
    %unsigned_shlreturn_value2_i3_i22=%shl5_i2_i21
    %funccal33_i23=%unsigned_shlreturn_value2_i3_i22
    ashr34_i24 = xor i32 %rng_ip0_18, %funccal33_i23
    %unsigned_shr_ip0_4_i25=%ashr34_i24
    %sge12_i6_i27 = icmp sge i32 %unsigned_shr_ip0_4_i25, 0
    br i1 %sge12_i6_i27, label %if_then_block0_i4_i19, label %if_else_block1_i5_i20

if_then_block0_i4_i19; preds = %for_body_block11
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
    %funccal107=%rngreturn_value26_i44
    %rng_ip0_45=%funccal107
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
    %funccal110=%rngreturn_value26_i71
    and114 = and i32 %funccal107, 255
    and116 = and i32 %funccal110, 255
    %ne117 = icmp ne i32 %and114, %and116
    br i1 %ne117, label %if_then_block13, label %if_else_block14

if_then_block13; preds = %unsigned_shr_return_block_i6_i35
    %rng_ip0_72=%funccal110
    %unsigned_shl_ip0_0_i73=%rng_ip0_72
    shl5_i2_i75 = shl i32 %unsigned_shl_ip0_0_i73, 13
    %unsigned_shlreturn_value2_i3_i76=%shl5_i2_i75
    %funccal33_i77=%unsigned_shlreturn_value2_i3_i76
    ashr34_i78 = xor i32 %rng_ip0_72, %funccal33_i77
    %unsigned_shr_ip0_4_i79=%ashr34_i78
    %sge12_i6_i81 = icmp sge i32 %unsigned_shr_ip0_4_i79, 0
    br i1 %sge12_i6_i81, label %if_then_block0_i4_i47, label %if_else_block1_i5_i48

if_then_block0_i4_i47; preds = %if_then_block13
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
    %funccal120=%rngreturn_value26_i98
    %rng_ip0_99=%funccal120
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
    %funccal123=%rngreturn_value26_i125
    %rng_ip0_126=%funccal123
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
    %funccal126=%rngreturn_value26_i152
    %rng_ip0_153=%funccal126
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
    %funccal129=%rngreturn_value26_i179
    %rng_ip0_180=%funccal129
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
    %test_ip0_276=%and138
    %test_ip1_277=%ashr140
    %test_ip2_278=%and142
    %test_ip3_279=%ashr144
    %test_ip4_280=%ashr146
    %test_ip5_281=%and148
    %test_ip6_282=%ashr150
    %test_ip7_283=%and152
    %test_ip8_284=%ashr154
    %test_ip9_285=%and156
    %eq63_i286 = icmp eq i32 %test_ip0_276, %test_ip1_277
    br i1 %eq63_i286, label %if_then_block3_i140, label %if_else_block4_i172

if_then_block3_i140; preds = %unsigned_shr_return_block_i6_i105
    %ne66_i287 = icmp ne i32 %test_ip1_277, %test_ip2_278
    br i1 %ne66_i287, label %oror_dest_block10_i142, label %oror_b_block9_i141

oror_b_block9_i141; preds = %if_then_block3_i140
    %ne69_i288 = icmp ne i32 %test_ip2_278, %test_ip3_279
    br label %oror_dest_block10_i142

oror_dest_block10_i142; preds = %oror_b_block9_i141
    %Oror_70_i289 = phi i1[ true, %if_then_block3_i140], [ %ne69_i288, %oror_b_block9_i141]
    br i1 %Oror_70_i289, label %if_then_block6_i143, label %if_else_block7_i153

if_then_block6_i143; preds = %oror_dest_block10_i142
    %test_ip0_207_i290=%test_ip1_277
    %test_ip1_208_i291=%test_ip2_278
    %test_ip2_209_i292=%test_ip3_279
    %test_ip3_210_i293=%test_ip4_280
    %test_ip4_211_i294=%test_ip5_281
    %test_ip5_212_i295=%test_ip6_282
    %test_ip6_213_i296=%test_ip7_283
    %test_ip7_214_i297=%test_ip8_284
    %test_ip8_215_i298=%test_ip9_285
    %test_ip9_216_i299=%test_ip0_276
    %eq63_i217_i300 = icmp eq i32 %test_ip0_207_i290, %test_ip1_208_i291
    br i1 %eq63_i217_i300, label %if_then_block3_i113_i145, label %if_else_block4_i118_i150

if_then_block3_i113_i145; preds = %if_then_block6_i143
    %ne66_i218_i301 = icmp ne i32 %test_ip1_208_i291, %test_ip2_209_i292
    br i1 %ne66_i218_i301, label %oror_dest_block10_i115_i147, label %oror_b_block9_i114_i146

oror_b_block9_i114_i146; preds = %if_then_block3_i113_i145
    %ne69_i219_i302 = icmp ne i32 %test_ip2_209_i292, %test_ip3_210_i293
    br label %oror_dest_block10_i115_i147

oror_dest_block10_i115_i147; preds = %oror_b_block9_i114_i146
    %Oror_70_i220_i303 = phi i1[ true, %if_then_block3_i113_i145], [ %ne69_i219_i302, %oror_b_block9_i114_i146]
    br i1 %Oror_70_i220_i303, label %if_then_block6_i116_i148, label %if_else_block7_i117_i149

if_then_block6_i116_i148; preds = %oror_dest_block10_i115_i147
    %funccal81_i221_i304 = call i32 @test(i32 %test_ip1_208_i291, i32 %test_ip2_209_i292, i32 %test_ip3_210_i293, i32 %test_ip4_211_i294, i32 %test_ip5_212_i295, i32 %test_ip6_213_i296, i32 %test_ip7_214_i297, i32 %test_ip8_215_i298, i32 %test_ip9_216_i299, i32 %test_ip0_207_i290)
    add82_i222_i305 = add i32 %funccal81_i221_i304, 1
    %testreturn_value60_i223_i306=%add82_i222_i305
    br label %test_return_block_i119_i151

if_else_block7_i117_i149; preds = %if_then_block6_i116_i148
    sub88_i224_i307 = sub i32 %test_ip5_212_i295, 1
    sub90_i225_i308 = sub i32 %test_ip6_213_i296, 2
    %funccal95_i226_i309 = call i32 @test(i32 %test_ip1_208_i291, i32 %test_ip2_209_i292, i32 %test_ip3_210_i293, i32 %test_ip4_211_i294, i32 %sub88_i224_i307, i32 %sub90_i225_i308, i32 %test_ip7_214_i297, i32 %test_ip8_215_i298, i32 %test_ip9_216_i299, i32 %test_ip0_207_i290)
    add96_i227_i310 = add i32 %funccal95_i226_i309, 2
    %testreturn_value60_i223_i306=%add96_i227_i310
    br label %test_return_block_i119_i151

if_else_block4_i118_i150; preds = %if_else_block7_i117_i149
    add99_i228_i311 = add i32 %test_ip0_207_i290, %test_ip1_208_i291
    add101_i229_i312 = add i32 %add99_i228_i311, %test_ip0_207_i290
    %testreturn_value60_i223_i306=%add101_i229_i312
    br label %test_return_block_i119_i151

test_return_block_i119_i151; preds = %if_else_block4_i118_i150
    %funccal81_i313=%testreturn_value60_i223_i306
    add82_i314 = add i32 %funccal81_i313, 1
    %testreturn_value60_i315=%add82_i314
    br label %test_return_block_i173

if_else_block7_i153; preds = %test_return_block_i119_i151
    sub88_i316 = sub i32 %test_ip5_281, 1
    sub90_i317 = sub i32 %test_ip6_282, 2
    %test_ip0_230_i318=%test_ip1_277
    %test_ip1_231_i319=%test_ip2_278
    %test_ip2_232_i320=%test_ip3_279
    %test_ip3_233_i321=%test_ip4_280
    %test_ip4_234_i322=%sub88_i316
    %test_ip5_235_i323=%sub90_i317
    %test_ip6_236_i324=%test_ip7_283
    %test_ip7_237_i325=%test_ip8_284
    %test_ip8_238_i326=%test_ip9_285
    %test_ip9_239_i327=%test_ip0_276
    %eq63_i240_i328 = icmp eq i32 %test_ip0_230_i318, %test_ip1_231_i319
    br i1 %eq63_i240_i328, label %if_then_block3_i122_i155, label %if_else_block4_i136_i169

if_then_block3_i122_i155; preds = %if_else_block7_i153
    %ne66_i241_i329 = icmp ne i32 %test_ip1_231_i319, %test_ip2_232_i320
    br i1 %ne66_i241_i329, label %oror_dest_block10_i124_i157, label %oror_b_block9_i123_i156

oror_b_block9_i123_i156; preds = %if_then_block3_i122_i155
    %ne69_i242_i330 = icmp ne i32 %test_ip2_232_i320, %test_ip3_233_i321
    br label %oror_dest_block10_i124_i157

oror_dest_block10_i124_i157; preds = %oror_b_block9_i123_i156
    %Oror_70_i243_i331 = phi i1[ true, %if_then_block3_i122_i155], [ %ne69_i242_i330, %oror_b_block9_i123_i156]
    br i1 %Oror_70_i243_i331, label %if_then_block6_i125_i158, label %if_else_block7_i135_i168

if_then_block6_i125_i158; preds = %oror_dest_block10_i124_i157
    %test_ip0_207_i244_i332=%test_ip1_231_i319
    %test_ip1_208_i245_i333=%test_ip2_232_i320
    %test_ip2_209_i246_i334=%test_ip3_233_i321
    %test_ip3_210_i247_i335=%test_ip4_234_i322
    %test_ip4_211_i248_i336=%test_ip5_235_i323
    %test_ip5_212_i249_i337=%test_ip6_236_i324
    %test_ip6_213_i250_i338=%test_ip7_237_i325
    %test_ip7_214_i251_i339=%test_ip8_238_i326
    %test_ip8_215_i252_i340=%test_ip9_239_i327
    %test_ip9_216_i253_i341=%test_ip0_230_i318
    %eq63_i217_i254_i342 = icmp eq i32 %test_ip0_207_i244_i332, %test_ip1_208_i245_i333
    br i1 %eq63_i217_i254_i342, label %if_then_block3_i113_i127_i160, label %if_else_block4_i118_i132_i165

if_then_block3_i113_i127_i160; preds = %if_then_block6_i125_i158
    %ne66_i218_i255_i343 = icmp ne i32 %test_ip1_208_i245_i333, %test_ip2_209_i246_i334
    br i1 %ne66_i218_i255_i343, label %oror_dest_block10_i115_i129_i162, label %oror_b_block9_i114_i128_i161

oror_b_block9_i114_i128_i161; preds = %if_then_block3_i113_i127_i160
    %ne69_i219_i256_i344 = icmp ne i32 %test_ip2_209_i246_i334, %test_ip3_210_i247_i335
    br label %oror_dest_block10_i115_i129_i162

oror_dest_block10_i115_i129_i162; preds = %oror_b_block9_i114_i128_i161
    %Oror_70_i220_i257_i345 = phi i1[ true, %if_then_block3_i113_i127_i160], [ %ne69_i219_i256_i344, %oror_b_block9_i114_i128_i161]
    br i1 %Oror_70_i220_i257_i345, label %if_then_block6_i116_i130_i163, label %if_else_block7_i117_i131_i164

if_then_block6_i116_i130_i163; preds = %oror_dest_block10_i115_i129_i162
    %funccal81_i221_i258_i346 = call i32 @test(i32 %test_ip1_208_i245_i333, i32 %test_ip2_209_i246_i334, i32 %test_ip3_210_i247_i335, i32 %test_ip4_211_i248_i336, i32 %test_ip5_212_i249_i337, i32 %test_ip6_213_i250_i338, i32 %test_ip7_214_i251_i339, i32 %test_ip8_215_i252_i340, i32 %test_ip9_216_i253_i341, i32 %test_ip0_207_i244_i332)
    add82_i222_i259_i347 = add i32 %funccal81_i221_i258_i346, 1
    %testreturn_value60_i223_i260_i348=%add82_i222_i259_i347
    br label %test_return_block_i119_i133_i166

if_else_block7_i117_i131_i164; preds = %if_then_block6_i116_i130_i163
    sub88_i224_i261_i349 = sub i32 %test_ip5_212_i249_i337, 1
    sub90_i225_i262_i350 = sub i32 %test_ip6_213_i250_i338, 2
    %funccal95_i226_i263_i351 = call i32 @test(i32 %test_ip1_208_i245_i333, i32 %test_ip2_209_i246_i334, i32 %test_ip3_210_i247_i335, i32 %test_ip4_211_i248_i336, i32 %sub88_i224_i261_i349, i32 %sub90_i225_i262_i350, i32 %test_ip7_214_i251_i339, i32 %test_ip8_215_i252_i340, i32 %test_ip9_216_i253_i341, i32 %test_ip0_207_i244_i332)
    add96_i227_i264_i352 = add i32 %funccal95_i226_i263_i351, 2
    %testreturn_value60_i223_i260_i348=%add96_i227_i264_i352
    br label %test_return_block_i119_i133_i166

if_else_block4_i118_i132_i165; preds = %if_else_block7_i117_i131_i164
    add99_i228_i265_i353 = add i32 %test_ip0_207_i244_i332, %test_ip1_208_i245_i333
    add101_i229_i266_i354 = add i32 %add99_i228_i265_i353, %test_ip0_207_i244_i332
    %testreturn_value60_i223_i260_i348=%add101_i229_i266_i354
    br label %test_return_block_i119_i133_i166

test_return_block_i119_i133_i166; preds = %if_else_block4_i118_i132_i165
    %funccal81_i267_i355=%testreturn_value60_i223_i260_i348
    add82_i268_i356 = add i32 %funccal81_i267_i355, 1
    %testreturn_value60_i269_i357=%add82_i268_i356
    br label %test_return_block_i137_i170

if_else_block7_i135_i168; preds = %test_return_block_i119_i133_i166
    sub88_i270_i358 = sub i32 %test_ip5_235_i323, 1
    sub90_i271_i359 = sub i32 %test_ip6_236_i324, 2
    %funccal95_i272_i360 = call i32 @test(i32 %test_ip1_231_i319, i32 %test_ip2_232_i320, i32 %test_ip3_233_i321, i32 %test_ip4_234_i322, i32 %sub88_i270_i358, i32 %sub90_i271_i359, i32 %test_ip7_237_i325, i32 %test_ip8_238_i326, i32 %test_ip9_239_i327, i32 %test_ip0_230_i318)
    add96_i273_i361 = add i32 %funccal95_i272_i360, 2
    %testreturn_value60_i269_i357=%add96_i273_i361
    br label %test_return_block_i137_i170

if_else_block4_i136_i169; preds = %if_else_block7_i135_i168
    add99_i274_i362 = add i32 %test_ip0_230_i318, %test_ip1_231_i319
    add101_i275_i363 = add i32 %add99_i274_i362, %test_ip0_230_i318
    %testreturn_value60_i269_i357=%add101_i275_i363
    br label %test_return_block_i137_i170

test_return_block_i137_i170; preds = %if_else_block4_i136_i169
    %funccal95_i364=%testreturn_value60_i269_i357
    add96_i365 = add i32 %funccal95_i364, 2
    %testreturn_value60_i315=%add96_i365
    br label %test_return_block_i173

if_else_block4_i172; preds = %test_return_block_i137_i170
    add99_i366 = add i32 %test_ip0_276, %test_ip1_277
    add101_i367 = add i32 %add99_i366, %test_ip0_276
    %testreturn_value60_i315=%add101_i367
    br label %test_return_block_i173

test_return_block_i173; preds = %if_else_block4_i172
    %funccal157=%testreturn_value60_i315
    ashr158 = xor i32 %sum|addr1041, %funccal157
    br label %for_body_block11

if_else_block14; preds = %test_return_block_i173
    sub160 = sub i32 %sum|addr1041, 19
    %mainreturn_value102=%sub160
    br label %main_return_block

main_return_block; preds = %if_else_block14
    ret i32 %mainreturn_value102

}

