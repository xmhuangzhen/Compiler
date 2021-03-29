%TA

@init_anger
@work_anger
@const_string_no0
@const_string_no1
@const_string_no2
@const_string_no3
@const_string_no4
@const_string_no5
@const_string_no6

define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter : i8* %TA*  @work(i8**, %TA**)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    null
    null
    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : void
Parameter : i8* %TA*  @work(i8**, %TA**){
work_entrance_block    %Id_load1 = load %TA*, %TA** %ta
    %memacc_result2 = getelementptr %TA, %TA* %Id_load1, i32 0, i32 1
    %memacc_result3 = load i32, i32* %memacc_result2
    %sle4 = icmp sle i32 %memacc_result3, 100
    br i1 %sle4, label %if_then_block0, label %if_else_block1

if_then_block0                                     ; preds = %work_entrance_block
    %Id_load5 = load i8*, i8** %st
    %StringConst6 = getelementptr [2 x i8], [2 x i8]* @const_string_no0, i32 0, i32 0
    %add7 = call i8* @__string_add(i8* %Id_load5, i8* %StringConst6)
    %Id_load8 = load %TA*, %TA** %ta
    %memacc_result9 = getelementptr %TA, %TA* %Id_load8, i32 0, i32 0
    %memacc_result10 = load i8*, i8** %memacc_result9
    %add11 = call i8* @__string_add(i8* %add7, i8* %memacc_result10)
    %StringConst12 = getelementptr [21 x i8], [21 x i8]* @const_string_no1, i32 0, i32 0
    %add13 = call i8* @__string_add(i8* %add11, i8* %StringConst12)
    %funccal14 = call void @println(i8* %add13)
    br label %if_dest_block2

if_else_block1                                     ; preds = %if_then_block0
    %Id_load15 = load i8*, i8** %st
    %StringConst16 = getelementptr [2 x i8], [2 x i8]* @const_string_no0, i32 0, i32 0
    %add17 = call i8* @__string_add(i8* %Id_load15, i8* %StringConst16)
    %Id_load18 = load %TA*, %TA** %ta
    %memacc_result19 = getelementptr %TA, %TA* %Id_load18, i32 0, i32 0
    %memacc_result20 = load i8*, i8** %memacc_result19
    %add21 = call i8* @__string_add(i8* %add17, i8* %memacc_result20)
    %StringConst22 = getelementptr [22 x i8], [22 x i8]* @const_string_no2, i32 0, i32 0
    %add23 = call i8* @__string_add(i8* %add21, i8* %StringConst22)
    %funccal24 = call void @println(i8* %add23)
    br label %if_dest_block2

if_dest_block2                                     ; preds = %if_else_block1
    %Id_load25 = load %TA*, %TA** %ta
    %memacc_result26 = getelementptr %TA, %TA* %Id_load25, i32 0, i32 1
    %memacc_result27 = load i32, i32* %memacc_result26
    %Id_load28 = load %TA*, %TA** %ta
    %memacc_result29 = getelementptr %TA, %TA* %Id_load28, i32 0, i32 1
    %memacc_result30 = load i32, i32* %memacc_result29
    %work_anger31 = load i32, i32 @work_anger
    add32 = add i32 %memacc_result30, %work_anger31
    store i32 %add32, i32* %memacc_result26
    br label %work_return_block

work_return_block                                  ; preds = %if_dest_block2
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init34 = call void @__init__()
    %Id_load37 = load %TA*, %TA** %mr35
    %Malloc_Result38 = call i8* @malloc(i32 8)
    Malloc_Cast_Result_39 = bitcast i32* %Malloc_Result38 to %TA*
    store %TA* %Malloc_Cast_Result_39, %TA** %mr35
    %Id_load40 = load %TA*, %TA** %mr35
    %memacc_result41 = getelementptr %TA, %TA* %Id_load40, i32 0, i32 0
    %memacc_result42 = load i8*, i8** %memacc_result41
    %StringConst43 = getelementptr [14 x i8], [14 x i8]* @const_string_no3, i32 0, i32 0
    store i8* %StringConst43, i8** %memacc_result41
    %Id_load44 = load %TA*, %TA** %mr35
    %memacc_result45 = getelementptr %TA, %TA* %Id_load44, i32 0, i32 1
    %memacc_result46 = load i32, i32* %memacc_result45
    store i32 0, i32* %memacc_result45
    %Id_load47 = load %TA*, %TA** %mars36
    %Malloc_Result48 = call i8* @malloc(i32 8)
    Malloc_Cast_Result_49 = bitcast i32* %Malloc_Result48 to %TA*
    store %TA* %Malloc_Cast_Result_49, %TA** %mars36
    %Id_load50 = load %TA*, %TA** %mars36
    %memacc_result51 = getelementptr %TA, %TA* %Id_load50, i32 0, i32 0
    %memacc_result52 = load i8*, i8** %memacc_result51
    %StringConst53 = getelementptr [15 x i8], [15 x i8]* @const_string_no4, i32 0, i32 0
    store i8* %StringConst53, i8** %memacc_result51
    %Id_load54 = load %TA*, %TA** %mars36
    %memacc_result55 = getelementptr %TA, %TA* %Id_load54, i32 0, i32 1
    %memacc_result56 = load i32, i32* %memacc_result55
    %init_anger57 = load i32, i32 @init_anger
    store i32 %init_anger57, i32* %memacc_result55
    %StringConst58 = getelementptr [2 x i8], [2 x i8]* @const_string_no5, i32 0, i32 0
    %Id_load59 = load %TA*, %TA** %mr35
    %funccal60 = call void @work(i8* %StringConst58, %TA* %Id_load59)
    %StringConst61 = getelementptr [4 x i8], [4 x i8]* @const_string_no6, i32 0, i32 0
    %Id_load62 = load %TA*, %TA** %mars36
    %funccal63 = call void @work(i8* %StringConst61, %TA* %Id_load62)
    %StringConst64 = getelementptr [4 x i8], [4 x i8]* @const_string_no6, i32 0, i32 0
    %Id_load65 = load %TA*, %TA** %mars36
    %funccal66 = call void @work(i8* %StringConst64, %TA* %Id_load65)
    store i32 0, i32* %mainreturn_value33
    br label %main_return_block
    br label %main_return_block

main_return_block                                  ; preds = %main_entrance_block
    ret i32 %mainreturn_value33

}

