taskStress

@const_string_no0

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i3

__init___entrance_block_i3; preds = %main_entrance_block
    %Malloc_Result207 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_208 = bitcast i32* %Malloc_Result207 to taskStress*
    %taskStress.taskStress_ip0_0=%Malloc_Cast_Result_208
    %Id_GEP_197_i1 = getelementptr taskStress, taskStress* %taskStress.taskStress_ip0_0, i32 0, i32 0
    store i32 -1, i32* %Id_GEP_197_i1
    %Id_GEP_200_i2 = getelementptr taskStress, taskStress* %taskStress.taskStress_ip0_0, i32 0, i32 0
    %Id_GEP_Load201_i3 = load i32, i32* %Id_GEP_200_i2
    %eq202_i4 = icmp eq i32 %Id_GEP_Load201_i3, -1
    br i1 %eq202_i4, label %if_then_block4_i8, label %if_dest_block5_i9

if_then_block4_i8; preds = %__init___entrance_block_i3
    %StringConst203_i5 = getelementptr [3 x i8], [3 x i8]* @const_string_no0, i32 0, i32 0
    %funccal204_i6 = call void @println(i8* %StringConst203_i5)
    br label %if_dest_block5_i9

if_dest_block5_i9; preds = %if_then_block4_i8
    %taskStress.main_ip0_7=%Malloc_Cast_Result_208
    %Id_GEP_3_i8 = getelementptr taskStress, taskStress* %taskStress.main_ip0_7, i32 0, i32 0
    %Id_GEP_Load4_i9 = load i32, i32* %Id_GEP_3_i8
    %funccal5_i10 = call void @printlnInt(i32 %Id_GEP_Load4_i9)
    %mainreturn_value205=0
    br label %main_return_block

main_return_block; preds = %if_dest_block5_i9
    ret i32 %mainreturn_value205

}

