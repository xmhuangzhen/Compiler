

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init1 = call void @__init__()
    store i32 5, i32* %a2
    SelfAdd7 = add i32 %Id_a6, 1
    store i32 %SelfAdd7, i32* %Id_a6
    store i32 %SelfAdd7, i32* %Id_c5
    store i32 %Id_c9, i32* %Id_b8
    store i32 %Id_a10, i32* %mainreturn_value0
    br label %main_last_block

main_last_block                                    ; preds = %main_entrance_block
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret ReturnType : i32
Parameter :  %mainreturn_value0

}

