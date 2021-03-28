%point


define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter : %point  @point.point(%point*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___last_block                                ; preds = %__init___entrance_block

__init___return_block                              ; preds = %__init___last_block
    ret void

}

define ReturnType : void
Parameter : %point  @point.point(%point*){
point.point_entrance_block    %ClassAddr_turnto_reg_0=%this
    %Id_GEP_1 = getelementptr %point, %point* %ClassAddr_turnto_reg_0, i32 0, i32 0
    %Id_GEP_Load2 = load i32, %point* %ClassAddr_turnto_reg_0
    store i32 0, i32* %Id_GEP_1
    br label %point.point_return_block

point.point_last_block                             ; preds = %point.point_entrance_block

point.point_return_block                           ; preds = %point.point_last_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init4 = call void @__init__()
    %Malloc_Result6 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_7 = bitcast i32* %Malloc_Result6 to %point*
    call void @point.point(%point* %Malloc_Cast_Result_7)
    store %point* %Malloc_Cast_Result_7, %point** %a5
    %Id_load8 = load %point*, %point** %a5
    %memacc_result9 = getelementptr %point, %point* %Id_load8, i32 0, i32 0
    %memacc_result10 = load i32, i32* %memacc_result9
    store i32 %memacc_result10, i32* %mainreturn_value3
    br label %main_last_block

main_last_block                                    ; preds = %main_entrance_block
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value3

}

