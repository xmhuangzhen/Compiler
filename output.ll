
@const_string_no0

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___last_block                                ; preds = %__init___entrance_block

__init___return_block                              ; preds = %__init___last_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init1 = call void @__init__()
    call_size_13 = mul i32 4, 4
    call_size_24 = add i32 %call_size_13, 4
    %call_malloc_func5 = call i8* @malloc(i32 %call_size_24)
    store i32 4, i32* %call_malloc_func5
    %call_array_head6 = getelementptr i32, i32* %call_malloc_func5, i32 1
    call_array_head_cast_7 = bitcast i32* %call_array_head6 to i32*
    store i32* %call_array_head_cast_7, i32** %a2
    %Id_load9 = load i32*, i32** %a2
    %array_size10 = getelementptr i32, i32* %Id_load9, i32 -1
    %array_size_load11 = load i32, i32* %array_size10
    call_size_112 = mul i32 %array_size_load11, 4
    call_size_213 = add i32 %call_size_112, 4
    %call_malloc_func14 = call i8* @malloc(i32 %call_size_213)
    store i32 %array_size_load11, i32* %call_malloc_func14
    %call_array_head15 = getelementptr i32, i32* %call_malloc_func14, i32 1
    call_array_head_cast_16 = bitcast i32* %call_array_head15 to i32*
    store i32* %call_array_head_cast_16, i32** %b8
    %Id_load18 = load i32, i32* %i17
    store i32 0, i32* %i17

for_cond_block0                                    ; preds = %main_entrance_block
    %Id_load19 = load i32, i32* %i17
    %Id_load20 = load i32*, i32** %a2
    %array_size21 = getelementptr i32, i32* %Id_load20, i32 -1
    %array_size_load22 = load i32, i32* %array_size21
    %slt23 = icmp slt i32 %Id_load19, %array_size_load22
    br i1 %slt23, label %for_body_block2, label %for_dest_block3

for_body_block2                                    ; preds = %for_cond_block0
    %Id_load24 = load i32*, i32** %a2
    %Id_load25 = load i32, i32* %i17
    %getElementPtr26 = getelementptr i32, i32* %Id_load24, i32 %Id_load25
    %GEP_Load27 = load i32, i32* %getElementPtr26
    store i32 0, i32* %getElementPtr26
    %Id_load28 = load i32*, i32** %b8
    %Id_load29 = load i32, i32* %i17
    %getElementPtr30 = getelementptr i32, i32* %Id_load28, i32 %Id_load29
    %GEP_Load31 = load i32, i32* %getElementPtr30
    store i32 2, i32* %getElementPtr30
    br label %for_step_block1

for_step_block1                                    ; preds = %for_body_block2
    %Id_load32 = load i32, i32* %i17
    SelfAdd33 = add i32 %Id_load32, 1
    store i32 %SelfAdd33, i32* %i17
    br label %for_cond_block0

for_dest_block3                                    ; preds = %for_step_block1
    %Id_load34 = load i32, i32* %i17
    store i32 0, i32* %i17

for_cond_block4                                    ; preds = %for_dest_block3
    %Id_load35 = load i32, i32* %i17
    %Id_load36 = load i32*, i32** %a2
    %array_size37 = getelementptr i32, i32* %Id_load36, i32 -1
    %array_size_load38 = load i32, i32* %array_size37
    %slt39 = icmp slt i32 %Id_load35, %array_size_load38
    br i1 %slt39, label %for_body_block6, label %for_dest_block7

for_body_block6                                    ; preds = %for_cond_block4
    %Id_load40 = load i32*, i32** %a2
    %Id_load41 = load i32, i32* %i17
    %getElementPtr42 = getelementptr i32, i32* %Id_load40, i32 %Id_load41
    %GEP_Load43 = load i32, i32* %getElementPtr42
    %funccal44 = call i8* @toString(i32 %GEP_Load43)
    %funccal45 = call void @print(ReturnType : i8*
Parameter : i32  %funccal44)
    br label %for_step_block5

for_step_block5                                    ; preds = %for_body_block6
    %Id_load46 = load i32, i32* %i17
    SelfAdd47 = add i32 %Id_load46, 1
    store i32 %SelfAdd47, i32* %i17
    br label %for_cond_block4

for_dest_block7                                    ; preds = %for_step_block5
    %StringConst48 = getelementptr [1 x i8], [1 x i8]* @const_string_no0, i32 0, i32 0
    %funccal49 = call void @println(i8* %StringConst48)
    %Id_load50 = load i32, i32* %i17
    store i32 0, i32* %i17

for_cond_block8                                    ; preds = %for_dest_block7
    %Id_load51 = load i32, i32* %i17
    %Id_load52 = load i32*, i32** %a2
    %array_size53 = getelementptr i32, i32* %Id_load52, i32 -1
    %array_size_load54 = load i32, i32* %array_size53
    %slt55 = icmp slt i32 %Id_load51, %array_size_load54
    br i1 %slt55, label %for_body_block10, label %for_dest_block11

for_body_block10                                   ; preds = %for_cond_block8
    %Id_load56 = load i32*, i32** %b8
    %Id_load57 = load i32, i32* %i17
    %getElementPtr58 = getelementptr i32, i32* %Id_load56, i32 %Id_load57
    %GEP_Load59 = load i32, i32* %getElementPtr58
    %funccal60 = call i8* @toString(i32 %GEP_Load59)
    %funccal61 = call void @print(ReturnType : i8*
Parameter : i32  %funccal60)
    br label %for_step_block9

for_step_block9                                    ; preds = %for_body_block10
    %Id_load62 = load i32, i32* %i17
    SelfAdd63 = add i32 %Id_load62, 1
    store i32 %SelfAdd63, i32* %i17
    br label %for_cond_block8

for_dest_block11                                   ; preds = %for_step_block9
    %Id_load64 = load i32*, i32** %a2
    %Id_load65 = load i32*, i32** %b8
    store i32* %Id_load65, i32** %a2
    %Id_load66 = load i32, i32* %i17
    store i32 0, i32* %i17

for_cond_block12                                   ; preds = %for_dest_block11
    %Id_load67 = load i32, i32* %i17
    %Id_load68 = load i32*, i32** %a2
    %array_size69 = getelementptr i32, i32* %Id_load68, i32 -1
    %array_size_load70 = load i32, i32* %array_size69
    %slt71 = icmp slt i32 %Id_load67, %array_size_load70
    br i1 %slt71, label %for_body_block14, label %for_dest_block15

for_body_block14                                   ; preds = %for_cond_block12
    %Id_load72 = load i32*, i32** %a2
    %Id_load73 = load i32, i32* %i17
    %getElementPtr74 = getelementptr i32, i32* %Id_load72, i32 %Id_load73
    %GEP_Load75 = load i32, i32* %getElementPtr74
    %funccal76 = call i8* @toString(i32 %GEP_Load75)
    %funccal77 = call void @print(ReturnType : i8*
Parameter : i32  %funccal76)
    br label %for_step_block13

for_step_block13                                   ; preds = %for_body_block14
    %Id_load78 = load i32, i32* %i17
    SelfAdd79 = add i32 %Id_load78, 1
    store i32 %SelfAdd79, i32* %i17
    br label %for_cond_block12

for_dest_block15                                   ; preds = %for_step_block13
    %Id_load80 = load i32*, i32** %a2
    %array_size81 = getelementptr i32, i32* %Id_load80, i32 -1
    %array_size_load82 = load i32, i32* %array_size81
    store i32 %array_size_load82, i32* %mainreturn_value0
    br label %main_last_block

main_last_block                                    ; preds = %for_dest_block15
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value0

}

