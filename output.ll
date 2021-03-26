

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
    call_size_14 = mul i32 20, 4
    call_size_25 = add i32 %call_size_14, 4
    %call_malloc_func3 = call i8* @malloc(i32 %call_size_25)
    store i32 20, i32* %call_malloc_func3
    store i32* %call_malloc_func3, i32** %a2
    %funccal7 = call i32 @__array_size()
    store i32 %funccal7, i32* %mainreturn_value0
    br label %main_last_block

main_last_block                                    ; preds = %main_entrance_block
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value0

}

