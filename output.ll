
@a

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    add1 = add i32 @a, 1
    store i32 %add1, i32* @a
    store i32 %value, i32* %mainreturn_value0
    br label %main_last_block

main_last_block                                    ; preds = %main_entrance_block
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value0

}

