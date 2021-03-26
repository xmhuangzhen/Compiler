

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    call_size_13 = mul i32 20, 4
    call_size_24 = add i32 %call_size_13, 4
    %call_malloc_func2 = call i8* @malloc(i32 %call_size_24)
    store i32 20, i32* %call_malloc_func2
    %call_array_head5 = getelementptr i32, i32* %call_malloc_func2, i32 1
    %Subarray_start_Reg6 = load i32*, i32* %call_array_head5
    %SubArray_end_reg7 = getelementptr i32, i32* %call_array_head5, i32 20
    br label %cond_block0

cond_block0                                        ; preds = %main_entrance_block
    %Subarray_Cond_8 = icmp ne i32* %Subarray_start_Reg6, %SubArray_end_reg7
    br i1 %Subarray_Cond_8, label %body_block1, label %dest_block2

body_block1                                        ; preds = %cond_block0
    call_size_110 = mul i32 40, 4
    call_size_211 = add i32 %call_size_110, 4
    %call_malloc_func9 = call i8* @malloc(i32 %call_size_211)
    store i32 40, i32* %call_malloc_func9
    %call_array_head12 = getelementptr i32, i32* %call_malloc_func9, i32 1
    store i32 %call_array_head12, i32* %Subarray_start_Reg6
    %Subarray_start_Reg6 = getelementptr i32, i32* %Subarray_start_Reg6, i32 1
    br label %cond_block0

dest_block2                                        ; preds = %body_block1
    store i32** %call_array_head5, i32*** %a1
    %array_size14 = getelementptr i32**, i32*** %a1, i32 -1
    store i32 %array_size14, i32* %mainreturn_value0
    br label %main_last_block

main_last_block                                    ; preds = %dest_block2
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value0

}

