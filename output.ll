

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
test_entrance_block    %Id_load3 = load i32, i32* %i|addr1
    %j|addr23=0
    %i|addr11=0
    br label %for_cond_block0

for_cond_block0                                    ; preds = %test_entrance_block
    %slt5 = icmp slt i32 %i|addr11, 200
    br i1 %slt5, label %for_body_block2, label %for_dest_block3

for_body_block2                                    ; preds = %for_cond_block0
    SelfAdd117 = add i32 %i|addr11, 1
    SelfAdd119 = add i32 %j|addr23, 1
    %j|addr22=%SelfAdd119
    %i|addr10=%SelfAdd117
    SelfAdd125 = add i32 %SelfAdd117, 1
    %j|addr23=%j|addr22
    %i|addr11=%SelfAdd125
    br label %for_cond_block0

for_dest_block3                                    ; preds = %for_body_block2
    %testreturn_value0=%j|addr23
    br label %test_return_block

test_return_block                                  ; preds = %for_dest_block3
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

