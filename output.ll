
@const_string_no0
@const_string_no1

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
    store i32 15000, i32* %N2
    call_size_14 = mul i32 15001, 4
    call_size_25 = add i32 %call_size_14, 4
    %call_malloc_func6 = call i8* @malloc(i32 %call_size_25)
    store i32 15001, i32* %call_malloc_func6
    %call_array_head7 = getelementptr i32, i32* %call_malloc_func6, i32 1
    call_array_head_cast_8 = bitcast i32* %call_array_head7 to i1*
    store i1* %call_array_head_cast_8, i1** %b3
    store i32 0, i32* %resultCount9
    %Id_load11 = load i32, i32* %i10
    store i32 1, i32* %i10

for_cond_block0                                    ; preds = %main_entrance_block
    %Id_load12 = load i32, i32* %i10
    %Id_load13 = load i32, i32* %N2
    %sle14 = icmp sle i32 %Id_load12, %Id_load13
    br i1 %sle14, label %for_body_block2, label %for_dest_block3

for_body_block2                                    ; preds = %for_cond_block0
    %Id_load15 = load i1*, i1** %b3
    %Id_load16 = load i32, i32* %i10
    %getElementPtr17 = getelementptr i1, i1* %Id_load15, i32 %Id_load16
    %GEP_Load18 = load i1, i1* %getElementPtr17
    store i1 true, i1* %getElementPtr17
    br label %for_step_block1

for_step_block1                                    ; preds = %for_body_block2
    %Id_load19 = load i32, i32* %i10
    SelfAdd20 = add i32 %Id_load19, 1
    store i32 %SelfAdd20, i32* %i10
    br label %for_cond_block0

for_dest_block3                                    ; preds = %for_step_block1
    %Id_load21 = load i32, i32* %i10
    store i32 2, i32* %i10

for_cond_block4                                    ; preds = %for_dest_block3
    %Id_load22 = load i32, i32* %i10
    %Id_load23 = load i32, i32* %N2
    %sle24 = icmp sle i32 %Id_load22, %Id_load23
    br i1 %sle24, label %for_body_block6, label %for_dest_block7

for_body_block6                                    ; preds = %for_cond_block4
    %Id_load25 = load i1*, i1** %b3
    %Id_load26 = load i32, i32* %i10
    %getElementPtr27 = getelementptr i1, i1* %Id_load25, i32 %Id_load26
    %GEP_Load28 = load i1, i1* %getElementPtr27
    br i1 %GEP_Load28, label %if_then_block8, label %if_dest_block9

if_then_block8                                     ; preds = %for_body_block6
    store i32 2, i32* %count29
    %Id_load30 = load i32, i32* %i10
    %sgt31 = icmp sgt i32 %Id_load30, 3
    br i1 %sgt31, label %andand_b_block12, label %andand_dest_block13

andand_b_block12                                   ; preds = %if_then_block8
    %Id_load32 = load i1*, i1** %b3
    %Id_load33 = load i32, i32* %i10
    sub34 = sub i32 %Id_load33, 2
    %getElementPtr35 = getelementptr i1, i1* %Id_load32, i32 %sub34
    %GEP_Load36 = load i1, i1* %getElementPtr35
    br label %andand_dest_block13

andand_dest_block13                                ; preds = %andand_b_block12
    Andand_37 = and i1 %sgt31, %GEP_Load36
    br i1 %Andand_37, label %if_then_block10, label %if_dest_block11

if_then_block10                                    ; preds = %andand_dest_block13
    %Id_load38 = load i32, i32* %resultCount9
    SelfAdd39 = add i32 %Id_load38, 1
    store i32 %SelfAdd39, i32* %resultCount9
    %Id_load40 = load i32, i32* %i10
    sub41 = sub i32 %Id_load40, 2
    %funccal42 = call i8* @toString(i32 %sub41)
    %StringConst43 = getelementptr [2 x i8], [2 x i8]* @const_string_no0, i32 0, i32 0
    %add44 = call i8* @__string_add(ReturnType : i8*
Parameter : i32  %funccal42, i8* %StringConst43)
    %Id_load45 = load i32, i32* %i10
    %funccal46 = call i8* @toString(i32 %Id_load45)
    %add47 = call i8* @__string_add(i8* %add44, ReturnType : i8*
Parameter : i32  %funccal46)
    %funccal48 = call void @println(i8* %add47)
    br label %if_dest_block11

if_dest_block11                                    ; preds = %if_then_block10
    br label %while_cond_block14

while_cond_block14                                 ; preds = %if_dest_block11
    %Id_load49 = load i32, i32* %i10
    %Id_load50 = load i32, i32* %count29
    mul51 = mul i32 %Id_load49, %Id_load50
    %Id_load52 = load i32, i32* %N2
    %sle53 = icmp sle i32 %mul51, %Id_load52
    br i1 %sle53, label %while_body_block15, label %while_dest_block16

while_body_block15                                 ; preds = %while_cond_block14
    %Id_load54 = load i1*, i1** %b3
    %Id_load55 = load i32, i32* %i10
    %Id_load56 = load i32, i32* %count29
    mul57 = mul i32 %Id_load55, %Id_load56
    %getElementPtr58 = getelementptr i1, i1* %Id_load54, i32 %mul57
    %GEP_Load59 = load i1, i1* %getElementPtr58
    store i1 false, i1* %getElementPtr58
    %Id_load60 = load i32, i32* %count29
    SelfAdd61 = add i32 %Id_load60, 1
    store i32 %SelfAdd61, i32* %count29
    br label %while_cond_block14

while_dest_block16                                 ; preds = %while_body_block15
    br label %if_dest_block9

if_dest_block9                                     ; preds = %while_dest_block16
    br label %for_step_block5

for_step_block5                                    ; preds = %if_dest_block9
    %Id_load62 = load i32, i32* %i10
    SelfAdd63 = add i32 %Id_load62, 1
    store i32 %SelfAdd63, i32* %i10
    br label %for_cond_block4

for_dest_block7                                    ; preds = %for_step_block5
    %StringConst64 = getelementptr [8 x i8], [8 x i8]* @const_string_no1, i32 0, i32 0
    %Id_load65 = load i32, i32* %resultCount9
    %funccal66 = call i8* @toString(i32 %Id_load65)
    %add67 = call i8* @__string_add(i8* %StringConst64, ReturnType : i8*
Parameter : i32  %funccal66)
    %funccal68 = call void @println(i8* %add67)
    store i32 0, i32* %mainreturn_value0
    br label %main_last_block

main_last_block                                    ; preds = %for_dest_block7
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value0

}

