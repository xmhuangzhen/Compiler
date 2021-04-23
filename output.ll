
@const_string_no0

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    %call_malloc_func9 = call i8* @malloc(i32 11208)
    store i32 2801, i32* %call_malloc_func9
    %call_array_head10 = getelementptr i32, i32* %call_malloc_func9, i32 1
    call_array_head_cast_11 = bitcast i32* %call_array_head10 to i32*
    br label %for_cond_block0

for_cond_block0; preds = %__init___entrance_block_i0
    %b|addr22 = phi i32[ 0, %__init___entrance_block_i0], [ %SelfAdd24, %for_body_block2]
    sub15 = sub i32 %b|addr22, 2800
    %ne16 = icmp ne i32 %sub15, 0
    br i1 %ne16, label %for_body_block2, label %for_dest_block3

for_body_block2; preds = %for_cond_block0
    %getElementPtr19 = getelementptr i32, i32* %call_array_head_cast_11, i32 %b|addr22
    store i32 2000, i32* %getElementPtr19
    SelfAdd24 = add i32 %b|addr22, 1
    br label %for_cond_block0

for_dest_block3; preds = %for_body_block2
    br label %for_body_block5

for_body_block5; preds = %for_dest_block3
    %e|addr56 = phi i32[ 0, %for_dest_block3], [ %srem76, %if_then_block12]
    %c|addr33 = phi i32[ 2800, %for_dest_block3], [ %sub65, %if_then_block12]
    mul28 = mul i32 %c|addr33, 2
    %eq30 = icmp eq i32 %mul28, 0
    br i1 %eq30, label %if_then_block7, label %if_dest_block8

if_then_block7; preds = %for_body_block5
    %StringConst77 = getelementptr [1 x i8], [1 x i8]* @const_string_no0, i32 0, i32 0
    %funccal78 = call void @print(i8* %StringConst77)
    %mainreturn_value0=0
    br label %main_return_block

if_dest_block8; preds = %if_then_block7
    br label %for_body_block10

for_body_block10; preds = %if_dest_block8
    %b|addr21 = phi i32[ %c|addr33, %if_dest_block8], [ %PreSub57, %if_dest_block13]
    %g|addr128 = phi i32[ %mul28, %if_dest_block8], [ %SelfSub55, %if_dest_block13]
    %d|addr44 = phi i32[ 0, %if_dest_block8], [ %mul62, %if_dest_block13]
    %getElementPtr37 = getelementptr i32, i32* %call_array_head_cast_11, i32 %b|addr21
    %GEP_Load38 = load i32, i32* %getElementPtr37
    mul40 = mul i32 %GEP_Load38, 10000
    add41 = add i32 %d|addr44, %mul40
    %getElementPtr44 = getelementptr i32, i32* %call_array_head_cast_11, i32 %b|addr21
    PreSub48 = sub i32 %g|addr128, 1
    srem49 = srem i32 %add41, %PreSub48
    store i32 %srem49, i32* %getElementPtr44
    sdiv53 = sdiv i32 %add41, %PreSub48
    SelfSub55 = sub i32 %PreSub48, 1
    PreSub57 = sub i32 %b|addr21, 1
    %eq58 = icmp eq i32 %PreSub57, 0
    br i1 %eq58, label %if_then_block12, label %if_dest_block13

if_then_block12; preds = %for_body_block10
    sub65 = sub i32 %c|addr33, 14
    sdiv69 = sdiv i32 %sdiv53, 10000
    add70 = add i32 %e|addr56, %sdiv69
    %funccal71 = call i8* @toString(i32 %add70)
    %funccal72 = call void @print(i8* %funccal71)
    srem76 = srem i32 %sdiv53, 10000
    br label %for_body_block5

if_dest_block13; preds = %if_then_block12
    mul62 = mul i32 %sdiv53, %PreSub57
    br label %for_body_block10

main_return_block; preds = %if_dest_block13
    ret i32 %mainreturn_value0

}

