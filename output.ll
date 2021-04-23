

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    %call_malloc_func4_i0 = call i8* @malloc(i32 40004)
    store i32 10000, i32* %call_malloc_func4_i0
    %call_array_head5_i1 = getelementptr i32, i32* %call_malloc_func4_i0, i32 1
    call_array_head_cast_6_i2 = bitcast i32* %call_array_head5_i1 to i32*
    br label %for_cond_block0_i4

for_cond_block0_i4; preds = %__init___entrance_block_i0
    %i|addr71_i3 = phi i32[ 0, %__init___entrance_block_i0], [ %SelfAdd46_i4, %for_dest_block7_i14]
    %slt13_i5 = icmp slt i32 %i|addr71_i3, 10
    br i1 %slt13_i5, label %for_body_block2_i5, label %for_dest_block3_i15

for_body_block2_i5; preds = %for_cond_block0_i4
    mul25_i15 = mul i32 %i|addr71_i3, 1000
    br label %for_cond_block4_i6

for_cond_block4_i6; preds = %for_body_block2_i5
    %j|addr84_i6 = phi i32[ 0, %for_body_block2_i5], [ %SelfAdd44_i7, %for_dest_block11_i13]
    %slt16_i8 = icmp slt i32 %j|addr84_i6, 10
    br i1 %slt16_i8, label %for_body_block6_i7, label %for_dest_block7_i14

for_body_block6_i7; preds = %for_cond_block4_i6
    mul27_i16 = mul i32 %j|addr84_i6, 100
    add28_i17 = add i32 %mul25_i15, %mul27_i16
    br label %for_cond_block8_i8

for_cond_block8_i8; preds = %for_body_block6_i7
    %k|addr99_i9 = phi i32[ 0, %for_body_block6_i7], [ %SelfAdd42_i10, %for_dest_block15_i12]
    %slt19_i11 = icmp slt i32 %k|addr99_i9, 10
    br i1 %slt19_i11, label %for_body_block10_i9, label %for_dest_block11_i13

for_body_block10_i9; preds = %for_cond_block8_i8
    mul30_i18 = mul i32 %k|addr99_i9, 10
    add31_i19 = add i32 %add28_i17, %mul30_i18
    br label %for_cond_block12_i10

for_cond_block12_i10; preds = %for_body_block10_i9
    %l|addr1013_i12 = phi i32[ 0, %for_body_block10_i9], [ %SelfAdd40_i13, %for_body_block14_i11]
    %slt22_i14 = icmp slt i32 %l|addr1013_i12, 10
    br i1 %slt22_i14, label %for_body_block14_i11, label %for_dest_block15_i12

for_body_block14_i11; preds = %for_cond_block12_i10
    add33_i20 = add i32 %add31_i19, %l|addr1013_i12
    %getElementPtr34_i21 = getelementptr i32, i32* %call_array_head_cast_6_i2, i32 %add33_i20
    add38_i22 = add i32 %i|addr71_i3, %l|addr1013_i12
    store i32 %add38_i22, i32* %getElementPtr34_i21
    SelfAdd40_i13 = add i32 %l|addr1013_i12, 1
    br label %for_cond_block12_i10

for_dest_block15_i12; preds = %for_body_block14_i11
    SelfAdd42_i10 = add i32 %k|addr99_i9, 1
    br label %for_cond_block8_i8

for_dest_block11_i13; preds = %for_dest_block15_i12
    SelfAdd44_i7 = add i32 %j|addr84_i6, 1
    br label %for_cond_block4_i6

for_dest_block7_i14; preds = %for_dest_block11_i13
    SelfAdd46_i4 = add i32 %i|addr71_i3, 1
    br label %for_cond_block0_i4

for_dest_block3_i15; preds = %for_dest_block7_i14
    br label %for_cond_block16_i16

for_cond_block16_i16; preds = %for_dest_block3_i15
    %i|addr70_i23 = phi i32[ 0, %for_dest_block3_i15], [ %SelfAdd102_i24, %for_dest_block23_i29]
    %sum|addr4724_i25 = phi i32[ 0, %for_dest_block3_i15], [ %sum|addr4723_i26, %for_dest_block23_i29]
    %slt50_i27 = icmp slt i32 %i|addr70_i23, 10
    br i1 %slt50_i27, label %for_body_block18_i17, label %for_dest_block19_i30

for_body_block18_i17; preds = %for_cond_block16_i16
    mul83_i51 = mul i32 %i|addr70_i23, 1000
    br label %for_cond_block20_i18

for_cond_block20_i18; preds = %for_body_block18_i17
    %j|addr82_i28 = phi i32[ 0, %for_body_block18_i17], [ %SelfAdd100_i29, %for_dest_block27_i28]
    %sum|addr4723_i26 = phi i32[ %sum|addr4724_i25, %for_body_block18_i17], [ %sum|addr4722_i30, %for_dest_block27_i28]
    %slt53_i31 = icmp slt i32 %j|addr82_i28, 10
    br i1 %slt53_i31, label %for_body_block22_i19, label %for_dest_block23_i29

for_body_block22_i19; preds = %for_cond_block20_i18
    mul85_i52 = mul i32 %j|addr82_i28, 100
    add86_i53 = add i32 %mul83_i51, %mul85_i52
    br label %for_cond_block24_i20

for_cond_block24_i20; preds = %for_body_block22_i19
    %k|addr96_i32 = phi i32[ 0, %for_body_block22_i19], [ %SelfAdd98_i33, %for_dest_block31_i27]
    %sum|addr4722_i30 = phi i32[ %sum|addr4723_i26, %for_body_block22_i19], [ %sum|addr4721_i34, %for_dest_block31_i27]
    %slt56_i35 = icmp slt i32 %k|addr96_i32, 10
    br i1 %slt56_i35, label %for_body_block26_i21, label %for_dest_block27_i28

for_body_block26_i21; preds = %for_cond_block24_i20
    mul88_i54 = mul i32 %k|addr96_i32, 10
    add73_i46 = add i32 %add86_i53, %mul88_i54
    br label %for_cond_block28_i22

for_cond_block28_i22; preds = %for_body_block26_i21
    %l|addr1015_i36 = phi i32[ 0, %for_body_block26_i21], [ %SelfAdd96_i37, %if_dest_block34_i26]
    %sum|addr4721_i34 = phi i32[ %sum|addr4722_i30, %for_body_block26_i21], [ %sum|addr4720_i38, %if_dest_block34_i26]
    %slt59_i39 = icmp slt i32 %l|addr1015_i36, 10
    br i1 %slt59_i39, label %for_body_block30_i23, label %for_dest_block31_i27

for_body_block30_i23; preds = %for_cond_block28_i22
    and61_i40 = and i32 %l|addr1015_i36, 1
    %eq62_i41 = icmp eq i32 %and61_i40, 1
    br i1 %eq62_i41, label %if_then_block32_i24, label %if_else_block33_i25

if_then_block32_i24; preds = %for_body_block30_i23
    add75_i47 = add i32 %add73_i46, %l|addr1015_i36
    %getElementPtr76_i48 = getelementptr i32, i32* %call_array_head_cast_6_i2, i32 %add75_i47
    %GEP_Load77_i49 = load i32, i32* %getElementPtr76_i48
    add78_i50 = add i32 %sum|addr4721_i34, %GEP_Load77_i49
    br label %if_dest_block34_i26

if_else_block33_i25; preds = %if_then_block32_i24
    add91_i56 = add i32 %add73_i46, %l|addr1015_i36
    %getElementPtr92_i57 = getelementptr i32, i32* %call_array_head_cast_6_i2, i32 %add91_i56
    %GEP_Load93_i58 = load i32, i32* %getElementPtr92_i57
    sub94_i59 = sub i32 %sum|addr4721_i34, %GEP_Load93_i58
    br label %if_dest_block34_i26

if_dest_block34_i26; preds = %if_else_block33_i25
    %sum|addr4720_i38 = phi i32[ %add78_i50, %if_then_block32_i24], [ %sub94_i59, %if_else_block33_i25]
    SelfAdd96_i37 = add i32 %l|addr1015_i36, 1
    br label %for_cond_block28_i22

for_dest_block31_i27; preds = %if_dest_block34_i26
    SelfAdd98_i33 = add i32 %k|addr96_i32, 1
    br label %for_cond_block24_i20

for_dest_block27_i28; preds = %for_dest_block31_i27
    SelfAdd100_i29 = add i32 %j|addr82_i28, 1
    br label %for_cond_block20_i18

for_dest_block23_i29; preds = %for_dest_block27_i28
    SelfAdd102_i24 = add i32 %i|addr70_i23, 1
    br label %for_cond_block16_i16

for_dest_block19_i30; preds = %for_dest_block23_i29
    %testreturn_value0_i60=%sum|addr4724_i25
    %funccal105=%testreturn_value0_i60
    ashr106 = xor i32 %funccal105, 5000
    %mainreturn_value104=%ashr106
    br label %main_return_block

main_return_block; preds = %for_dest_block19_i30
    ret i32 %mainreturn_value104

}

