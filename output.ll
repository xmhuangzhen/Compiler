

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter : i32  @abs(i32)
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
Parameter : i32  @abs(i32){
abs_entrance_block    %sgt2 = icmp sgt i32 %Id_c1, 0
    br i1 %sgt2, label %if_then_block0, label %if_dest_block1

if_then_block0                                     ; preds = %abs_entrance_block
    store i32 %Id_c3, i32* %absreturn_value0
    br label %abs_last_block

if_dest_block1                                     ; preds = %if_then_block0
    minus5 = sub i32 1, %Id_c4
    store i32 %minus5, i32* %absreturn_value0
    br label %abs_last_block

abs_last_block                                     ; preds = %if_dest_block1
    br label %if_dest_block1
    br label %abs_return_block

abs_return_block                                   ; preds = %abs_last_block
    ret i32 %absreturn_value0

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init7 = call void @__init__()
    store i32 0, i32* %mainreturn_value6
    br label %main_last_block

main_last_block                                    ; preds = %main_entrance_block
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value6

}

