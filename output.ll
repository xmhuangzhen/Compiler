

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter : i32 i32 i32  @qpow(i32*, i32*, i32*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block; preds = %__init___entrance_block
    ret void

}

define ReturnType : i32
Parameter : i32 i32 i32  @qpow(i32*, i32*, i32*){
qpow_entrance_block    %Id_load3 = load i32, i32* %a
    br label %while_cond_block0

while_cond_block0; preds = %qpow_entrance_block
    %y|addr23 = phi i32[ %Id_load3, %qpow_entrance_block], [ %srem20, %if_dest_block4]
    %t|addr12 = phi i32[ 1, %qpow_entrance_block], [ %t|addr11, %if_dest_block4]
    %p0 = phi i32[ %p, %qpow_entrance_block], [ %sdiv23, %if_dest_block4]
    %sgt5 = icmp sgt i32 %p0, 0
    br i1 %sgt5, label %while_body_block1, label %while_dest_block2

while_body_block1; preds = %while_cond_block0
    and7 = and i32 %p0, 1
    %eq8 = icmp eq i32 %and7, 1
    br i1 %eq8, label %if_then_block3, label %if_dest_block4

if_then_block3; preds = %while_body_block1
    mul12 = mul i32 %t|addr12, %y|addr23
    %Id_load13 = load i32, i32* %mod
    srem14 = srem i32 %mul12, %Id_load13
    br label %if_dest_block4

if_dest_block4; preds = %if_then_block3
    %t|addr11 = phi i32[ %srem14, %if_then_block3], [ %t|addr12, %while_body_block1]
    mul18 = mul i32 %y|addr23, %y|addr23
    %Id_load19 = load i32, i32* %mod
    srem20 = srem i32 %mul18, %Id_load19
    sdiv23 = sdiv i32 %p0, 2
    br label %while_cond_block0

while_dest_block2; preds = %if_dest_block4
    %qpowreturn_value0=%t|addr12
    br label %qpow_return_block

qpow_return_block; preds = %while_dest_block2
    ret i32 %qpowreturn_value0

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    call void @__init__()
    %funccal26 = call i32 @qpow(i32 2, i32 10, i32 10000)
    %mainreturn_value25=%funccal26
    br label %main_return_block

main_return_block; preds = %main_entrance_block
    ret i32 %mainreturn_value25

}

