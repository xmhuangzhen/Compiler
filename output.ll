
@const_string_no0

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init1 = call void @__init__()
    store i32 10000, i32* %a2
    store i32 0, i32* %b3
    store i32 2800, i32* %c4
    store i32 0, i32* %d5
    store i32 0, i32* %e6
    call_size_18 = mul i32 2801, 4
    call_size_29 = add i32 %call_size_18, 4
    %call_malloc_func10 = call i8* @malloc(i32 %call_size_29)
    store i32 2801, i32* %call_malloc_func10
    %call_array_head11 = getelementptr i32, i32* %call_malloc_func10, i32 1
    call_array_head_cast_12 = bitcast i32* %call_array_head11 to i32*
    store i32* %call_array_head_cast_12, i32** %f7
    store i32 0, i32* %g13
    br label %for_cond_block0

for_cond_block0                                    ; preds = %main_entrance_block
    %Id_load14 = load i32, i32* %b3
    %Id_load15 = load i32, i32* %c4
    sub16 = sub i32 %Id_load14, %Id_load15
    %ne17 = icmp ne i32 %sub16, 0
    br i1 %ne17, label %for_body_block2, label %for_dest_block3

for_body_block2                                    ; preds = %for_cond_block0
    %Id_load18 = load i32*, i32** %f7
    %Id_load19 = load i32, i32* %b3
    %getElementPtr20 = getelementptr i32, i32* %Id_load18, i32 %Id_load19
    %GEP_Load21 = load i32, i32* %getElementPtr20
    %Id_load22 = load i32, i32* %a2
    sdiv23 = sdiv i32 %Id_load22, 5
    store i32 %sdiv23, i32* %getElementPtr20
    br label %for_step_block1

for_step_block1                                    ; preds = %for_body_block2
    %Id_load24 = load i32, i32* %b3
    SelfAdd25 = add i32 %Id_load24, 1
    store i32 %SelfAdd25, i32* %b3
    br label %for_cond_block0

for_dest_block3                                    ; preds = %for_step_block1
    br label %for_body_block5

for_body_block5                                    ; preds = %for_dest_block3
    %Id_load26 = load i32, i32* %d5
    store i32 0, i32* %d5
    %Id_load27 = load i32, i32* %g13
    %Id_load28 = load i32, i32* %c4
    mul29 = mul i32 %Id_load28, 2
    store i32 %mul29, i32* %g13
    %Id_load30 = load i32, i32* %g13
    %eq31 = icmp eq i32 %Id_load30, 0
    br i1 %eq31, label %if_then_block7, label %if_dest_block8

if_then_block7                                     ; preds = %for_body_block5
    br label %for_dest_block6
    br label %if_dest_block8

if_dest_block8                                     ; preds = %if_then_block7
    %Id_load32 = load i32, i32* %b3
    %Id_load33 = load i32, i32* %c4
    store i32 %Id_load33, i32* %b3
    br label %for_body_block10

for_body_block10                                   ; preds = %if_dest_block8
    %Id_load34 = load i32, i32* %d5
    %Id_load35 = load i32, i32* %d5
    %Id_load36 = load i32*, i32** %f7
    %Id_load37 = load i32, i32* %b3
    %getElementPtr38 = getelementptr i32, i32* %Id_load36, i32 %Id_load37
    %GEP_Load39 = load i32, i32* %getElementPtr38
    %Id_load40 = load i32, i32* %a2
    mul41 = mul i32 %GEP_Load39, %Id_load40
    add42 = add i32 %Id_load35, %mul41
    store i32 %add42, i32* %d5
    %Id_load43 = load i32*, i32** %f7
    %Id_load44 = load i32, i32* %b3
    %getElementPtr45 = getelementptr i32, i32* %Id_load43, i32 %Id_load44
    %GEP_Load46 = load i32, i32* %getElementPtr45
    %Id_load47 = load i32, i32* %d5
    %Id_load48 = load i32, i32* %g13
    PreSub49 = sub i32 %Id_load48, 1
    store i32 %PreSub49, i32* %g13
    srem50 = srem i32 %Id_load47, %PreSub49
    store i32 %srem50, i32* %getElementPtr45
    %Id_load51 = load i32, i32* %d5
    %Id_load52 = load i32, i32* %d5
    %Id_load53 = load i32, i32* %g13
    sdiv54 = sdiv i32 %Id_load52, %Id_load53
    store i32 %sdiv54, i32* %d5
    %Id_load55 = load i32, i32* %g13
    SelfSub56 = sub i32 %Id_load55, 1
    store i32 %SelfSub56, i32* %g13
    %Id_load57 = load i32, i32* %b3
    PreSub58 = sub i32 %Id_load57, 1
    store i32 %PreSub58, i32* %b3
    %eq59 = icmp eq i32 %PreSub58, 0
    br i1 %eq59, label %if_then_block12, label %if_dest_block13

if_then_block12                                    ; preds = %for_body_block10
    br label %for_dest_block11
    br label %if_dest_block13

if_dest_block13                                    ; preds = %if_then_block12
    br label %for_step_block9

for_step_block9                                    ; preds = %if_dest_block13
    %Id_load60 = load i32, i32* %d5
    %Id_load61 = load i32, i32* %d5
    %Id_load62 = load i32, i32* %b3
    mul63 = mul i32 %Id_load61, %Id_load62
    store i32 %mul63, i32* %d5
    br label %for_body_block10

for_dest_block11                                   ; preds = %for_step_block9
    %Id_load64 = load i32, i32* %c4
    %Id_load65 = load i32, i32* %c4
    sub66 = sub i32 %Id_load65, 14
    store i32 %sub66, i32* %c4
    %Id_load67 = load i32, i32* %e6
    %Id_load68 = load i32, i32* %d5
    %Id_load69 = load i32, i32* %a2
    sdiv70 = sdiv i32 %Id_load68, %Id_load69
    add71 = add i32 %Id_load67, %sdiv70
    %funccal72 = call i8* @toString(i32 %add71)
    %funccal73 = call void @print(ReturnType : i8*
Parameter : i32  %funccal72)
    br label %for_step_block4

for_step_block4                                    ; preds = %for_dest_block11
    %Id_load74 = load i32, i32* %e6
    %Id_load75 = load i32, i32* %d5
    %Id_load76 = load i32, i32* %a2
    srem77 = srem i32 %Id_load75, %Id_load76
    store i32 %srem77, i32* %e6
    br label %for_body_block5

for_dest_block6                                    ; preds = %for_step_block4
    %StringConst78 = getelementptr [1 x i8], [1 x i8]* @const_string_no0, i32 0, i32 0
    %funccal79 = call void @print(i8* %StringConst78)
    store i32 0, i32* %mainreturn_value0
    br label %main_return_block
    br label %main_return_block

main_return_block                                  ; preds = %for_dest_block6
    ret i32 %mainreturn_value0

}

