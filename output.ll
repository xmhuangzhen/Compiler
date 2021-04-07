
@a
@const_string_no0

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    call_size_10 = mul i32 4, 4
    call_size_21 = add i32 %call_size_10, 4
    %call_malloc_func2 = call i8* @malloc(i32 %call_size_21)
    store i32 4, i32* %call_malloc_func2
    %call_array_head3 = getelementptr i32, i32* %call_malloc_func2, i32 1
    call_array_head_cast_4 = bitcast i32* %call_array_head3 to i32*
    store i32 %call_array_head_cast_4, i32* @a
    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init6 = call void @__init__()
    call_size_18 = mul i32 4, 4
    call_size_29 = add i32 %call_size_18, 4
    %call_malloc_func10 = call i8* @malloc(i32 %call_size_29)
    store i32 4, i32* %call_malloc_func10
    %call_array_head11 = getelementptr i32, i32* %call_malloc_func10, i32 1
    call_array_head_cast_12 = bitcast i32* %call_array_head11 to i32*
    %getElementPtr15 = getelementptr i32, i32* %call_array_head_cast_12, i32 0
    %a17 = load i32*, i32* @a
    store i32* %a17, i32** %getElementPtr15
    %getElementPtr19 = getelementptr i32, i32* %call_array_head_cast_12, i32 1
    %a21 = load i32*, i32* @a
    store i32* %a21, i32** %getElementPtr19
    %getElementPtr23 = getelementptr i32, i32* %call_array_head_cast_12, i32 2
    %a25 = load i32*, i32* @a
    store i32* %a25, i32** %getElementPtr23
    %getElementPtr27 = getelementptr i32, i32* %call_array_head_cast_12, i32 3
    %a29 = load i32*, i32* @a
    store i32* %a29, i32** %getElementPtr27
    %array_size31 = getelementptr i32, i32* %call_array_head_cast_12, i32 -1
    %array_size_load32 = load i32, i32* %array_size31
    %funccal33 = call i8* @toString(i32 %array_size_load32)
    %funccal34 = call void @println(ReturnType : i8*
Parameter : i32  %funccal33)
    %i17=0
    %b0=%call_array_head_cast_12
    br label %for_cond_block0

for_cond_block0                                    ; preds = %main_entrance_block
    %getElementPtr38 = getelementptr i32**, i32*** %b0, i32 0
    %GEP_Load39 = load i32*, i32** %getElementPtr38
    %array_size40 = getelementptr i32, i32* %GEP_Load39, i32 -1
    %array_size_load41 = load i32, i32* %array_size40
    %slt42 = icmp slt i32 %i17, %array_size_load41
    br i1 %slt42, label %for_cond_block0Prime0, label %for_cond_block0Prime1

for_cond_block0Prime1                              ; preds = %for_cond_block0
    %i19=%i17
    %b2=%b0
    br label %for_dest_block3

for_cond_block0Prime0                              ; preds = %for_cond_block0Prime1
    %i18=%i17
    %b1=%b0
    br label %for_body_block2

for_body_block2                                    ; preds = %for_cond_block0Prime0
    %getElementPtr44 = getelementptr i32**, i32*** %b1, i32 0
    %GEP_Load45 = load i32*, i32** %getElementPtr44
    %getElementPtr47 = getelementptr i32, i32* %GEP_Load45, i32* %i18
    %funccal49 = call i32 @getInt()
    store i32 %funccal49, i32* %getElementPtr47
    %i20=%i18
    %b3=%b1
    br label %for_step_block1

for_step_block1                                    ; preds = %for_body_block2
    SelfAdd51 = add i32 %i20, 1
    %i17=%SelfAdd51
    %b0=%b3
    br label %for_cond_block0

for_dest_block3                                    ; preds = %for_step_block1
    %i21=0
    %b4=%b2
    br label %for_cond_block4

for_cond_block4                                    ; preds = %for_dest_block3
    %getElementPtr55 = getelementptr i32**, i32*** %b4, i32 1
    %GEP_Load56 = load i32*, i32** %getElementPtr55
    %array_size57 = getelementptr i32, i32* %GEP_Load56, i32 -1
    %array_size_load58 = load i32, i32* %array_size57
    %slt59 = icmp slt i32 %i21, %array_size_load58
    br i1 %slt59, label %for_cond_block4Prime2, label %for_cond_block4Prime3

for_cond_block4Prime3                              ; preds = %for_cond_block4
    %i23=%i21
    %b6=%b4
    br label %for_dest_block7

for_cond_block4Prime2                              ; preds = %for_cond_block4Prime3
    %i22=%i21
    %b5=%b4
    br label %for_body_block6

for_body_block6                                    ; preds = %for_cond_block4Prime2
    %getElementPtr61 = getelementptr i32**, i32*** %b5, i32 1
    %GEP_Load62 = load i32*, i32** %getElementPtr61
    %getElementPtr64 = getelementptr i32, i32* %GEP_Load62, i32* %i22
    %GEP_Load65 = load i32, i32* %getElementPtr64
    %funccal66 = call i8* @toString(i32 %GEP_Load65)
    %funccal67 = call void @print(ReturnType : i8*
Parameter : i32  %funccal66)
    %i24=%i22
    %b7=%b5
    br label %for_step_block5

for_step_block5                                    ; preds = %for_body_block6
    SelfAdd69 = add i32 %i24, 1
    %i21=%SelfAdd69
    %b4=%b7
    br label %for_cond_block4

for_dest_block7                                    ; preds = %for_step_block5
    %StringConst70 = getelementptr [0 x i8], [0 x i8]* @const_string_no0, i32 0, i32 0
    %funccal71 = call void @println(i8* %StringConst70)
    %i25=0
    %b8=%b6
    br label %for_cond_block8

for_cond_block8                                    ; preds = %for_dest_block7
    %getElementPtr75 = getelementptr i32**, i32*** %b8, i32 2
    %GEP_Load76 = load i32*, i32** %getElementPtr75
    %array_size77 = getelementptr i32, i32* %GEP_Load76, i32 -1
    %array_size_load78 = load i32, i32* %array_size77
    %slt79 = icmp slt i32 %i25, %array_size_load78
    br i1 %slt79, label %for_cond_block8Prime4, label %for_cond_block8Prime5

for_cond_block8Prime5                              ; preds = %for_cond_block8
    %i27=%i25
    %b10=%b8
    br label %for_dest_block11

for_cond_block8Prime4                              ; preds = %for_cond_block8Prime5
    %i26=%i25
    %b9=%b8
    br label %for_body_block10

for_body_block10                                   ; preds = %for_cond_block8Prime4
    %getElementPtr81 = getelementptr i32**, i32*** %b9, i32 2
    %GEP_Load82 = load i32*, i32** %getElementPtr81
    %getElementPtr84 = getelementptr i32, i32* %GEP_Load82, i32* %i26
    store i32 0, i32* %getElementPtr84
    %i28=%i26
    %b11=%b9
    br label %for_step_block9

for_step_block9                                    ; preds = %for_body_block10
    SelfAdd87 = add i32 %i28, 1
    %i25=%SelfAdd87
    %b8=%b11
    br label %for_cond_block8

for_dest_block11                                   ; preds = %for_step_block9
    %i29=0
    %b12=%b10
    br label %for_cond_block12

for_cond_block12                                   ; preds = %for_dest_block11
    %getElementPtr91 = getelementptr i32**, i32*** %b12, i32 3
    %GEP_Load92 = load i32*, i32** %getElementPtr91
    %array_size93 = getelementptr i32, i32* %GEP_Load92, i32 -1
    %array_size_load94 = load i32, i32* %array_size93
    %slt95 = icmp slt i32 %i29, %array_size_load94
    br i1 %slt95, label %for_cond_block12Prime6, label %for_cond_block12Prime7

for_cond_block12Prime7                             ; preds = %for_cond_block12
    %i31=%i29
    %b14=%b12
    br label %for_dest_block15

for_cond_block12Prime6                             ; preds = %for_cond_block12Prime7
    %i30=%i29
    %b13=%b12
    br label %for_body_block14

for_body_block14                                   ; preds = %for_cond_block12Prime6
    %getElementPtr97 = getelementptr i32**, i32*** %b13, i32 3
    %GEP_Load98 = load i32*, i32** %getElementPtr97
    %getElementPtr100 = getelementptr i32, i32* %GEP_Load98, i32* %i30
    %GEP_Load101 = load i32, i32* %getElementPtr100
    %funccal102 = call i8* @toString(i32 %GEP_Load101)
    %funccal103 = call void @print(ReturnType : i8*
Parameter : i32  %funccal102)
    %i32=%i30
    %b15=%b13
    br label %for_step_block13

for_step_block13                                   ; preds = %for_body_block14
    SelfAdd105 = add i32 %i32, 1
    %i29=%SelfAdd105
    %b12=%b15
    br label %for_cond_block12

for_dest_block15                                   ; preds = %for_step_block13
    %mainreturn_value5=0
    %i33=%i31
    %b16=%b14
    br label %main_return_block

main_return_block                                  ; preds = %for_dest_block15
    ret i32 %mainreturn_value5

}

