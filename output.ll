

define ReturnType : i32
Parameter : i32 i32 i32  @tak(i32, i32, i32)
define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter : i32 i32 i32  @tak(i32, i32, i32){
tak_entrance_block    %slt6 = icmp slt i32 %y, %x
    br i1 %slt6, label %if_then_block0, label %if_else_block1

if_then_block0; preds = %tak_entrance_block
    sub8 = sub i32 %x, 1
    %tak_ip0_0=%sub8
    %tak_ip1_1=%y
    %tak_ip2_2=%z
    %slt6_i3 = icmp slt i32 %tak_ip1_1, %tak_ip0_0
    br i1 %slt6_i3, label %if_then_block0_i4, label %if_else_block1_i5

if_then_block0_i4; preds = %if_then_block0
    sub8_i4 = sub i32 %tak_ip0_0, 1
    %tak_ip0_403=%sub8_i4
    %tak_ip1_404=%tak_ip1_1
    %tak_ip2_405=%tak_ip2_2
    %slt6_i406 = icmp slt i32 %tak_ip1_404, %tak_ip0_403
    br i1 %slt6_i406, label %if_then_block0_i159, label %if_else_block1_i235

if_then_block0_i159; preds = %if_then_block0_i4
    sub8_i407 = sub i32 %tak_ip0_403, 1
    %tak_ip0_0_i408=%sub8_i407
    %tak_ip1_1_i409=%tak_ip1_404
    %tak_ip2_2_i410=%tak_ip2_405
    %slt6_i3_i411 = icmp slt i32 %tak_ip1_1_i409, %tak_ip0_0_i408
    br i1 %slt6_i3_i411, label %if_then_block0_i4_i161, label %if_else_block1_i5_i162

if_then_block0_i4_i161; preds = %if_then_block0_i159
    sub8_i4_i412 = sub i32 %tak_ip0_0_i408, 1
    %funccal11_i5_i413 = call i32 @tak(i32 %sub8_i4_i412, i32 %tak_ip1_1_i409, i32 %tak_ip2_2_i410)
    sub13_i6_i414 = sub i32 %tak_ip1_1_i409, 1
    %funccal16_i7_i415 = call i32 @tak(i32 %sub13_i6_i414, i32 %tak_ip2_2_i410, i32 %tak_ip0_0_i408)
    sub18_i8_i416 = sub i32 %tak_ip2_2_i410, 1
    %funccal21_i9_i417 = call i32 @tak(i32 %sub18_i8_i416, i32 %tak_ip0_0_i408, i32 %tak_ip1_1_i409)
    %funccal22_i10_i418 = call i32 @tak(i32 %funccal11_i5_i413, i32 %funccal16_i7_i415, i32 %funccal21_i9_i417)
    add23_i11_i419 = add i32 1, %funccal22_i10_i418
    %takreturn_value3_i12_i420=%add23_i11_i419
    br label %tak_return_block_i6_i163

if_else_block1_i5_i162; preds = %if_then_block0_i4_i161
    %takreturn_value3_i12_i420=%tak_ip2_2_i410
    br label %tak_return_block_i6_i163

tak_return_block_i6_i163; preds = %if_else_block1_i5_i162
    %funccal11_i421=%takreturn_value3_i12_i420
    sub13_i422 = sub i32 %tak_ip1_404, 1
    %tak_ip0_13_i423=%sub13_i422
    %tak_ip1_14_i424=%tak_ip2_405
    %tak_ip2_15_i425=%tak_ip0_403
    %slt6_i16_i426 = icmp slt i32 %tak_ip1_14_i424, %tak_ip0_13_i423
    br i1 %slt6_i16_i426, label %if_then_block0_i9_i166, label %if_else_block1_i15_i172

if_then_block0_i9_i166; preds = %tak_return_block_i6_i163
    sub8_i17_i427 = sub i32 %tak_ip0_13_i423, 1
    %tak_ip0_0_i18_i428=%sub8_i17_i427
    %tak_ip1_1_i19_i429=%tak_ip1_14_i424
    %tak_ip2_2_i20_i430=%tak_ip2_15_i425
    %slt6_i3_i21_i431 = icmp slt i32 %tak_ip1_1_i19_i429, %tak_ip0_0_i18_i428
    br i1 %slt6_i3_i21_i431, label %if_then_block0_i4_i11_i168, label %if_else_block1_i5_i12_i169

if_then_block0_i4_i11_i168; preds = %if_then_block0_i9_i166
    sub8_i4_i22_i432 = sub i32 %tak_ip0_0_i18_i428, 1
    %funccal11_i5_i23_i433 = call i32 @tak(i32 %sub8_i4_i22_i432, i32 %tak_ip1_1_i19_i429, i32 %tak_ip2_2_i20_i430)
    sub13_i6_i24_i434 = sub i32 %tak_ip1_1_i19_i429, 1
    %funccal16_i7_i25_i435 = call i32 @tak(i32 %sub13_i6_i24_i434, i32 %tak_ip2_2_i20_i430, i32 %tak_ip0_0_i18_i428)
    sub18_i8_i26_i436 = sub i32 %tak_ip2_2_i20_i430, 1
    %funccal21_i9_i27_i437 = call i32 @tak(i32 %sub18_i8_i26_i436, i32 %tak_ip0_0_i18_i428, i32 %tak_ip1_1_i19_i429)
    %funccal22_i10_i28_i438 = call i32 @tak(i32 %funccal11_i5_i23_i433, i32 %funccal16_i7_i25_i435, i32 %funccal21_i9_i27_i437)
    add23_i11_i29_i439 = add i32 1, %funccal22_i10_i28_i438
    %takreturn_value3_i12_i30_i440=%add23_i11_i29_i439
    br label %tak_return_block_i6_i13_i170

if_else_block1_i5_i12_i169; preds = %if_then_block0_i4_i11_i168
    %takreturn_value3_i12_i30_i440=%tak_ip2_2_i20_i430
    br label %tak_return_block_i6_i13_i170

tak_return_block_i6_i13_i170; preds = %if_else_block1_i5_i12_i169
    %funccal11_i31_i441=%takreturn_value3_i12_i30_i440
    sub13_i32_i442 = sub i32 %tak_ip1_14_i424, 1
    %funccal16_i33_i443 = call i32 @tak(i32 %sub13_i32_i442, i32 %tak_ip2_15_i425, i32 %tak_ip0_13_i423)
    sub18_i34_i444 = sub i32 %tak_ip2_15_i425, 1
    %funccal21_i35_i445 = call i32 @tak(i32 %sub18_i34_i444, i32 %tak_ip0_13_i423, i32 %tak_ip1_14_i424)
    %funccal22_i36_i446 = call i32 @tak(i32 %funccal11_i31_i441, i32 %funccal16_i33_i443, i32 %funccal21_i35_i445)
    add23_i37_i447 = add i32 1, %funccal22_i36_i446
    %takreturn_value3_i38_i448=%add23_i37_i447
    br label %tak_return_block_i16_i173

if_else_block1_i15_i172; preds = %tak_return_block_i6_i13_i170
    %takreturn_value3_i38_i448=%tak_ip2_15_i425
    br label %tak_return_block_i16_i173

tak_return_block_i16_i173; preds = %if_else_block1_i15_i172
    %funccal16_i449=%takreturn_value3_i38_i448
    sub18_i450 = sub i32 %tak_ip2_405, 1
    %tak_ip0_39_i451=%sub18_i450
    %tak_ip1_40_i452=%tak_ip0_403
    %tak_ip2_41_i453=%tak_ip1_404
    %slt6_i42_i454 = icmp slt i32 %tak_ip1_40_i452, %tak_ip0_39_i451
    br i1 %slt6_i42_i454, label %if_then_block0_i19_i176, label %if_else_block1_i35_i192

if_then_block0_i19_i176; preds = %tak_return_block_i16_i173
    sub8_i43_i455 = sub i32 %tak_ip0_39_i451, 1
    %tak_ip0_0_i44_i456=%sub8_i43_i455
    %tak_ip1_1_i45_i457=%tak_ip1_40_i452
    %tak_ip2_2_i46_i458=%tak_ip2_41_i453
    %slt6_i3_i47_i459 = icmp slt i32 %tak_ip1_1_i45_i457, %tak_ip0_0_i44_i456
    br i1 %slt6_i3_i47_i459, label %if_then_block0_i4_i21_i178, label %if_else_block1_i5_i22_i179

if_then_block0_i4_i21_i178; preds = %if_then_block0_i19_i176
    sub8_i4_i48_i460 = sub i32 %tak_ip0_0_i44_i456, 1
    %funccal11_i5_i49_i461 = call i32 @tak(i32 %sub8_i4_i48_i460, i32 %tak_ip1_1_i45_i457, i32 %tak_ip2_2_i46_i458)
    sub13_i6_i50_i462 = sub i32 %tak_ip1_1_i45_i457, 1
    %funccal16_i7_i51_i463 = call i32 @tak(i32 %sub13_i6_i50_i462, i32 %tak_ip2_2_i46_i458, i32 %tak_ip0_0_i44_i456)
    sub18_i8_i52_i464 = sub i32 %tak_ip2_2_i46_i458, 1
    %funccal21_i9_i53_i465 = call i32 @tak(i32 %sub18_i8_i52_i464, i32 %tak_ip0_0_i44_i456, i32 %tak_ip1_1_i45_i457)
    %funccal22_i10_i54_i466 = call i32 @tak(i32 %funccal11_i5_i49_i461, i32 %funccal16_i7_i51_i463, i32 %funccal21_i9_i53_i465)
    add23_i11_i55_i467 = add i32 1, %funccal22_i10_i54_i466
    %takreturn_value3_i12_i56_i468=%add23_i11_i55_i467
    br label %tak_return_block_i6_i23_i180

if_else_block1_i5_i22_i179; preds = %if_then_block0_i4_i21_i178
    %takreturn_value3_i12_i56_i468=%tak_ip2_2_i46_i458
    br label %tak_return_block_i6_i23_i180

tak_return_block_i6_i23_i180; preds = %if_else_block1_i5_i22_i179
    %funccal11_i57_i469=%takreturn_value3_i12_i56_i468
    sub13_i58_i470 = sub i32 %tak_ip1_40_i452, 1
    %tak_ip0_13_i59_i471=%sub13_i58_i470
    %tak_ip1_14_i60_i472=%tak_ip2_41_i453
    %tak_ip2_15_i61_i473=%tak_ip0_39_i451
    %slt6_i16_i62_i474 = icmp slt i32 %tak_ip1_14_i60_i472, %tak_ip0_13_i59_i471
    br i1 %slt6_i16_i62_i474, label %if_then_block0_i9_i26_i183, label %if_else_block1_i15_i32_i189

if_then_block0_i9_i26_i183; preds = %tak_return_block_i6_i23_i180
    sub8_i17_i63_i475 = sub i32 %tak_ip0_13_i59_i471, 1
    %tak_ip0_0_i18_i64_i476=%sub8_i17_i63_i475
    %tak_ip1_1_i19_i65_i477=%tak_ip1_14_i60_i472
    %tak_ip2_2_i20_i66_i478=%tak_ip2_15_i61_i473
    %slt6_i3_i21_i67_i479 = icmp slt i32 %tak_ip1_1_i19_i65_i477, %tak_ip0_0_i18_i64_i476
    br i1 %slt6_i3_i21_i67_i479, label %if_then_block0_i4_i11_i28_i185, label %if_else_block1_i5_i12_i29_i186

if_then_block0_i4_i11_i28_i185; preds = %if_then_block0_i9_i26_i183
    sub8_i4_i22_i68_i480 = sub i32 %tak_ip0_0_i18_i64_i476, 1
    %funccal11_i5_i23_i69_i481 = call i32 @tak(i32 %sub8_i4_i22_i68_i480, i32 %tak_ip1_1_i19_i65_i477, i32 %tak_ip2_2_i20_i66_i478)
    sub13_i6_i24_i70_i482 = sub i32 %tak_ip1_1_i19_i65_i477, 1
    %funccal16_i7_i25_i71_i483 = call i32 @tak(i32 %sub13_i6_i24_i70_i482, i32 %tak_ip2_2_i20_i66_i478, i32 %tak_ip0_0_i18_i64_i476)
    sub18_i8_i26_i72_i484 = sub i32 %tak_ip2_2_i20_i66_i478, 1
    %funccal21_i9_i27_i73_i485 = call i32 @tak(i32 %sub18_i8_i26_i72_i484, i32 %tak_ip0_0_i18_i64_i476, i32 %tak_ip1_1_i19_i65_i477)
    %funccal22_i10_i28_i74_i486 = call i32 @tak(i32 %funccal11_i5_i23_i69_i481, i32 %funccal16_i7_i25_i71_i483, i32 %funccal21_i9_i27_i73_i485)
    add23_i11_i29_i75_i487 = add i32 1, %funccal22_i10_i28_i74_i486
    %takreturn_value3_i12_i30_i76_i488=%add23_i11_i29_i75_i487
    br label %tak_return_block_i6_i13_i30_i187

if_else_block1_i5_i12_i29_i186; preds = %if_then_block0_i4_i11_i28_i185
    %takreturn_value3_i12_i30_i76_i488=%tak_ip2_2_i20_i66_i478
    br label %tak_return_block_i6_i13_i30_i187

tak_return_block_i6_i13_i30_i187; preds = %if_else_block1_i5_i12_i29_i186
    %funccal11_i31_i77_i489=%takreturn_value3_i12_i30_i76_i488
    sub13_i32_i78_i490 = sub i32 %tak_ip1_14_i60_i472, 1
    %funccal16_i33_i79_i491 = call i32 @tak(i32 %sub13_i32_i78_i490, i32 %tak_ip2_15_i61_i473, i32 %tak_ip0_13_i59_i471)
    sub18_i34_i80_i492 = sub i32 %tak_ip2_15_i61_i473, 1
    %funccal21_i35_i81_i493 = call i32 @tak(i32 %sub18_i34_i80_i492, i32 %tak_ip0_13_i59_i471, i32 %tak_ip1_14_i60_i472)
    %funccal22_i36_i82_i494 = call i32 @tak(i32 %funccal11_i31_i77_i489, i32 %funccal16_i33_i79_i491, i32 %funccal21_i35_i81_i493)
    add23_i37_i83_i495 = add i32 1, %funccal22_i36_i82_i494
    %takreturn_value3_i38_i84_i496=%add23_i37_i83_i495
    br label %tak_return_block_i16_i33_i190

if_else_block1_i15_i32_i189; preds = %tak_return_block_i6_i13_i30_i187
    %takreturn_value3_i38_i84_i496=%tak_ip2_15_i61_i473
    br label %tak_return_block_i16_i33_i190

tak_return_block_i16_i33_i190; preds = %if_else_block1_i15_i32_i189
    %funccal16_i85_i497=%takreturn_value3_i38_i84_i496
    sub18_i86_i498 = sub i32 %tak_ip2_41_i453, 1
    %funccal21_i87_i499 = call i32 @tak(i32 %sub18_i86_i498, i32 %tak_ip0_39_i451, i32 %tak_ip1_40_i452)
    %funccal22_i88_i500 = call i32 @tak(i32 %funccal11_i57_i469, i32 %funccal16_i85_i497, i32 %funccal21_i87_i499)
    add23_i89_i501 = add i32 1, %funccal22_i88_i500
    %takreturn_value3_i90_i502=%add23_i89_i501
    br label %tak_return_block_i36_i193

if_else_block1_i35_i192; preds = %tak_return_block_i16_i33_i190
    %takreturn_value3_i90_i502=%tak_ip2_41_i453
    br label %tak_return_block_i36_i193

tak_return_block_i36_i193; preds = %if_else_block1_i35_i192
    %funccal21_i503=%takreturn_value3_i90_i502
    %tak_ip0_91_i504=%funccal11_i421
    %tak_ip1_92_i505=%funccal16_i449
    %tak_ip2_93_i506=%funccal21_i503
    %slt6_i94_i507 = icmp slt i32 %tak_ip1_92_i505, %tak_ip0_91_i504
    br i1 %slt6_i94_i507, label %if_then_block0_i39_i196, label %if_else_block1_i75_i232

if_then_block0_i39_i196; preds = %tak_return_block_i36_i193
    sub8_i95_i508 = sub i32 %tak_ip0_91_i504, 1
    %tak_ip0_0_i96_i509=%sub8_i95_i508
    %tak_ip1_1_i97_i510=%tak_ip1_92_i505
    %tak_ip2_2_i98_i511=%tak_ip2_93_i506
    %slt6_i3_i99_i512 = icmp slt i32 %tak_ip1_1_i97_i510, %tak_ip0_0_i96_i509
    br i1 %slt6_i3_i99_i512, label %if_then_block0_i4_i41_i198, label %if_else_block1_i5_i42_i199

if_then_block0_i4_i41_i198; preds = %if_then_block0_i39_i196
    sub8_i4_i100_i513 = sub i32 %tak_ip0_0_i96_i509, 1
    %funccal11_i5_i101_i514 = call i32 @tak(i32 %sub8_i4_i100_i513, i32 %tak_ip1_1_i97_i510, i32 %tak_ip2_2_i98_i511)
    sub13_i6_i102_i515 = sub i32 %tak_ip1_1_i97_i510, 1
    %funccal16_i7_i103_i516 = call i32 @tak(i32 %sub13_i6_i102_i515, i32 %tak_ip2_2_i98_i511, i32 %tak_ip0_0_i96_i509)
    sub18_i8_i104_i517 = sub i32 %tak_ip2_2_i98_i511, 1
    %funccal21_i9_i105_i518 = call i32 @tak(i32 %sub18_i8_i104_i517, i32 %tak_ip0_0_i96_i509, i32 %tak_ip1_1_i97_i510)
    %funccal22_i10_i106_i519 = call i32 @tak(i32 %funccal11_i5_i101_i514, i32 %funccal16_i7_i103_i516, i32 %funccal21_i9_i105_i518)
    add23_i11_i107_i520 = add i32 1, %funccal22_i10_i106_i519
    %takreturn_value3_i12_i108_i521=%add23_i11_i107_i520
    br label %tak_return_block_i6_i43_i200

if_else_block1_i5_i42_i199; preds = %if_then_block0_i4_i41_i198
    %takreturn_value3_i12_i108_i521=%tak_ip2_2_i98_i511
    br label %tak_return_block_i6_i43_i200

tak_return_block_i6_i43_i200; preds = %if_else_block1_i5_i42_i199
    %funccal11_i109_i522=%takreturn_value3_i12_i108_i521
    sub13_i110_i523 = sub i32 %tak_ip1_92_i505, 1
    %tak_ip0_13_i111_i524=%sub13_i110_i523
    %tak_ip1_14_i112_i525=%tak_ip2_93_i506
    %tak_ip2_15_i113_i526=%tak_ip0_91_i504
    %slt6_i16_i114_i527 = icmp slt i32 %tak_ip1_14_i112_i525, %tak_ip0_13_i111_i524
    br i1 %slt6_i16_i114_i527, label %if_then_block0_i9_i46_i203, label %if_else_block1_i15_i52_i209

if_then_block0_i9_i46_i203; preds = %tak_return_block_i6_i43_i200
    sub8_i17_i115_i528 = sub i32 %tak_ip0_13_i111_i524, 1
    %tak_ip0_0_i18_i116_i529=%sub8_i17_i115_i528
    %tak_ip1_1_i19_i117_i530=%tak_ip1_14_i112_i525
    %tak_ip2_2_i20_i118_i531=%tak_ip2_15_i113_i526
    %slt6_i3_i21_i119_i532 = icmp slt i32 %tak_ip1_1_i19_i117_i530, %tak_ip0_0_i18_i116_i529
    br i1 %slt6_i3_i21_i119_i532, label %if_then_block0_i4_i11_i48_i205, label %if_else_block1_i5_i12_i49_i206

if_then_block0_i4_i11_i48_i205; preds = %if_then_block0_i9_i46_i203
    sub8_i4_i22_i120_i533 = sub i32 %tak_ip0_0_i18_i116_i529, 1
    %funccal11_i5_i23_i121_i534 = call i32 @tak(i32 %sub8_i4_i22_i120_i533, i32 %tak_ip1_1_i19_i117_i530, i32 %tak_ip2_2_i20_i118_i531)
    sub13_i6_i24_i122_i535 = sub i32 %tak_ip1_1_i19_i117_i530, 1
    %funccal16_i7_i25_i123_i536 = call i32 @tak(i32 %sub13_i6_i24_i122_i535, i32 %tak_ip2_2_i20_i118_i531, i32 %tak_ip0_0_i18_i116_i529)
    sub18_i8_i26_i124_i537 = sub i32 %tak_ip2_2_i20_i118_i531, 1
    %funccal21_i9_i27_i125_i538 = call i32 @tak(i32 %sub18_i8_i26_i124_i537, i32 %tak_ip0_0_i18_i116_i529, i32 %tak_ip1_1_i19_i117_i530)
    %funccal22_i10_i28_i126_i539 = call i32 @tak(i32 %funccal11_i5_i23_i121_i534, i32 %funccal16_i7_i25_i123_i536, i32 %funccal21_i9_i27_i125_i538)
    add23_i11_i29_i127_i540 = add i32 1, %funccal22_i10_i28_i126_i539
    %takreturn_value3_i12_i30_i128_i541=%add23_i11_i29_i127_i540
    br label %tak_return_block_i6_i13_i50_i207

if_else_block1_i5_i12_i49_i206; preds = %if_then_block0_i4_i11_i48_i205
    %takreturn_value3_i12_i30_i128_i541=%tak_ip2_2_i20_i118_i531
    br label %tak_return_block_i6_i13_i50_i207

tak_return_block_i6_i13_i50_i207; preds = %if_else_block1_i5_i12_i49_i206
    %funccal11_i31_i129_i542=%takreturn_value3_i12_i30_i128_i541
    sub13_i32_i130_i543 = sub i32 %tak_ip1_14_i112_i525, 1
    %funccal16_i33_i131_i544 = call i32 @tak(i32 %sub13_i32_i130_i543, i32 %tak_ip2_15_i113_i526, i32 %tak_ip0_13_i111_i524)
    sub18_i34_i132_i545 = sub i32 %tak_ip2_15_i113_i526, 1
    %funccal21_i35_i133_i546 = call i32 @tak(i32 %sub18_i34_i132_i545, i32 %tak_ip0_13_i111_i524, i32 %tak_ip1_14_i112_i525)
    %funccal22_i36_i134_i547 = call i32 @tak(i32 %funccal11_i31_i129_i542, i32 %funccal16_i33_i131_i544, i32 %funccal21_i35_i133_i546)
    add23_i37_i135_i548 = add i32 1, %funccal22_i36_i134_i547
    %takreturn_value3_i38_i136_i549=%add23_i37_i135_i548
    br label %tak_return_block_i16_i53_i210

if_else_block1_i15_i52_i209; preds = %tak_return_block_i6_i13_i50_i207
    %takreturn_value3_i38_i136_i549=%tak_ip2_15_i113_i526
    br label %tak_return_block_i16_i53_i210

tak_return_block_i16_i53_i210; preds = %if_else_block1_i15_i52_i209
    %funccal16_i137_i550=%takreturn_value3_i38_i136_i549
    sub18_i138_i551 = sub i32 %tak_ip2_93_i506, 1
    %tak_ip0_39_i139_i552=%sub18_i138_i551
    %tak_ip1_40_i140_i553=%tak_ip0_91_i504
    %tak_ip2_41_i141_i554=%tak_ip1_92_i505
    %slt6_i42_i142_i555 = icmp slt i32 %tak_ip1_40_i140_i553, %tak_ip0_39_i139_i552
    br i1 %slt6_i42_i142_i555, label %if_then_block0_i19_i56_i213, label %if_else_block1_i35_i72_i229

if_then_block0_i19_i56_i213; preds = %tak_return_block_i16_i53_i210
    sub8_i43_i143_i556 = sub i32 %tak_ip0_39_i139_i552, 1
    %tak_ip0_0_i44_i144_i557=%sub8_i43_i143_i556
    %tak_ip1_1_i45_i145_i558=%tak_ip1_40_i140_i553
    %tak_ip2_2_i46_i146_i559=%tak_ip2_41_i141_i554
    %slt6_i3_i47_i147_i560 = icmp slt i32 %tak_ip1_1_i45_i145_i558, %tak_ip0_0_i44_i144_i557
    br i1 %slt6_i3_i47_i147_i560, label %if_then_block0_i4_i21_i58_i215, label %if_else_block1_i5_i22_i59_i216

if_then_block0_i4_i21_i58_i215; preds = %if_then_block0_i19_i56_i213
    sub8_i4_i48_i148_i561 = sub i32 %tak_ip0_0_i44_i144_i557, 1
    %funccal11_i5_i49_i149_i562 = call i32 @tak(i32 %sub8_i4_i48_i148_i561, i32 %tak_ip1_1_i45_i145_i558, i32 %tak_ip2_2_i46_i146_i559)
    sub13_i6_i50_i150_i563 = sub i32 %tak_ip1_1_i45_i145_i558, 1
    %funccal16_i7_i51_i151_i564 = call i32 @tak(i32 %sub13_i6_i50_i150_i563, i32 %tak_ip2_2_i46_i146_i559, i32 %tak_ip0_0_i44_i144_i557)
    sub18_i8_i52_i152_i565 = sub i32 %tak_ip2_2_i46_i146_i559, 1
    %funccal21_i9_i53_i153_i566 = call i32 @tak(i32 %sub18_i8_i52_i152_i565, i32 %tak_ip0_0_i44_i144_i557, i32 %tak_ip1_1_i45_i145_i558)
    %funccal22_i10_i54_i154_i567 = call i32 @tak(i32 %funccal11_i5_i49_i149_i562, i32 %funccal16_i7_i51_i151_i564, i32 %funccal21_i9_i53_i153_i566)
    add23_i11_i55_i155_i568 = add i32 1, %funccal22_i10_i54_i154_i567
    %takreturn_value3_i12_i56_i156_i569=%add23_i11_i55_i155_i568
    br label %tak_return_block_i6_i23_i60_i217

if_else_block1_i5_i22_i59_i216; preds = %if_then_block0_i4_i21_i58_i215
    %takreturn_value3_i12_i56_i156_i569=%tak_ip2_2_i46_i146_i559
    br label %tak_return_block_i6_i23_i60_i217

tak_return_block_i6_i23_i60_i217; preds = %if_else_block1_i5_i22_i59_i216
    %funccal11_i57_i157_i570=%takreturn_value3_i12_i56_i156_i569
    sub13_i58_i158_i571 = sub i32 %tak_ip1_40_i140_i553, 1
    %tak_ip0_13_i59_i159_i572=%sub13_i58_i158_i571
    %tak_ip1_14_i60_i160_i573=%tak_ip2_41_i141_i554
    %tak_ip2_15_i61_i161_i574=%tak_ip0_39_i139_i552
    %slt6_i16_i62_i162_i575 = icmp slt i32 %tak_ip1_14_i60_i160_i573, %tak_ip0_13_i59_i159_i572
    br i1 %slt6_i16_i62_i162_i575, label %if_then_block0_i9_i26_i63_i220, label %if_else_block1_i15_i32_i69_i226

if_then_block0_i9_i26_i63_i220; preds = %tak_return_block_i6_i23_i60_i217
    sub8_i17_i63_i163_i576 = sub i32 %tak_ip0_13_i59_i159_i572, 1
    %tak_ip0_0_i18_i64_i164_i577=%sub8_i17_i63_i163_i576
    %tak_ip1_1_i19_i65_i165_i578=%tak_ip1_14_i60_i160_i573
    %tak_ip2_2_i20_i66_i166_i579=%tak_ip2_15_i61_i161_i574
    %slt6_i3_i21_i67_i167_i580 = icmp slt i32 %tak_ip1_1_i19_i65_i165_i578, %tak_ip0_0_i18_i64_i164_i577
    br i1 %slt6_i3_i21_i67_i167_i580, label %if_then_block0_i4_i11_i28_i65_i222, label %if_else_block1_i5_i12_i29_i66_i223

if_then_block0_i4_i11_i28_i65_i222; preds = %if_then_block0_i9_i26_i63_i220
    sub8_i4_i22_i68_i168_i581 = sub i32 %tak_ip0_0_i18_i64_i164_i577, 1
    %funccal11_i5_i23_i69_i169_i582 = call i32 @tak(i32 %sub8_i4_i22_i68_i168_i581, i32 %tak_ip1_1_i19_i65_i165_i578, i32 %tak_ip2_2_i20_i66_i166_i579)
    sub13_i6_i24_i70_i170_i583 = sub i32 %tak_ip1_1_i19_i65_i165_i578, 1
    %funccal16_i7_i25_i71_i171_i584 = call i32 @tak(i32 %sub13_i6_i24_i70_i170_i583, i32 %tak_ip2_2_i20_i66_i166_i579, i32 %tak_ip0_0_i18_i64_i164_i577)
    sub18_i8_i26_i72_i172_i585 = sub i32 %tak_ip2_2_i20_i66_i166_i579, 1
    %funccal21_i9_i27_i73_i173_i586 = call i32 @tak(i32 %sub18_i8_i26_i72_i172_i585, i32 %tak_ip0_0_i18_i64_i164_i577, i32 %tak_ip1_1_i19_i65_i165_i578)
    %funccal22_i10_i28_i74_i174_i587 = call i32 @tak(i32 %funccal11_i5_i23_i69_i169_i582, i32 %funccal16_i7_i25_i71_i171_i584, i32 %funccal21_i9_i27_i73_i173_i586)
    add23_i11_i29_i75_i175_i588 = add i32 1, %funccal22_i10_i28_i74_i174_i587
    %takreturn_value3_i12_i30_i76_i176_i589=%add23_i11_i29_i75_i175_i588
    br label %tak_return_block_i6_i13_i30_i67_i224

if_else_block1_i5_i12_i29_i66_i223; preds = %if_then_block0_i4_i11_i28_i65_i222
    %takreturn_value3_i12_i30_i76_i176_i589=%tak_ip2_2_i20_i66_i166_i579
    br label %tak_return_block_i6_i13_i30_i67_i224

tak_return_block_i6_i13_i30_i67_i224; preds = %if_else_block1_i5_i12_i29_i66_i223
    %funccal11_i31_i77_i177_i590=%takreturn_value3_i12_i30_i76_i176_i589
    sub13_i32_i78_i178_i591 = sub i32 %tak_ip1_14_i60_i160_i573, 1
    %funccal16_i33_i79_i179_i592 = call i32 @tak(i32 %sub13_i32_i78_i178_i591, i32 %tak_ip2_15_i61_i161_i574, i32 %tak_ip0_13_i59_i159_i572)
    sub18_i34_i80_i180_i593 = sub i32 %tak_ip2_15_i61_i161_i574, 1
    %funccal21_i35_i81_i181_i594 = call i32 @tak(i32 %sub18_i34_i80_i180_i593, i32 %tak_ip0_13_i59_i159_i572, i32 %tak_ip1_14_i60_i160_i573)
    %funccal22_i36_i82_i182_i595 = call i32 @tak(i32 %funccal11_i31_i77_i177_i590, i32 %funccal16_i33_i79_i179_i592, i32 %funccal21_i35_i81_i181_i594)
    add23_i37_i83_i183_i596 = add i32 1, %funccal22_i36_i82_i182_i595
    %takreturn_value3_i38_i84_i184_i597=%add23_i37_i83_i183_i596
    br label %tak_return_block_i16_i33_i70_i227

if_else_block1_i15_i32_i69_i226; preds = %tak_return_block_i6_i13_i30_i67_i224
    %takreturn_value3_i38_i84_i184_i597=%tak_ip2_15_i61_i161_i574
    br label %tak_return_block_i16_i33_i70_i227

tak_return_block_i16_i33_i70_i227; preds = %if_else_block1_i15_i32_i69_i226
    %funccal16_i85_i185_i598=%takreturn_value3_i38_i84_i184_i597
    sub18_i86_i186_i599 = sub i32 %tak_ip2_41_i141_i554, 1
    %funccal21_i87_i187_i600 = call i32 @tak(i32 %sub18_i86_i186_i599, i32 %tak_ip0_39_i139_i552, i32 %tak_ip1_40_i140_i553)
    %funccal22_i88_i188_i601 = call i32 @tak(i32 %funccal11_i57_i157_i570, i32 %funccal16_i85_i185_i598, i32 %funccal21_i87_i187_i600)
    add23_i89_i189_i602 = add i32 1, %funccal22_i88_i188_i601
    %takreturn_value3_i90_i190_i603=%add23_i89_i189_i602
    br label %tak_return_block_i36_i73_i230

if_else_block1_i35_i72_i229; preds = %tak_return_block_i16_i33_i70_i227
    %takreturn_value3_i90_i190_i603=%tak_ip2_41_i141_i554
    br label %tak_return_block_i36_i73_i230

tak_return_block_i36_i73_i230; preds = %if_else_block1_i35_i72_i229
    %funccal21_i191_i604=%takreturn_value3_i90_i190_i603
    %funccal22_i192_i605 = call i32 @tak(i32 %funccal11_i109_i522, i32 %funccal16_i137_i550, i32 %funccal21_i191_i604)
    add23_i193_i606 = add i32 1, %funccal22_i192_i605
    %takreturn_value3_i194_i607=%add23_i193_i606
    br label %tak_return_block_i76_i233

if_else_block1_i75_i232; preds = %tak_return_block_i36_i73_i230
    %takreturn_value3_i194_i607=%tak_ip2_93_i506
    br label %tak_return_block_i76_i233

tak_return_block_i76_i233; preds = %if_else_block1_i75_i232
    %funccal22_i608=%takreturn_value3_i194_i607
    add23_i609 = add i32 1, %funccal22_i608
    %takreturn_value3_i610=%add23_i609
    br label %tak_return_block_i236

if_else_block1_i235; preds = %tak_return_block_i76_i233
    %takreturn_value3_i610=%tak_ip2_405
    br label %tak_return_block_i236

tak_return_block_i236; preds = %if_else_block1_i235
    %funccal11_i5=%takreturn_value3_i610
    sub13_i6 = sub i32 %tak_ip1_1, 1
    %funccal16_i7 = call i32 @tak(i32 %sub13_i6, i32 %tak_ip2_2, i32 %tak_ip0_0)
    sub18_i8 = sub i32 %tak_ip2_2, 1
    %funccal21_i9 = call i32 @tak(i32 %sub18_i8, i32 %tak_ip0_0, i32 %tak_ip1_1)
    %funccal22_i10 = call i32 @tak(i32 %funccal11_i5, i32 %funccal16_i7, i32 %funccal21_i9)
    add23_i11 = add i32 1, %funccal22_i10
    %takreturn_value3_i12=%add23_i11
    br label %tak_return_block_i6

if_else_block1_i5; preds = %tak_return_block_i236
    %takreturn_value3_i12=%tak_ip2_2
    br label %tak_return_block_i6

tak_return_block_i6; preds = %if_else_block1_i5
    %funccal11=%takreturn_value3_i12
    sub13 = sub i32 %y, 1
    %tak_ip0_13=%sub13
    %tak_ip1_14=%z
    %tak_ip2_15=%x
    %slt6_i16 = icmp slt i32 %tak_ip1_14, %tak_ip0_13
    br i1 %slt6_i16, label %if_then_block0_i9, label %if_else_block1_i15

if_then_block0_i9; preds = %tak_return_block_i6
    sub8_i17 = sub i32 %tak_ip0_13, 1
    %tak_ip0_0_i18=%sub8_i17
    %tak_ip1_1_i19=%tak_ip1_14
    %tak_ip2_2_i20=%tak_ip2_15
    %slt6_i3_i21 = icmp slt i32 %tak_ip1_1_i19, %tak_ip0_0_i18
    br i1 %slt6_i3_i21, label %if_then_block0_i4_i11, label %if_else_block1_i5_i12

if_then_block0_i4_i11; preds = %if_then_block0_i9
    sub8_i4_i22 = sub i32 %tak_ip0_0_i18, 1
    %funccal11_i5_i23 = call i32 @tak(i32 %sub8_i4_i22, i32 %tak_ip1_1_i19, i32 %tak_ip2_2_i20)
    sub13_i6_i24 = sub i32 %tak_ip1_1_i19, 1
    %funccal16_i7_i25 = call i32 @tak(i32 %sub13_i6_i24, i32 %tak_ip2_2_i20, i32 %tak_ip0_0_i18)
    sub18_i8_i26 = sub i32 %tak_ip2_2_i20, 1
    %funccal21_i9_i27 = call i32 @tak(i32 %sub18_i8_i26, i32 %tak_ip0_0_i18, i32 %tak_ip1_1_i19)
    %funccal22_i10_i28 = call i32 @tak(i32 %funccal11_i5_i23, i32 %funccal16_i7_i25, i32 %funccal21_i9_i27)
    add23_i11_i29 = add i32 1, %funccal22_i10_i28
    %takreturn_value3_i12_i30=%add23_i11_i29
    br label %tak_return_block_i6_i13

if_else_block1_i5_i12; preds = %if_then_block0_i4_i11
    %takreturn_value3_i12_i30=%tak_ip2_2_i20
    br label %tak_return_block_i6_i13

tak_return_block_i6_i13; preds = %if_else_block1_i5_i12
    %funccal11_i31=%takreturn_value3_i12_i30
    sub13_i32 = sub i32 %tak_ip1_14, 1
    %funccal16_i33 = call i32 @tak(i32 %sub13_i32, i32 %tak_ip2_15, i32 %tak_ip0_13)
    sub18_i34 = sub i32 %tak_ip2_15, 1
    %funccal21_i35 = call i32 @tak(i32 %sub18_i34, i32 %tak_ip0_13, i32 %tak_ip1_14)
    %funccal22_i36 = call i32 @tak(i32 %funccal11_i31, i32 %funccal16_i33, i32 %funccal21_i35)
    add23_i37 = add i32 1, %funccal22_i36
    %takreturn_value3_i38=%add23_i37
    br label %tak_return_block_i16

if_else_block1_i15; preds = %tak_return_block_i6_i13
    %takreturn_value3_i38=%tak_ip2_15
    br label %tak_return_block_i16

tak_return_block_i16; preds = %if_else_block1_i15
    %funccal16=%takreturn_value3_i38
    sub18 = sub i32 %z, 1
    %tak_ip0_39=%sub18
    %tak_ip1_40=%x
    %tak_ip2_41=%y
    %slt6_i42 = icmp slt i32 %tak_ip1_40, %tak_ip0_39
    br i1 %slt6_i42, label %if_then_block0_i19, label %if_else_block1_i35

if_then_block0_i19; preds = %tak_return_block_i16
    sub8_i43 = sub i32 %tak_ip0_39, 1
    %tak_ip0_0_i44=%sub8_i43
    %tak_ip1_1_i45=%tak_ip1_40
    %tak_ip2_2_i46=%tak_ip2_41
    %slt6_i3_i47 = icmp slt i32 %tak_ip1_1_i45, %tak_ip0_0_i44
    br i1 %slt6_i3_i47, label %if_then_block0_i4_i21, label %if_else_block1_i5_i22

if_then_block0_i4_i21; preds = %if_then_block0_i19
    sub8_i4_i48 = sub i32 %tak_ip0_0_i44, 1
    %funccal11_i5_i49 = call i32 @tak(i32 %sub8_i4_i48, i32 %tak_ip1_1_i45, i32 %tak_ip2_2_i46)
    sub13_i6_i50 = sub i32 %tak_ip1_1_i45, 1
    %funccal16_i7_i51 = call i32 @tak(i32 %sub13_i6_i50, i32 %tak_ip2_2_i46, i32 %tak_ip0_0_i44)
    sub18_i8_i52 = sub i32 %tak_ip2_2_i46, 1
    %funccal21_i9_i53 = call i32 @tak(i32 %sub18_i8_i52, i32 %tak_ip0_0_i44, i32 %tak_ip1_1_i45)
    %funccal22_i10_i54 = call i32 @tak(i32 %funccal11_i5_i49, i32 %funccal16_i7_i51, i32 %funccal21_i9_i53)
    add23_i11_i55 = add i32 1, %funccal22_i10_i54
    %takreturn_value3_i12_i56=%add23_i11_i55
    br label %tak_return_block_i6_i23

if_else_block1_i5_i22; preds = %if_then_block0_i4_i21
    %takreturn_value3_i12_i56=%tak_ip2_2_i46
    br label %tak_return_block_i6_i23

tak_return_block_i6_i23; preds = %if_else_block1_i5_i22
    %funccal11_i57=%takreturn_value3_i12_i56
    sub13_i58 = sub i32 %tak_ip1_40, 1
    %tak_ip0_13_i59=%sub13_i58
    %tak_ip1_14_i60=%tak_ip2_41
    %tak_ip2_15_i61=%tak_ip0_39
    %slt6_i16_i62 = icmp slt i32 %tak_ip1_14_i60, %tak_ip0_13_i59
    br i1 %slt6_i16_i62, label %if_then_block0_i9_i26, label %if_else_block1_i15_i32

if_then_block0_i9_i26; preds = %tak_return_block_i6_i23
    sub8_i17_i63 = sub i32 %tak_ip0_13_i59, 1
    %tak_ip0_0_i18_i64=%sub8_i17_i63
    %tak_ip1_1_i19_i65=%tak_ip1_14_i60
    %tak_ip2_2_i20_i66=%tak_ip2_15_i61
    %slt6_i3_i21_i67 = icmp slt i32 %tak_ip1_1_i19_i65, %tak_ip0_0_i18_i64
    br i1 %slt6_i3_i21_i67, label %if_then_block0_i4_i11_i28, label %if_else_block1_i5_i12_i29

if_then_block0_i4_i11_i28; preds = %if_then_block0_i9_i26
    sub8_i4_i22_i68 = sub i32 %tak_ip0_0_i18_i64, 1
    %funccal11_i5_i23_i69 = call i32 @tak(i32 %sub8_i4_i22_i68, i32 %tak_ip1_1_i19_i65, i32 %tak_ip2_2_i20_i66)
    sub13_i6_i24_i70 = sub i32 %tak_ip1_1_i19_i65, 1
    %funccal16_i7_i25_i71 = call i32 @tak(i32 %sub13_i6_i24_i70, i32 %tak_ip2_2_i20_i66, i32 %tak_ip0_0_i18_i64)
    sub18_i8_i26_i72 = sub i32 %tak_ip2_2_i20_i66, 1
    %funccal21_i9_i27_i73 = call i32 @tak(i32 %sub18_i8_i26_i72, i32 %tak_ip0_0_i18_i64, i32 %tak_ip1_1_i19_i65)
    %funccal22_i10_i28_i74 = call i32 @tak(i32 %funccal11_i5_i23_i69, i32 %funccal16_i7_i25_i71, i32 %funccal21_i9_i27_i73)
    add23_i11_i29_i75 = add i32 1, %funccal22_i10_i28_i74
    %takreturn_value3_i12_i30_i76=%add23_i11_i29_i75
    br label %tak_return_block_i6_i13_i30

if_else_block1_i5_i12_i29; preds = %if_then_block0_i4_i11_i28
    %takreturn_value3_i12_i30_i76=%tak_ip2_2_i20_i66
    br label %tak_return_block_i6_i13_i30

tak_return_block_i6_i13_i30; preds = %if_else_block1_i5_i12_i29
    %funccal11_i31_i77=%takreturn_value3_i12_i30_i76
    sub13_i32_i78 = sub i32 %tak_ip1_14_i60, 1
    %funccal16_i33_i79 = call i32 @tak(i32 %sub13_i32_i78, i32 %tak_ip2_15_i61, i32 %tak_ip0_13_i59)
    sub18_i34_i80 = sub i32 %tak_ip2_15_i61, 1
    %funccal21_i35_i81 = call i32 @tak(i32 %sub18_i34_i80, i32 %tak_ip0_13_i59, i32 %tak_ip1_14_i60)
    %funccal22_i36_i82 = call i32 @tak(i32 %funccal11_i31_i77, i32 %funccal16_i33_i79, i32 %funccal21_i35_i81)
    add23_i37_i83 = add i32 1, %funccal22_i36_i82
    %takreturn_value3_i38_i84=%add23_i37_i83
    br label %tak_return_block_i16_i33

if_else_block1_i15_i32; preds = %tak_return_block_i6_i13_i30
    %takreturn_value3_i38_i84=%tak_ip2_15_i61
    br label %tak_return_block_i16_i33

tak_return_block_i16_i33; preds = %if_else_block1_i15_i32
    %funccal16_i85=%takreturn_value3_i38_i84
    sub18_i86 = sub i32 %tak_ip2_41, 1
    %funccal21_i87 = call i32 @tak(i32 %sub18_i86, i32 %tak_ip0_39, i32 %tak_ip1_40)
    %funccal22_i88 = call i32 @tak(i32 %funccal11_i57, i32 %funccal16_i85, i32 %funccal21_i87)
    add23_i89 = add i32 1, %funccal22_i88
    %takreturn_value3_i90=%add23_i89
    br label %tak_return_block_i36

if_else_block1_i35; preds = %tak_return_block_i16_i33
    %takreturn_value3_i90=%tak_ip2_41
    br label %tak_return_block_i36

tak_return_block_i36; preds = %if_else_block1_i35
    %funccal21=%takreturn_value3_i90
    %tak_ip0_91=%funccal11
    %tak_ip1_92=%funccal16
    %tak_ip2_93=%funccal21
    %slt6_i94 = icmp slt i32 %tak_ip1_92, %tak_ip0_91
    br i1 %slt6_i94, label %if_then_block0_i39, label %if_else_block1_i75

if_then_block0_i39; preds = %tak_return_block_i36
    sub8_i95 = sub i32 %tak_ip0_91, 1
    %tak_ip0_0_i96=%sub8_i95
    %tak_ip1_1_i97=%tak_ip1_92
    %tak_ip2_2_i98=%tak_ip2_93
    %slt6_i3_i99 = icmp slt i32 %tak_ip1_1_i97, %tak_ip0_0_i96
    br i1 %slt6_i3_i99, label %if_then_block0_i4_i41, label %if_else_block1_i5_i42

if_then_block0_i4_i41; preds = %if_then_block0_i39
    sub8_i4_i100 = sub i32 %tak_ip0_0_i96, 1
    %funccal11_i5_i101 = call i32 @tak(i32 %sub8_i4_i100, i32 %tak_ip1_1_i97, i32 %tak_ip2_2_i98)
    sub13_i6_i102 = sub i32 %tak_ip1_1_i97, 1
    %funccal16_i7_i103 = call i32 @tak(i32 %sub13_i6_i102, i32 %tak_ip2_2_i98, i32 %tak_ip0_0_i96)
    sub18_i8_i104 = sub i32 %tak_ip2_2_i98, 1
    %funccal21_i9_i105 = call i32 @tak(i32 %sub18_i8_i104, i32 %tak_ip0_0_i96, i32 %tak_ip1_1_i97)
    %funccal22_i10_i106 = call i32 @tak(i32 %funccal11_i5_i101, i32 %funccal16_i7_i103, i32 %funccal21_i9_i105)
    add23_i11_i107 = add i32 1, %funccal22_i10_i106
    %takreturn_value3_i12_i108=%add23_i11_i107
    br label %tak_return_block_i6_i43

if_else_block1_i5_i42; preds = %if_then_block0_i4_i41
    %takreturn_value3_i12_i108=%tak_ip2_2_i98
    br label %tak_return_block_i6_i43

tak_return_block_i6_i43; preds = %if_else_block1_i5_i42
    %funccal11_i109=%takreturn_value3_i12_i108
    sub13_i110 = sub i32 %tak_ip1_92, 1
    %tak_ip0_13_i111=%sub13_i110
    %tak_ip1_14_i112=%tak_ip2_93
    %tak_ip2_15_i113=%tak_ip0_91
    %slt6_i16_i114 = icmp slt i32 %tak_ip1_14_i112, %tak_ip0_13_i111
    br i1 %slt6_i16_i114, label %if_then_block0_i9_i46, label %if_else_block1_i15_i52

if_then_block0_i9_i46; preds = %tak_return_block_i6_i43
    sub8_i17_i115 = sub i32 %tak_ip0_13_i111, 1
    %tak_ip0_0_i18_i116=%sub8_i17_i115
    %tak_ip1_1_i19_i117=%tak_ip1_14_i112
    %tak_ip2_2_i20_i118=%tak_ip2_15_i113
    %slt6_i3_i21_i119 = icmp slt i32 %tak_ip1_1_i19_i117, %tak_ip0_0_i18_i116
    br i1 %slt6_i3_i21_i119, label %if_then_block0_i4_i11_i48, label %if_else_block1_i5_i12_i49

if_then_block0_i4_i11_i48; preds = %if_then_block0_i9_i46
    sub8_i4_i22_i120 = sub i32 %tak_ip0_0_i18_i116, 1
    %funccal11_i5_i23_i121 = call i32 @tak(i32 %sub8_i4_i22_i120, i32 %tak_ip1_1_i19_i117, i32 %tak_ip2_2_i20_i118)
    sub13_i6_i24_i122 = sub i32 %tak_ip1_1_i19_i117, 1
    %funccal16_i7_i25_i123 = call i32 @tak(i32 %sub13_i6_i24_i122, i32 %tak_ip2_2_i20_i118, i32 %tak_ip0_0_i18_i116)
    sub18_i8_i26_i124 = sub i32 %tak_ip2_2_i20_i118, 1
    %funccal21_i9_i27_i125 = call i32 @tak(i32 %sub18_i8_i26_i124, i32 %tak_ip0_0_i18_i116, i32 %tak_ip1_1_i19_i117)
    %funccal22_i10_i28_i126 = call i32 @tak(i32 %funccal11_i5_i23_i121, i32 %funccal16_i7_i25_i123, i32 %funccal21_i9_i27_i125)
    add23_i11_i29_i127 = add i32 1, %funccal22_i10_i28_i126
    %takreturn_value3_i12_i30_i128=%add23_i11_i29_i127
    br label %tak_return_block_i6_i13_i50

if_else_block1_i5_i12_i49; preds = %if_then_block0_i4_i11_i48
    %takreturn_value3_i12_i30_i128=%tak_ip2_2_i20_i118
    br label %tak_return_block_i6_i13_i50

tak_return_block_i6_i13_i50; preds = %if_else_block1_i5_i12_i49
    %funccal11_i31_i129=%takreturn_value3_i12_i30_i128
    sub13_i32_i130 = sub i32 %tak_ip1_14_i112, 1
    %funccal16_i33_i131 = call i32 @tak(i32 %sub13_i32_i130, i32 %tak_ip2_15_i113, i32 %tak_ip0_13_i111)
    sub18_i34_i132 = sub i32 %tak_ip2_15_i113, 1
    %funccal21_i35_i133 = call i32 @tak(i32 %sub18_i34_i132, i32 %tak_ip0_13_i111, i32 %tak_ip1_14_i112)
    %funccal22_i36_i134 = call i32 @tak(i32 %funccal11_i31_i129, i32 %funccal16_i33_i131, i32 %funccal21_i35_i133)
    add23_i37_i135 = add i32 1, %funccal22_i36_i134
    %takreturn_value3_i38_i136=%add23_i37_i135
    br label %tak_return_block_i16_i53

if_else_block1_i15_i52; preds = %tak_return_block_i6_i13_i50
    %takreturn_value3_i38_i136=%tak_ip2_15_i113
    br label %tak_return_block_i16_i53

tak_return_block_i16_i53; preds = %if_else_block1_i15_i52
    %funccal16_i137=%takreturn_value3_i38_i136
    sub18_i138 = sub i32 %tak_ip2_93, 1
    %tak_ip0_39_i139=%sub18_i138
    %tak_ip1_40_i140=%tak_ip0_91
    %tak_ip2_41_i141=%tak_ip1_92
    %slt6_i42_i142 = icmp slt i32 %tak_ip1_40_i140, %tak_ip0_39_i139
    br i1 %slt6_i42_i142, label %if_then_block0_i19_i56, label %if_else_block1_i35_i72

if_then_block0_i19_i56; preds = %tak_return_block_i16_i53
    sub8_i43_i143 = sub i32 %tak_ip0_39_i139, 1
    %tak_ip0_0_i44_i144=%sub8_i43_i143
    %tak_ip1_1_i45_i145=%tak_ip1_40_i140
    %tak_ip2_2_i46_i146=%tak_ip2_41_i141
    %slt6_i3_i47_i147 = icmp slt i32 %tak_ip1_1_i45_i145, %tak_ip0_0_i44_i144
    br i1 %slt6_i3_i47_i147, label %if_then_block0_i4_i21_i58, label %if_else_block1_i5_i22_i59

if_then_block0_i4_i21_i58; preds = %if_then_block0_i19_i56
    sub8_i4_i48_i148 = sub i32 %tak_ip0_0_i44_i144, 1
    %funccal11_i5_i49_i149 = call i32 @tak(i32 %sub8_i4_i48_i148, i32 %tak_ip1_1_i45_i145, i32 %tak_ip2_2_i46_i146)
    sub13_i6_i50_i150 = sub i32 %tak_ip1_1_i45_i145, 1
    %funccal16_i7_i51_i151 = call i32 @tak(i32 %sub13_i6_i50_i150, i32 %tak_ip2_2_i46_i146, i32 %tak_ip0_0_i44_i144)
    sub18_i8_i52_i152 = sub i32 %tak_ip2_2_i46_i146, 1
    %funccal21_i9_i53_i153 = call i32 @tak(i32 %sub18_i8_i52_i152, i32 %tak_ip0_0_i44_i144, i32 %tak_ip1_1_i45_i145)
    %funccal22_i10_i54_i154 = call i32 @tak(i32 %funccal11_i5_i49_i149, i32 %funccal16_i7_i51_i151, i32 %funccal21_i9_i53_i153)
    add23_i11_i55_i155 = add i32 1, %funccal22_i10_i54_i154
    %takreturn_value3_i12_i56_i156=%add23_i11_i55_i155
    br label %tak_return_block_i6_i23_i60

if_else_block1_i5_i22_i59; preds = %if_then_block0_i4_i21_i58
    %takreturn_value3_i12_i56_i156=%tak_ip2_2_i46_i146
    br label %tak_return_block_i6_i23_i60

tak_return_block_i6_i23_i60; preds = %if_else_block1_i5_i22_i59
    %funccal11_i57_i157=%takreturn_value3_i12_i56_i156
    sub13_i58_i158 = sub i32 %tak_ip1_40_i140, 1
    %tak_ip0_13_i59_i159=%sub13_i58_i158
    %tak_ip1_14_i60_i160=%tak_ip2_41_i141
    %tak_ip2_15_i61_i161=%tak_ip0_39_i139
    %slt6_i16_i62_i162 = icmp slt i32 %tak_ip1_14_i60_i160, %tak_ip0_13_i59_i159
    br i1 %slt6_i16_i62_i162, label %if_then_block0_i9_i26_i63, label %if_else_block1_i15_i32_i69

if_then_block0_i9_i26_i63; preds = %tak_return_block_i6_i23_i60
    sub8_i17_i63_i163 = sub i32 %tak_ip0_13_i59_i159, 1
    %tak_ip0_0_i18_i64_i164=%sub8_i17_i63_i163
    %tak_ip1_1_i19_i65_i165=%tak_ip1_14_i60_i160
    %tak_ip2_2_i20_i66_i166=%tak_ip2_15_i61_i161
    %slt6_i3_i21_i67_i167 = icmp slt i32 %tak_ip1_1_i19_i65_i165, %tak_ip0_0_i18_i64_i164
    br i1 %slt6_i3_i21_i67_i167, label %if_then_block0_i4_i11_i28_i65, label %if_else_block1_i5_i12_i29_i66

if_then_block0_i4_i11_i28_i65; preds = %if_then_block0_i9_i26_i63
    sub8_i4_i22_i68_i168 = sub i32 %tak_ip0_0_i18_i64_i164, 1
    %funccal11_i5_i23_i69_i169 = call i32 @tak(i32 %sub8_i4_i22_i68_i168, i32 %tak_ip1_1_i19_i65_i165, i32 %tak_ip2_2_i20_i66_i166)
    sub13_i6_i24_i70_i170 = sub i32 %tak_ip1_1_i19_i65_i165, 1
    %funccal16_i7_i25_i71_i171 = call i32 @tak(i32 %sub13_i6_i24_i70_i170, i32 %tak_ip2_2_i20_i66_i166, i32 %tak_ip0_0_i18_i64_i164)
    sub18_i8_i26_i72_i172 = sub i32 %tak_ip2_2_i20_i66_i166, 1
    %funccal21_i9_i27_i73_i173 = call i32 @tak(i32 %sub18_i8_i26_i72_i172, i32 %tak_ip0_0_i18_i64_i164, i32 %tak_ip1_1_i19_i65_i165)
    %funccal22_i10_i28_i74_i174 = call i32 @tak(i32 %funccal11_i5_i23_i69_i169, i32 %funccal16_i7_i25_i71_i171, i32 %funccal21_i9_i27_i73_i173)
    add23_i11_i29_i75_i175 = add i32 1, %funccal22_i10_i28_i74_i174
    %takreturn_value3_i12_i30_i76_i176=%add23_i11_i29_i75_i175
    br label %tak_return_block_i6_i13_i30_i67

if_else_block1_i5_i12_i29_i66; preds = %if_then_block0_i4_i11_i28_i65
    %takreturn_value3_i12_i30_i76_i176=%tak_ip2_2_i20_i66_i166
    br label %tak_return_block_i6_i13_i30_i67

tak_return_block_i6_i13_i30_i67; preds = %if_else_block1_i5_i12_i29_i66
    %funccal11_i31_i77_i177=%takreturn_value3_i12_i30_i76_i176
    sub13_i32_i78_i178 = sub i32 %tak_ip1_14_i60_i160, 1
    %funccal16_i33_i79_i179 = call i32 @tak(i32 %sub13_i32_i78_i178, i32 %tak_ip2_15_i61_i161, i32 %tak_ip0_13_i59_i159)
    sub18_i34_i80_i180 = sub i32 %tak_ip2_15_i61_i161, 1
    %funccal21_i35_i81_i181 = call i32 @tak(i32 %sub18_i34_i80_i180, i32 %tak_ip0_13_i59_i159, i32 %tak_ip1_14_i60_i160)
    %funccal22_i36_i82_i182 = call i32 @tak(i32 %funccal11_i31_i77_i177, i32 %funccal16_i33_i79_i179, i32 %funccal21_i35_i81_i181)
    add23_i37_i83_i183 = add i32 1, %funccal22_i36_i82_i182
    %takreturn_value3_i38_i84_i184=%add23_i37_i83_i183
    br label %tak_return_block_i16_i33_i70

if_else_block1_i15_i32_i69; preds = %tak_return_block_i6_i13_i30_i67
    %takreturn_value3_i38_i84_i184=%tak_ip2_15_i61_i161
    br label %tak_return_block_i16_i33_i70

tak_return_block_i16_i33_i70; preds = %if_else_block1_i15_i32_i69
    %funccal16_i85_i185=%takreturn_value3_i38_i84_i184
    sub18_i86_i186 = sub i32 %tak_ip2_41_i141, 1
    %funccal21_i87_i187 = call i32 @tak(i32 %sub18_i86_i186, i32 %tak_ip0_39_i139, i32 %tak_ip1_40_i140)
    %funccal22_i88_i188 = call i32 @tak(i32 %funccal11_i57_i157, i32 %funccal16_i85_i185, i32 %funccal21_i87_i187)
    add23_i89_i189 = add i32 1, %funccal22_i88_i188
    %takreturn_value3_i90_i190=%add23_i89_i189
    br label %tak_return_block_i36_i73

if_else_block1_i35_i72; preds = %tak_return_block_i16_i33_i70
    %takreturn_value3_i90_i190=%tak_ip2_41_i141
    br label %tak_return_block_i36_i73

tak_return_block_i36_i73; preds = %if_else_block1_i35_i72
    %funccal21_i191=%takreturn_value3_i90_i190
    %funccal22_i192 = call i32 @tak(i32 %funccal11_i109, i32 %funccal16_i137, i32 %funccal21_i191)
    add23_i193 = add i32 1, %funccal22_i192
    %takreturn_value3_i194=%add23_i193
    br label %tak_return_block_i76

if_else_block1_i75; preds = %tak_return_block_i36_i73
    %takreturn_value3_i194=%tak_ip2_93
    br label %tak_return_block_i76

tak_return_block_i76; preds = %if_else_block1_i75
    %funccal22=%takreturn_value3_i194
    add23 = add i32 1, %funccal22
    %takreturn_value3=%add23
    br label %tak_return_block

if_else_block1; preds = %tak_return_block_i76
    %takreturn_value3=%z
    br label %tak_return_block

tak_return_block; preds = %if_else_block1
    ret i32 %takreturn_value3

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    %funccal30 = call i32 @getInt()
    %funccal32 = call i32 @getInt()
    %funccal34 = call i32 @getInt()
    %tak_ip0_195=%funccal30
    %tak_ip1_196=%funccal32
    %tak_ip2_197=%funccal34
    %slt6_i198 = icmp slt i32 %tak_ip1_196, %tak_ip0_195
    br i1 %slt6_i198, label %if_then_block0_i79, label %if_else_block1_i155

if_then_block0_i79; preds = %__init___entrance_block_i0
    sub8_i199 = sub i32 %tak_ip0_195, 1
    %tak_ip0_0_i200=%sub8_i199
    %tak_ip1_1_i201=%tak_ip1_196
    %tak_ip2_2_i202=%tak_ip2_197
    %slt6_i3_i203 = icmp slt i32 %tak_ip1_1_i201, %tak_ip0_0_i200
    br i1 %slt6_i3_i203, label %if_then_block0_i4_i81, label %if_else_block1_i5_i82

if_then_block0_i4_i81; preds = %if_then_block0_i79
    sub8_i4_i204 = sub i32 %tak_ip0_0_i200, 1
    %funccal11_i5_i205 = call i32 @tak(i32 %sub8_i4_i204, i32 %tak_ip1_1_i201, i32 %tak_ip2_2_i202)
    sub13_i6_i206 = sub i32 %tak_ip1_1_i201, 1
    %funccal16_i7_i207 = call i32 @tak(i32 %sub13_i6_i206, i32 %tak_ip2_2_i202, i32 %tak_ip0_0_i200)
    sub18_i8_i208 = sub i32 %tak_ip2_2_i202, 1
    %funccal21_i9_i209 = call i32 @tak(i32 %sub18_i8_i208, i32 %tak_ip0_0_i200, i32 %tak_ip1_1_i201)
    %funccal22_i10_i210 = call i32 @tak(i32 %funccal11_i5_i205, i32 %funccal16_i7_i207, i32 %funccal21_i9_i209)
    add23_i11_i211 = add i32 1, %funccal22_i10_i210
    %takreturn_value3_i12_i212=%add23_i11_i211
    br label %tak_return_block_i6_i83

if_else_block1_i5_i82; preds = %if_then_block0_i4_i81
    %takreturn_value3_i12_i212=%tak_ip2_2_i202
    br label %tak_return_block_i6_i83

tak_return_block_i6_i83; preds = %if_else_block1_i5_i82
    %funccal11_i213=%takreturn_value3_i12_i212
    sub13_i214 = sub i32 %tak_ip1_196, 1
    %tak_ip0_13_i215=%sub13_i214
    %tak_ip1_14_i216=%tak_ip2_197
    %tak_ip2_15_i217=%tak_ip0_195
    %slt6_i16_i218 = icmp slt i32 %tak_ip1_14_i216, %tak_ip0_13_i215
    br i1 %slt6_i16_i218, label %if_then_block0_i9_i86, label %if_else_block1_i15_i92

if_then_block0_i9_i86; preds = %tak_return_block_i6_i83
    sub8_i17_i219 = sub i32 %tak_ip0_13_i215, 1
    %tak_ip0_0_i18_i220=%sub8_i17_i219
    %tak_ip1_1_i19_i221=%tak_ip1_14_i216
    %tak_ip2_2_i20_i222=%tak_ip2_15_i217
    %slt6_i3_i21_i223 = icmp slt i32 %tak_ip1_1_i19_i221, %tak_ip0_0_i18_i220
    br i1 %slt6_i3_i21_i223, label %if_then_block0_i4_i11_i88, label %if_else_block1_i5_i12_i89

if_then_block0_i4_i11_i88; preds = %if_then_block0_i9_i86
    sub8_i4_i22_i224 = sub i32 %tak_ip0_0_i18_i220, 1
    %funccal11_i5_i23_i225 = call i32 @tak(i32 %sub8_i4_i22_i224, i32 %tak_ip1_1_i19_i221, i32 %tak_ip2_2_i20_i222)
    sub13_i6_i24_i226 = sub i32 %tak_ip1_1_i19_i221, 1
    %funccal16_i7_i25_i227 = call i32 @tak(i32 %sub13_i6_i24_i226, i32 %tak_ip2_2_i20_i222, i32 %tak_ip0_0_i18_i220)
    sub18_i8_i26_i228 = sub i32 %tak_ip2_2_i20_i222, 1
    %funccal21_i9_i27_i229 = call i32 @tak(i32 %sub18_i8_i26_i228, i32 %tak_ip0_0_i18_i220, i32 %tak_ip1_1_i19_i221)
    %funccal22_i10_i28_i230 = call i32 @tak(i32 %funccal11_i5_i23_i225, i32 %funccal16_i7_i25_i227, i32 %funccal21_i9_i27_i229)
    add23_i11_i29_i231 = add i32 1, %funccal22_i10_i28_i230
    %takreturn_value3_i12_i30_i232=%add23_i11_i29_i231
    br label %tak_return_block_i6_i13_i90

if_else_block1_i5_i12_i89; preds = %if_then_block0_i4_i11_i88
    %takreturn_value3_i12_i30_i232=%tak_ip2_2_i20_i222
    br label %tak_return_block_i6_i13_i90

tak_return_block_i6_i13_i90; preds = %if_else_block1_i5_i12_i89
    %funccal11_i31_i233=%takreturn_value3_i12_i30_i232
    sub13_i32_i234 = sub i32 %tak_ip1_14_i216, 1
    %funccal16_i33_i235 = call i32 @tak(i32 %sub13_i32_i234, i32 %tak_ip2_15_i217, i32 %tak_ip0_13_i215)
    sub18_i34_i236 = sub i32 %tak_ip2_15_i217, 1
    %funccal21_i35_i237 = call i32 @tak(i32 %sub18_i34_i236, i32 %tak_ip0_13_i215, i32 %tak_ip1_14_i216)
    %funccal22_i36_i238 = call i32 @tak(i32 %funccal11_i31_i233, i32 %funccal16_i33_i235, i32 %funccal21_i35_i237)
    add23_i37_i239 = add i32 1, %funccal22_i36_i238
    %takreturn_value3_i38_i240=%add23_i37_i239
    br label %tak_return_block_i16_i93

if_else_block1_i15_i92; preds = %tak_return_block_i6_i13_i90
    %takreturn_value3_i38_i240=%tak_ip2_15_i217
    br label %tak_return_block_i16_i93

tak_return_block_i16_i93; preds = %if_else_block1_i15_i92
    %funccal16_i241=%takreturn_value3_i38_i240
    sub18_i242 = sub i32 %tak_ip2_197, 1
    %tak_ip0_39_i243=%sub18_i242
    %tak_ip1_40_i244=%tak_ip0_195
    %tak_ip2_41_i245=%tak_ip1_196
    %slt6_i42_i246 = icmp slt i32 %tak_ip1_40_i244, %tak_ip0_39_i243
    br i1 %slt6_i42_i246, label %if_then_block0_i19_i96, label %if_else_block1_i35_i112

if_then_block0_i19_i96; preds = %tak_return_block_i16_i93
    sub8_i43_i247 = sub i32 %tak_ip0_39_i243, 1
    %tak_ip0_0_i44_i248=%sub8_i43_i247
    %tak_ip1_1_i45_i249=%tak_ip1_40_i244
    %tak_ip2_2_i46_i250=%tak_ip2_41_i245
    %slt6_i3_i47_i251 = icmp slt i32 %tak_ip1_1_i45_i249, %tak_ip0_0_i44_i248
    br i1 %slt6_i3_i47_i251, label %if_then_block0_i4_i21_i98, label %if_else_block1_i5_i22_i99

if_then_block0_i4_i21_i98; preds = %if_then_block0_i19_i96
    sub8_i4_i48_i252 = sub i32 %tak_ip0_0_i44_i248, 1
    %funccal11_i5_i49_i253 = call i32 @tak(i32 %sub8_i4_i48_i252, i32 %tak_ip1_1_i45_i249, i32 %tak_ip2_2_i46_i250)
    sub13_i6_i50_i254 = sub i32 %tak_ip1_1_i45_i249, 1
    %funccal16_i7_i51_i255 = call i32 @tak(i32 %sub13_i6_i50_i254, i32 %tak_ip2_2_i46_i250, i32 %tak_ip0_0_i44_i248)
    sub18_i8_i52_i256 = sub i32 %tak_ip2_2_i46_i250, 1
    %funccal21_i9_i53_i257 = call i32 @tak(i32 %sub18_i8_i52_i256, i32 %tak_ip0_0_i44_i248, i32 %tak_ip1_1_i45_i249)
    %funccal22_i10_i54_i258 = call i32 @tak(i32 %funccal11_i5_i49_i253, i32 %funccal16_i7_i51_i255, i32 %funccal21_i9_i53_i257)
    add23_i11_i55_i259 = add i32 1, %funccal22_i10_i54_i258
    %takreturn_value3_i12_i56_i260=%add23_i11_i55_i259
    br label %tak_return_block_i6_i23_i100

if_else_block1_i5_i22_i99; preds = %if_then_block0_i4_i21_i98
    %takreturn_value3_i12_i56_i260=%tak_ip2_2_i46_i250
    br label %tak_return_block_i6_i23_i100

tak_return_block_i6_i23_i100; preds = %if_else_block1_i5_i22_i99
    %funccal11_i57_i261=%takreturn_value3_i12_i56_i260
    sub13_i58_i262 = sub i32 %tak_ip1_40_i244, 1
    %tak_ip0_13_i59_i263=%sub13_i58_i262
    %tak_ip1_14_i60_i264=%tak_ip2_41_i245
    %tak_ip2_15_i61_i265=%tak_ip0_39_i243
    %slt6_i16_i62_i266 = icmp slt i32 %tak_ip1_14_i60_i264, %tak_ip0_13_i59_i263
    br i1 %slt6_i16_i62_i266, label %if_then_block0_i9_i26_i103, label %if_else_block1_i15_i32_i109

if_then_block0_i9_i26_i103; preds = %tak_return_block_i6_i23_i100
    sub8_i17_i63_i267 = sub i32 %tak_ip0_13_i59_i263, 1
    %tak_ip0_0_i18_i64_i268=%sub8_i17_i63_i267
    %tak_ip1_1_i19_i65_i269=%tak_ip1_14_i60_i264
    %tak_ip2_2_i20_i66_i270=%tak_ip2_15_i61_i265
    %slt6_i3_i21_i67_i271 = icmp slt i32 %tak_ip1_1_i19_i65_i269, %tak_ip0_0_i18_i64_i268
    br i1 %slt6_i3_i21_i67_i271, label %if_then_block0_i4_i11_i28_i105, label %if_else_block1_i5_i12_i29_i106

if_then_block0_i4_i11_i28_i105; preds = %if_then_block0_i9_i26_i103
    sub8_i4_i22_i68_i272 = sub i32 %tak_ip0_0_i18_i64_i268, 1
    %funccal11_i5_i23_i69_i273 = call i32 @tak(i32 %sub8_i4_i22_i68_i272, i32 %tak_ip1_1_i19_i65_i269, i32 %tak_ip2_2_i20_i66_i270)
    sub13_i6_i24_i70_i274 = sub i32 %tak_ip1_1_i19_i65_i269, 1
    %funccal16_i7_i25_i71_i275 = call i32 @tak(i32 %sub13_i6_i24_i70_i274, i32 %tak_ip2_2_i20_i66_i270, i32 %tak_ip0_0_i18_i64_i268)
    sub18_i8_i26_i72_i276 = sub i32 %tak_ip2_2_i20_i66_i270, 1
    %funccal21_i9_i27_i73_i277 = call i32 @tak(i32 %sub18_i8_i26_i72_i276, i32 %tak_ip0_0_i18_i64_i268, i32 %tak_ip1_1_i19_i65_i269)
    %funccal22_i10_i28_i74_i278 = call i32 @tak(i32 %funccal11_i5_i23_i69_i273, i32 %funccal16_i7_i25_i71_i275, i32 %funccal21_i9_i27_i73_i277)
    add23_i11_i29_i75_i279 = add i32 1, %funccal22_i10_i28_i74_i278
    %takreturn_value3_i12_i30_i76_i280=%add23_i11_i29_i75_i279
    br label %tak_return_block_i6_i13_i30_i107

if_else_block1_i5_i12_i29_i106; preds = %if_then_block0_i4_i11_i28_i105
    %takreturn_value3_i12_i30_i76_i280=%tak_ip2_2_i20_i66_i270
    br label %tak_return_block_i6_i13_i30_i107

tak_return_block_i6_i13_i30_i107; preds = %if_else_block1_i5_i12_i29_i106
    %funccal11_i31_i77_i281=%takreturn_value3_i12_i30_i76_i280
    sub13_i32_i78_i282 = sub i32 %tak_ip1_14_i60_i264, 1
    %funccal16_i33_i79_i283 = call i32 @tak(i32 %sub13_i32_i78_i282, i32 %tak_ip2_15_i61_i265, i32 %tak_ip0_13_i59_i263)
    sub18_i34_i80_i284 = sub i32 %tak_ip2_15_i61_i265, 1
    %funccal21_i35_i81_i285 = call i32 @tak(i32 %sub18_i34_i80_i284, i32 %tak_ip0_13_i59_i263, i32 %tak_ip1_14_i60_i264)
    %funccal22_i36_i82_i286 = call i32 @tak(i32 %funccal11_i31_i77_i281, i32 %funccal16_i33_i79_i283, i32 %funccal21_i35_i81_i285)
    add23_i37_i83_i287 = add i32 1, %funccal22_i36_i82_i286
    %takreturn_value3_i38_i84_i288=%add23_i37_i83_i287
    br label %tak_return_block_i16_i33_i110

if_else_block1_i15_i32_i109; preds = %tak_return_block_i6_i13_i30_i107
    %takreturn_value3_i38_i84_i288=%tak_ip2_15_i61_i265
    br label %tak_return_block_i16_i33_i110

tak_return_block_i16_i33_i110; preds = %if_else_block1_i15_i32_i109
    %funccal16_i85_i289=%takreturn_value3_i38_i84_i288
    sub18_i86_i290 = sub i32 %tak_ip2_41_i245, 1
    %funccal21_i87_i291 = call i32 @tak(i32 %sub18_i86_i290, i32 %tak_ip0_39_i243, i32 %tak_ip1_40_i244)
    %funccal22_i88_i292 = call i32 @tak(i32 %funccal11_i57_i261, i32 %funccal16_i85_i289, i32 %funccal21_i87_i291)
    add23_i89_i293 = add i32 1, %funccal22_i88_i292
    %takreturn_value3_i90_i294=%add23_i89_i293
    br label %tak_return_block_i36_i113

if_else_block1_i35_i112; preds = %tak_return_block_i16_i33_i110
    %takreturn_value3_i90_i294=%tak_ip2_41_i245
    br label %tak_return_block_i36_i113

tak_return_block_i36_i113; preds = %if_else_block1_i35_i112
    %funccal21_i295=%takreturn_value3_i90_i294
    %tak_ip0_91_i296=%funccal11_i213
    %tak_ip1_92_i297=%funccal16_i241
    %tak_ip2_93_i298=%funccal21_i295
    %slt6_i94_i299 = icmp slt i32 %tak_ip1_92_i297, %tak_ip0_91_i296
    br i1 %slt6_i94_i299, label %if_then_block0_i39_i116, label %if_else_block1_i75_i152

if_then_block0_i39_i116; preds = %tak_return_block_i36_i113
    sub8_i95_i300 = sub i32 %tak_ip0_91_i296, 1
    %tak_ip0_0_i96_i301=%sub8_i95_i300
    %tak_ip1_1_i97_i302=%tak_ip1_92_i297
    %tak_ip2_2_i98_i303=%tak_ip2_93_i298
    %slt6_i3_i99_i304 = icmp slt i32 %tak_ip1_1_i97_i302, %tak_ip0_0_i96_i301
    br i1 %slt6_i3_i99_i304, label %if_then_block0_i4_i41_i118, label %if_else_block1_i5_i42_i119

if_then_block0_i4_i41_i118; preds = %if_then_block0_i39_i116
    sub8_i4_i100_i305 = sub i32 %tak_ip0_0_i96_i301, 1
    %funccal11_i5_i101_i306 = call i32 @tak(i32 %sub8_i4_i100_i305, i32 %tak_ip1_1_i97_i302, i32 %tak_ip2_2_i98_i303)
    sub13_i6_i102_i307 = sub i32 %tak_ip1_1_i97_i302, 1
    %funccal16_i7_i103_i308 = call i32 @tak(i32 %sub13_i6_i102_i307, i32 %tak_ip2_2_i98_i303, i32 %tak_ip0_0_i96_i301)
    sub18_i8_i104_i309 = sub i32 %tak_ip2_2_i98_i303, 1
    %funccal21_i9_i105_i310 = call i32 @tak(i32 %sub18_i8_i104_i309, i32 %tak_ip0_0_i96_i301, i32 %tak_ip1_1_i97_i302)
    %funccal22_i10_i106_i311 = call i32 @tak(i32 %funccal11_i5_i101_i306, i32 %funccal16_i7_i103_i308, i32 %funccal21_i9_i105_i310)
    add23_i11_i107_i312 = add i32 1, %funccal22_i10_i106_i311
    %takreturn_value3_i12_i108_i313=%add23_i11_i107_i312
    br label %tak_return_block_i6_i43_i120

if_else_block1_i5_i42_i119; preds = %if_then_block0_i4_i41_i118
    %takreturn_value3_i12_i108_i313=%tak_ip2_2_i98_i303
    br label %tak_return_block_i6_i43_i120

tak_return_block_i6_i43_i120; preds = %if_else_block1_i5_i42_i119
    %funccal11_i109_i314=%takreturn_value3_i12_i108_i313
    sub13_i110_i315 = sub i32 %tak_ip1_92_i297, 1
    %tak_ip0_13_i111_i316=%sub13_i110_i315
    %tak_ip1_14_i112_i317=%tak_ip2_93_i298
    %tak_ip2_15_i113_i318=%tak_ip0_91_i296
    %slt6_i16_i114_i319 = icmp slt i32 %tak_ip1_14_i112_i317, %tak_ip0_13_i111_i316
    br i1 %slt6_i16_i114_i319, label %if_then_block0_i9_i46_i123, label %if_else_block1_i15_i52_i129

if_then_block0_i9_i46_i123; preds = %tak_return_block_i6_i43_i120
    sub8_i17_i115_i320 = sub i32 %tak_ip0_13_i111_i316, 1
    %tak_ip0_0_i18_i116_i321=%sub8_i17_i115_i320
    %tak_ip1_1_i19_i117_i322=%tak_ip1_14_i112_i317
    %tak_ip2_2_i20_i118_i323=%tak_ip2_15_i113_i318
    %slt6_i3_i21_i119_i324 = icmp slt i32 %tak_ip1_1_i19_i117_i322, %tak_ip0_0_i18_i116_i321
    br i1 %slt6_i3_i21_i119_i324, label %if_then_block0_i4_i11_i48_i125, label %if_else_block1_i5_i12_i49_i126

if_then_block0_i4_i11_i48_i125; preds = %if_then_block0_i9_i46_i123
    sub8_i4_i22_i120_i325 = sub i32 %tak_ip0_0_i18_i116_i321, 1
    %funccal11_i5_i23_i121_i326 = call i32 @tak(i32 %sub8_i4_i22_i120_i325, i32 %tak_ip1_1_i19_i117_i322, i32 %tak_ip2_2_i20_i118_i323)
    sub13_i6_i24_i122_i327 = sub i32 %tak_ip1_1_i19_i117_i322, 1
    %funccal16_i7_i25_i123_i328 = call i32 @tak(i32 %sub13_i6_i24_i122_i327, i32 %tak_ip2_2_i20_i118_i323, i32 %tak_ip0_0_i18_i116_i321)
    sub18_i8_i26_i124_i329 = sub i32 %tak_ip2_2_i20_i118_i323, 1
    %funccal21_i9_i27_i125_i330 = call i32 @tak(i32 %sub18_i8_i26_i124_i329, i32 %tak_ip0_0_i18_i116_i321, i32 %tak_ip1_1_i19_i117_i322)
    %funccal22_i10_i28_i126_i331 = call i32 @tak(i32 %funccal11_i5_i23_i121_i326, i32 %funccal16_i7_i25_i123_i328, i32 %funccal21_i9_i27_i125_i330)
    add23_i11_i29_i127_i332 = add i32 1, %funccal22_i10_i28_i126_i331
    %takreturn_value3_i12_i30_i128_i333=%add23_i11_i29_i127_i332
    br label %tak_return_block_i6_i13_i50_i127

if_else_block1_i5_i12_i49_i126; preds = %if_then_block0_i4_i11_i48_i125
    %takreturn_value3_i12_i30_i128_i333=%tak_ip2_2_i20_i118_i323
    br label %tak_return_block_i6_i13_i50_i127

tak_return_block_i6_i13_i50_i127; preds = %if_else_block1_i5_i12_i49_i126
    %funccal11_i31_i129_i334=%takreturn_value3_i12_i30_i128_i333
    sub13_i32_i130_i335 = sub i32 %tak_ip1_14_i112_i317, 1
    %funccal16_i33_i131_i336 = call i32 @tak(i32 %sub13_i32_i130_i335, i32 %tak_ip2_15_i113_i318, i32 %tak_ip0_13_i111_i316)
    sub18_i34_i132_i337 = sub i32 %tak_ip2_15_i113_i318, 1
    %funccal21_i35_i133_i338 = call i32 @tak(i32 %sub18_i34_i132_i337, i32 %tak_ip0_13_i111_i316, i32 %tak_ip1_14_i112_i317)
    %funccal22_i36_i134_i339 = call i32 @tak(i32 %funccal11_i31_i129_i334, i32 %funccal16_i33_i131_i336, i32 %funccal21_i35_i133_i338)
    add23_i37_i135_i340 = add i32 1, %funccal22_i36_i134_i339
    %takreturn_value3_i38_i136_i341=%add23_i37_i135_i340
    br label %tak_return_block_i16_i53_i130

if_else_block1_i15_i52_i129; preds = %tak_return_block_i6_i13_i50_i127
    %takreturn_value3_i38_i136_i341=%tak_ip2_15_i113_i318
    br label %tak_return_block_i16_i53_i130

tak_return_block_i16_i53_i130; preds = %if_else_block1_i15_i52_i129
    %funccal16_i137_i342=%takreturn_value3_i38_i136_i341
    sub18_i138_i343 = sub i32 %tak_ip2_93_i298, 1
    %tak_ip0_39_i139_i344=%sub18_i138_i343
    %tak_ip1_40_i140_i345=%tak_ip0_91_i296
    %tak_ip2_41_i141_i346=%tak_ip1_92_i297
    %slt6_i42_i142_i347 = icmp slt i32 %tak_ip1_40_i140_i345, %tak_ip0_39_i139_i344
    br i1 %slt6_i42_i142_i347, label %if_then_block0_i19_i56_i133, label %if_else_block1_i35_i72_i149

if_then_block0_i19_i56_i133; preds = %tak_return_block_i16_i53_i130
    sub8_i43_i143_i348 = sub i32 %tak_ip0_39_i139_i344, 1
    %tak_ip0_0_i44_i144_i349=%sub8_i43_i143_i348
    %tak_ip1_1_i45_i145_i350=%tak_ip1_40_i140_i345
    %tak_ip2_2_i46_i146_i351=%tak_ip2_41_i141_i346
    %slt6_i3_i47_i147_i352 = icmp slt i32 %tak_ip1_1_i45_i145_i350, %tak_ip0_0_i44_i144_i349
    br i1 %slt6_i3_i47_i147_i352, label %if_then_block0_i4_i21_i58_i135, label %if_else_block1_i5_i22_i59_i136

if_then_block0_i4_i21_i58_i135; preds = %if_then_block0_i19_i56_i133
    sub8_i4_i48_i148_i353 = sub i32 %tak_ip0_0_i44_i144_i349, 1
    %funccal11_i5_i49_i149_i354 = call i32 @tak(i32 %sub8_i4_i48_i148_i353, i32 %tak_ip1_1_i45_i145_i350, i32 %tak_ip2_2_i46_i146_i351)
    sub13_i6_i50_i150_i355 = sub i32 %tak_ip1_1_i45_i145_i350, 1
    %funccal16_i7_i51_i151_i356 = call i32 @tak(i32 %sub13_i6_i50_i150_i355, i32 %tak_ip2_2_i46_i146_i351, i32 %tak_ip0_0_i44_i144_i349)
    sub18_i8_i52_i152_i357 = sub i32 %tak_ip2_2_i46_i146_i351, 1
    %funccal21_i9_i53_i153_i358 = call i32 @tak(i32 %sub18_i8_i52_i152_i357, i32 %tak_ip0_0_i44_i144_i349, i32 %tak_ip1_1_i45_i145_i350)
    %funccal22_i10_i54_i154_i359 = call i32 @tak(i32 %funccal11_i5_i49_i149_i354, i32 %funccal16_i7_i51_i151_i356, i32 %funccal21_i9_i53_i153_i358)
    add23_i11_i55_i155_i360 = add i32 1, %funccal22_i10_i54_i154_i359
    %takreturn_value3_i12_i56_i156_i361=%add23_i11_i55_i155_i360
    br label %tak_return_block_i6_i23_i60_i137

if_else_block1_i5_i22_i59_i136; preds = %if_then_block0_i4_i21_i58_i135
    %takreturn_value3_i12_i56_i156_i361=%tak_ip2_2_i46_i146_i351
    br label %tak_return_block_i6_i23_i60_i137

tak_return_block_i6_i23_i60_i137; preds = %if_else_block1_i5_i22_i59_i136
    %funccal11_i57_i157_i362=%takreturn_value3_i12_i56_i156_i361
    sub13_i58_i158_i363 = sub i32 %tak_ip1_40_i140_i345, 1
    %tak_ip0_13_i59_i159_i364=%sub13_i58_i158_i363
    %tak_ip1_14_i60_i160_i365=%tak_ip2_41_i141_i346
    %tak_ip2_15_i61_i161_i366=%tak_ip0_39_i139_i344
    %slt6_i16_i62_i162_i367 = icmp slt i32 %tak_ip1_14_i60_i160_i365, %tak_ip0_13_i59_i159_i364
    br i1 %slt6_i16_i62_i162_i367, label %if_then_block0_i9_i26_i63_i140, label %if_else_block1_i15_i32_i69_i146

if_then_block0_i9_i26_i63_i140; preds = %tak_return_block_i6_i23_i60_i137
    sub8_i17_i63_i163_i368 = sub i32 %tak_ip0_13_i59_i159_i364, 1
    %tak_ip0_0_i18_i64_i164_i369=%sub8_i17_i63_i163_i368
    %tak_ip1_1_i19_i65_i165_i370=%tak_ip1_14_i60_i160_i365
    %tak_ip2_2_i20_i66_i166_i371=%tak_ip2_15_i61_i161_i366
    %slt6_i3_i21_i67_i167_i372 = icmp slt i32 %tak_ip1_1_i19_i65_i165_i370, %tak_ip0_0_i18_i64_i164_i369
    br i1 %slt6_i3_i21_i67_i167_i372, label %if_then_block0_i4_i11_i28_i65_i142, label %if_else_block1_i5_i12_i29_i66_i143

if_then_block0_i4_i11_i28_i65_i142; preds = %if_then_block0_i9_i26_i63_i140
    sub8_i4_i22_i68_i168_i373 = sub i32 %tak_ip0_0_i18_i64_i164_i369, 1
    %funccal11_i5_i23_i69_i169_i374 = call i32 @tak(i32 %sub8_i4_i22_i68_i168_i373, i32 %tak_ip1_1_i19_i65_i165_i370, i32 %tak_ip2_2_i20_i66_i166_i371)
    sub13_i6_i24_i70_i170_i375 = sub i32 %tak_ip1_1_i19_i65_i165_i370, 1
    %funccal16_i7_i25_i71_i171_i376 = call i32 @tak(i32 %sub13_i6_i24_i70_i170_i375, i32 %tak_ip2_2_i20_i66_i166_i371, i32 %tak_ip0_0_i18_i64_i164_i369)
    sub18_i8_i26_i72_i172_i377 = sub i32 %tak_ip2_2_i20_i66_i166_i371, 1
    %funccal21_i9_i27_i73_i173_i378 = call i32 @tak(i32 %sub18_i8_i26_i72_i172_i377, i32 %tak_ip0_0_i18_i64_i164_i369, i32 %tak_ip1_1_i19_i65_i165_i370)
    %funccal22_i10_i28_i74_i174_i379 = call i32 @tak(i32 %funccal11_i5_i23_i69_i169_i374, i32 %funccal16_i7_i25_i71_i171_i376, i32 %funccal21_i9_i27_i73_i173_i378)
    add23_i11_i29_i75_i175_i380 = add i32 1, %funccal22_i10_i28_i74_i174_i379
    %takreturn_value3_i12_i30_i76_i176_i381=%add23_i11_i29_i75_i175_i380
    br label %tak_return_block_i6_i13_i30_i67_i144

if_else_block1_i5_i12_i29_i66_i143; preds = %if_then_block0_i4_i11_i28_i65_i142
    %takreturn_value3_i12_i30_i76_i176_i381=%tak_ip2_2_i20_i66_i166_i371
    br label %tak_return_block_i6_i13_i30_i67_i144

tak_return_block_i6_i13_i30_i67_i144; preds = %if_else_block1_i5_i12_i29_i66_i143
    %funccal11_i31_i77_i177_i382=%takreturn_value3_i12_i30_i76_i176_i381
    sub13_i32_i78_i178_i383 = sub i32 %tak_ip1_14_i60_i160_i365, 1
    %funccal16_i33_i79_i179_i384 = call i32 @tak(i32 %sub13_i32_i78_i178_i383, i32 %tak_ip2_15_i61_i161_i366, i32 %tak_ip0_13_i59_i159_i364)
    sub18_i34_i80_i180_i385 = sub i32 %tak_ip2_15_i61_i161_i366, 1
    %funccal21_i35_i81_i181_i386 = call i32 @tak(i32 %sub18_i34_i80_i180_i385, i32 %tak_ip0_13_i59_i159_i364, i32 %tak_ip1_14_i60_i160_i365)
    %funccal22_i36_i82_i182_i387 = call i32 @tak(i32 %funccal11_i31_i77_i177_i382, i32 %funccal16_i33_i79_i179_i384, i32 %funccal21_i35_i81_i181_i386)
    add23_i37_i83_i183_i388 = add i32 1, %funccal22_i36_i82_i182_i387
    %takreturn_value3_i38_i84_i184_i389=%add23_i37_i83_i183_i388
    br label %tak_return_block_i16_i33_i70_i147

if_else_block1_i15_i32_i69_i146; preds = %tak_return_block_i6_i13_i30_i67_i144
    %takreturn_value3_i38_i84_i184_i389=%tak_ip2_15_i61_i161_i366
    br label %tak_return_block_i16_i33_i70_i147

tak_return_block_i16_i33_i70_i147; preds = %if_else_block1_i15_i32_i69_i146
    %funccal16_i85_i185_i390=%takreturn_value3_i38_i84_i184_i389
    sub18_i86_i186_i391 = sub i32 %tak_ip2_41_i141_i346, 1
    %funccal21_i87_i187_i392 = call i32 @tak(i32 %sub18_i86_i186_i391, i32 %tak_ip0_39_i139_i344, i32 %tak_ip1_40_i140_i345)
    %funccal22_i88_i188_i393 = call i32 @tak(i32 %funccal11_i57_i157_i362, i32 %funccal16_i85_i185_i390, i32 %funccal21_i87_i187_i392)
    add23_i89_i189_i394 = add i32 1, %funccal22_i88_i188_i393
    %takreturn_value3_i90_i190_i395=%add23_i89_i189_i394
    br label %tak_return_block_i36_i73_i150

if_else_block1_i35_i72_i149; preds = %tak_return_block_i16_i33_i70_i147
    %takreturn_value3_i90_i190_i395=%tak_ip2_41_i141_i346
    br label %tak_return_block_i36_i73_i150

tak_return_block_i36_i73_i150; preds = %if_else_block1_i35_i72_i149
    %funccal21_i191_i396=%takreturn_value3_i90_i190_i395
    %funccal22_i192_i397 = call i32 @tak(i32 %funccal11_i109_i314, i32 %funccal16_i137_i342, i32 %funccal21_i191_i396)
    add23_i193_i398 = add i32 1, %funccal22_i192_i397
    %takreturn_value3_i194_i399=%add23_i193_i398
    br label %tak_return_block_i76_i153

if_else_block1_i75_i152; preds = %tak_return_block_i36_i73_i150
    %takreturn_value3_i194_i399=%tak_ip2_93_i298
    br label %tak_return_block_i76_i153

tak_return_block_i76_i153; preds = %if_else_block1_i75_i152
    %funccal22_i400=%takreturn_value3_i194_i399
    add23_i401 = add i32 1, %funccal22_i400
    %takreturn_value3_i402=%add23_i401
    br label %tak_return_block_i156

if_else_block1_i155; preds = %tak_return_block_i76_i153
    %takreturn_value3_i402=%tak_ip2_197
    br label %tak_return_block_i156

tak_return_block_i156; preds = %if_else_block1_i155
    %funccal38=%takreturn_value3_i402
    %funccal39 = call i8* @toString(i32 %funccal38)
    %funccal40 = call void @println(i8* %funccal39)
    %mainreturn_value25=0
    br label %main_return_block

main_return_block; preds = %tak_return_block_i156
    ret i32 %mainreturn_value25

}

