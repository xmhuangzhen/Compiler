

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
    call_size_13 = mul i32 4, 4
    call_size_24 = add i32 %call_size_13, 4
    %call_malloc_func5 = call i8* @malloc(i32 %call_size_24)
    store i32 4, i32* %call_malloc_func5
    %call_array_head6 = getelementptr i32, i32* %call_malloc_func5, i32 1
    store i32* %call_array_head6, i32** %a2
    %Id_load7 = load i32*, i32** %a2
    %getElementPtr8 = getelementptr i32, i32* %Id_load7, i32 1
    %GEP_Load9 = load i32, i32* %getElementPtr8
    store i32 1, i32* %getElementPtr8
    %Id_load10 = load i32*, i32** %a2
    %getElementPtr11 = getelementptr i32, i32* %Id_load10, i32 1
    %GEP_Load12 = load i32, i32* %getElementPtr11
    %funccal13 = call i8* @toString(i32 %GEP_Load12)
    %funccal14 = call void @println(ReturnType : i8*
Parameter : i32  %funccal13)
    %Id_load15 = load i32*, i32** %a2
    %getElementPtr16 = getelementptr i32, i32* %Id_load15, i32 1
    %GEP_Load17 = load i32, i32* %getElementPtr16
    store i32 %GEP_Load17, i32* %mainreturn_value0
    br label %main_last_block

main_last_block                                    ; preds = %main_entrance_block
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value0

}

