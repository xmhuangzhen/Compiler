

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
    %p0=10
    br label %while_cond_block0

while_cond_block0                                  ; preds = %main_entrance_block
    %sgt4 = icmp sgt i32 %p0, 5
    br i1 %sgt4, label %while_body_block1, label %while_dest_block2

while_body_block1                                  ; preds = %while_cond_block0
    SelfSub6 = sub i32 %p0, 1
    %p0=%SelfSub6
    br label %while_cond_block0

while_dest_block2                                  ; preds = %while_body_block1
    %mainreturn_value0=%p0
    br label %main_return_block

main_return_block                                  ; preds = %while_dest_block2
    ret i32 %mainreturn_value0

}

