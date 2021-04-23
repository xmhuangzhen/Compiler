
@N
@head
@startx
@starty
@targetx
@targety
@x
@y
@xlist
@ylist
@tail
@ok
@now
@dx
@dy
@step
@i
@j
@const_string_no0

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i10

__init___entrance_block_i10; preds = %main_entrance_block
    %call_malloc_func2_i12 = call i8* @malloc(i32 48004)
    store i32 12000, i32* %call_malloc_func2_i12
    %call_array_head3_i13 = getelementptr i32, i32* %call_malloc_func2_i12, i32 1
    call_array_head_cast_4_i14 = bitcast i32* %call_array_head3_i13 to i32*
    store i32 %call_array_head_cast_4_i14, i32* @xlist
    %call_malloc_func7_i15 = call i8* @malloc(i32 48004)
    store i32 12000, i32* %call_malloc_func7_i15
    %call_array_head8_i16 = getelementptr i32, i32* %call_malloc_func7_i15, i32 1
    call_array_head_cast_9_i17 = bitcast i32* %call_array_head8_i16 to i32*
    store i32 %call_array_head_cast_9_i17, i32* @ylist
    %call_malloc_func12_i18 = call i8* @malloc(i32 36)
    store i32 8, i32* %call_malloc_func12_i18
    %call_array_head13_i19 = getelementptr i32, i32* %call_malloc_func12_i18, i32 1
    call_array_head_cast_14_i20 = bitcast i32* %call_array_head13_i19 to i32*
    store i32 %call_array_head_cast_14_i20, i32* @dx
    %call_malloc_func17_i21 = call i8* @malloc(i32 40)
    store i32 9, i32* %call_malloc_func17_i21
    %call_array_head18_i22 = getelementptr i32, i32* %call_malloc_func17_i21, i32 1
    call_array_head_cast_19_i23 = bitcast i32* %call_array_head18_i22 to i32*
    store i32 %call_array_head_cast_19_i23, i32* @dy
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    %call_malloc_func28_i27 = call i8* @malloc(i32 %call_size_227_i26)
    store i32 106, i32* %call_malloc_func28_i27
    %call_array_head29_i28 = getelementptr i32, i32* %call_malloc_func28_i27, i32 1
    call_array_head_cast_30_i29 = bitcast i32* %call_array_head29_i28 to i32*
    store i32* %call_array_head_cast_30_i29, i32** @step
    store pointer is not pointertypei32
    br label %for_cond_block0_i14

for_cond_block0_i14; preds = %__init___entrance_block_i10
    %i32_i30 = load i32, i32 @i
    %slt34_i31 = icmp slt i32 %i32_i30, 106
    br i1 %slt34_i31, label %for_body_block2_i15, label %for_dest_block3_i19

for_body_block2_i15; preds = %for_cond_block0_i14
    %step35_i32 = load i32**, i32** @step
    %i36_i33 = load i32, i32 @i
    %getElementPtr37_i34 = getelementptr i32*, i32** %step35_i32, i32 %i36_i33
    %call_malloc_func42_i37 = call i8* @malloc(i32 %call_size_241_i36)
    store i32 106, i32* %call_malloc_func42_i37
    %call_array_head43_i38 = getelementptr i32, i32* %call_malloc_func42_i37, i32 1
    call_array_head_cast_44_i39 = bitcast i32* %call_array_head43_i38 to i32*
    store i32* %call_array_head_cast_44_i39, i32** %getElementPtr37_i34
    store pointer is not pointertypei32
    br label %for_cond_block4_i16

for_cond_block4_i16; preds = %for_body_block2_i15
    %j46_i40 = load i32, i32 @j
    %slt48_i41 = icmp slt i32 %j46_i40, 106
    br i1 %slt48_i41, label %for_body_block6_i17, label %for_dest_block7_i18

for_body_block6_i17; preds = %for_cond_block4_i16
    %step49_i42 = load i32**, i32** @step
    %i50_i43 = load i32, i32 @i
    %getElementPtr51_i44 = getelementptr i32*, i32** %step49_i42, i32 %i50_i43
    %GEP_Load52_i45 = load i32*, i32** %getElementPtr51_i44
    %j53_i46 = load i32, i32 @j
    %getElementPtr54_i47 = getelementptr i32, i32* %GEP_Load52_i45, i32 %j53_i46
    store i32 0, i32* %getElementPtr54_i47
    %j56_i48 = load i32, i32 @j
    SelfAdd57_i49 = add i32 %j56_i48, 1
    store pointer is not pointertypei32
    br label %for_cond_block4_i16

for_dest_block7_i18; preds = %for_body_block6_i17
    %i58_i50 = load i32, i32 @i
    SelfAdd59_i51 = add i32 %i58_i50, 1
    store pointer is not pointertypei32
    br label %for_cond_block0_i14

for_dest_block3_i19; preds = %for_dest_block7_i18
    %funccal117 = call i32 @getInt()
    store pointer is not pointertypei32
    %N119 = load i32, i32 @N
    sub120 = sub i32 %N119, 1
    store pointer is not pointertypei32
    %targety122 = load i32, i32 @targety
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    br label %for_cond_block20

for_cond_block20; preds = %for_dest_block3_i19
    %i124 = load i32, i32 @i
    %N125 = load i32, i32 @N
    %slt126 = icmp slt i32 %i124, %N125
    br i1 %slt126, label %for_body_block22, label %for_dest_block23

for_body_block22; preds = %for_cond_block20
    store pointer is not pointertypei32
    br label %for_cond_block24

for_cond_block24; preds = %for_body_block22
    %j128 = load i32, i32 @j
    %N129 = load i32, i32 @N
    %slt130 = icmp slt i32 %j128, %N129
    br i1 %slt130, label %for_body_block26, label %for_dest_block27

for_body_block26; preds = %for_cond_block24
    %step131 = load i32**, i32** @step
    %i132 = load i32, i32 @i
    %getElementPtr133 = getelementptr i32*, i32** %step131, i32 %i132
    %GEP_Load134 = load i32*, i32** %getElementPtr133
    %j135 = load i32, i32 @j
    %getElementPtr136 = getelementptr i32, i32* %GEP_Load134, i32 %j135
    store i32 -1, i32* %getElementPtr136
    %j138 = load i32, i32 @j
    SelfAdd139 = add i32 %j138, 1
    store pointer is not pointertypei32
    br label %for_cond_block24

for_dest_block27; preds = %for_body_block26
    %i140 = load i32, i32 @i
    SelfAdd141 = add i32 %i140, 1
    store pointer is not pointertypei32
    br label %for_cond_block20

for_dest_block23; preds = %for_dest_block27
    %dx142 = load i32*, i32* @dx
    %getElementPtr143 = getelementptr i32, i32* %dx142, i32 0
    store i32 -2, i32* %getElementPtr143
    %dy145 = load i32*, i32* @dy
    %getElementPtr146 = getelementptr i32, i32* %dy145, i32 0
    store i32 -1, i32* %getElementPtr146
    %dx148 = load i32*, i32* @dx
    %getElementPtr149 = getelementptr i32, i32* %dx148, i32 1
    store i32 -2, i32* %getElementPtr149
    %dy151 = load i32*, i32* @dy
    %getElementPtr152 = getelementptr i32, i32* %dy151, i32 1
    store i32 1, i32* %getElementPtr152
    %dx154 = load i32*, i32* @dx
    %getElementPtr155 = getelementptr i32, i32* %dx154, i32 2
    store i32 2, i32* %getElementPtr155
    %dy157 = load i32*, i32* @dy
    %getElementPtr158 = getelementptr i32, i32* %dy157, i32 2
    store i32 -1, i32* %getElementPtr158
    %dx160 = load i32*, i32* @dx
    %getElementPtr161 = getelementptr i32, i32* %dx160, i32 3
    store i32 2, i32* %getElementPtr161
    %dy163 = load i32*, i32* @dy
    %getElementPtr164 = getelementptr i32, i32* %dy163, i32 3
    store i32 1, i32* %getElementPtr164
    %dx166 = load i32*, i32* @dx
    %getElementPtr167 = getelementptr i32, i32* %dx166, i32 4
    store i32 -1, i32* %getElementPtr167
    %dy169 = load i32*, i32* @dy
    %getElementPtr170 = getelementptr i32, i32* %dy169, i32 4
    store i32 -2, i32* %getElementPtr170
    %dx172 = load i32*, i32* @dx
    %getElementPtr173 = getelementptr i32, i32* %dx172, i32 5
    store i32 -1, i32* %getElementPtr173
    %dy175 = load i32*, i32* @dy
    %getElementPtr176 = getelementptr i32, i32* %dy175, i32 5
    store i32 2, i32* %getElementPtr176
    %dx178 = load i32*, i32* @dx
    %getElementPtr179 = getelementptr i32, i32* %dx178, i32 6
    store i32 1, i32* %getElementPtr179
    %dy181 = load i32*, i32* @dy
    %getElementPtr182 = getelementptr i32, i32* %dy181, i32 6
    store i32 -2, i32* %getElementPtr182
    %dx184 = load i32*, i32* @dx
    %getElementPtr185 = getelementptr i32, i32* %dx184, i32 7
    store i32 1, i32* %getElementPtr185
    %dy187 = load i32*, i32* @dy
    %getElementPtr188 = getelementptr i32, i32* %dy187, i32 7
    store i32 2, i32* %getElementPtr188
    br label %while_cond_block28

while_cond_block28; preds = %for_dest_block23
    %head190 = load i32, i32 @head
    %tail191 = load i32, i32 @tail
    %sle192 = icmp sle i32 %head190, %tail191
    br i1 %sle192, label %while_body_block29, label %while_dest_block30

while_body_block29; preds = %while_cond_block28
    %xlist194 = load i32*, i32* @xlist
    %head195 = load i32, i32 @head
    %getElementPtr196 = getelementptr i32, i32* %xlist194, i32 %head195
    %GEP_Load197 = load i32, i32* %getElementPtr196
    store pointer is not pointertypei32
    %ylist199 = load i32*, i32* @ylist
    %head200 = load i32, i32 @head
    %getElementPtr201 = getelementptr i32, i32* %ylist199, i32 %head200
    %GEP_Load202 = load i32, i32* %getElementPtr201
    store pointer is not pointertypei32
    %step204 = load i32**, i32** @step
    %x205 = load i32, i32 @x
    %getElementPtr206 = getelementptr i32*, i32** %step204, i32 %x205
    %GEP_Load207 = load i32*, i32** %getElementPtr206
    %y208 = load i32, i32 @y
    %getElementPtr209 = getelementptr i32, i32* %GEP_Load207, i32 %y208
    %GEP_Load210 = load i32, i32* %getElementPtr209
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    br label %for_cond_block31

for_cond_block31; preds = %while_body_block29
    %j212 = load i32, i32 @j
    %slt213 = icmp slt i32 %j212, 8
    br i1 %slt213, label %for_body_block33, label %for_dest_block34

for_body_block33; preds = %for_cond_block31
    %x214 = load i32, i32 @x
    %dx215 = load i32*, i32* @dx
    %j216 = load i32, i32 @j
    %getElementPtr217 = getelementptr i32, i32* %dx215, i32 %j216
    %GEP_Load218 = load i32, i32* %getElementPtr217
    add219 = add i32 %x214, %GEP_Load218
    %y220 = load i32, i32 @y
    %dy221 = load i32*, i32* @dy
    %j222 = load i32, i32 @j
    %getElementPtr223 = getelementptr i32, i32* %dy221, i32 %j222
    %GEP_Load224 = load i32, i32* %getElementPtr223
    add225 = add i32 %y220, %GEP_Load224
    %addList_ip0_52=%add219
    %addList_ip1_53=%add225
    %check_ip0_0_i54=%addList_ip0_52
    %N63_i1_i55 = load i32, i32 @N
    %slt64_i2_i56 = icmp slt i32 %check_ip0_0_i54, %N63_i1_i55
    br i1 %slt64_i2_i56, label %andand_b_block8_i1_i24, label %andand_dest_block9_i2_i25

andand_b_block8_i1_i24; preds = %for_body_block33
    %sge66_i3_i57 = icmp sge i32 %check_ip0_0_i54, 0
    br label %andand_dest_block9_i2_i25

andand_dest_block9_i2_i25; preds = %andand_b_block8_i1_i24
    %Andand_67_i4_i58 = phi i1[ false, %for_body_block33], [ %sge66_i3_i57, %andand_b_block8_i1_i24]
    %checkreturn_value61_i5_i59=%Andand_67_i4_i58
    %funccal72_i60=%checkreturn_value61_i5_i59
    br i1 %funccal72_i60, label %andand_b_block14_i28, label %andand_dest_block15_i34

andand_b_block14_i28; preds = %andand_dest_block9_i2_i25
    %check_ip0_6_i61=%addList_ip1_53
    %N63_i7_i62 = load i32, i32 @N
    %slt64_i8_i63 = icmp slt i32 %check_ip0_6_i61, %N63_i7_i62
    br i1 %slt64_i8_i63, label %andand_b_block8_i6_i30, label %andand_dest_block9_i7_i31

andand_b_block8_i6_i30; preds = %andand_b_block14_i28
    %sge66_i9_i64 = icmp sge i32 %check_ip0_6_i61, 0
    br label %andand_dest_block9_i7_i31

andand_dest_block9_i7_i31; preds = %andand_b_block8_i6_i30
    %Andand_67_i10_i65 = phi i1[ false, %andand_b_block14_i28], [ %sge66_i9_i64, %andand_b_block8_i6_i30]
    %checkreturn_value61_i11_i66=%Andand_67_i10_i65
    %funccal74_i67=%checkreturn_value61_i11_i66
    br label %andand_dest_block15_i34

andand_dest_block15_i34; preds = %andand_dest_block9_i7_i31
    %Andand_75_i68 = phi i1[ false, %andand_dest_block9_i2_i25], [ %funccal74_i67, %andand_dest_block9_i7_i31]
    br i1 %Andand_75_i68, label %andand_b_block12_i35, label %andand_dest_block13_i36

andand_b_block12_i35; preds = %andand_dest_block15_i34
    %step76_i69 = load i32**, i32** @step
    %getElementPtr78_i70 = getelementptr i32*, i32** %step76_i69, i32 %addList_ip0_52
    %GEP_Load79_i71 = load i32*, i32** %getElementPtr78_i70
    %getElementPtr81_i72 = getelementptr i32, i32* %GEP_Load79_i71, i32 %addList_ip1_53
    %GEP_Load82_i73 = load i32, i32* %getElementPtr81_i72
    %eq83_i74 = icmp eq i32 %GEP_Load82_i73, -1
    br label %andand_dest_block13_i36

andand_dest_block13_i36; preds = %andand_b_block12_i35
    %Andand_84_i75 = phi i1[ false, %andand_dest_block15_i34], [ %eq83_i74, %andand_b_block12_i35]
    br i1 %Andand_84_i75, label %if_then_block10_i37, label %if_dest_block11_i42

if_then_block10_i37; preds = %andand_dest_block13_i36
    %tail85_i76 = load i32, i32 @tail
    SelfAdd86_i77 = add i32 %tail85_i76, 1
    store pointer is not pointertypei32
    %xlist87_i78 = load i32*, i32* @xlist
    %tail88_i79 = load i32, i32 @tail
    %getElementPtr89_i80 = getelementptr i32, i32* %xlist87_i78, i32 %tail88_i79
    store i32 %addList_ip0_52, i32* %getElementPtr89_i80
    %ylist92_i81 = load i32*, i32* @ylist
    %tail93_i82 = load i32, i32 @tail
    %getElementPtr94_i83 = getelementptr i32, i32* %ylist92_i81, i32 %tail93_i82
    store i32 %addList_ip1_53, i32* %getElementPtr94_i83
    %step97_i84 = load i32**, i32** @step
    %getElementPtr99_i85 = getelementptr i32*, i32** %step97_i84, i32 %addList_ip0_52
    %GEP_Load100_i86 = load i32*, i32** %getElementPtr99_i85
    %getElementPtr102_i87 = getelementptr i32, i32* %GEP_Load100_i86, i32 %addList_ip1_53
    %now104_i88 = load i32, i32 @now
    add105_i89 = add i32 %now104_i88, 1
    store i32 %add105_i89, i32* %getElementPtr102_i87
    %targetx107_i90 = load i32, i32 @targetx
    %eq108_i91 = icmp eq i32 %addList_ip0_52, %targetx107_i90
    br i1 %eq108_i91, label %andand_b_block18_i38, label %andand_dest_block19_i39

andand_b_block18_i38; preds = %if_then_block10_i37
    %targety110_i92 = load i32, i32 @targety
    %eq111_i93 = icmp eq i32 %addList_ip1_53, %targety110_i92
    br label %andand_dest_block19_i39

andand_dest_block19_i39; preds = %andand_b_block18_i38
    %Andand_112_i94 = phi i1[ false, %if_then_block10_i37], [ %eq111_i93, %andand_b_block18_i38]
    br i1 %Andand_112_i94, label %if_then_block16_i40, label %if_dest_block17_i41

if_then_block16_i40; preds = %andand_dest_block19_i39
    store pointer is not pointertypei32
    br label %if_dest_block17_i41

if_dest_block17_i41; preds = %if_then_block16_i40
    br label %if_dest_block11_i42

if_dest_block11_i42; preds = %if_dest_block17_i41
    %j227 = load i32, i32 @j
    SelfAdd228 = add i32 %j227, 1
    store pointer is not pointertypei32
    br label %for_cond_block31

for_dest_block34; preds = %if_dest_block11_i42
    %ok229 = load i32, i32 @ok
    %eq230 = icmp eq i32 %ok229, 1
    br i1 %eq230, label %if_then_block35, label %if_dest_block36

if_then_block35; preds = %for_dest_block34
    br label %while_dest_block30

if_dest_block36; preds = %if_then_block35
    %head231 = load i32, i32 @head
    SelfAdd232 = add i32 %head231, 1
    store pointer is not pointertypei32
    br label %while_cond_block28

while_dest_block30; preds = %if_dest_block36
    %ok233 = load i32, i32 @ok
    %eq234 = icmp eq i32 %ok233, 1
    br i1 %eq234, label %if_then_block37, label %if_else_block38

if_then_block37; preds = %while_dest_block30
    %step235 = load i32**, i32** @step
    %targetx236 = load i32, i32 @targetx
    %getElementPtr237 = getelementptr i32*, i32** %step235, i32 %targetx236
    %GEP_Load238 = load i32*, i32** %getElementPtr237
    %targety239 = load i32, i32 @targety
    %getElementPtr240 = getelementptr i32, i32* %GEP_Load238, i32 %targety239
    %GEP_Load241 = load i32, i32* %getElementPtr240
    %funccal242 = call i8* @toString(i32 %GEP_Load241)
    %funccal243 = call void @println(i8* %funccal242)
    br label %if_dest_block39

if_else_block38; preds = %if_then_block37
    %StringConst244 = getelementptr [13 x i8], [13 x i8]* @const_string_no0, i32 0, i32 0
    %funccal245 = call void @print(i8* %StringConst244)
    br label %if_dest_block39

if_dest_block39; preds = %if_else_block38
    br label %main_return_block

main_return_block; preds = %if_dest_block39
    ret i32 0

}

