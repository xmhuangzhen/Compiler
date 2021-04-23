
@N

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    store pointer is not pointertypei32
    br label %for_cond_block0_i4

for_cond_block0_i4; preds = %__init___entrance_block_i0
    %i|addr11_i0 = phi i32[ 0, %__init___entrance_block_i0], [ %SelfAdd189_i1, %for_body_block2_i5]
    %j|addr26_i2 = phi i32[ 0, %__init___entrance_block_i0], [ %SelfAdd183_i3, %for_body_block2_i5]
    %slt7_i4 = icmp slt i32 %i|addr11_i0, 200
    br i1 %slt7_i4, label %for_body_block2_i5, label %for_dest_block3_i6

for_body_block2_i5; preds = %for_cond_block0_i4
    SelfAdd181_i5 = add i32 %i|addr11_i0, 1
    SelfAdd183_i3 = add i32 %j|addr26_i2, 1
    SelfAdd189_i1 = add i32 %SelfAdd181_i5, 1
    br label %for_cond_block0_i4

for_dest_block3_i6; preds = %for_body_block2_i5
    %testreturn_value0_i6=%j|addr26_i2
    %funccal2700=%testreturn_value0_i6
    sub2705 = add i32 %funccal2700, 65436
    %mainreturn_value2699=%sub2705
    br label %main_return_block

main_return_block; preds = %for_dest_block3_i6
    ret i32 %mainreturn_value2699

}

