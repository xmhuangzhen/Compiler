

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    br label %__init___return_block_i1

__init___return_block_i1; preds = %__init___entrance_block_i0
    br label %main_entrance_block_AB_2

main_entrance_block_AB_2; preds = %__init___return_block_i1
    br label %andand_dest_block4

andand_dest_block4; preds = %main_entrance_block_AB_2
    Andand_10 = and i1 false, %ne9
    br i1 %Andand_10, label %if_then_block0, label %if_else_block1

if_then_block0; preds = %andand_dest_block4
    br label %if_dest_block2

if_else_block1; preds = %if_then_block0
    br label %if_dest_block2

if_dest_block2; preds = %if_else_block1
    %c|addr30 = phi i32[ 10, %if_then_block0], [ 20, %if_else_block1]
    %eq14 = icmp eq i32 %c|addr30, 10
    br i1 %eq14, label %andand_b_block9, label %andand_dest_block10

andand_b_block9; preds = %if_dest_block2
    sdiv17 = sdiv i32 5, 0
    %eq18 = icmp eq i32 %sdiv17, 0
    br label %andand_dest_block10

andand_dest_block10; preds = %andand_b_block9
    Andand_19 = and i1 %eq14, %eq18
    br i1 %Andand_19, label %andand_b_block7, label %andand_dest_block8

andand_b_block7; preds = %andand_dest_block10
    br label %andand_dest_block8

andand_dest_block8; preds = %andand_b_block7
    Andand_22 = and i1 %Andand_19, true
    not23 = xor i1 true, %Andand_22
    br i1 %not23, label %if_then_block5, label %if_dest_block6

if_then_block5; preds = %andand_dest_block8
    br label %if_dest_block6

if_dest_block6; preds = %if_then_block5
    %c|addr31 = phi i32[ 30, %if_then_block5], [ %c|addr30, %andand_dest_block8]
    %mainreturn_value0=%c|addr31
    br label %main_return_block

main_return_block; preds = %if_dest_block6
    ret i32 %mainreturn_value0

}

