
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

__init___last_block                                ; preds = %__init___entrance_block

__init___return_block                              ; preds = %__init___last_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init6 = call void @__init__()
    %a8 = load i32*, i32* @a
    %array_size9 = getelementptr i32, i32* %a8, i32 -1
    call_size_110 = mul i32 %array_size9, 4
    call_size_211 = add i32 %call_size_110, 4
    %call_malloc_func12 = call i8* @malloc(i32 %call_size_211)
    store i32 %array_size9, i32* %call_malloc_func12
    %call_array_head13 = getelementptr i32, i32* %call_malloc_func12, i32 1
    call_array_head_cast_14 = bitcast i32* %call_array_head13 to i32*
    store i32* %call_array_head_cast_14, i32** %b7
    %Id_load16 = load i32, i32* %i15
    store i32 0, i32* %i15

for_cond_block0                                    ; preds = %main_entrance_block
    %Id_load17 = load i32, i32* %i15
    %a18 = load i32*, i32* @a
    %array_size19 = getelementptr i32, i32* %a18, i32 -1
    %slt20 = icmp slt i32 %Id_load17, %array_size19
    br i1 %slt20, label %for_body_block2, label %for_dest_block3

for_body_block2                                    ; preds = %for_cond_block0
    %a21 = load i32*, i32* @a
    %Id_load22 = load i32, i32* %i15
    %getElementPtr23 = getelementptr i32, i32* %a21, i32 %Id_load22
    %GEP_Load24 = load i32, i32* %getElementPtr23
    store i32 0, i32* %getElementPtr23
    %Id_load25 = load i32*, i32** %b7
    %Id_load26 = load i32, i32* %i15
    %getElementPtr27 = getelementptr i32, i32* %Id_load25, i32 %Id_load26
    %GEP_Load28 = load i32, i32* %getElementPtr27
    %funccal29 = call i32 @getInt()
    store i32 %funccal29, i32* %getElementPtr27
    br label %for_step_block1

for_step_block1                                    ; preds = %for_body_block2
    %Id_load30 = load i32, i32* %i15
    SelfAdd31 = add i32 %Id_load30, 1
    store i32 %SelfAdd31, i32* %i15
    br label %for_cond_block0

for_dest_block3                                    ; preds = %for_step_block1
    %Id_load32 = load i32, i32* %i15
    store i32 0, i32* %i15

for_cond_block4                                    ; preds = %for_dest_block3
    %Id_load33 = load i32, i32* %i15
    %a34 = load i32*, i32* @a
    %array_size35 = getelementptr i32, i32* %a34, i32 -1
    %slt36 = icmp slt i32 %Id_load33, %array_size35
    br i1 %slt36, label %for_body_block6, label %for_dest_block7

for_body_block6                                    ; preds = %for_cond_block4
    %a37 = load i32*, i32* @a
    %Id_load38 = load i32, i32* %i15
    %getElementPtr39 = getelementptr i32, i32* %a37, i32 %Id_load38
    %GEP_Load40 = load i32, i32* %getElementPtr39
    %funccal41 = call i8* @toString(i32 %GEP_Load40)
    %funccal42 = call void @print(ReturnType : i8*
Parameter : i32  %funccal41)
    br label %for_step_block5

for_step_block5                                    ; preds = %for_body_block6
    %Id_load43 = load i32, i32* %i15
    SelfAdd44 = add i32 %Id_load43, 1
    store i32 %SelfAdd44, i32* %i15
    br label %for_cond_block4

for_dest_block7                                    ; preds = %for_step_block5
    %StringConst45 = getelementptr [1 x i8], [1 x i8]* @const_string_no0, i32 0, i32 0
    %funccal46 = call void @println(i8* %StringConst45)
    %a47 = load i32*, i32* @a
    %Id_load48 = load i32*, i32** %b7
    store i32 %Id_load48, i32* @a
    %Id_load49 = load i32, i32* %i15
    store i32 0, i32* %i15

for_cond_block8                                    ; preds = %for_dest_block7
    %Id_load50 = load i32, i32* %i15
    %a51 = load i32*, i32* @a
    %array_size52 = getelementptr i32, i32* %a51, i32 -1
    %slt53 = icmp slt i32 %Id_load50, %array_size52
    br i1 %slt53, label %for_body_block10, label %for_dest_block11

for_body_block10                                   ; preds = %for_cond_block8
    %a54 = load i32*, i32* @a
    %Id_load55 = load i32, i32* %i15
    %getElementPtr56 = getelementptr i32, i32* %a54, i32 %Id_load55
    %GEP_Load57 = load i32, i32* %getElementPtr56
    %funccal58 = call i8* @toString(i32 %GEP_Load57)
    %funccal59 = call void @print(ReturnType : i8*
Parameter : i32  %funccal58)
    br label %for_step_block9

for_step_block9                                    ; preds = %for_body_block10
    %Id_load60 = load i32, i32* %i15
    SelfAdd61 = add i32 %Id_load60, 1
    store i32 %SelfAdd61, i32* %i15
    br label %for_cond_block8

for_dest_block11                                   ; preds = %for_step_block9
    %a62 = load i32*, i32* @a
    %array_size63 = getelementptr i32, i32* %a62, i32 -1
    store i32 %array_size63, i32* %mainreturn_value5
    br label %main_last_block

main_last_block                                    ; preds = %for_dest_block11
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value5

}

