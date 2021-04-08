C2


define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init1 = call void @__init__()
    %Malloc_Result3 = call i8* @malloc(i32 13)
    Malloc_Cast_Result_4 = bitcast i32* %Malloc_Result3 to C2*
    %memacc_result6 = getelementptr C2, C2* %Malloc_Cast_Result_4, i32 0, i32 0
    store i32 10, i32* %memacc_result6
    %memacc_result9 = getelementptr C2, C2* %Malloc_Cast_Result_4, i32 0, i32 1
    store i32 20, i32* %memacc_result9
    %memacc_result12 = getelementptr C2, C2* %Malloc_Cast_Result_4, i32 0, i32 2
    %memacc_result15 = getelementptr C2, C2* %Malloc_Cast_Result_4, i32 0, i32 0
    %memacc_result16 = load i32, i32* %memacc_result15
    %memacc_result18 = getelementptr C2, C2* %Malloc_Cast_Result_4, i32 0, i32 1
    %memacc_result19 = load i32, i32* %memacc_result18
    %sgt20 = icmp sgt i32 %memacc_result16, %memacc_result19
    store i1 %sgt20, i1* %memacc_result12
    %memacc_result22 = getelementptr C2, C2* %Malloc_Cast_Result_4, i32 0, i32 2
    %memacc_result23 = load i1, i1* %memacc_result22
    br i1 %memacc_result23, label %main_entrance_blockPrime0, label %main_entrance_blockPrime1

main_entrance_blockPrime1                          ; preds = %main_entrance_block
    %o1=%Malloc_Cast_Result_4
    br label %if_else_block1

main_entrance_blockPrime0                          ; preds = %main_entrance_blockPrime1
    %o0=%Malloc_Cast_Result_4
    br label %if_then_block0

if_then_block0                                     ; preds = %main_entrance_blockPrime0
    %memacc_result25 = getelementptr C2, C2* %o0, i32 0, i32 3
    store i32 40, i32* %memacc_result25
    %o2=%o0
    br label %if_dest_block2

if_else_block1                                     ; preds = %if_then_block0
    %memacc_result28 = getelementptr C2, C2* %o1, i32 0, i32 3
    store i32 80, i32* %memacc_result28
    %o2=%o1
    br label %if_dest_block2

if_dest_block2                                     ; preds = %if_else_block1
    %memacc_result31 = getelementptr C2, C2* %o2, i32 0, i32 0
    %memacc_result32 = load i32, i32* %memacc_result31
    %memacc_result34 = getelementptr C2, C2* %o2, i32 0, i32 1
    %memacc_result35 = load i32, i32* %memacc_result34
    add36 = add i32 %memacc_result32, %memacc_result35
    %memacc_result38 = getelementptr C2, C2* %o2, i32 0, i32 3
    %memacc_result39 = load i32, i32* %memacc_result38
    add40 = add i32 %add36, %memacc_result39
    %mainreturn_value0=%add40
    %o3=%o2
    br label %main_return_block

main_return_block                                  ; preds = %if_dest_block2
    ret i32 %mainreturn_value0

}

