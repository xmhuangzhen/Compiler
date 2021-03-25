

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
    store i32 5, i32* %a2
    store i32 6, i32* %b3
    %sle4 = icmp sle i32 %b3, %a2
    br i1 %sle4, label %if_then_block0, label %if_else_block1

if_then_block0                                     ; preds = %main_entrance_block
    store i32 6, i32* %a2
    br label %if_dest_block2

if_else_block1                                     ; preds = %if_then_block0
    add5 = add i32 %a2, %b3
    store i32 %add5, i32* %a2
    br label %if_dest_block2

if_dest_block2                                     ; preds = %if_else_block1
    store i32 %a2, i32* %mainreturn_value0
    br label %main_last_block

main_last_block                                    ; preds = %if_dest_block2
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value0

}

