vector

@const_string_no0
@const_string_no1
@const_string_no2
@const_string_no3
@const_string_no4
@const_string_no5
@const_string_no6
@const_string_no7
@const_string_no8

define ReturnType : void
Parameter : vector i32*  @vector.init(vector*, i32*)
define ReturnType : vector*
Parameter : vector vector*  @vector.add(vector*, vector*)
define ReturnType : i8*
Parameter : vector  @vector.tostring(vector*)
define ReturnType : i1
Parameter : vector vector*  @vector.copy(vector*, vector*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter : vector i32*  @vector.init(vector*, i32*){
vector.init_entrance_block    %eq4 = icmp eq i32 %vec, null
    br i1 %eq4, label %if_then_block0, label %if_dest_block1

if_then_block0; preds = %vector.init_entrance_block
    br label %vector.init_return_block

if_dest_block1; preds = %if_then_block0
    %Id_GEP_6 = getelementptr vector, vector* %this, i32 0, i32 0
    %array_size9 = getelementptr i32, i32* %vec, i32 -1
    %array_size_load10 = load i32, i32* %array_size9
    call_size_111 = mul i32 %array_size_load10, 4
    call_size_212 = add i32 %call_size_111, 4
    %call_malloc_func13 = call i8* @malloc(i32 %call_size_212)
    store i32 %array_size_load10, i32* %call_malloc_func13
    %call_array_head14 = getelementptr i32, i32* %call_malloc_func13, i32 1
    call_array_head_cast_15 = bitcast i32* %call_array_head14 to i32*
    store i32* %call_array_head_cast_15, i32** %Id_GEP_6
    br label %for_cond_block2

for_cond_block2; preds = %if_dest_block1
    %i|addr160 = phi i32[ 0, %if_dest_block1], [ %PreAdd34, %for_body_block4]
    %array_size20 = getelementptr i32, i32* %vec, i32 -1
    %array_size_load21 = load i32, i32* %array_size20
    %slt22 = icmp slt i32 %i|addr160, %array_size_load21
    br i1 %slt22, label %for_body_block4, label %for_dest_block5

for_body_block4; preds = %for_cond_block2
    %Id_GEP_24 = getelementptr vector, vector* %this, i32 0, i32 0
    %Id_GEP_Load25 = load i32*, i32** %Id_GEP_24
    %getElementPtr27 = getelementptr i32, i32* %Id_GEP_Load25, i32 %i|addr160
    %getElementPtr31 = getelementptr i32, i32* %vec, i32 %i|addr160
    %GEP_Load32 = load i32, i32* %getElementPtr31
    store i32 %GEP_Load32, i32* %getElementPtr27
    PreAdd34 = add i32 %i|addr160, 1
    br label %for_cond_block2

for_dest_block5; preds = %for_body_block4
    br label %vector.init_return_block

vector.init_return_block; preds = %for_dest_block5
    ret void

}

define ReturnType : vector*
Parameter : vector vector*  @vector.add(vector*, vector*){
vector.add_entrance_block    br label %vector.getDim_entrance_block_i10

vector.getDim_entrance_block_i10; preds = %vector.add_entrance_block
    %vector.getDim_ip0_18=%this
    %Id_GEP_38_i19 = getelementptr vector, vector* %vector.getDim_ip0_18, i32 0, i32 0
    %Id_GEP_Load39_i20 = load i32*, i32** %Id_GEP_38_i19
    %eq40_i21 = icmp eq i32 %Id_GEP_Load39_i20, null
    br i1 %eq40_i21, label %if_then_block6_i11, label %if_dest_block7_i12

if_then_block6_i11; preds = %vector.getDim_entrance_block_i10
    %vector.getDimreturn_value36_i22=0
    br label %vector.getDim_return_block_i13

if_dest_block7_i12; preds = %if_then_block6_i11
    %Id_GEP_42_i23 = getelementptr vector, vector* %vector.getDim_ip0_18, i32 0, i32 0
    %Id_GEP_Load43_i24 = load i32*, i32** %Id_GEP_42_i23
    %array_size44_i25 = getelementptr i32, i32* %Id_GEP_Load43_i24, i32 -1
    %array_size_load45_i26 = load i32, i32* %array_size44_i25
    %vector.getDimreturn_value36_i22=%array_size_load45_i26
    br label %vector.getDim_return_block_i13

vector.getDim_return_block_i13; preds = %if_dest_block7_i12
    %funccal105=%vector.getDimreturn_value36_i22
    %vector.getDim_ip0_27=%rhs
    %Id_GEP_38_i28 = getelementptr vector, vector* %vector.getDim_ip0_27, i32 0, i32 0
    %Id_GEP_Load39_i29 = load i32*, i32** %Id_GEP_38_i28
    %eq40_i30 = icmp eq i32 %Id_GEP_Load39_i29, null
    br i1 %eq40_i30, label %if_then_block6_i16, label %if_dest_block7_i17

if_then_block6_i16; preds = %vector.getDim_return_block_i13
    %vector.getDimreturn_value36_i31=0
    br label %vector.getDim_return_block_i18

if_dest_block7_i17; preds = %if_then_block6_i16
    %Id_GEP_42_i32 = getelementptr vector, vector* %vector.getDim_ip0_27, i32 0, i32 0
    %Id_GEP_Load43_i33 = load i32*, i32** %Id_GEP_42_i32
    %array_size44_i34 = getelementptr i32, i32* %Id_GEP_Load43_i33, i32 -1
    %array_size_load45_i35 = load i32, i32* %array_size44_i34
    %vector.getDimreturn_value36_i31=%array_size_load45_i35
    br label %vector.getDim_return_block_i18

vector.getDim_return_block_i18; preds = %if_dest_block7_i17
    %funccal108=%vector.getDimreturn_value36_i31
    %ne109 = icmp ne i32 %funccal105, %funccal108
    br i1 %ne109, label %oror_dest_block20, label %oror_b_block19

oror_b_block19; preds = %vector.getDim_return_block_i18
    %vector.getDim_ip0_36=%this
    %Id_GEP_38_i37 = getelementptr vector, vector* %vector.getDim_ip0_36, i32 0, i32 0
    %Id_GEP_Load39_i38 = load i32*, i32** %Id_GEP_38_i37
    %eq40_i39 = icmp eq i32 %Id_GEP_Load39_i38, null
    br i1 %eq40_i39, label %if_then_block6_i21, label %if_dest_block7_i22

if_then_block6_i21; preds = %oror_b_block19
    %vector.getDimreturn_value36_i40=0
    br label %vector.getDim_return_block_i23

if_dest_block7_i22; preds = %if_then_block6_i21
    %Id_GEP_42_i41 = getelementptr vector, vector* %vector.getDim_ip0_36, i32 0, i32 0
    %Id_GEP_Load43_i42 = load i32*, i32** %Id_GEP_42_i41
    %array_size44_i43 = getelementptr i32, i32* %Id_GEP_Load43_i42, i32 -1
    %array_size_load45_i44 = load i32, i32* %array_size44_i43
    %vector.getDimreturn_value36_i40=%array_size_load45_i44
    br label %vector.getDim_return_block_i23

vector.getDim_return_block_i23; preds = %if_dest_block7_i22
    %funccal110=%vector.getDimreturn_value36_i40
    %eq112 = icmp eq i32 %funccal110, 0
    br label %oror_dest_block20

oror_dest_block20; preds = %vector.getDim_return_block_i23
    Oror_113 = or i1 %ne109, %eq112
    br i1 %Oror_113, label %if_then_block17, label %if_dest_block18

if_then_block17; preds = %oror_dest_block20
    %vector.addreturn_value104=null
    br label %vector.add_return_block

if_dest_block18; preds = %if_then_block17
    %Malloc_Result115 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_116 = bitcast i32* %Malloc_Result115 to vector*
    %memacc_result119 = getelementptr vector, vector* %Malloc_Cast_Result_116, i32 0, i32 0
    %vector.getDim_ip0_45=%this
    %Id_GEP_38_i46 = getelementptr vector, vector* %vector.getDim_ip0_45, i32 0, i32 0
    %Id_GEP_Load39_i47 = load i32*, i32** %Id_GEP_38_i46
    %eq40_i48 = icmp eq i32 %Id_GEP_Load39_i47, null
    br i1 %eq40_i48, label %if_then_block6_i26, label %if_dest_block7_i27

if_then_block6_i26; preds = %if_dest_block18
    %vector.getDimreturn_value36_i49=0
    br label %vector.getDim_return_block_i28

if_dest_block7_i27; preds = %if_then_block6_i26
    %Id_GEP_42_i50 = getelementptr vector, vector* %vector.getDim_ip0_45, i32 0, i32 0
    %Id_GEP_Load43_i51 = load i32*, i32** %Id_GEP_42_i50
    %array_size44_i52 = getelementptr i32, i32* %Id_GEP_Load43_i51, i32 -1
    %array_size_load45_i53 = load i32, i32* %array_size44_i52
    %vector.getDimreturn_value36_i49=%array_size_load45_i53
    br label %vector.getDim_return_block_i28

vector.getDim_return_block_i28; preds = %if_dest_block7_i27
    %funccal121=%vector.getDimreturn_value36_i49
    call_size_1123 = mul i32 %funccal121, 4
    call_size_2124 = add i32 %call_size_1123, 4
    %call_malloc_func125 = call i8* @malloc(i32 %call_size_2124)
    store i32 %funccal121, i32* %call_malloc_func125
    %call_array_head126 = getelementptr i32, i32* %call_malloc_func125, i32 1
    call_array_head_cast_127 = bitcast i32* %call_array_head126 to i32*
    store i32* %call_array_head_cast_127, i32** %memacc_result119
    br label %for_cond_block21

for_cond_block21; preds = %vector.getDim_return_block_i28
    %i|addr1177 = phi i32[ 0, %vector.getDim_return_block_i28], [ %PreAdd153, %for_body_block23]
    %vector.getDim_ip0_54=%this
    %Id_GEP_38_i55 = getelementptr vector, vector* %vector.getDim_ip0_54, i32 0, i32 0
    %Id_GEP_Load39_i56 = load i32*, i32** %Id_GEP_38_i55
    %eq40_i57 = icmp eq i32 %Id_GEP_Load39_i56, null
    br i1 %eq40_i57, label %if_then_block6_i31, label %if_dest_block7_i32

if_then_block6_i31; preds = %for_cond_block21
    %vector.getDimreturn_value36_i58=0
    br label %vector.getDim_return_block_i33

if_dest_block7_i32; preds = %if_then_block6_i31
    %Id_GEP_42_i59 = getelementptr vector, vector* %vector.getDim_ip0_54, i32 0, i32 0
    %Id_GEP_Load43_i60 = load i32*, i32** %Id_GEP_42_i59
    %array_size44_i61 = getelementptr i32, i32* %Id_GEP_Load43_i60, i32 -1
    %array_size_load45_i62 = load i32, i32* %array_size44_i61
    %vector.getDimreturn_value36_i58=%array_size_load45_i62
    br label %vector.getDim_return_block_i33

vector.getDim_return_block_i33; preds = %if_dest_block7_i32
    %funccal130=%vector.getDimreturn_value36_i58
    %slt132 = icmp slt i32 %i|addr1177, %funccal130
    br i1 %slt132, label %for_body_block23, label %for_dest_block24

for_body_block23; preds = %vector.getDim_return_block_i33
    %memacc_result134 = getelementptr vector, vector* %Malloc_Cast_Result_116, i32 0, i32 0
    %memacc_result135 = load i32*, i32** %memacc_result134
    %getElementPtr137 = getelementptr i32, i32* %memacc_result135, i32 %i|addr1177
    %Id_GEP_140 = getelementptr vector, vector* %this, i32 0, i32 0
    %Id_GEP_Load141 = load i32*, i32** %Id_GEP_140
    %getElementPtr143 = getelementptr i32, i32* %Id_GEP_Load141, i32 %i|addr1177
    %GEP_Load144 = load i32, i32* %getElementPtr143
    %memacc_result146 = getelementptr vector, vector* %rhs, i32 0, i32 0
    %memacc_result147 = load i32*, i32** %memacc_result146
    %getElementPtr149 = getelementptr i32, i32* %memacc_result147, i32 %i|addr1177
    %GEP_Load150 = load i32, i32* %getElementPtr149
    add151 = add i32 %GEP_Load144, %GEP_Load150
    store i32 %add151, i32* %getElementPtr137
    PreAdd153 = add i32 %i|addr1177, 1
    br label %for_cond_block21

for_dest_block24; preds = %for_body_block23
    %vector.addreturn_value104=%Malloc_Cast_Result_116
    br label %vector.add_return_block

vector.add_return_block; preds = %for_dest_block24
    ret vector* %vector.addreturn_value104

}

define ReturnType : i8*
Parameter : vector  @vector.tostring(vector*){
vector.tostring_entrance_block    %StringConst173 = getelementptr [2 x i8], [2 x i8]* @const_string_no0, i32 0, i32 0
    br label %vector.getDim_entrance_block_i40

vector.getDim_entrance_block_i40; preds = %vector.tostring_entrance_block
    %vector.getDim_ip0_72=%this
    %Id_GEP_38_i73 = getelementptr vector, vector* %vector.getDim_ip0_72, i32 0, i32 0
    %Id_GEP_Load39_i74 = load i32*, i32** %Id_GEP_38_i73
    %eq40_i75 = icmp eq i32 %Id_GEP_Load39_i74, null
    br i1 %eq40_i75, label %if_then_block6_i41, label %if_dest_block7_i42

if_then_block6_i41; preds = %vector.getDim_entrance_block_i40
    %vector.getDimreturn_value36_i76=0
    br label %vector.getDim_return_block_i43

if_dest_block7_i42; preds = %if_then_block6_i41
    %Id_GEP_42_i77 = getelementptr vector, vector* %vector.getDim_ip0_72, i32 0, i32 0
    %Id_GEP_Load43_i78 = load i32*, i32** %Id_GEP_42_i77
    %array_size44_i79 = getelementptr i32, i32* %Id_GEP_Load43_i78, i32 -1
    %array_size_load45_i80 = load i32, i32* %array_size44_i79
    %vector.getDimreturn_value36_i76=%array_size_load45_i80
    br label %vector.getDim_return_block_i43

vector.getDim_return_block_i43; preds = %if_dest_block7_i42
    %funccal174=%vector.getDimreturn_value36_i76
    %sgt176 = icmp sgt i32 %funccal174, 0
    br i1 %sgt176, label %if_then_block27, label %if_dest_block28

if_then_block27; preds = %vector.getDim_return_block_i43
    %Id_GEP_180 = getelementptr vector, vector* %this, i32 0, i32 0
    %Id_GEP_Load181 = load i32*, i32** %Id_GEP_180
    %getElementPtr182 = getelementptr i32, i32* %Id_GEP_Load181, i32 0
    %GEP_Load183 = load i32, i32* %getElementPtr182
    %funccal184 = call i8* @toString(i32 %GEP_Load183)
    %add185 = call i8* @__string_add(i8* %StringConst173, i8* %funccal184)
    br label %if_dest_block28

if_dest_block28; preds = %if_then_block27
    %temp|addr1729 = phi i8*[ %add185, %if_then_block27], [ %StringConst173, %vector.getDim_return_block_i43]
    br label %for_cond_block29

for_cond_block29; preds = %if_dest_block28
    %i|addr18611 = phi i32[ 1, %if_dest_block28], [ %PreAdd205, %for_body_block31]
    %temp|addr17210 = phi i8*[ %temp|addr1729, %if_dest_block28], [ %add203, %for_body_block31]
    %vector.getDim_ip0_81=%this
    %Id_GEP_38_i82 = getelementptr vector, vector* %vector.getDim_ip0_81, i32 0, i32 0
    %Id_GEP_Load39_i83 = load i32*, i32** %Id_GEP_38_i82
    %eq40_i84 = icmp eq i32 %Id_GEP_Load39_i83, null
    br i1 %eq40_i84, label %if_then_block6_i46, label %if_dest_block7_i47

if_then_block6_i46; preds = %for_cond_block29
    %vector.getDimreturn_value36_i85=0
    br label %vector.getDim_return_block_i48

if_dest_block7_i47; preds = %if_then_block6_i46
    %Id_GEP_42_i86 = getelementptr vector, vector* %vector.getDim_ip0_81, i32 0, i32 0
    %Id_GEP_Load43_i87 = load i32*, i32** %Id_GEP_42_i86
    %array_size44_i88 = getelementptr i32, i32* %Id_GEP_Load43_i87, i32 -1
    %array_size_load45_i89 = load i32, i32* %array_size44_i88
    %vector.getDimreturn_value36_i85=%array_size_load45_i89
    br label %vector.getDim_return_block_i48

vector.getDim_return_block_i48; preds = %if_dest_block7_i47
    %funccal189=%vector.getDimreturn_value36_i85
    %slt191 = icmp slt i32 %i|addr18611, %funccal189
    br i1 %slt191, label %for_body_block31, label %for_dest_block32

for_body_block31; preds = %vector.getDim_return_block_i48
    %StringConst194 = getelementptr [2 x i8], [2 x i8]* @const_string_no1, i32 0, i32 0
    %add195 = call i8* @__string_add(i8* %temp|addr17210, i8* %StringConst194)
    %Id_GEP_197 = getelementptr vector, vector* %this, i32 0, i32 0
    %Id_GEP_Load198 = load i32*, i32** %Id_GEP_197
    %getElementPtr200 = getelementptr i32, i32* %Id_GEP_Load198, i32 %i|addr18611
    %GEP_Load201 = load i32, i32* %getElementPtr200
    %funccal202 = call i8* @toString(i32 %GEP_Load201)
    %add203 = call i8* @__string_add(i8* %add195, i8* %funccal202)
    PreAdd205 = add i32 %i|addr18611, 1
    br label %for_cond_block29

for_dest_block32; preds = %for_body_block31
    %StringConst208 = getelementptr [2 x i8], [2 x i8]* @const_string_no2, i32 0, i32 0
    %add209 = call i8* @__string_add(i8* %temp|addr17210, i8* %StringConst208)
    %vector.tostringreturn_value171=%add209
    br label %vector.tostring_return_block

vector.tostring_return_block; preds = %for_dest_block32
    ret i8* %vector.tostringreturn_value171

}

define ReturnType : i1
Parameter : vector vector*  @vector.copy(vector*, vector*){
vector.copy_entrance_block    %eq215 = icmp eq vector* %rhs, null
    br i1 %eq215, label %if_then_block33, label %if_dest_block34

if_then_block33; preds = %vector.copy_entrance_block
    %vector.copyreturn_value213=false
    br label %vector.copy_return_block

if_dest_block34; preds = %if_then_block33
    %vector.getDim_ip0_90=%rhs
    %Id_GEP_38_i91 = getelementptr vector, vector* %vector.getDim_ip0_90, i32 0, i32 0
    %Id_GEP_Load39_i92 = load i32*, i32** %Id_GEP_38_i91
    %eq40_i93 = icmp eq i32 %Id_GEP_Load39_i92, null
    br i1 %eq40_i93, label %if_then_block6_i51, label %if_dest_block7_i52

if_then_block6_i51; preds = %if_dest_block34
    %vector.getDimreturn_value36_i94=0
    br label %vector.getDim_return_block_i53

if_dest_block7_i52; preds = %if_then_block6_i51
    %Id_GEP_42_i95 = getelementptr vector, vector* %vector.getDim_ip0_90, i32 0, i32 0
    %Id_GEP_Load43_i96 = load i32*, i32** %Id_GEP_42_i95
    %array_size44_i97 = getelementptr i32, i32* %Id_GEP_Load43_i96, i32 -1
    %array_size_load45_i98 = load i32, i32* %array_size44_i97
    %vector.getDimreturn_value36_i94=%array_size_load45_i98
    br label %vector.getDim_return_block_i53

vector.getDim_return_block_i53; preds = %if_dest_block7_i52
    %funccal217=%vector.getDimreturn_value36_i94
    %eq218 = icmp eq i32 %funccal217, 0
    br i1 %eq218, label %if_then_block35, label %if_else_block36

if_then_block35; preds = %vector.getDim_return_block_i53
    %Id_GEP_220 = getelementptr vector, vector* %this, i32 0, i32 0
    store i32* null, i32** %Id_GEP_220
    br label %if_dest_block37

if_else_block36; preds = %if_then_block35
    %Id_GEP_223 = getelementptr vector, vector* %this, i32 0, i32 0
    %vector.getDim_ip0_99=%rhs
    %Id_GEP_38_i100 = getelementptr vector, vector* %vector.getDim_ip0_99, i32 0, i32 0
    %Id_GEP_Load39_i101 = load i32*, i32** %Id_GEP_38_i100
    %eq40_i102 = icmp eq i32 %Id_GEP_Load39_i101, null
    br i1 %eq40_i102, label %if_then_block6_i56, label %if_dest_block7_i57

if_then_block6_i56; preds = %if_else_block36
    %vector.getDimreturn_value36_i103=0
    br label %vector.getDim_return_block_i58

if_dest_block7_i57; preds = %if_then_block6_i56
    %Id_GEP_42_i104 = getelementptr vector, vector* %vector.getDim_ip0_99, i32 0, i32 0
    %Id_GEP_Load43_i105 = load i32*, i32** %Id_GEP_42_i104
    %array_size44_i106 = getelementptr i32, i32* %Id_GEP_Load43_i105, i32 -1
    %array_size_load45_i107 = load i32, i32* %array_size44_i106
    %vector.getDimreturn_value36_i103=%array_size_load45_i107
    br label %vector.getDim_return_block_i58

vector.getDim_return_block_i58; preds = %if_dest_block7_i57
    %funccal226=%vector.getDimreturn_value36_i103
    call_size_1227 = mul i32 %funccal226, 4
    call_size_2228 = add i32 %call_size_1227, 4
    %call_malloc_func229 = call i8* @malloc(i32 %call_size_2228)
    store i32 %funccal226, i32* %call_malloc_func229
    %call_array_head230 = getelementptr i32, i32* %call_malloc_func229, i32 1
    call_array_head_cast_231 = bitcast i32* %call_array_head230 to i32*
    store i32* %call_array_head_cast_231, i32** %Id_GEP_223
    br label %for_cond_block38

for_cond_block38; preds = %vector.getDim_return_block_i58
    %i|addr23213 = phi i32[ 0, %vector.getDim_return_block_i58], [ %PreAdd251, %for_body_block40]
    %vector.getDim_ip0_108=%this
    %Id_GEP_38_i109 = getelementptr vector, vector* %vector.getDim_ip0_108, i32 0, i32 0
    %Id_GEP_Load39_i110 = load i32*, i32** %Id_GEP_38_i109
    %eq40_i111 = icmp eq i32 %Id_GEP_Load39_i110, null
    br i1 %eq40_i111, label %if_then_block6_i61, label %if_dest_block7_i62

if_then_block6_i61; preds = %for_cond_block38
    %vector.getDimreturn_value36_i112=0
    br label %vector.getDim_return_block_i63

if_dest_block7_i62; preds = %if_then_block6_i61
    %Id_GEP_42_i113 = getelementptr vector, vector* %vector.getDim_ip0_108, i32 0, i32 0
    %Id_GEP_Load43_i114 = load i32*, i32** %Id_GEP_42_i113
    %array_size44_i115 = getelementptr i32, i32* %Id_GEP_Load43_i114, i32 -1
    %array_size_load45_i116 = load i32, i32* %array_size44_i115
    %vector.getDimreturn_value36_i112=%array_size_load45_i116
    br label %vector.getDim_return_block_i63

vector.getDim_return_block_i63; preds = %if_dest_block7_i62
    %funccal235=%vector.getDimreturn_value36_i112
    %slt237 = icmp slt i32 %i|addr23213, %funccal235
    br i1 %slt237, label %for_body_block40, label %for_dest_block41

for_body_block40; preds = %vector.getDim_return_block_i63
    %Id_GEP_239 = getelementptr vector, vector* %this, i32 0, i32 0
    %Id_GEP_Load240 = load i32*, i32** %Id_GEP_239
    %getElementPtr242 = getelementptr i32, i32* %Id_GEP_Load240, i32 %i|addr23213
    %memacc_result245 = getelementptr vector, vector* %rhs, i32 0, i32 0
    %memacc_result246 = load i32*, i32** %memacc_result245
    %getElementPtr248 = getelementptr i32, i32* %memacc_result246, i32 %i|addr23213
    %GEP_Load249 = load i32, i32* %getElementPtr248
    store i32 %GEP_Load249, i32* %getElementPtr242
    PreAdd251 = add i32 %i|addr23213, 1
    br label %for_cond_block38

for_dest_block41; preds = %for_body_block40
    br label %if_dest_block37

if_dest_block37; preds = %for_dest_block41
    %vector.copyreturn_value213=true
    br label %vector.copy_return_block

vector.copy_return_block; preds = %if_dest_block37
    ret i1 %vector.copyreturn_value213

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i65

__init___entrance_block_i65; preds = %main_entrance_block
    %Malloc_Result254 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_255 = bitcast i32* %Malloc_Result254 to vector*
    %call_malloc_func259 = call i8* @malloc(i32 44)
    store i32 10, i32* %call_malloc_func259
    %call_array_head260 = getelementptr i32, i32* %call_malloc_func259, i32 1
    call_array_head_cast_261 = bitcast i32* %call_array_head260 to i32*
    br label %for_cond_block42

for_cond_block42; preds = %__init___entrance_block_i65
    %i|addr26215 = phi i32[ 0, %__init___entrance_block_i65], [ %PreAdd273, %for_body_block44]
    %slt265 = icmp slt i32 %i|addr26215, 10
    br i1 %slt265, label %for_body_block44, label %for_dest_block45

for_body_block44; preds = %for_cond_block42
    %getElementPtr268 = getelementptr i32, i32* %call_array_head_cast_261, i32 %i|addr26215
    sub271 = sub i32 9, %i|addr26215
    store i32 %sub271, i32* %getElementPtr268
    PreAdd273 = add i32 %i|addr26215, 1
    br label %for_cond_block42

for_dest_block45; preds = %for_body_block44
    %funccal276 = call void @vector.init(vector* %Malloc_Cast_Result_255, i32* %call_array_head_cast_261)
    %StringConst277 = getelementptr [10 x i8], [10 x i8]* @const_string_no3, i32 0, i32 0
    %funccal278 = call void @print(i8* %StringConst277)
    %funccal280 = call i8* @vector.tostring(vector* %Malloc_Cast_Result_255)
    %funccal281 = call void @println(i8* %funccal280)
    %Malloc_Result283 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_284 = bitcast i32* %Malloc_Result283 to vector*
    %funccal287 = call i1 @vector.copy(vector* %Malloc_Cast_Result_284, vector* %Malloc_Cast_Result_255)
    %vector.set_ip0_117=%Malloc_Cast_Result_284
    %vector.set_ip1_118=3
    %vector.set_ip2_119=817
    %vector.getDim_ip0_63_i120=%vector.set_ip0_117
    %Id_GEP_38_i64_i121 = getelementptr vector, vector* %vector.getDim_ip0_63_i120, i32 0, i32 0
    %Id_GEP_Load39_i65_i122 = load i32*, i32** %Id_GEP_38_i64_i121
    %eq40_i66_i123 = icmp eq i32 %Id_GEP_Load39_i65_i122, null
    br i1 %eq40_i66_i123, label %if_then_block6_i36_i70, label %if_dest_block7_i37_i71

if_then_block6_i36_i70; preds = %for_dest_block45
    %vector.getDimreturn_value36_i67_i124=0
    br label %vector.getDim_return_block_i38_i72

if_dest_block7_i37_i71; preds = %if_then_block6_i36_i70
    %Id_GEP_42_i68_i125 = getelementptr vector, vector* %vector.getDim_ip0_63_i120, i32 0, i32 0
    %Id_GEP_Load43_i69_i126 = load i32*, i32** %Id_GEP_42_i68_i125
    %array_size44_i70_i127 = getelementptr i32, i32* %Id_GEP_Load43_i69_i126, i32 -1
    %array_size_load45_i71_i128 = load i32, i32* %array_size44_i70_i127
    %vector.getDimreturn_value36_i67_i124=%array_size_load45_i71_i128
    br label %vector.getDim_return_block_i38_i72

vector.getDim_return_block_i38_i72; preds = %if_dest_block7_i37_i71
    %funccal159_i129=%vector.getDimreturn_value36_i67_i124
    %slt162_i130 = icmp slt i32 %funccal159_i129, %vector.set_ip1_118
    br i1 %slt162_i130, label %if_then_block25_i74, label %if_dest_block26_i75

if_then_block25_i74; preds = %vector.getDim_return_block_i38_i72
    %vector.setreturn_value158_i131=false
    br label %vector.set_return_block_i76

if_dest_block26_i75; preds = %if_then_block25_i74
    %Id_GEP_164_i132 = getelementptr vector, vector* %vector.set_ip0_117, i32 0, i32 0
    %Id_GEP_Load165_i133 = load i32*, i32** %Id_GEP_164_i132
    %getElementPtr167_i134 = getelementptr i32, i32* %Id_GEP_Load165_i133, i32 %vector.set_ip1_118
    store i32 %vector.set_ip2_119, i32* %getElementPtr167_i134
    %vector.setreturn_value158_i131=true
    br label %vector.set_return_block_i76

vector.set_return_block_i76; preds = %if_dest_block26_i75
    %funccal289=%vector.setreturn_value158_i131
    br i1 %funccal289, label %if_then_block46, label %if_dest_block47

if_then_block46; preds = %vector.set_return_block_i76
    %StringConst290 = getelementptr [8 x i8], [8 x i8]* @const_string_no4, i32 0, i32 0
    %funccal291 = call void @println(i8* %StringConst290)
    br label %if_dest_block47

if_dest_block47; preds = %if_then_block46
    %StringConst292 = getelementptr [10 x i8], [10 x i8]* @const_string_no5, i32 0, i32 0
    %funccal293 = call void @print(i8* %StringConst292)
    %funccal295 = call i8* @vector.tostring(vector* %Malloc_Cast_Result_284)
    %funccal296 = call void @println(i8* %funccal295)
    %StringConst297 = getelementptr [7 x i8], [7 x i8]* @const_string_no6, i32 0, i32 0
    %funccal298 = call void @print(i8* %StringConst297)
    %funccal301 = call vector* @vector.add(vector* %Malloc_Cast_Result_255, vector* %Malloc_Cast_Result_284)
    %funccal302 = call i8* @vector.tostring(vector* %funccal301)
    %funccal303 = call void @println(i8* %funccal302)
    %StringConst304 = getelementptr [7 x i8], [7 x i8]* @const_string_no7, i32 0, i32 0
    %funccal305 = call void @print(i8* %StringConst304)
    %vector.dot_ip0_135=%Malloc_Cast_Result_255
    %vector.dot_ip1_136=%Malloc_Cast_Result_284
    br label %while_cond_block8_i79

while_cond_block8_i79; preds = %if_dest_block47
    %i|addr492_i137 = phi i32[ 0, %if_dest_block47], [ %PreAdd70_i138, %while_body_block9_i85]
    %result|addr503_i139 = phi i32[ 0, %if_dest_block47], [ %mul68_i140, %while_body_block9_i85]
    %vector.getDim_ip0_0_i141=%vector.dot_ip0_135
    %Id_GEP_38_i1_i142 = getelementptr vector, vector* %vector.getDim_ip0_0_i141, i32 0, i32 0
    %Id_GEP_Load39_i2_i143 = load i32*, i32** %Id_GEP_38_i1_i142
    %eq40_i3_i144 = icmp eq i32 %Id_GEP_Load39_i2_i143, null
    br i1 %eq40_i3_i144, label %if_then_block6_i1_i81, label %if_dest_block7_i2_i82

if_then_block6_i1_i81; preds = %while_cond_block8_i79
    %vector.getDimreturn_value36_i4_i145=0
    br label %vector.getDim_return_block_i3_i83

if_dest_block7_i2_i82; preds = %if_then_block6_i1_i81
    %Id_GEP_42_i5_i146 = getelementptr vector, vector* %vector.getDim_ip0_0_i141, i32 0, i32 0
    %Id_GEP_Load43_i6_i147 = load i32*, i32** %Id_GEP_42_i5_i146
    %array_size44_i7_i148 = getelementptr i32, i32* %Id_GEP_Load43_i6_i147, i32 -1
    %array_size_load45_i8_i149 = load i32, i32* %array_size44_i7_i148
    %vector.getDimreturn_value36_i4_i145=%array_size_load45_i8_i149
    br label %vector.getDim_return_block_i3_i83

vector.getDim_return_block_i3_i83; preds = %if_dest_block7_i2_i82
    %funccal52_i150=%vector.getDimreturn_value36_i4_i145
    %slt54_i151 = icmp slt i32 %i|addr492_i137, %funccal52_i150
    br i1 %slt54_i151, label %while_body_block9_i85, label %while_dest_block10_i86

while_body_block9_i85; preds = %vector.getDim_return_block_i3_i83
    %Id_GEP_57_i152 = getelementptr vector, vector* %vector.dot_ip0_135, i32 0, i32 0
    %Id_GEP_Load58_i153 = load i32*, i32** %Id_GEP_57_i152
    %getElementPtr60_i154 = getelementptr i32, i32* %Id_GEP_Load58_i153, i32 %i|addr492_i137
    %GEP_Load61_i155 = load i32, i32* %getElementPtr60_i154
    %memacc_result63_i156 = getelementptr vector, vector* %vector.dot_ip1_136, i32 0, i32 0
    %memacc_result64_i157 = load i32*, i32** %memacc_result63_i156
    %getElementPtr66_i158 = getelementptr i32, i32* %memacc_result64_i157, i32 %i|addr492_i137
    %GEP_Load67_i159 = load i32, i32* %getElementPtr66_i158
    mul68_i140 = mul i32 %GEP_Load61_i155, %GEP_Load67_i159
    PreAdd70_i138 = add i32 %i|addr492_i137, 1
    br label %while_cond_block8_i79

while_dest_block10_i86; preds = %while_body_block9_i85
    %vector.dotreturn_value48_i160=%result|addr503_i139
    %funccal308=%vector.dotreturn_value48_i160
    %funccal309 = call i8* @toString(i32 %funccal308)
    %funccal310 = call void @println(i8* %funccal309)
    %StringConst311 = getelementptr [14 x i8], [14 x i8]* @const_string_no8, i32 0, i32 0
    %funccal312 = call void @print(i8* %StringConst311)
    %vector.scalarInPlaceMultiply_ip0_161=%Malloc_Cast_Result_284
    %vector.scalarInPlaceMultiply_ip1_162=8
    %Id_GEP_76_i163 = getelementptr vector, vector* %vector.scalarInPlaceMultiply_ip0_161, i32 0, i32 0
    %Id_GEP_Load77_i164 = load i32*, i32** %Id_GEP_76_i163
    %eq78_i165 = icmp eq i32 %Id_GEP_Load77_i164, null
    br i1 %eq78_i165, label %if_then_block11_i90, label %if_dest_block12_i91

if_then_block11_i90; preds = %while_dest_block10_i86
    %vector.scalarInPlaceMultiplyreturn_value74_i166=null
    br label %vector.scalarInPlaceMultiply_return_block_i100

if_dest_block12_i91; preds = %if_then_block11_i90
    br label %for_cond_block13_i92

for_cond_block13_i92; preds = %if_dest_block12_i91
    %i|addr795_i167 = phi i32[ 0, %if_dest_block12_i91], [ %PreAdd100_i168, %for_body_block15_i98]
    %vector.getDim_ip0_9_i169=%vector.scalarInPlaceMultiply_ip0_161
    %Id_GEP_38_i10_i170 = getelementptr vector, vector* %vector.getDim_ip0_9_i169, i32 0, i32 0
    %Id_GEP_Load39_i11_i171 = load i32*, i32** %Id_GEP_38_i10_i170
    %eq40_i12_i172 = icmp eq i32 %Id_GEP_Load39_i11_i171, null
    br i1 %eq40_i12_i172, label %if_then_block6_i6_i94, label %if_dest_block7_i7_i95

if_then_block6_i6_i94; preds = %for_cond_block13_i92
    %vector.getDimreturn_value36_i13_i173=0
    br label %vector.getDim_return_block_i8_i96

if_dest_block7_i7_i95; preds = %if_then_block6_i6_i94
    %Id_GEP_42_i14_i174 = getelementptr vector, vector* %vector.getDim_ip0_9_i169, i32 0, i32 0
    %Id_GEP_Load43_i15_i175 = load i32*, i32** %Id_GEP_42_i14_i174
    %array_size44_i16_i176 = getelementptr i32, i32* %Id_GEP_Load43_i15_i175, i32 -1
    %array_size_load45_i17_i177 = load i32, i32* %array_size44_i16_i176
    %vector.getDimreturn_value36_i13_i173=%array_size_load45_i17_i177
    br label %vector.getDim_return_block_i8_i96

vector.getDim_return_block_i8_i96; preds = %if_dest_block7_i7_i95
    %funccal82_i178=%vector.getDimreturn_value36_i13_i173
    %slt84_i179 = icmp slt i32 %i|addr795_i167, %funccal82_i178
    br i1 %slt84_i179, label %for_body_block15_i98, label %for_dest_block16_i99

for_body_block15_i98; preds = %vector.getDim_return_block_i8_i96
    %memacc_result86_i180 = getelementptr vector, vector* %vector.scalarInPlaceMultiply_ip0_161, i32 0, i32 0
    %memacc_result87_i181 = load i32*, i32** %memacc_result86_i180
    %getElementPtr89_i182 = getelementptr i32, i32* %memacc_result87_i181, i32 %i|addr795_i167
    %memacc_result93_i183 = getelementptr vector, vector* %vector.scalarInPlaceMultiply_ip0_161, i32 0, i32 0
    %memacc_result94_i184 = load i32*, i32** %memacc_result93_i183
    %getElementPtr96_i185 = getelementptr i32, i32* %memacc_result94_i184, i32 %i|addr795_i167
    %GEP_Load97_i186 = load i32, i32* %getElementPtr96_i185
    mul98_i187 = mul i32 %vector.scalarInPlaceMultiply_ip1_162, %GEP_Load97_i186
    store i32 %mul98_i187, i32* %getElementPtr89_i182
    PreAdd100_i168 = add i32 %i|addr795_i167, 1
    br label %for_cond_block13_i92

for_dest_block16_i99; preds = %for_body_block15_i98
    %vector.scalarInPlaceMultiplyreturn_value74_i166=%vector.scalarInPlaceMultiply_ip0_161
    br label %vector.scalarInPlaceMultiply_return_block_i100

vector.scalarInPlaceMultiply_return_block_i100; preds = %for_dest_block16_i99
    %funccal315=%vector.scalarInPlaceMultiplyreturn_value74_i166
    %funccal316 = call i8* @vector.tostring(vector* %funccal315)
    %funccal317 = call void @println(i8* %funccal316)
    %mainreturn_value252=0
    br label %main_return_block

main_return_block; preds = %vector.scalarInPlaceMultiply_return_block_i100
    ret i32 %mainreturn_value252

}

