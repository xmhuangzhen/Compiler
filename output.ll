
@const_string_no0
@const_string_no1

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter : i32* i32 i32  @partition(i32*, i32, i32)
define ReturnType : void
Parameter : i32* i32 i32  @quick_sort(i32*, i32, i32)
define ReturnType : void
Parameter : i32*  @quick_sort_inf(i32*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block; preds = %__init___entrance_block
    ret void

}

define ReturnType : i32
Parameter : i32* i32 i32  @partition(i32*, i32, i32){
partition_entrance_block    %getElementPtr7 = getelementptr i32, i32* %a, i32 %r
    %GEP_Load8 = load i32, i32* %getElementPtr7
    sub11 = sub i32 %p, 1
    br label %for_cond_block0

for_cond_block0; preds = %partition_entrance_block
    %j|addr122 = phi i32[ %p, %partition_entrance_block], [ %PreAdd45, %if_dest_block5]
    %i|addr91 = phi i32[ %sub11, %partition_entrance_block], [ %i|addr90, %if_dest_block5]
    %slt17 = icmp slt i32 %j|addr122, %r
    br i1 %slt17, label %for_body_block2, label %for_dest_block3

for_body_block2; preds = %for_cond_block0
    %getElementPtr20 = getelementptr i32, i32* %a, i32 %j|addr122
    %GEP_Load21 = load i32, i32* %getElementPtr20
    %sle23 = icmp sle i32 %GEP_Load21, %GEP_Load8
    br i1 %sle23, label %if_then_block4, label %if_dest_block5

if_then_block4; preds = %for_body_block2
    PreAdd25 = add i32 %i|addr91, 1
    %getElementPtr29 = getelementptr i32, i32* %a, i32 %PreAdd25
    %GEP_Load30 = load i32, i32* %getElementPtr29
    %getElementPtr33 = getelementptr i32, i32* %a, i32 %PreAdd25
    %getElementPtr37 = getelementptr i32, i32* %a, i32 %j|addr122
    %GEP_Load38 = load i32, i32* %getElementPtr37
    store i32 %GEP_Load38, i32* %getElementPtr33
    %getElementPtr41 = getelementptr i32, i32* %a, i32 %j|addr122
    store i32 %GEP_Load30, i32* %getElementPtr41
    br label %if_dest_block5

if_dest_block5; preds = %if_then_block4
    %i|addr90 = phi i32[ %PreAdd25, %if_then_block4], [ %i|addr91, %for_body_block2]
    PreAdd45 = add i32 %j|addr122, 1
    br label %for_cond_block0

for_dest_block3; preds = %if_dest_block5
    add49 = add i32 %i|addr91, 1
    %getElementPtr50 = getelementptr i32, i32* %a, i32 %add49
    %GEP_Load51 = load i32, i32* %getElementPtr50
    %getElementPtr55 = getelementptr i32, i32* %a, i32 %add49
    %getElementPtr59 = getelementptr i32, i32* %a, i32 %r
    %GEP_Load60 = load i32, i32* %getElementPtr59
    store i32 %GEP_Load60, i32* %getElementPtr55
    %getElementPtr63 = getelementptr i32, i32* %a, i32 %r
    store i32 %GEP_Load51, i32* %getElementPtr63
    %partitionreturn_value3=%add49
    br label %partition_return_block

partition_return_block; preds = %for_dest_block3
    ret i32 %partitionreturn_value3

}

define ReturnType : void
Parameter : i32* i32 i32  @quick_sort(i32*, i32, i32){
quick_sort_entrance_block    %sge74 = icmp sge i32 %p, %r
    br i1 %sge74, label %if_then_block6, label %if_dest_block7

if_then_block6; preds = %quick_sort_entrance_block
    br label %quick_sort_return_block

if_dest_block7; preds = %if_then_block6
    %funccal79 = call i32 @partition(i32* %a, i32 %p, i32 %r)
    sub83 = sub i32 %funccal79, 1
    %funccal84 = call void @quick_sort(i32* %a, i32 %p, i32 %sub83)
    add87 = add i32 %funccal79, 1
    %a=%a
    %p=%add87
    %r=%r
    br label %quick_sort_entrance_block

quick_sort_return_block; preds = %if_dest_block7
    ret void

}

define ReturnType : void
Parameter : i32*  @quick_sort_inf(i32*){
quick_sort_inf_entrance_block    %array_size94 = getelementptr i32, i32* %a, i32 -1
    %array_size_load95 = load i32, i32* %array_size94
    sub96 = sub i32 %array_size_load95, 1
    %funccal97 = call void @quick_sort(i32* %a, i32 0, i32 %sub96)
    br label %quick_sort_inf_return_block

quick_sort_inf_return_block; preds = %quick_sort_inf_entrance_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    call void @__init__()
    %funccal100 = call i32 @getInt()
    call_size_1103 = mul i32 %funccal100, 4
    call_size_2104 = add i32 %call_size_1103, 4
    %call_malloc_func105 = call i8* @malloc(i32 %call_size_2104)
    store i32 %funccal100, i32* %call_malloc_func105
    %call_array_head106 = getelementptr i32, i32* %call_malloc_func105, i32 1
    call_array_head_cast_107 = bitcast i32* %call_array_head106 to i32*
    br label %for_cond_block8

for_cond_block8; preds = %main_entrance_block
    %i|addr1086 = phi i32[ 0, %main_entrance_block], [ %PreAdd119, %for_body_block10]
    %slt112 = icmp slt i32 %i|addr1086, %funccal100
    br i1 %slt112, label %for_body_block10, label %for_dest_block11

for_body_block10; preds = %for_cond_block8
    %getElementPtr115 = getelementptr i32, i32* %call_array_head_cast_107, i32 %i|addr1086
    %funccal117 = call i32 @getInt()
    store i32 %funccal117, i32* %getElementPtr115
    PreAdd119 = add i32 %i|addr1086, 1
    br label %for_cond_block8

for_dest_block11; preds = %for_body_block10
    %funccal121 = call void @quick_sort_inf(i32* %call_array_head_cast_107)
    br label %for_cond_block12

for_cond_block12; preds = %for_dest_block11
    %i|addr1087 = phi i32[ 0, %for_dest_block11], [ %PreAdd135, %for_body_block14]
    %slt125 = icmp slt i32 %i|addr1087, %funccal100
    br i1 %slt125, label %for_body_block14, label %for_dest_block15

for_body_block14; preds = %for_cond_block12
    %getElementPtr128 = getelementptr i32, i32* %call_array_head_cast_107, i32 %i|addr1087
    %GEP_Load129 = load i32, i32* %getElementPtr128
    %funccal130 = call i8* @toString(i32 %GEP_Load129)
    %StringConst131 = getelementptr [1 x i8], [1 x i8]* @const_string_no0, i32 0, i32 0
    %add132 = call i8* @__string_add(i8* %funccal130, i8* %StringConst131)
    %funccal133 = call void @print(i8* %add132)
    PreAdd135 = add i32 %i|addr1087, 1
    br label %for_cond_block12

for_dest_block15; preds = %for_body_block14
    %StringConst136 = getelementptr [0 x i8], [0 x i8]* @const_string_no1, i32 0, i32 0
    %funccal137 = call void @println(i8* %StringConst136)
    %mainreturn_value98=0
    br label %main_return_block

main_return_block; preds = %for_dest_block15
    ret i32 %mainreturn_value98

}

