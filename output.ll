

define ReturnType : i32
Parameter : i32 i32  @gcd2(i32, i32)
define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter : i32 i32  @gcd2(i32, i32){
gcd2_entrance_block    srem31 = srem i32 %x, %y
    %eq32 = icmp eq i32 %srem31, 0
    br i1 %eq32, label %if_then_block6, label %if_else_block7

if_then_block6; preds = %gcd2_entrance_block
    %gcd2return_value28=%y
    br label %gcd2_return_block

if_else_block7; preds = %if_then_block6
    srem37 = srem i32 %x, %y
    %gcd1_ip0_21=%y
    %gcd1_ip1_22=%srem37
    srem18_i23 = srem i32 %gcd1_ip0_21, %gcd1_ip1_22
    %eq19_i24 = icmp eq i32 %srem18_i23, 0
    br i1 %eq19_i24, label %if_then_block3_i19, label %if_else_block4_i20

if_then_block3_i19; preds = %if_else_block7
    %gcd1return_value15_i25=%gcd1_ip1_22
    br label %gcd1_return_block_i31

if_else_block4_i20; preds = %if_then_block3_i19
    srem24_i26 = srem i32 %gcd1_ip0_21, %gcd1_ip1_22
    %gcd_ip0_7_i27=%gcd1_ip1_22
    %gcd_ip1_8_i28=%srem24_i26
    srem5_i9_i29 = srem i32 %gcd_ip0_7_i27, %gcd_ip1_8_i28
    %eq6_i10_i30 = icmp eq i32 %srem5_i9_i29, 0
    br i1 %eq6_i10_i30, label %if_then_block0_i9_i22, label %if_else_block1_i10_i23

if_then_block0_i9_i22; preds = %if_else_block4_i20
    %gcdreturn_value2_i11_i31=%gcd_ip1_8_i28
    br label %gcd_return_block_i16_i29

if_else_block1_i10_i23; preds = %if_then_block0_i9_i22
    srem11_i12_i32 = srem i32 %gcd_ip0_7_i27, %gcd_ip1_8_i28
    %gcd5_ip0_0_i13_i33=%gcd_ip1_8_i28
    %gcd5_ip1_1_i14_i34=%srem11_i12_i32
    srem70_i2_i15_i35 = srem i32 %gcd5_ip0_0_i13_i33, %gcd5_ip1_1_i14_i34
    %eq71_i3_i16_i36 = icmp eq i32 %srem70_i2_i15_i35, 0
    br i1 %eq71_i3_i16_i36, label %if_then_block15_i4_i12_i25, label %if_else_block16_i5_i13_i26

if_then_block15_i4_i12_i25; preds = %if_else_block1_i10_i23
    %gcd5return_value67_i4_i17_i37=%gcd5_ip1_1_i14_i34
    br label %gcd5_return_block_i6_i14_i27

if_else_block16_i5_i13_i26; preds = %if_then_block15_i4_i12_i25
    srem76_i5_i18_i38 = srem i32 %gcd5_ip0_0_i13_i33, %gcd5_ip1_1_i14_i34
    %gcd2_ip0_112=%gcd5_ip1_1_i14_i34
    %gcd2_ip1_113=%srem76_i5_i18_i38
    srem31_i114 = srem i32 %gcd2_ip0_112, %gcd2_ip1_113
    %eq32_i115 = icmp eq i32 %srem31_i114, 0
    br i1 %eq32_i115, label %if_then_block6_i84, label %if_else_block7_i85

if_then_block6_i84; preds = %if_else_block16_i5_i13_i26
    %gcd2return_value28_i116=%gcd2_ip1_113
    br label %gcd2_return_block_i101

if_else_block7_i85; preds = %if_then_block6_i84
    srem37_i117 = srem i32 %gcd2_ip0_112, %gcd2_ip1_113
    %gcd1_ip0_21_i118=%gcd2_ip1_113
    %gcd1_ip1_22_i119=%srem37_i117
    srem18_i23_i120 = srem i32 %gcd1_ip0_21_i118, %gcd1_ip1_22_i119
    %eq19_i24_i121 = icmp eq i32 %srem18_i23_i120, 0
    br i1 %eq19_i24_i121, label %if_then_block3_i19_i87, label %if_else_block4_i20_i88

if_then_block3_i19_i87; preds = %if_else_block7_i85
    %gcd1return_value15_i25_i122=%gcd1_ip1_22_i119
    br label %gcd1_return_block_i31_i99

if_else_block4_i20_i88; preds = %if_then_block3_i19_i87
    srem24_i26_i123 = srem i32 %gcd1_ip0_21_i118, %gcd1_ip1_22_i119
    %gcd_ip0_7_i27_i124=%gcd1_ip1_22_i119
    %gcd_ip1_8_i28_i125=%srem24_i26_i123
    srem5_i9_i29_i126 = srem i32 %gcd_ip0_7_i27_i124, %gcd_ip1_8_i28_i125
    %eq6_i10_i30_i127 = icmp eq i32 %srem5_i9_i29_i126, 0
    br i1 %eq6_i10_i30_i127, label %if_then_block0_i9_i22_i90, label %if_else_block1_i10_i23_i91

if_then_block0_i9_i22_i90; preds = %if_else_block4_i20_i88
    %gcdreturn_value2_i11_i31_i128=%gcd_ip1_8_i28_i125
    br label %gcd_return_block_i16_i29_i97

if_else_block1_i10_i23_i91; preds = %if_then_block0_i9_i22_i90
    srem11_i12_i32_i129 = srem i32 %gcd_ip0_7_i27_i124, %gcd_ip1_8_i28_i125
    %gcd5_ip0_0_i13_i33_i130=%gcd_ip1_8_i28_i125
    %gcd5_ip1_1_i14_i34_i131=%srem11_i12_i32_i129
    srem70_i2_i15_i35_i132 = srem i32 %gcd5_ip0_0_i13_i33_i130, %gcd5_ip1_1_i14_i34_i131
    %eq71_i3_i16_i36_i133 = icmp eq i32 %srem70_i2_i15_i35_i132, 0
    br i1 %eq71_i3_i16_i36_i133, label %if_then_block15_i4_i12_i25_i93, label %if_else_block16_i5_i13_i26_i94

if_then_block15_i4_i12_i25_i93; preds = %if_else_block1_i10_i23_i91
    %gcd5return_value67_i4_i17_i37_i134=%gcd5_ip1_1_i14_i34_i131
    br label %gcd5_return_block_i6_i14_i27_i95

if_else_block16_i5_i13_i26_i94; preds = %if_then_block15_i4_i12_i25_i93
    srem76_i5_i18_i38_i135 = srem i32 %gcd5_ip0_0_i13_i33_i130, %gcd5_ip1_1_i14_i34_i131
    %gcd2_ip0_308=%gcd5_ip1_1_i14_i34_i131
    %gcd2_ip1_309=%srem76_i5_i18_i38_i135
    srem31_i310 = srem i32 %gcd2_ip0_308, %gcd2_ip1_309
    %eq32_i311 = icmp eq i32 %srem31_i310, 0
    br i1 %eq32_i311, label %if_then_block6_i224, label %if_else_block7_i225

if_then_block6_i224; preds = %if_else_block16_i5_i13_i26_i94
    %gcd2return_value28_i312=%gcd2_ip1_309
    br label %gcd2_return_block_i261

if_else_block7_i225; preds = %if_then_block6_i224
    srem37_i313 = srem i32 %gcd2_ip0_308, %gcd2_ip1_309
    %gcd1_ip0_21_i314=%gcd2_ip1_309
    %gcd1_ip1_22_i315=%srem37_i313
    srem18_i23_i316 = srem i32 %gcd1_ip0_21_i314, %gcd1_ip1_22_i315
    %eq19_i24_i317 = icmp eq i32 %srem18_i23_i316, 0
    br i1 %eq19_i24_i317, label %if_then_block3_i19_i227, label %if_else_block4_i20_i228

if_then_block3_i19_i227; preds = %if_else_block7_i225
    %gcd1return_value15_i25_i318=%gcd1_ip1_22_i315
    br label %gcd1_return_block_i31_i259

if_else_block4_i20_i228; preds = %if_then_block3_i19_i227
    srem24_i26_i319 = srem i32 %gcd1_ip0_21_i314, %gcd1_ip1_22_i315
    %gcd_ip0_7_i27_i320=%gcd1_ip1_22_i315
    %gcd_ip1_8_i28_i321=%srem24_i26_i319
    srem5_i9_i29_i322 = srem i32 %gcd_ip0_7_i27_i320, %gcd_ip1_8_i28_i321
    %eq6_i10_i30_i323 = icmp eq i32 %srem5_i9_i29_i322, 0
    br i1 %eq6_i10_i30_i323, label %if_then_block0_i9_i22_i230, label %if_else_block1_i10_i23_i231

if_then_block0_i9_i22_i230; preds = %if_else_block4_i20_i228
    %gcdreturn_value2_i11_i31_i324=%gcd_ip1_8_i28_i321
    br label %gcd_return_block_i16_i29_i257

if_else_block1_i10_i23_i231; preds = %if_then_block0_i9_i22_i230
    srem11_i12_i32_i325 = srem i32 %gcd_ip0_7_i27_i320, %gcd_ip1_8_i28_i321
    %gcd5_ip0_0_i13_i33_i326=%gcd_ip1_8_i28_i321
    %gcd5_ip1_1_i14_i34_i327=%srem11_i12_i32_i325
    srem70_i2_i15_i35_i328 = srem i32 %gcd5_ip0_0_i13_i33_i326, %gcd5_ip1_1_i14_i34_i327
    %eq71_i3_i16_i36_i329 = icmp eq i32 %srem70_i2_i15_i35_i328, 0
    br i1 %eq71_i3_i16_i36_i329, label %if_then_block15_i4_i12_i25_i233, label %if_else_block16_i5_i13_i26_i234

if_then_block15_i4_i12_i25_i233; preds = %if_else_block1_i10_i23_i231
    %gcd5return_value67_i4_i17_i37_i330=%gcd5_ip1_1_i14_i34_i327
    br label %gcd5_return_block_i6_i14_i27_i255

if_else_block16_i5_i13_i26_i234; preds = %if_then_block15_i4_i12_i25_i233
    srem76_i5_i18_i38_i331 = srem i32 %gcd5_ip0_0_i13_i33_i326, %gcd5_ip1_1_i14_i34_i327
    %gcd2_ip0_112_i332=%gcd5_ip1_1_i14_i34_i327
    %gcd2_ip1_113_i333=%srem76_i5_i18_i38_i331
    srem31_i114_i334 = srem i32 %gcd2_ip0_112_i332, %gcd2_ip1_113_i333
    %eq32_i115_i335 = icmp eq i32 %srem31_i114_i334, 0
    br i1 %eq32_i115_i335, label %if_then_block6_i84_i236, label %if_else_block7_i85_i237

if_then_block6_i84_i236; preds = %if_else_block16_i5_i13_i26_i234
    %gcd2return_value28_i116_i336=%gcd2_ip1_113_i333
    br label %gcd2_return_block_i101_i253

if_else_block7_i85_i237; preds = %if_then_block6_i84_i236
    srem37_i117_i337 = srem i32 %gcd2_ip0_112_i332, %gcd2_ip1_113_i333
    %gcd1_ip0_21_i118_i338=%gcd2_ip1_113_i333
    %gcd1_ip1_22_i119_i339=%srem37_i117_i337
    srem18_i23_i120_i340 = srem i32 %gcd1_ip0_21_i118_i338, %gcd1_ip1_22_i119_i339
    %eq19_i24_i121_i341 = icmp eq i32 %srem18_i23_i120_i340, 0
    br i1 %eq19_i24_i121_i341, label %if_then_block3_i19_i87_i239, label %if_else_block4_i20_i88_i240

if_then_block3_i19_i87_i239; preds = %if_else_block7_i85_i237
    %gcd1return_value15_i25_i122_i342=%gcd1_ip1_22_i119_i339
    br label %gcd1_return_block_i31_i99_i251

if_else_block4_i20_i88_i240; preds = %if_then_block3_i19_i87_i239
    srem24_i26_i123_i343 = srem i32 %gcd1_ip0_21_i118_i338, %gcd1_ip1_22_i119_i339
    %gcd_ip0_7_i27_i124_i344=%gcd1_ip1_22_i119_i339
    %gcd_ip1_8_i28_i125_i345=%srem24_i26_i123_i343
    srem5_i9_i29_i126_i346 = srem i32 %gcd_ip0_7_i27_i124_i344, %gcd_ip1_8_i28_i125_i345
    %eq6_i10_i30_i127_i347 = icmp eq i32 %srem5_i9_i29_i126_i346, 0
    br i1 %eq6_i10_i30_i127_i347, label %if_then_block0_i9_i22_i90_i242, label %if_else_block1_i10_i23_i91_i243

if_then_block0_i9_i22_i90_i242; preds = %if_else_block4_i20_i88_i240
    %gcdreturn_value2_i11_i31_i128_i348=%gcd_ip1_8_i28_i125_i345
    br label %gcd_return_block_i16_i29_i97_i249

if_else_block1_i10_i23_i91_i243; preds = %if_then_block0_i9_i22_i90_i242
    srem11_i12_i32_i129_i349 = srem i32 %gcd_ip0_7_i27_i124_i344, %gcd_ip1_8_i28_i125_i345
    %gcd5_ip0_0_i13_i33_i130_i350=%gcd_ip1_8_i28_i125_i345
    %gcd5_ip1_1_i14_i34_i131_i351=%srem11_i12_i32_i129_i349
    srem70_i2_i15_i35_i132_i352 = srem i32 %gcd5_ip0_0_i13_i33_i130_i350, %gcd5_ip1_1_i14_i34_i131_i351
    %eq71_i3_i16_i36_i133_i353 = icmp eq i32 %srem70_i2_i15_i35_i132_i352, 0
    br i1 %eq71_i3_i16_i36_i133_i353, label %if_then_block15_i4_i12_i25_i93_i245, label %if_else_block16_i5_i13_i26_i94_i246

if_then_block15_i4_i12_i25_i93_i245; preds = %if_else_block1_i10_i23_i91_i243
    %gcd5return_value67_i4_i17_i37_i134_i354=%gcd5_ip1_1_i14_i34_i131_i351
    br label %gcd5_return_block_i6_i14_i27_i95_i247

if_else_block16_i5_i13_i26_i94_i246; preds = %if_then_block15_i4_i12_i25_i93_i245
    srem76_i5_i18_i38_i135_i355 = srem i32 %gcd5_ip0_0_i13_i33_i130_i350, %gcd5_ip1_1_i14_i34_i131_i351
    %funccal77_i6_i19_i39_i136_i356 = call i32 @gcd2(i32 %gcd5_ip1_1_i14_i34_i131_i351, i32 %srem76_i5_i18_i38_i135_i355)
    %gcd5return_value67_i4_i17_i37_i134_i354=%funccal77_i6_i19_i39_i136_i356
    br label %gcd5_return_block_i6_i14_i27_i95_i247

gcd5_return_block_i6_i14_i27_i95_i247; preds = %if_else_block16_i5_i13_i26_i94_i246
    %funccal12_i20_i40_i137_i357=%gcd5return_value67_i4_i17_i37_i134_i354
    %gcdreturn_value2_i11_i31_i128_i348=%funccal12_i20_i40_i137_i357
    br label %gcd_return_block_i16_i29_i97_i249

gcd_return_block_i16_i29_i97_i249; preds = %gcd5_return_block_i6_i14_i27_i95_i247
    %funccal25_i41_i138_i358=%gcdreturn_value2_i11_i31_i128_i348
    %gcd1return_value15_i25_i122_i342=%funccal25_i41_i138_i358
    br label %gcd1_return_block_i31_i99_i251

gcd1_return_block_i31_i99_i251; preds = %gcd_return_block_i16_i29_i97_i249
    %funccal38_i139_i359=%gcd1return_value15_i25_i122_i342
    %gcd2return_value28_i116_i336=%funccal38_i139_i359
    br label %gcd2_return_block_i101_i253

gcd2_return_block_i101_i253; preds = %gcd1_return_block_i31_i99_i251
    %funccal77_i6_i19_i39_i360=%gcd2return_value28_i116_i336
    %gcd5return_value67_i4_i17_i37_i330=%funccal77_i6_i19_i39_i360
    br label %gcd5_return_block_i6_i14_i27_i255

gcd5_return_block_i6_i14_i27_i255; preds = %gcd2_return_block_i101_i253
    %funccal12_i20_i40_i361=%gcd5return_value67_i4_i17_i37_i330
    %gcdreturn_value2_i11_i31_i324=%funccal12_i20_i40_i361
    br label %gcd_return_block_i16_i29_i257

gcd_return_block_i16_i29_i257; preds = %gcd5_return_block_i6_i14_i27_i255
    %funccal25_i41_i362=%gcdreturn_value2_i11_i31_i324
    %gcd1return_value15_i25_i318=%funccal25_i41_i362
    br label %gcd1_return_block_i31_i259

gcd1_return_block_i31_i259; preds = %gcd_return_block_i16_i29_i257
    %funccal38_i363=%gcd1return_value15_i25_i318
    %gcd2return_value28_i312=%funccal38_i363
    br label %gcd2_return_block_i261

gcd2_return_block_i261; preds = %gcd1_return_block_i31_i259
    %funccal77_i6_i19_i39_i136=%gcd2return_value28_i312
    %gcd5return_value67_i4_i17_i37_i134=%funccal77_i6_i19_i39_i136
    br label %gcd5_return_block_i6_i14_i27_i95

gcd5_return_block_i6_i14_i27_i95; preds = %gcd2_return_block_i261
    %funccal12_i20_i40_i137=%gcd5return_value67_i4_i17_i37_i134
    %gcdreturn_value2_i11_i31_i128=%funccal12_i20_i40_i137
    br label %gcd_return_block_i16_i29_i97

gcd_return_block_i16_i29_i97; preds = %gcd5_return_block_i6_i14_i27_i95
    %funccal25_i41_i138=%gcdreturn_value2_i11_i31_i128
    %gcd1return_value15_i25_i122=%funccal25_i41_i138
    br label %gcd1_return_block_i31_i99

gcd1_return_block_i31_i99; preds = %gcd_return_block_i16_i29_i97
    %funccal38_i139=%gcd1return_value15_i25_i122
    %gcd2return_value28_i116=%funccal38_i139
    br label %gcd2_return_block_i101

gcd2_return_block_i101; preds = %gcd1_return_block_i31_i99
    %funccal77_i6_i19_i39=%gcd2return_value28_i116
    %gcd5return_value67_i4_i17_i37=%funccal77_i6_i19_i39
    br label %gcd5_return_block_i6_i14_i27

gcd5_return_block_i6_i14_i27; preds = %gcd2_return_block_i101
    %funccal12_i20_i40=%gcd5return_value67_i4_i17_i37
    %gcdreturn_value2_i11_i31=%funccal12_i20_i40
    br label %gcd_return_block_i16_i29

gcd_return_block_i16_i29; preds = %gcd5_return_block_i6_i14_i27
    %funccal25_i41=%gcdreturn_value2_i11_i31
    %gcd1return_value15_i25=%funccal25_i41
    br label %gcd1_return_block_i31

gcd1_return_block_i31; preds = %gcd_return_block_i16_i29
    %funccal38=%gcd1return_value15_i25
    %gcd2return_value28=%funccal38
    br label %gcd2_return_block

gcd2_return_block; preds = %gcd1_return_block_i31
    ret i32 %gcd2return_value28

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    %gcdreturn_value2_i74=1
    %funccal79=%gcdreturn_value2_i74
    %funccal80 = call i8* @toString(i32 %funccal79)
    %funccal81 = call void @println(i8* %funccal80)
    %gcd5return_value67_i4_i94=1029
    %funccal12_i97=%gcd5return_value67_i4_i94
    %gcdreturn_value2_i88=%funccal12_i97
    %funccal82=%gcdreturn_value2_i88
    %funccal83 = call i8* @toString(i32 %funccal82)
    %funccal84 = call void @println(i8* %funccal83)
    %gcd2return_value28_i256=171
    %funccal77_i6_i110=%gcd2return_value28_i256
    %gcd5return_value67_i4_i108=%funccal77_i6_i110
    %funccal12_i111=%gcd5return_value67_i4_i108
    %gcdreturn_value2_i102=%funccal12_i111
    %funccal85=%gcdreturn_value2_i102
    %funccal86 = call i8* @toString(i32 %funccal85)
    %funccal87 = call void @println(i8* %funccal86)
    %mainreturn_value78=0
    br label %main_return_block

main_return_block; preds = %__init___entrance_block_i0
    ret i32 %mainreturn_value78

}

