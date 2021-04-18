
@n
@h
@now
@a
@A
@M
@Q
@R
@seed
@const_string_no0
@const_string_no1
@const_string_no2
@const_string_no3
@const_string_no4
@const_string_no5
@const_string_no6
@const_string_no7

define ReturnType : void
Parameter :  @show()
define ReturnType : i1
Parameter :  @win()
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @show(){
show_entrance_block    br label %for_cond_block9

for_cond_block9; preds = %show_entrance_block
    %i|addr580 = phi i32[ 0, %show_entrance_block], [ %PreAdd72, %for_step_block10]
    %now61 = load i32, i32 @now
    %slt62 = icmp slt i32 %i|addr580, %now61
    br i1 %slt62, label %for_body_block11, label %for_dest_block12

for_body_block11; preds = %for_cond_block9
    %a63 = load i32*, i32* @a
    %getElementPtr65 = getelementptr i32, i32* %a63, i32 %i|addr580
    %GEP_Load66 = load i32, i32* %getElementPtr65
    %funccal67 = call i8* @toString(i32 %GEP_Load66)
    %StringConst68 = getelementptr [1 x i8], [1 x i8]* @const_string_no0, i32 0, i32 0
    %add69 = call i8* @__string_add(i8* %funccal67, i8* %StringConst68)
    %funccal70 = call void @print(i8* %add69)
    br label %for_step_block10

for_step_block10; preds = %for_body_block11
    PreAdd72 = add i32 %i|addr580, 1
    br label %for_cond_block9

for_dest_block12; preds = %for_step_block10
    %StringConst73 = getelementptr [0 x i8], [0 x i8]* @const_string_no1, i32 0, i32 0
    %funccal74 = call void @println(i8* %StringConst73)
    br label %show_return_block

show_return_block; preds = %for_dest_block12
    ret void

}

define ReturnType : i1
Parameter :  @win(){
win_entrance_block    %call_malloc_func81 = call i8* @malloc(i32 404)
    store i32 100, i32* %call_malloc_func81
    %call_array_head82 = getelementptr i32, i32* %call_malloc_func81, i32 1
    call_array_head_cast_83 = bitcast i32* %call_array_head82 to i32*
    %now85 = load i32, i32 @now
    %h86 = load i32, i32 @h
    %ne87 = icmp ne i32 %now85, %h86
    br i1 %ne87, label %if_then_block13, label %if_dest_block14

if_then_block13; preds = %win_entrance_block
    %winreturn_value75=false
    br label %win_return_block

if_dest_block14; preds = %if_then_block13
    br label %for_cond_block15

for_cond_block15; preds = %if_dest_block14
    %j|addr775 = phi i32[ 0, %if_dest_block14], [ %PreAdd101, %for_step_block16]
    %now90 = load i32, i32 @now
    %slt91 = icmp slt i32 %j|addr775, %now90
    br i1 %slt91, label %for_body_block17, label %for_dest_block18

for_body_block17; preds = %for_cond_block15
    %getElementPtr94 = getelementptr i32, i32* %call_array_head_cast_83, i32 %j|addr775
    %a96 = load i32*, i32* @a
    %getElementPtr98 = getelementptr i32, i32* %a96, i32 %j|addr775
    %GEP_Load99 = load i32, i32* %getElementPtr98
    store i32 %GEP_Load99, i32* %getElementPtr94
    br label %for_step_block16

for_step_block16; preds = %for_body_block17
    PreAdd101 = add i32 %j|addr775, 1
    br label %for_cond_block15

for_dest_block18; preds = %for_step_block16
    br label %for_cond_block19

for_cond_block19; preds = %for_dest_block18
    %i|addr762 = phi i32[ 0, %for_dest_block18], [ %PreAdd143, %for_step_block20]
    %now104 = load i32, i32 @now
    sub105 = sub i32 %now104, 1
    %slt106 = icmp slt i32 %i|addr762, %sub105
    br i1 %slt106, label %for_body_block21, label %for_dest_block22

for_body_block21; preds = %for_cond_block19
    add109 = add i32 %i|addr762, 1
    br label %for_cond_block23

for_cond_block23; preds = %for_body_block21
    %j|addr777 = phi i32[ %add109, %for_body_block21], [ %PreAdd141, %for_step_block24]
    %now111 = load i32, i32 @now
    %slt112 = icmp slt i32 %j|addr777, %now111
    br i1 %slt112, label %for_body_block25, label %for_dest_block26

for_body_block25; preds = %for_cond_block23
    %getElementPtr115 = getelementptr i32, i32* %call_array_head_cast_83, i32 %i|addr762
    %GEP_Load116 = load i32, i32* %getElementPtr115
    %getElementPtr119 = getelementptr i32, i32* %call_array_head_cast_83, i32 %j|addr777
    %GEP_Load120 = load i32, i32* %getElementPtr119
    %sgt121 = icmp sgt i32 %GEP_Load116, %GEP_Load120
    br i1 %sgt121, label %if_then_block27, label %if_dest_block28

if_then_block27; preds = %for_body_block25
    %getElementPtr125 = getelementptr i32, i32* %call_array_head_cast_83, i32 %i|addr762
    %GEP_Load126 = load i32, i32* %getElementPtr125
    %getElementPtr129 = getelementptr i32, i32* %call_array_head_cast_83, i32 %i|addr762
    %getElementPtr133 = getelementptr i32, i32* %call_array_head_cast_83, i32 %j|addr777
    %GEP_Load134 = load i32, i32* %getElementPtr133
    store i32 %GEP_Load134, i32* %getElementPtr129
    %getElementPtr137 = getelementptr i32, i32* %call_array_head_cast_83, i32 %j|addr777
    store i32 %GEP_Load126, i32* %getElementPtr137
    br label %if_dest_block28

if_dest_block28; preds = %if_then_block27
    br label %for_step_block24

for_step_block24; preds = %if_dest_block28
    PreAdd141 = add i32 %j|addr777, 1
    br label %for_cond_block23

for_dest_block26; preds = %for_step_block24
    br label %for_step_block20

for_step_block20; preds = %for_dest_block26
    PreAdd143 = add i32 %i|addr762, 1
    br label %for_cond_block19

for_dest_block22; preds = %for_step_block20
    br label %for_cond_block29

for_cond_block29; preds = %for_dest_block22
    %i|addr763 = phi i32[ 0, %for_dest_block22], [ %PreAdd156, %for_step_block30]
    %now146 = load i32, i32 @now
    %slt147 = icmp slt i32 %i|addr763, %now146
    br i1 %slt147, label %for_body_block31, label %for_dest_block32

for_body_block31; preds = %for_cond_block29
    %getElementPtr150 = getelementptr i32, i32* %call_array_head_cast_83, i32 %i|addr763
    %GEP_Load151 = load i32, i32* %getElementPtr150
    add153 = add i32 %i|addr763, 1
    %ne154 = icmp ne i32 %GEP_Load151, %add153
    br i1 %ne154, label %if_then_block33, label %if_dest_block34

if_then_block33; preds = %for_body_block31
    %winreturn_value75=false
    br label %win_return_block

if_dest_block34; preds = %if_then_block33
    br label %for_step_block30

for_step_block30; preds = %if_dest_block34
    PreAdd156 = add i32 %i|addr763, 1
    br label %for_cond_block29

for_dest_block32; preds = %for_step_block30
    %winreturn_value75=true
    br label %win_return_block

win_return_block; preds = %for_dest_block32
    ret i1 %winreturn_value75

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i3

__init___entrance_block_i3; preds = %main_entrance_block
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    br label %__init___return_block_i4

__init___return_block_i4; preds = %__init___entrance_block_i3
    br label %main_entrance_block_AB_5

main_entrance_block_AB_5; preds = %__init___return_block_i4
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    %call_malloc_func231 = call i8* @malloc(i32 404)
    store i32 100, i32* %call_malloc_func231
    %call_array_head232 = getelementptr i32, i32* %call_malloc_func231, i32 1
    call_array_head_cast_233 = bitcast i32* %call_array_head232 to i32*
    store i32 %call_array_head_cast_233, i32* @a
    %M235 = load i32, i32 @M
    %A236 = load i32, i32 @A
    sdiv237 = sdiv i32 %M235, %A236
    store pointer is not pointertypei32
    %M239 = load i32, i32 @M
    %A240 = load i32, i32 @A
    srem241 = srem i32 %M239, %A240
    store pointer is not pointertypei32
    %n242 = load i32, i32 @n
    br label %pd_entrance_block_i6

pd_entrance_block_i6; preds = %main_entrance_block_AB_5
    %pd_ip0_16=%n242
    br label %for_cond_block3_i7

for_cond_block3_i7; preds = %pd_entrance_block_i6
    %h45_i17 = load i32, i32 @h
    %Id_load46_i18 = load i32, i32* %pd_ip0_16
    %sle47_i19 = icmp sle i32 %h45_i17, %Id_load46_i18
    br i1 %sle47_i19, label %for_body_block5_i8, label %for_dest_block6_i12

for_body_block5_i8; preds = %for_cond_block3_i7
    %Id_load48_i20 = load i32, i32* %pd_ip0_16
    %h49_i21 = load i32, i32 @h
    %h50_i22 = load i32, i32 @h
    add51_i23 = add i32 %h50_i22, 1
    mul52_i24 = mul i32 %h49_i21, %add51_i23
    sdiv53_i25 = sdiv i32 %mul52_i24, 2
    %eq54_i26 = icmp eq i32 %Id_load48_i20, %sdiv53_i25
    br i1 %eq54_i26, label %if_then_block7_i9, label %if_dest_block8_i10

if_then_block7_i9; preds = %for_body_block5_i8
    %pdreturn_value44_i27=true
    br label %pd_return_block_i13

if_dest_block8_i10; preds = %if_then_block7_i9
    br label %for_step_block4_i11

for_step_block4_i11; preds = %if_dest_block8_i10
    %h55_i28 = load i32, i32 @h
    PreAdd56_i29 = add i32 %h55_i28, 1
    store pointer is not pointertypei32
    br label %for_cond_block3_i7

for_dest_block6_i12; preds = %for_step_block4_i11
    %pdreturn_value44_i27=false
    br label %pd_return_block_i13

pd_return_block_i13; preds = %for_dest_block6_i12
    br label %main_entrance_block_AB_5_AB_14

main_entrance_block_AB_5_AB_14; preds = %pd_return_block_i13
    %funccal243=%pdreturn_value44_i27
    not244 = xor i1 true, %funccal243
    br i1 %not244, label %if_then_block56, label %if_dest_block57

if_then_block56; preds = %main_entrance_block_AB_5_AB_14
    %StringConst245 = getelementptr [79 x i8], [79 x i8]* @const_string_no2, i32 0, i32 0
    %funccal246 = call void @println(i8* %StringConst245)
    %mainreturn_value220=1
    br label %main_return_block

if_dest_block57; preds = %if_then_block56
    %StringConst247 = getelementptr [12 x i8], [12 x i8]* @const_string_no3, i32 0, i32 0
    %funccal248 = call void @println(i8* %StringConst247)
    br label %initialize_entrance_block_i15

initialize_entrance_block_i15; preds = %if_dest_block57
    %initialize_ip0_30=3654898
    %Id_load24_i31 = load i32, i32* %initialize_ip0_30
    store pointer is not pointertypei32
    br label %initialize_return_block_i16

initialize_return_block_i16; preds = %initialize_entrance_block_i15
    br label %if_dest_block57_AB_17

if_dest_block57_AB_17; preds = %initialize_return_block_i16
    br label %random_entrance_block_i18

random_entrance_block_i18; preds = %if_dest_block57_AB_17
    %A2_i32 = load i32, i32 @A
    %seed3_i33 = load i32, i32 @seed
    %Q4_i34 = load i32, i32 @Q
    srem5_i35 = srem i32 %seed3_i33, %Q4_i34
    mul6_i36 = mul i32 %A2_i32, %srem5_i35
    %R7_i37 = load i32, i32 @R
    %seed8_i38 = load i32, i32 @seed
    %Q9_i39 = load i32, i32 @Q
    sdiv10_i40 = sdiv i32 %seed8_i38, %Q9_i39
    mul11_i41 = mul i32 %R7_i37, %sdiv10_i40
    sub12_i42 = sub i32 %mul6_i36, %mul11_i41
    %sge14_i43 = icmp sge i32 %sub12_i42, 0
    br i1 %sge14_i43, label %if_then_block0_i19, label %if_else_block1_i20

if_then_block0_i19; preds = %random_entrance_block_i18
    store pointer is not pointertypei32
    br label %if_dest_block2_i21

if_else_block1_i20; preds = %if_then_block0_i19
    %M19_i44 = load i32, i32 @M
    add20_i45 = add i32 %sub12_i42, %M19_i44
    store pointer is not pointertypei32
    br label %if_dest_block2_i21

if_dest_block2_i21; preds = %if_else_block1_i20
    %seed21_i46 = load i32, i32 @seed
    %randomreturn_value0_i47=%seed21_i46
    br label %random_return_block_i22

random_return_block_i22; preds = %if_dest_block2_i21
    br label %if_dest_block57_AB_17_AB_23

if_dest_block57_AB_17_AB_23; preds = %random_return_block_i22
    %funccal251=%randomreturn_value0_i47
    srem252 = srem i32 %funccal251, 10
    add253 = add i32 %srem252, 1
    store pointer is not pointertypei32
    %now254 = load i32, i32 @now
    %funccal255 = call i8* @toString(i32 %now254)
    %funccal256 = call void @println(i8* %funccal255)
    br label %for_cond_block58

for_cond_block58; preds = %if_dest_block57_AB_17_AB_23
    %temp|addr22220 = phi i32[ 0, %if_dest_block57_AB_17_AB_23], [ %add289, %for_step_block59]
    %i|addr22118 = phi i32[ 0, %if_dest_block57_AB_17_AB_23], [ %PreAdd291, %for_step_block59]
    %now258 = load i32, i32 @now
    sub259 = sub i32 %now258, 1
    %slt260 = icmp slt i32 %i|addr22118, %sub259
    br i1 %slt260, label %for_body_block60, label %for_dest_block61

for_body_block60; preds = %for_cond_block58
    %a261 = load i32*, i32* @a
    %getElementPtr263 = getelementptr i32, i32* %a261, i32 %i|addr22118
    br label %random_entrance_block_i24

random_entrance_block_i24; preds = %for_body_block60
    %A2_i48 = load i32, i32 @A
    %seed3_i49 = load i32, i32 @seed
    %Q4_i50 = load i32, i32 @Q
    srem5_i51 = srem i32 %seed3_i49, %Q4_i50
    mul6_i52 = mul i32 %A2_i48, %srem5_i51
    %R7_i53 = load i32, i32 @R
    %seed8_i54 = load i32, i32 @seed
    %Q9_i55 = load i32, i32 @Q
    sdiv10_i56 = sdiv i32 %seed8_i54, %Q9_i55
    mul11_i57 = mul i32 %R7_i53, %sdiv10_i56
    sub12_i58 = sub i32 %mul6_i52, %mul11_i57
    %sge14_i59 = icmp sge i32 %sub12_i58, 0
    br i1 %sge14_i59, label %if_then_block0_i25, label %if_else_block1_i26

if_then_block0_i25; preds = %random_entrance_block_i24
    store pointer is not pointertypei32
    br label %if_dest_block2_i27

if_else_block1_i26; preds = %if_then_block0_i25
    %M19_i60 = load i32, i32 @M
    add20_i61 = add i32 %sub12_i58, %M19_i60
    store pointer is not pointertypei32
    br label %if_dest_block2_i27

if_dest_block2_i27; preds = %if_else_block1_i26
    %seed21_i62 = load i32, i32 @seed
    %randomreturn_value0_i63=%seed21_i62
    br label %random_return_block_i28

random_return_block_i28; preds = %if_dest_block2_i27
    br label %for_body_block60_AB_29

for_body_block60_AB_29; preds = %random_return_block_i28
    %funccal265=%randomreturn_value0_i63
    srem266 = srem i32 %funccal265, 10
    add267 = add i32 %srem266, 1
    store i32 %add267, i32* %getElementPtr263
    br label %while_cond_block62

while_cond_block62; preds = %for_body_block60_AB_29
    %a268 = load i32*, i32* @a
    %getElementPtr270 = getelementptr i32, i32* %a268, i32 %i|addr22118
    %GEP_Load271 = load i32, i32* %getElementPtr270
    add273 = add i32 %GEP_Load271, %temp|addr22220
    %n274 = load i32, i32 @n
    %sgt275 = icmp sgt i32 %add273, %n274
    br i1 %sgt275, label %while_body_block63, label %while_dest_block64

while_body_block63; preds = %while_cond_block62
    %a276 = load i32*, i32* @a
    %getElementPtr278 = getelementptr i32, i32* %a276, i32 %i|addr22118
    br label %random_entrance_block_i30

random_entrance_block_i30; preds = %while_body_block63
    %A2_i64 = load i32, i32 @A
    %seed3_i65 = load i32, i32 @seed
    %Q4_i66 = load i32, i32 @Q
    srem5_i67 = srem i32 %seed3_i65, %Q4_i66
    mul6_i68 = mul i32 %A2_i64, %srem5_i67
    %R7_i69 = load i32, i32 @R
    %seed8_i70 = load i32, i32 @seed
    %Q9_i71 = load i32, i32 @Q
    sdiv10_i72 = sdiv i32 %seed8_i70, %Q9_i71
    mul11_i73 = mul i32 %R7_i69, %sdiv10_i72
    sub12_i74 = sub i32 %mul6_i68, %mul11_i73
    %sge14_i75 = icmp sge i32 %sub12_i74, 0
    br i1 %sge14_i75, label %if_then_block0_i31, label %if_else_block1_i32

if_then_block0_i31; preds = %random_entrance_block_i30
    store pointer is not pointertypei32
    br label %if_dest_block2_i33

if_else_block1_i32; preds = %if_then_block0_i31
    %M19_i76 = load i32, i32 @M
    add20_i77 = add i32 %sub12_i74, %M19_i76
    store pointer is not pointertypei32
    br label %if_dest_block2_i33

if_dest_block2_i33; preds = %if_else_block1_i32
    %seed21_i78 = load i32, i32 @seed
    %randomreturn_value0_i79=%seed21_i78
    br label %random_return_block_i34

random_return_block_i34; preds = %if_dest_block2_i33
    br label %while_body_block63_AB_35

while_body_block63_AB_35; preds = %random_return_block_i34
    %funccal280=%randomreturn_value0_i79
    srem281 = srem i32 %funccal280, 10
    add282 = add i32 %srem281, 1
    store i32 %add282, i32* %getElementPtr278
    br label %while_cond_block62

while_dest_block64; preds = %while_body_block63_AB_35
    %a285 = load i32*, i32* @a
    %getElementPtr287 = getelementptr i32, i32* %a285, i32 %i|addr22118
    %GEP_Load288 = load i32, i32* %getElementPtr287
    add289 = add i32 %temp|addr22220, %GEP_Load288
    br label %for_step_block59

for_step_block59; preds = %while_dest_block64
    PreAdd291 = add i32 %i|addr22118, 1
    br label %for_cond_block58

for_dest_block61; preds = %for_step_block59
    %a292 = load i32*, i32* @a
    %now293 = load i32, i32 @now
    sub294 = sub i32 %now293, 1
    %getElementPtr295 = getelementptr i32, i32* %a292, i32 %sub294
    %n297 = load i32, i32 @n
    sub299 = sub i32 %n297, %temp|addr22220
    store i32 %sub299, i32* %getElementPtr295
    %funccal300 = call void @show()
    br label %merge_entrance_block_i36

merge_entrance_block_i36; preds = %for_dest_block61
    br label %for_cond_block35_i37

for_cond_block35_i37; preds = %merge_entrance_block_i36
    %i|addr15812_i80 = phi i32[ 0, %merge_entrance_block_i36], [ %PreAdd186_i81, %for_step_block36_i50]
    %now161_i82 = load i32, i32 @now
    %slt162_i83 = icmp slt i32 %i|addr15812_i80, %now161_i82
    br i1 %slt162_i83, label %for_body_block37_i38, label %for_dest_block38_i51

for_body_block37_i38; preds = %for_cond_block35_i37
    %a163_i84 = load i32*, i32* @a
    %getElementPtr165_i85 = getelementptr i32, i32* %a163_i84, i32 %i|addr15812_i80
    %GEP_Load166_i86 = load i32, i32* %getElementPtr165_i85
    %eq167_i87 = icmp eq i32 %GEP_Load166_i86, 0
    br i1 %eq167_i87, label %if_then_block39_i39, label %if_dest_block40_i49

if_then_block39_i39; preds = %for_body_block37_i38
    add171_i88 = add i32 %i|addr15812_i80, 1
    br label %for_cond_block41_i40

for_cond_block41_i40; preds = %if_then_block39_i39
    %j|addr16815_i89 = phi i32[ %add171_i88, %if_then_block39_i39], [ %PreAdd184_i90, %for_step_block42_i47]
    %now173_i91 = load i32, i32 @now
    %slt174_i92 = icmp slt i32 %j|addr16815_i89, %now173_i91
    br i1 %slt174_i92, label %for_body_block43_i41, label %for_dest_block44_i48

for_body_block43_i41; preds = %for_cond_block41_i40
    %a175_i93 = load i32*, i32* @a
    %getElementPtr177_i94 = getelementptr i32, i32* %a175_i93, i32 %j|addr16815_i89
    %GEP_Load178_i95 = load i32, i32* %getElementPtr177_i94
    %ne179_i96 = icmp ne i32 %GEP_Load178_i95, 0
    br i1 %ne179_i96, label %if_then_block45_i42, label %if_dest_block46_i46

if_then_block45_i42; preds = %for_body_block43_i41
    br label %swap_entrance_block_i0_i43

swap_entrance_block_i0_i43; preds = %if_then_block45_i42
    %swap_ip0_0_i97=%i|addr15812_i80
    %swap_ip1_1_i98=%j|addr16815_i89
    %a27_i2_i99 = load i32*, i32* @a
    %Id_load28_i3_i100 = load i32, i32* %swap_ip0_0_i97
    %getElementPtr29_i4_i101 = getelementptr i32, i32* %a27_i2_i99, i32 %Id_load28_i3_i100
    %GEP_Load30_i5_i102 = load i32, i32* %getElementPtr29_i4_i101
    %a31_i6_i103 = load i32*, i32* @a
    %Id_load32_i7_i104 = load i32, i32* %swap_ip0_0_i97
    %getElementPtr33_i8_i105 = getelementptr i32, i32* %a31_i6_i103, i32 %Id_load32_i7_i104
    %a35_i9_i106 = load i32*, i32* @a
    %Id_load36_i10_i107 = load i32, i32* %swap_ip1_1_i98
    %getElementPtr37_i11_i108 = getelementptr i32, i32* %a35_i9_i106, i32 %Id_load36_i10_i107
    %GEP_Load38_i12_i109 = load i32, i32* %getElementPtr37_i11_i108
    store i32 %GEP_Load38_i12_i109, i32* %getElementPtr33_i8_i105
    %a39_i13_i110 = load i32*, i32* @a
    %Id_load40_i14_i111 = load i32, i32* %swap_ip1_1_i98
    %getElementPtr41_i15_i112 = getelementptr i32, i32* %a39_i13_i110, i32 %Id_load40_i14_i111
    store i32 %GEP_Load30_i5_i102, i32* %getElementPtr41_i15_i112
    br label %swap_return_block_i1_i44

swap_return_block_i1_i44; preds = %swap_entrance_block_i0_i43
    br label %if_then_block45_AB_2_i45

if_then_block45_AB_2_i45; preds = %swap_return_block_i1_i44
    br label %for_dest_block44_i48

if_dest_block46_i46; preds = %if_then_block45_AB_2_i45
    br label %for_step_block42_i47

for_step_block42_i47; preds = %if_dest_block46_i46
    PreAdd184_i90 = add i32 %j|addr16815_i89, 1
    br label %for_cond_block41_i40

for_dest_block44_i48; preds = %for_step_block42_i47
    br label %if_dest_block40_i49

if_dest_block40_i49; preds = %for_dest_block44_i48
    br label %for_step_block36_i50

for_step_block36_i50; preds = %if_dest_block40_i49
    PreAdd186_i81 = add i32 %i|addr15812_i80, 1
    br label %for_cond_block35_i37

for_dest_block38_i51; preds = %for_step_block36_i50
    br label %for_cond_block47_i52

for_cond_block47_i52; preds = %for_dest_block38_i51
    %i|addr15813_i113 = phi i32[ 0, %for_dest_block38_i51], [ %PreAdd199_i114, %for_step_block48_i56]
    %now189_i115 = load i32, i32 @now
    %slt190_i116 = icmp slt i32 %i|addr15813_i113, %now189_i115
    br i1 %slt190_i116, label %for_body_block49_i53, label %for_dest_block50_i57

for_body_block49_i53; preds = %for_cond_block47_i52
    %a191_i117 = load i32*, i32* @a
    %getElementPtr193_i118 = getelementptr i32, i32* %a191_i117, i32 %i|addr15813_i113
    %GEP_Load194_i119 = load i32, i32* %getElementPtr193_i118
    %eq195_i120 = icmp eq i32 %GEP_Load194_i119, 0
    br i1 %eq195_i120, label %if_then_block51_i54, label %if_dest_block52_i55

if_then_block51_i54; preds = %for_body_block49_i53
    store pointer is not pointertypei32
    br label %for_dest_block50_i57

if_dest_block52_i55; preds = %if_then_block51_i54
    br label %for_step_block48_i56

for_step_block48_i56; preds = %if_dest_block52_i55
    PreAdd199_i114 = add i32 %i|addr15813_i113, 1
    br label %for_cond_block47_i52

for_dest_block50_i57; preds = %for_step_block48_i56
    br label %merge_return_block_i58

merge_return_block_i58; preds = %for_dest_block50_i57
    br label %for_dest_block61_AB_59

for_dest_block61_AB_59; preds = %merge_return_block_i58
    br label %while_cond_block65

while_cond_block65; preds = %for_dest_block61_AB_59
    %count|addr22322 = phi i32[ 0, %for_dest_block61_AB_59], [ %PreAdd306, %while_body_block66_AB_65_AB_89]
    %funccal302 = call i1 @win()
    not303 = xor i1 true, %funccal302
    br i1 %not303, label %while_body_block66, label %while_dest_block67

while_body_block66; preds = %while_cond_block65
    %StringConst304 = getelementptr [5 x i8], [5 x i8]* @const_string_no4, i32 0, i32 0
    PreAdd306 = add i32 %count|addr22322, 1
    %funccal307 = call i8* @toString(i32 %PreAdd306)
    %add308 = call i8* @__string_add(i8* %StringConst304, i8* %funccal307)
    %StringConst309 = getelementptr [1 x i8], [1 x i8]* @const_string_no5, i32 0, i32 0
    %add310 = call i8* @__string_add(i8* %add308, i8* %StringConst309)
    %funccal311 = call void @println(i8* %add310)
    br label %move_entrance_block_i60

move_entrance_block_i60; preds = %while_body_block66
    br label %for_cond_block53_i61

for_cond_block53_i61; preds = %move_entrance_block_i60
    %i|addr20117_i121 = phi i32[ 0, %move_entrance_block_i60], [ %add212_i122, %for_body_block54_i62]
    %now203_i123 = load i32, i32 @now
    %slt204_i124 = icmp slt i32 %i|addr20117_i121, %now203_i123
    br i1 %slt204_i124, label %for_body_block54_i62, label %for_dest_block55_i63

for_body_block54_i62; preds = %for_cond_block53_i61
    %a205_i125 = load i32*, i32* @a
    %getElementPtr207_i126 = getelementptr i32, i32* %a205_i125, i32 %i|addr20117_i121
    %GEP_Load208_i127 = load i32, i32* %getElementPtr207_i126
    PreSub209_i128 = sub i32 %GEP_Load208_i127, 1
    store i32 %PreSub209_i128, i32* %getElementPtr207_i126
    add212_i122 = add i32 %i|addr20117_i121, 1
    br label %for_cond_block53_i61

for_dest_block55_i63; preds = %for_body_block54_i62
    %a213_i129 = load i32*, i32* @a
    %now214_i130 = load i32, i32 @now
    %getElementPtr215_i131 = getelementptr i32, i32* %a213_i129, i32 %now214_i130
    %now217_i132 = load i32, i32 @now
    store i32 %now217_i132, i32* %getElementPtr215_i131
    %now218_i133 = load i32, i32 @now
    SelfAdd219_i134 = add i32 %now218_i133, 1
    store pointer is not pointertypei32
    br label %move_return_block_i64

move_return_block_i64; preds = %for_dest_block55_i63
    br label %while_body_block66_AB_65

while_body_block66_AB_65; preds = %move_return_block_i64
    br label %merge_entrance_block_i66

merge_entrance_block_i66; preds = %while_body_block66_AB_65
    br label %for_cond_block35_i67

for_cond_block35_i67; preds = %merge_entrance_block_i66
    %i|addr15812_i135 = phi i32[ 0, %merge_entrance_block_i66], [ %PreAdd186_i136, %for_step_block36_i80]
    %now161_i137 = load i32, i32 @now
    %slt162_i138 = icmp slt i32 %i|addr15812_i135, %now161_i137
    br i1 %slt162_i138, label %for_body_block37_i68, label %for_dest_block38_i81

for_body_block37_i68; preds = %for_cond_block35_i67
    %a163_i139 = load i32*, i32* @a
    %getElementPtr165_i140 = getelementptr i32, i32* %a163_i139, i32 %i|addr15812_i135
    %GEP_Load166_i141 = load i32, i32* %getElementPtr165_i140
    %eq167_i142 = icmp eq i32 %GEP_Load166_i141, 0
    br i1 %eq167_i142, label %if_then_block39_i69, label %if_dest_block40_i79

if_then_block39_i69; preds = %for_body_block37_i68
    add171_i143 = add i32 %i|addr15812_i135, 1
    br label %for_cond_block41_i70

for_cond_block41_i70; preds = %if_then_block39_i69
    %j|addr16815_i144 = phi i32[ %add171_i143, %if_then_block39_i69], [ %PreAdd184_i145, %for_step_block42_i77]
    %now173_i146 = load i32, i32 @now
    %slt174_i147 = icmp slt i32 %j|addr16815_i144, %now173_i146
    br i1 %slt174_i147, label %for_body_block43_i71, label %for_dest_block44_i78

for_body_block43_i71; preds = %for_cond_block41_i70
    %a175_i148 = load i32*, i32* @a
    %getElementPtr177_i149 = getelementptr i32, i32* %a175_i148, i32 %j|addr16815_i144
    %GEP_Load178_i150 = load i32, i32* %getElementPtr177_i149
    %ne179_i151 = icmp ne i32 %GEP_Load178_i150, 0
    br i1 %ne179_i151, label %if_then_block45_i72, label %if_dest_block46_i76

if_then_block45_i72; preds = %for_body_block43_i71
    br label %swap_entrance_block_i0_i73

swap_entrance_block_i0_i73; preds = %if_then_block45_i72
    %swap_ip0_0_i152=%i|addr15812_i135
    %swap_ip1_1_i153=%j|addr16815_i144
    %a27_i2_i154 = load i32*, i32* @a
    %Id_load28_i3_i155 = load i32, i32* %swap_ip0_0_i152
    %getElementPtr29_i4_i156 = getelementptr i32, i32* %a27_i2_i154, i32 %Id_load28_i3_i155
    %GEP_Load30_i5_i157 = load i32, i32* %getElementPtr29_i4_i156
    %a31_i6_i158 = load i32*, i32* @a
    %Id_load32_i7_i159 = load i32, i32* %swap_ip0_0_i152
    %getElementPtr33_i8_i160 = getelementptr i32, i32* %a31_i6_i158, i32 %Id_load32_i7_i159
    %a35_i9_i161 = load i32*, i32* @a
    %Id_load36_i10_i162 = load i32, i32* %swap_ip1_1_i153
    %getElementPtr37_i11_i163 = getelementptr i32, i32* %a35_i9_i161, i32 %Id_load36_i10_i162
    %GEP_Load38_i12_i164 = load i32, i32* %getElementPtr37_i11_i163
    store i32 %GEP_Load38_i12_i164, i32* %getElementPtr33_i8_i160
    %a39_i13_i165 = load i32*, i32* @a
    %Id_load40_i14_i166 = load i32, i32* %swap_ip1_1_i153
    %getElementPtr41_i15_i167 = getelementptr i32, i32* %a39_i13_i165, i32 %Id_load40_i14_i166
    store i32 %GEP_Load30_i5_i157, i32* %getElementPtr41_i15_i167
    br label %swap_return_block_i1_i74

swap_return_block_i1_i74; preds = %swap_entrance_block_i0_i73
    br label %if_then_block45_AB_2_i75

if_then_block45_AB_2_i75; preds = %swap_return_block_i1_i74
    br label %for_dest_block44_i78

if_dest_block46_i76; preds = %if_then_block45_AB_2_i75
    br label %for_step_block42_i77

for_step_block42_i77; preds = %if_dest_block46_i76
    PreAdd184_i145 = add i32 %j|addr16815_i144, 1
    br label %for_cond_block41_i70

for_dest_block44_i78; preds = %for_step_block42_i77
    br label %if_dest_block40_i79

if_dest_block40_i79; preds = %for_dest_block44_i78
    br label %for_step_block36_i80

for_step_block36_i80; preds = %if_dest_block40_i79
    PreAdd186_i136 = add i32 %i|addr15812_i135, 1
    br label %for_cond_block35_i67

for_dest_block38_i81; preds = %for_step_block36_i80
    br label %for_cond_block47_i82

for_cond_block47_i82; preds = %for_dest_block38_i81
    %i|addr15813_i168 = phi i32[ 0, %for_dest_block38_i81], [ %PreAdd199_i169, %for_step_block48_i86]
    %now189_i170 = load i32, i32 @now
    %slt190_i171 = icmp slt i32 %i|addr15813_i168, %now189_i170
    br i1 %slt190_i171, label %for_body_block49_i83, label %for_dest_block50_i87

for_body_block49_i83; preds = %for_cond_block47_i82
    %a191_i172 = load i32*, i32* @a
    %getElementPtr193_i173 = getelementptr i32, i32* %a191_i172, i32 %i|addr15813_i168
    %GEP_Load194_i174 = load i32, i32* %getElementPtr193_i173
    %eq195_i175 = icmp eq i32 %GEP_Load194_i174, 0
    br i1 %eq195_i175, label %if_then_block51_i84, label %if_dest_block52_i85

if_then_block51_i84; preds = %for_body_block49_i83
    store pointer is not pointertypei32
    br label %for_dest_block50_i87

if_dest_block52_i85; preds = %if_then_block51_i84
    br label %for_step_block48_i86

for_step_block48_i86; preds = %if_dest_block52_i85
    PreAdd199_i169 = add i32 %i|addr15813_i168, 1
    br label %for_cond_block47_i82

for_dest_block50_i87; preds = %for_step_block48_i86
    br label %merge_return_block_i88

merge_return_block_i88; preds = %for_dest_block50_i87
    br label %while_body_block66_AB_65_AB_89

while_body_block66_AB_65_AB_89; preds = %merge_return_block_i88
    %funccal314 = call void @show()
    br label %while_cond_block65

while_dest_block67; preds = %while_body_block66_AB_65_AB_89
    %StringConst315 = getelementptr [7 x i8], [7 x i8]* @const_string_no6, i32 0, i32 0
    %funccal317 = call i8* @toString(i32 %count|addr22322)
    %add318 = call i8* @__string_add(i8* %StringConst315, i8* %funccal317)
    %StringConst319 = getelementptr [8 x i8], [8 x i8]* @const_string_no7, i32 0, i32 0
    %add320 = call i8* @__string_add(i8* %add318, i8* %StringConst319)
    %funccal321 = call void @println(i8* %add320)
    %mainreturn_value220=0
    br label %main_return_block

main_return_block; preds = %while_dest_block67
    ret i32 %mainreturn_value220

}

