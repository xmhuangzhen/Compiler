

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter :  @test()
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : i32
Parameter :  @test(){
test_entrance_block    %j12=0
    %i0=0
    br label %for_cond_block0

for_cond_block0                                    ; preds = %test_entrance_block
    %slt5 = icmp slt i32 %i0, 200
    br i1 %slt5, label %for_body_block2, label %for_dest_block3

for_body_block2                                    ; preds = %for_cond_block0
    %j13=%j12
    %i1=%i0
    br label %andand_b_block9

andand_b_block9                                    ; preds = %for_body_block2
    %j15=%j13
    %i3=%i1
    br label %andand_dest_block10

andand_dest_block10                                ; preds = %andand_b_block9
    %j16=%j15
    %i4=%i3
    br label %andand_b_block7

andand_b_block7                                    ; preds = %andand_dest_block10
    %j17=%j16
    %i5=%i4
    br label %andand_dest_block8

andand_dest_block8                                 ; preds = %andand_b_block7
    %j18=%j17
    %i6=%i5
    br label %if_then_block4

if_then_block4                                     ; preds = %andand_dest_block8
    %j19=%j18
    %i7=%i6
    SelfAdd117 = add i32 %i6, 1
    SelfAdd119 = add i32 %j18, 1
    br label %if_dest_block6

if_dest_block6                                     ; preds = %if_then_block4
    %j21=%SelfAdd119
    %i9=%SelfAdd117
    br label %for_step_block1

for_step_block1                                    ; preds = %if_dest_block6
    %j22=%SelfAdd119
    %i10=%SelfAdd117
    SelfAdd125 = add i32 %SelfAdd117, 1
    %j12=%j22
    %i0=%SelfAdd125
    br label %for_cond_block0

for_dest_block3                                    ; preds = %for_step_block1
    %j14=%j12
    %i2=%i0
    %testreturn_value0=%j12
    br label %test_return_block

test_return_block                                  ; preds = %for_dest_block3
    %j23=%j14
    %i11=%i2
    ret i32 %testreturn_value0

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init128 = call void @__init__()
    %funccal129 = call i32 @test()
    sub130 = sub i32 %funccal129, 100
    %mainreturn_value127=%sub130
    br label %main_return_block

main_return_block                                  ; preds = %main_entrance_block
    ret i32 %mainreturn_value127

}

