
@INF
@n
@m
@a
@const_string_no0
@const_string_no1

define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter :  @init()
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    null
    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : void
Parameter :  @init(){
init_entrance_block    %n1 = load i32, i32 @n
    %funccal2 = call i32 @getInt()
    null
    %m3 = load i32, i32 @m
    %funccal4 = call i32 @getInt()
    null
    %a5 = load i32**, i32** @a
    %n6 = load i32, i32 @n
    %n7 = load i32, i32 @n
    call_size_18 = mul i32 %n6, 4
    call_size_29 = add i32 %call_size_18, 4
    %call_malloc_func10 = call i8* @malloc(i32 %call_size_29)
    store i32 %n6, i32* %call_malloc_func10
    %call_array_head11 = getelementptr i32, i32* %call_malloc_func10, i32 1
    call_array_head_cast_12 = bitcast i32* %call_array_head11 to i32**
    %Subarray_Cur_Reg13 = getelementptr i32, i32* %call_malloc_func10, i32 1
    %SubArray_end_reg14 = getelementptr i32*, i32** %call_array_head_cast_12, i32 %n6
    br label %cond_block0

cond_block0                                        ; preds = %init_entrance_block
    %Subarray_Cond_15 = icmp sle i32** %Subarray_Cur_Reg13, %SubArray_end_reg14
    br i1 %Subarray_Cond_15, label %body_block1, label %dest_block2

body_block1                                        ; preds = %cond_block0
    call_size_116 = mul i32 %n7, 4
    call_size_217 = add i32 %call_size_116, 4
    %call_malloc_func18 = call i8* @malloc(i32 %call_size_217)
    store i32 %n7, i32* %call_malloc_func18
    %call_array_head19 = getelementptr i32, i32* %call_malloc_func18, i32 1
    call_array_head_cast_20 = bitcast i32* %call_array_head19 to i32*
    store i32* %call_array_head_cast_20, i32** %Subarray_Cur_Reg13
    %Incr_reg21 = getelementptr i32*, i32** %Subarray_Cur_Reg13, i32 1
    %Subarray_Cur_Reg13=%Incr_reg21
    br label %cond_block0

dest_block2                                        ; preds = %body_block1
    store i32* %call_array_head_cast_12, i32** @a
    %Id_load24 = load i32, i32* %i22
    store i32 0, i32* %i22
    br label %for_cond_block3

for_cond_block3                                    ; preds = %dest_block2
    %Id_load25 = load i32, i32* %i22
    %n26 = load i32, i32 @n
    %slt27 = icmp slt i32 %Id_load25, %n26
    br i1 %slt27, label %for_body_block5, label %for_dest_block6

for_body_block5                                    ; preds = %for_cond_block3
    %a28 = load i32**, i32** @a
    %Id_load29 = load i32, i32* %i22
    %getElementPtr30 = getelementptr i32*, i32** %a28, i32 %Id_load29
    %GEP_Load31 = load i32*, i32** %getElementPtr30
    %Id_load32 = load i32, i32* %i22
    %getElementPtr33 = getelementptr i32, i32* %GEP_Load31, i32 %Id_load32
    %GEP_Load34 = load i32, i32* %getElementPtr33
    store i32 1000, i32* %getElementPtr33
    %Id_load35 = load i32, i32* %i22
    %funccal36 = call i8* @toString(i32 %Id_load35)
    %funccal37 = call void @println(ReturnType : i8*
Parameter : i32  %funccal36)
    br label %for_step_block4

for_step_block4                                    ; preds = %for_body_block5
    %Id_load38 = load i32, i32* %i22
    PreAdd39 = add i32 %Id_load38, 1
    store i32 %PreAdd39, i32* %i22
    br label %for_cond_block3

for_dest_block6                                    ; preds = %for_step_block4
    br label %init_return_block

init_return_block                                  ; preds = %for_dest_block6
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init41 = call void @__init__()
    %funccal42 = call void @init()
    %Id_load45 = load i32, i32* %i43
    store i32 0, i32* %i43
    br label %for_cond_block7

for_cond_block7                                    ; preds = %main_entrance_block
    %Id_load46 = load i32, i32* %i43
    %n47 = load i32, i32 @n
    %slt48 = icmp slt i32 %Id_load46, %n47
    br i1 %slt48, label %for_body_block9, label %for_dest_block10

for_body_block9                                    ; preds = %for_cond_block7
    %Id_load49 = load i32, i32* %j44
    store i32 0, i32* %j44
    br label %for_cond_block11

for_cond_block11                                   ; preds = %for_body_block9
    %Id_load50 = load i32, i32* %j44
    %n51 = load i32, i32 @n
    %slt52 = icmp slt i32 %Id_load50, %n51
    br i1 %slt52, label %for_body_block13, label %for_dest_block14

for_body_block13                                   ; preds = %for_cond_block11
    %a53 = load i32**, i32** @a
    %Id_load54 = load i32, i32* %i43
    %getElementPtr55 = getelementptr i32*, i32** %a53, i32 %Id_load54
    %GEP_Load56 = load i32*, i32** %getElementPtr55
    %Id_load57 = load i32, i32* %j44
    %getElementPtr58 = getelementptr i32, i32* %GEP_Load56, i32 %Id_load57
    %GEP_Load59 = load i32, i32* %getElementPtr58
    %funccal60 = call i8* @toString(i32 %GEP_Load59)
    %funccal61 = call void @print(ReturnType : i8*
Parameter : i32  %funccal60)
    %StringConst62 = getelementptr [1 x i8], [1 x i8]* @const_string_no0, i32 0, i32 0
    %funccal63 = call void @print(i8* %StringConst62)
    br label %for_step_block12

for_step_block12                                   ; preds = %for_body_block13
    %Id_load64 = load i32, i32* %j44
    PreAdd65 = add i32 %Id_load64, 1
    store i32 %PreAdd65, i32* %j44
    br label %for_cond_block11

for_dest_block14                                   ; preds = %for_step_block12
    %StringConst66 = getelementptr [0 x i8], [0 x i8]* @const_string_no1, i32 0, i32 0
    %funccal67 = call void @println(i8* %StringConst66)
    br label %for_step_block8

for_step_block8                                    ; preds = %for_dest_block14
    %Id_load68 = load i32, i32* %i43
    PreAdd69 = add i32 %Id_load68, 1
    store i32 %PreAdd69, i32* %i43
    br label %for_cond_block7

for_dest_block10                                   ; preds = %for_step_block8
    %a70 = load i32**, i32** @a
    %getElementPtr71 = getelementptr i32*, i32** %a70, i32 1
    %GEP_Load72 = load i32*, i32** %getElementPtr71
    %getElementPtr73 = getelementptr i32, i32* %GEP_Load72, i32 2
    %GEP_Load74 = load i32, i32* %getElementPtr73
    %mainreturn_value40=%GEP_Load74
    br label %main_return_block
    br label %main_return_block

main_return_block                                  ; preds = %for_dest_block10
    ret i32 %mainreturn_value40

}

