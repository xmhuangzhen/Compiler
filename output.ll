

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter : i32 i32 i32  @qpow(i32, i32, i32)
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
Parameter : i32 i32 i32  @qpow(i32, i32, i32){
qpow_entrance_block    store i32 %a0, i32* %qpowreturn_value3
    br label %qpow_last_block

qpow_last_block                                    ; preds = %qpow_entrance_block
    br label %qpow_return_block

qpow_return_block                                  ; preds = %qpow_last_block
    ret i32 %qpowreturn_value3

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init5 = call void @__init__()
    %funccal6 = call i32 @qpow(i32 2, i32 10, i32 10000)
    store i32 %funccal6, i32* %mainreturn_value4
    br label %main_last_block

main_last_block                                    ; preds = %main_entrance_block
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value4

}

