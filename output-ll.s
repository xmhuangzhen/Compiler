
@const_string_no0

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init = call void @__init__()
    %StringConst = getelementptr [3 x i8], [3 x i8]* @const_string_no0, i32 0, i32 0
    %funccal = call void @println(i8* %StringConst)
    store i32 0, i32* %mainreturn_value
    br label %main_last_block
    br label %main_return_block

main_last_block                                    ; preds = %main_entrance_block

main_return_block                                  ; preds = %main_last_block
    ret ReturnType : i32
Parameter :  %mainreturn_value

}

