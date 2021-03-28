
@n
@const_string_no0
@const_string_no1

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___last_block                                ; preds = %__init___entrance_block

__init___return_block                              ; preds = %__init___last_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init1 = call void @__init__()
    %n2 = load i32, i32 @n
    %funccal3 = call i32 @getInt()
    null
    %n4 = load i32, i32 @n
    srem5 = srem i32 %n4, 4
    %eq6 = icmp eq i32 %srem5, 0
    %lhs_compare_7 = icmp eq i1 %eq6, 0
    br i1 %lhs_compare_7, label %oror_b_block9, label %oror_dest_block10

oror_b_block9                                      ; preds = %main_entrance_block
    %n8 = load i32, i32 @n
    srem9 = srem i32 %n8, 7
    %eq10 = icmp eq i32 %srem9, 0
    br label %oror_dest_block10

oror_dest_block10                                  ; preds = %oror_b_block9
    Oror_11 = or i1 %eq6, %eq10
    %lhs_compare_12 = icmp eq i1 %Oror_11, 0
    br i1 %lhs_compare_12, label %oror_b_block7, label %oror_dest_block8

oror_b_block7                                      ; preds = %oror_dest_block10
    %n13 = load i32, i32 @n
    srem14 = srem i32 %n13, 47
    %eq15 = icmp eq i32 %srem14, 0
    br label %oror_dest_block8

oror_dest_block8                                   ; preds = %oror_b_block7
    Oror_16 = or i1 %Oror_11, %eq15
    %lhs_compare_17 = icmp eq i1 %Oror_16, 0
    br i1 %lhs_compare_17, label %oror_b_block5, label %oror_dest_block6

oror_b_block5                                      ; preds = %oror_dest_block8
    %n18 = load i32, i32 @n
    srem19 = srem i32 %n18, 74
    %eq20 = icmp eq i32 %srem19, 0
    br label %oror_dest_block6

oror_dest_block6                                   ; preds = %oror_b_block5
    Oror_21 = or i1 %Oror_16, %eq20
    %lhs_compare_22 = icmp eq i1 %Oror_21, 0
    br i1 %lhs_compare_22, label %oror_b_block3, label %oror_dest_block4

oror_b_block3                                      ; preds = %oror_dest_block6
    %n23 = load i32, i32 @n
    srem24 = srem i32 %n23, 477
    %eq25 = icmp eq i32 %srem24, 0
    br label %oror_dest_block4

oror_dest_block4                                   ; preds = %oror_b_block3
    Oror_26 = or i1 %Oror_21, %eq25
    br i1 %Oror_26, label %if_then_block0, label %if_else_block1

if_then_block0                                     ; preds = %oror_dest_block4
    %StringConst27 = getelementptr [3 x i8], [3 x i8]* @const_string_no0, i32 0, i32 0
    %funccal28 = call void @print(i8* %StringConst27)
    br label %if_dest_block2

if_else_block1                                     ; preds = %if_then_block0
    %StringConst29 = getelementptr [2 x i8], [2 x i8]* @const_string_no1, i32 0, i32 0
    %funccal30 = call void @print(i8* %StringConst29)
    br label %if_dest_block2

if_dest_block2                                     ; preds = %if_else_block1
    br label %main_return_block

main_last_block                                    ; preds = %if_dest_block2

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value0

}

