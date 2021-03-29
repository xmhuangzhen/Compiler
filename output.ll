%TA

@const_string_no0

define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter : %TA*  @work(%TA**)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : void
Parameter : %TA*  @work(%TA**){
work_entrance_block    %Id_load1 = load %TA*, %TA** %tmp
    %memacc_result2 = getelementptr %TA, %TA* %Id_load1, i32 0, i32 0
    %memacc_result3 = load i8*, i8** %memacc_result2
    %funccal4 = call void @println(i8* %memacc_result3)
    br label %work_return_block

work_return_block                                  ; preds = %work_entrance_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init6 = call void @__init__()
    %Id_load8 = load %TA*, %TA** %ta7
    %Malloc_Result9 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_10 = bitcast i32* %Malloc_Result9 to %TA*
    store %TA* %Malloc_Cast_Result_10, %TA** %ta7
    %Id_load11 = load %TA*, %TA** %ta7
    %memacc_result12 = getelementptr %TA, %TA* %Id_load11, i32 0, i32 0
    %memacc_result13 = load i8*, i8** %memacc_result12
    %StringConst14 = getelementptr [3 x i8], [3 x i8]* @const_string_no0, i32 0, i32 0
    store i8* %StringConst14, i8** %memacc_result12
    %Id_load15 = load %TA*, %TA** %ta7
    %funccal16 = call void @work(%TA* %Id_load15)
    store i32 0, i32* %mainreturn_value5
    br label %main_return_block
    br label %main_return_block

main_return_block                                  ; preds = %main_entrance_block
    ret i32 %mainreturn_value5

}

