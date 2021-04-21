

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    %mainreturn_value0=30
    br label %main_return_block

main_return_block; preds = %__init___entrance_block_i0
    ret i32 %mainreturn_value0

}

