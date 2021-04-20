
@n
@r
@c
@i
@j

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    br label %main_entrance_block_AB_2

main_entrance_block_AB_2; preds = %__init___entrance_block_i0
    store pointer is not pointertypei32
    br label %for_cond_block2

for_cond_block2; preds = %main_entrance_block_AB_2
    %i9 = load i32, i32 @i
    %slt10 = icmp slt i32 %i9, 5
    br i1 %slt10, label %for_body_block4, label %for_dest_block5

for_body_block4; preds = %for_cond_block2
    store pointer is not pointertypei32
    br label %for_cond_block6

for_cond_block6; preds = %for_body_block4
    %j12 = load i32, i32 @j
    %slt13 = icmp slt i32 %j12, 5
    br i1 %slt13, label %for_body_block8, label %for_dest_block9

for_body_block8; preds = %for_cond_block6
    %funccal15 = call i32 @getInt()
    store pointer is not pointertypei32
    %n16 = load i32, i32 @n
    %eq17 = icmp eq i32 %n16, 1
    br i1 %eq17, label %if_then_block10, label %if_dest_block11

if_then_block10; preds = %for_body_block8
    %i19 = load i32, i32 @i
    store pointer is not pointertypei32
    %j21 = load i32, i32 @j
    store pointer is not pointertypei32
    br label %if_dest_block11

if_dest_block11; preds = %if_then_block10
    br label %for_step_block7

for_step_block7; preds = %if_dest_block11
    %j22 = load i32, i32 @j
    SelfAdd23 = add i32 %j22, 1
    store pointer is not pointertypei32
    br label %for_cond_block6

for_dest_block9; preds = %for_step_block7
    br label %for_step_block3

for_step_block3; preds = %for_dest_block9
    %i24 = load i32, i32 @i
    SelfAdd25 = add i32 %i24, 1
    store pointer is not pointertypei32
    br label %for_cond_block2

for_dest_block5; preds = %for_step_block3
    %r26 = load i32, i32 @r
    br label %abs_entrance_block_i3

abs_entrance_block_i3; preds = %for_dest_block5
    %abs_ip0_0=%sub27
    %sgt3_i1 = icmp sgt i32 %abs_ip0_0, 0
    br i1 %sgt3_i1, label %if_then_block0_i4, label %if_dest_block1_i5

if_then_block0_i4; preds = %abs_entrance_block_i3
    %absreturn_value1_i2=%abs_ip0_0
    br label %abs_return_block_i6

if_dest_block1_i5; preds = %if_then_block0_i4
    minus6_i3 = sub i32 %r26, 2
    %absreturn_value1_i2=%minus6_i3
    br label %abs_return_block_i6

abs_return_block_i6; preds = %if_dest_block1_i5
    br label %for_dest_block5_AB_7

for_dest_block5_AB_7; preds = %abs_return_block_i6
    %funccal28=%absreturn_value1_i2
    %c29 = load i32, i32 @c
    br label %abs_entrance_block_i8

abs_entrance_block_i8; preds = %for_dest_block5_AB_7
    %abs_ip0_4=%sub30
    %sgt3_i5 = icmp sgt i32 %abs_ip0_4, 0
    br i1 %sgt3_i5, label %if_then_block0_i9, label %if_dest_block1_i10

if_then_block0_i9; preds = %abs_entrance_block_i8
    %absreturn_value1_i6=%abs_ip0_4
    br label %abs_return_block_i11

if_dest_block1_i10; preds = %if_then_block0_i9
    minus6_i7 = sub i32 %c29, 2
    %absreturn_value1_i6=%minus6_i7
    br label %abs_return_block_i11

abs_return_block_i11; preds = %if_dest_block1_i10
    br label %for_dest_block5_AB_7_AB_12

for_dest_block5_AB_7_AB_12; preds = %abs_return_block_i11
    %funccal31=%absreturn_value1_i6
    add32 = add i32 %funccal28, %funccal31
    %funccal33 = call void @printInt(i32 %add32)
    %mainreturn_value7=0
    br label %main_return_block

main_return_block; preds = %for_dest_block5_AB_7_AB_12
    ret i32 %mainreturn_value7

}

