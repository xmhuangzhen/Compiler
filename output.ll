
@c
@ans
@visit
@pre
@f
@i
@j
@open
@closed

define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter : i32  @origin(i32)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    store pointer is not pointertypei32
    %call_malloc_func2 = call i8* @malloc(i32 444)
    store i32 110, i32* %call_malloc_func2
    %call_array_head3 = getelementptr i32, i32* %call_malloc_func2, i32 1
    call_array_head_cast_4 = bitcast i32* %call_array_head3 to i32*
    store i32 %call_array_head_cast_4, i32* @visit
    %call_malloc_func7 = call i8* @malloc(i32 444)
    store i32 110, i32* %call_malloc_func7
    %call_array_head8 = getelementptr i32, i32* %call_malloc_func7, i32 1
    call_array_head_cast_9 = bitcast i32* %call_array_head8 to i32*
    store i32 %call_array_head_cast_9, i32* @pre
    %call_malloc_func12 = call i8* @malloc(i32 444)
    store i32 110, i32* %call_malloc_func12
    %call_array_head13 = getelementptr i32, i32* %call_malloc_func12, i32 1
    call_array_head_cast_14 = bitcast i32* %call_array_head13 to i32*
    store i32 %call_array_head_cast_14, i32* @f
    br label %__init___return_block

__init___return_block; preds = %__init___entrance_block
    ret void

}

define ReturnType : void
Parameter : i32  @origin(i32){
origin_entrance_block    call_size_119 = mul i32 %N, 4
    call_size_220 = add i32 %call_size_119, 4
    %call_malloc_func21 = call i8* @malloc(i32 %call_size_220)
    store i32 %N, i32* %call_malloc_func21
    %call_array_head22 = getelementptr i32, i32* %call_malloc_func21, i32 1
    call_array_head_cast_23 = bitcast i32* %call_array_head22 to i32*
    store i32* %call_array_head_cast_23, i32** @c
    store pointer is not pointertypei32
    br label %for_cond_block0

for_cond_block0; preds = %origin_entrance_block
    %i25 = load i32, i32 @i
    %slt27 = icmp slt i32 %i25, %N
    br i1 %slt27, label %for_body_block2, label %for_dest_block3

for_body_block2; preds = %for_cond_block0
    %c28 = load i32**, i32** @c
    %i29 = load i32, i32 @i
    %getElementPtr30 = getelementptr i32*, i32** %c28, i32 %i29
    call_size_133 = mul i32 %N, 4
    call_size_234 = add i32 %call_size_133, 4
    %call_malloc_func35 = call i8* @malloc(i32 %call_size_234)
    store i32 %N, i32* %call_malloc_func35
    %call_array_head36 = getelementptr i32, i32* %call_malloc_func35, i32 1
    call_array_head_cast_37 = bitcast i32* %call_array_head36 to i32*
    store i32* %call_array_head_cast_37, i32** %getElementPtr30
    store pointer is not pointertypei32
    br label %for_cond_block4

for_cond_block4; preds = %for_body_block2
    %j39 = load i32, i32 @j
    %slt41 = icmp slt i32 %j39, %N
    br i1 %slt41, label %for_body_block6, label %for_dest_block7

for_body_block6; preds = %for_cond_block4
    %c42 = load i32**, i32** @c
    %i43 = load i32, i32 @i
    %getElementPtr44 = getelementptr i32*, i32** %c42, i32 %i43
    %GEP_Load45 = load i32*, i32** %getElementPtr44
    %j46 = load i32, i32 @j
    %getElementPtr47 = getelementptr i32, i32* %GEP_Load45, i32 %j46
    store i32 0, i32* %getElementPtr47
    br label %for_step_block5

for_step_block5; preds = %for_body_block6
    %j49 = load i32, i32 @j
    SelfAdd50 = add i32 %j49, 1
    store pointer is not pointertypei32
    br label %for_cond_block4

for_dest_block7; preds = %for_step_block5
    br label %for_step_block1

for_step_block1; preds = %for_dest_block7
    %i51 = load i32, i32 @i
    SelfAdd52 = add i32 %i51, 1
    store pointer is not pointertypei32
    br label %for_cond_block0

for_dest_block3; preds = %for_step_block1
    br label %origin_return_block

origin_return_block; preds = %for_dest_block3
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    call void @__init__()
    %funccal218 = call void @origin(i32 110)
    br label %build_entrance_block_i0

build_entrance_block_i0; preds = %main_entrance_block
    %build_ip0_0=99
    %build_ip1_1=100
    store pointer is not pointertypei32
    br label %for_cond_block8_i1

for_cond_block8_i1; preds = %build_entrance_block_i0
    %i57_i2 = load i32, i32 @i
    %sle58_i3 = icmp sle i32 %i57_i2, 49
    br i1 %sle58_i3, label %for_body_block10_i2, label %for_dest_block11_i8

for_body_block10_i2; preds = %for_cond_block8_i1
    store pointer is not pointertypei32
    br label %for_cond_block12_i3

for_cond_block12_i3; preds = %for_body_block10_i2
    %j60_i4 = load i32, i32 @j
    %i61_i5 = load i32, i32 @i
    add63_i7 = sub i32 99, %i61_i5
    %sle64_i8 = icmp sle i32 %j60_i4, %add63_i7
    br i1 %sle64_i8, label %for_body_block14_i4, label %for_dest_block15_i6

for_body_block14_i4; preds = %for_cond_block12_i3
    %c65_i9 = load i32**, i32** @c
    %i66_i10 = load i32, i32 @i
    %getElementPtr67_i11 = getelementptr i32*, i32** %c65_i9, i32 %i66_i10
    %GEP_Load68_i12 = load i32*, i32** %getElementPtr67_i11
    %j69_i13 = load i32, i32 @j
    %getElementPtr70_i14 = getelementptr i32, i32* %GEP_Load68_i12, i32 %j69_i13
    store i32 1, i32* %getElementPtr70_i14
    br label %for_step_block13_i5

for_step_block13_i5; preds = %for_body_block14_i4
    %j72_i15 = load i32, i32 @j
    SelfAdd73_i16 = add i32 %j72_i15, 1
    store pointer is not pointertypei32
    br label %for_cond_block12_i3

for_dest_block15_i6; preds = %for_step_block13_i5
    br label %for_step_block9_i7

for_step_block9_i7; preds = %for_dest_block15_i6
    %i74_i17 = load i32, i32 @i
    SelfAdd75_i18 = add i32 %i74_i17, 1
    store pointer is not pointertypei32
    br label %for_cond_block8_i1

for_dest_block11_i8; preds = %for_step_block9_i7
    store pointer is not pointertypei32
    br label %for_cond_block16_i9

for_cond_block16_i9; preds = %for_dest_block11_i8
    %i77_i19 = load i32, i32 @i
    %sle78_i20 = icmp sle i32 %i77_i19, 49
    br i1 %sle78_i20, label %for_body_block18_i10, label %for_dest_block19_i12

for_body_block18_i10; preds = %for_cond_block16_i9
    %c79_i21 = load i32**, i32** @c
    %getElementPtr81_i22 = getelementptr i32*, i32** %c79_i21, i32 %build_ip0_0
    %GEP_Load82_i23 = load i32*, i32** %getElementPtr81_i22
    %i83_i24 = load i32, i32 @i
    %getElementPtr84_i25 = getelementptr i32, i32* %GEP_Load82_i23, i32 %i83_i24
    store i32 1, i32* %getElementPtr84_i25
    br label %for_step_block17_i11

for_step_block17_i11; preds = %for_body_block18_i10
    %i86_i26 = load i32, i32 @i
    SelfAdd87_i27 = add i32 %i86_i26, 1
    store pointer is not pointertypei32
    br label %for_cond_block16_i9

for_dest_block19_i12; preds = %for_step_block17_i11
    store pointer is not pointertypei32
    br label %for_cond_block20_i13

for_cond_block20_i13; preds = %for_dest_block19_i12
    %i89_i28 = load i32, i32 @i
    %sle90_i29 = icmp sle i32 %i89_i28, 98
    br i1 %sle90_i29, label %for_body_block22_i14, label %for_dest_block23_i16

for_body_block22_i14; preds = %for_cond_block20_i13
    %c91_i30 = load i32**, i32** @c
    %i92_i31 = load i32, i32 @i
    %getElementPtr93_i32 = getelementptr i32*, i32** %c91_i30, i32 %i92_i31
    %GEP_Load94_i33 = load i32*, i32** %getElementPtr93_i32
    %getElementPtr96_i34 = getelementptr i32, i32* %GEP_Load94_i33, i32 %build_ip1_1
    store i32 1, i32* %getElementPtr96_i34
    br label %for_step_block21_i15

for_step_block21_i15; preds = %for_body_block22_i14
    %i98_i35 = load i32, i32 @i
    SelfAdd99_i36 = add i32 %i98_i35, 1
    store pointer is not pointertypei32
    br label %for_cond_block20_i13

for_dest_block23_i16; preds = %for_step_block21_i15
    br label %while_cond_block46

while_cond_block46; preds = %for_dest_block23_i16
    br label %find_entrance_block_i19

find_entrance_block_i19; preds = %while_cond_block46
    %find_ip0_38=100
    %find_ip1_39=99
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    br label %for_cond_block24_i20

for_cond_block24_i20; preds = %find_entrance_block_i19
    %i107_i41 = load i32, i32 @i
    %sle109_i42 = icmp sle i32 %i107_i41, %find_ip0_38
    br i1 %sle109_i42, label %for_body_block26_i21, label %for_dest_block27_i23

for_body_block26_i21; preds = %for_cond_block24_i20
    %visit110_i43 = load i32*, i32* @visit
    %i111_i44 = load i32, i32 @i
    %getElementPtr112_i45 = getelementptr i32, i32* %visit110_i43, i32 %i111_i44
    store i32 0, i32* %getElementPtr112_i45
    br label %for_step_block25_i22

for_step_block25_i22; preds = %for_body_block26_i21
    %i114_i46 = load i32, i32 @i
    SelfAdd115_i47 = add i32 %i114_i46, 1
    store pointer is not pointertypei32
    br label %for_cond_block24_i20

for_dest_block27_i23; preds = %for_step_block25_i22
    %f116_i48 = load i32*, i32* @f
    %getElementPtr117_i49 = getelementptr i32, i32* %f116_i48, i32 1
    store i32 %find_ip1_39, i32* %getElementPtr117_i49
    %visit120_i50 = load i32*, i32* @visit
    %getElementPtr122_i51 = getelementptr i32, i32* %visit120_i50, i32 %find_ip1_39
    store i32 1, i32* %getElementPtr122_i51
    %pre124_i52 = load i32*, i32* @pre
    %getElementPtr126_i53 = getelementptr i32, i32* %pre124_i52, i32 %find_ip1_39
    store i32 0, i32* %getElementPtr126_i53
    br label %while_cond_block28_i24

while_cond_block28_i24; preds = %for_dest_block27_i23
    %flag|addr1023_i54 = phi i32[ 0, %for_dest_block27_i23], [ %flag|addr1022_i55, %for_dest_block36_i37]
    %open129_i56 = load i32, i32 @open
    %closed130_i57 = load i32, i32 @closed
    %slt131_i58 = icmp slt i32 %open129_i56, %closed130_i57
    br i1 %slt131_i58, label %andand_b_block31_i25, label %andand_dest_block32_i26

andand_b_block31_i25; preds = %while_cond_block28_i24
    %eq133_i59 = icmp eq i32 %flag|addr1023_i54, 0
    br label %andand_dest_block32_i26

andand_dest_block32_i26; preds = %andand_b_block31_i25
    Andand_134_i60 = and i1 %slt131_i58, %eq133_i59
    br i1 %Andand_134_i60, label %while_body_block29_i27, label %while_dest_block30_i38

while_body_block29_i27; preds = %andand_dest_block32_i26
    %open135_i61 = load i32, i32 @open
    SelfAdd136_i62 = add i32 %open135_i61, 1
    store pointer is not pointertypei32
    %f138_i63 = load i32*, i32* @f
    %open139_i64 = load i32, i32 @open
    %getElementPtr140_i65 = getelementptr i32, i32* %f138_i63, i32 %open139_i64
    %GEP_Load141_i66 = load i32, i32* %getElementPtr140_i65
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    br label %for_cond_block33_i28

for_cond_block33_i28; preds = %while_body_block29_i27
    %flag|addr1022_i55 = phi i32[ %flag|addr1023_i54, %while_body_block29_i27], [ %flag|addr1021_i67, %for_step_block34_i36]
    %j143_i68 = load i32, i32 @j
    %sle145_i69 = icmp sle i32 %j143_i68, %find_ip0_38
    br i1 %sle145_i69, label %for_body_block35_i29, label %for_dest_block36_i37

for_body_block35_i29; preds = %for_cond_block33_i28
    %c146_i70 = load i32**, i32** @c
    %i147_i71 = load i32, i32 @i
    %getElementPtr148_i72 = getelementptr i32*, i32** %c146_i70, i32 %i147_i71
    %GEP_Load149_i73 = load i32*, i32** %getElementPtr148_i72
    %j150_i74 = load i32, i32 @j
    %getElementPtr151_i75 = getelementptr i32, i32* %GEP_Load149_i73, i32 %j150_i74
    %GEP_Load152_i76 = load i32, i32* %getElementPtr151_i75
    %sgt153_i77 = icmp sgt i32 %GEP_Load152_i76, 0
    br i1 %sgt153_i77, label %andand_b_block39_i30, label %andand_dest_block40_i31

andand_b_block39_i30; preds = %for_body_block35_i29
    %visit154_i78 = load i32*, i32* @visit
    %j155_i79 = load i32, i32 @j
    %getElementPtr156_i80 = getelementptr i32, i32* %visit154_i78, i32 %j155_i79
    %GEP_Load157_i81 = load i32, i32* %getElementPtr156_i80
    %eq158_i82 = icmp eq i32 %GEP_Load157_i81, 0
    br label %andand_dest_block40_i31

andand_dest_block40_i31; preds = %andand_b_block39_i30
    Andand_159_i83 = and i1 %sgt153_i77, %eq158_i82
    br i1 %Andand_159_i83, label %if_then_block37_i32, label %if_dest_block38_i35

if_then_block37_i32; preds = %andand_dest_block40_i31
    %visit160_i84 = load i32*, i32* @visit
    %j161_i85 = load i32, i32 @j
    %getElementPtr162_i86 = getelementptr i32, i32* %visit160_i84, i32 %j161_i85
    store i32 1, i32* %getElementPtr162_i86
    %closed164_i87 = load i32, i32 @closed
    SelfAdd165_i88 = add i32 %closed164_i87, 1
    store pointer is not pointertypei32
    %f166_i89 = load i32*, i32* @f
    %closed167_i90 = load i32, i32 @closed
    %getElementPtr168_i91 = getelementptr i32, i32* %f166_i89, i32 %closed167_i90
    %j170_i92 = load i32, i32 @j
    store i32 %j170_i92, i32* %getElementPtr168_i91
    %pre171_i93 = load i32*, i32* @pre
    %j172_i94 = load i32, i32 @j
    %getElementPtr173_i95 = getelementptr i32, i32* %pre171_i93, i32 %j172_i94
    %i175_i96 = load i32, i32 @i
    store i32 %i175_i96, i32* %getElementPtr173_i95
    %closed176_i97 = load i32, i32 @closed
    %eq178_i98 = icmp eq i32 %closed176_i97, %find_ip0_38
    br i1 %eq178_i98, label %if_then_block41_i33, label %if_dest_block42_i34

if_then_block41_i33; preds = %if_then_block37_i32
    br label %if_dest_block42_i34

if_dest_block42_i34; preds = %if_then_block41_i33
    %flag|addr1020_i99 = phi i32[ 1, %if_then_block41_i33], [ %flag|addr1022_i55, %if_then_block37_i32]
    br label %if_dest_block38_i35

if_dest_block38_i35; preds = %if_dest_block42_i34
    %flag|addr1021_i67 = phi i32[ %flag|addr1020_i99, %if_dest_block42_i34], [ %flag|addr1022_i55, %andand_dest_block40_i31]
    br label %for_step_block34_i36

for_step_block34_i36; preds = %if_dest_block38_i35
    %j180_i100 = load i32, i32 @j
    SelfAdd181_i101 = add i32 %j180_i100, 1
    store pointer is not pointertypei32
    br label %for_cond_block33_i28

for_dest_block36_i37; preds = %for_step_block34_i36
    br label %while_cond_block28_i24

while_dest_block30_i38; preds = %for_dest_block36_i37
    %findreturn_value103_i102=%flag|addr1023_i54
    br label %while_cond_block46_AB_40

while_cond_block46_AB_40; preds = %while_dest_block30_i38
    %funccal234=%findreturn_value103_i102
    %sgt235 = icmp sgt i32 %funccal234, 0
    br i1 %sgt235, label %while_body_block47, label %while_dest_block48

while_body_block47; preds = %while_cond_block46_AB_40
    br label %improve_entrance_block_i41

improve_entrance_block_i41; preds = %while_body_block47
    %improve_ip0_103=100
    store pointer is not pointertypei32
    %ans187_i104 = load i32, i32 @ans
    SelfAdd188_i105 = add i32 %ans187_i104, 1
    store pointer is not pointertypei32
    br label %while_cond_block43_i42

while_cond_block43_i42; preds = %improve_entrance_block_i41
    %pre189_i106 = load i32*, i32* @pre
    %i190_i107 = load i32, i32 @i
    %getElementPtr191_i108 = getelementptr i32, i32* %pre189_i106, i32 %i190_i107
    %GEP_Load192_i109 = load i32, i32* %getElementPtr191_i108
    %sgt193_i110 = icmp sgt i32 %GEP_Load192_i109, 0
    br i1 %sgt193_i110, label %while_body_block44_i43, label %while_dest_block45_i44

while_body_block44_i43; preds = %while_cond_block43_i42
    %pre195_i111 = load i32*, i32* @pre
    %i196_i112 = load i32, i32 @i
    %getElementPtr197_i113 = getelementptr i32, i32* %pre195_i111, i32 %i196_i112
    %GEP_Load198_i114 = load i32, i32* %getElementPtr197_i113
    store pointer is not pointertypei32
    %c199_i115 = load i32**, i32** @c
    %j200_i116 = load i32, i32 @j
    %getElementPtr201_i117 = getelementptr i32*, i32** %c199_i115, i32 %j200_i116
    %GEP_Load202_i118 = load i32*, i32** %getElementPtr201_i117
    %i203_i119 = load i32, i32 @i
    %getElementPtr204_i120 = getelementptr i32, i32* %GEP_Load202_i118, i32 %i203_i119
    %GEP_Load205_i121 = load i32, i32* %getElementPtr204_i120
    SelfSub206_i122 = sub i32 %GEP_Load205_i121, 1
    store i32 %SelfSub206_i122, i32* %getElementPtr204_i120
    %c207_i123 = load i32**, i32** @c
    %i208_i124 = load i32, i32 @i
    %getElementPtr209_i125 = getelementptr i32*, i32** %c207_i123, i32 %i208_i124
    %GEP_Load210_i126 = load i32*, i32** %getElementPtr209_i125
    %j211_i127 = load i32, i32 @j
    %getElementPtr212_i128 = getelementptr i32, i32* %GEP_Load210_i126, i32 %j211_i127
    %GEP_Load213_i129 = load i32, i32* %getElementPtr212_i128
    SelfAdd214_i130 = add i32 %GEP_Load213_i129, 1
    store i32 %SelfAdd214_i130, i32* %getElementPtr212_i128
    %j216_i131 = load i32, i32 @j
    store pointer is not pointertypei32
    br label %while_cond_block43_i42

while_dest_block45_i44; preds = %while_body_block44_i43
    br label %while_body_block47_AB_46

while_body_block47_AB_46; preds = %while_dest_block45_i44
    br label %while_cond_block46

while_dest_block48; preds = %while_body_block47_AB_46
    %ans238 = load i32, i32 @ans
    %mainreturn_value217=%ans238
    br label %main_return_block

main_return_block; preds = %while_dest_block48
    ret i32 %mainreturn_value217

}

