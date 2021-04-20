older


define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter : older  @older.solveAge(older*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block; preds = %__init___entrance_block
    ret void

}

define ReturnType : void
Parameter : older  @older.solveAge(older*){
older.solveAge_entrance_block    %this|addr0 = alloca older**
    store older* %this, older** %this|addr0
    %ClassAddr_turnto_reg_2 = load older*, older** %this|addr0
    %Id_GEP_3 = getelementptr older, older* %ClassAddr_turnto_reg_2, i32 0, i32 0
    %Id_GEP_Load4 = load i32, i32* %Id_GEP_3
    store i32 1, i32* %Id_GEP_3
    br label %older.solveAge_return_block

older.solveAge_return_block; preds = %older.solveAge_entrance_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    call void @__init__()
    %mrJiang|addr6 = alloca older**
    %Malloc_Result7 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_8 = bitcast i32* %Malloc_Result7 to older*
    store older* %Malloc_Cast_Result_8, older** %mrJiang|addr6
    %Id_load9 = load older*, older** %mrJiang|addr6
    %funccal10 = call void @older.solveAge(older* %Id_load9)
    %Id_load11 = load older*, older** %mrJiang|addr6
    %memacc_result12 = getelementptr older, older* %Id_load11, i32 0, i32 0
    %memacc_result13 = load i32, i32* %memacc_result12
    %mainreturn_value5=%memacc_result13
    br label %main_return_block
    br label %main_return_block

main_return_block; preds = %main_entrance_block
    ret i32 %mainreturn_value5

}

