

define ReturnType : i32
Parameter :  @test()
define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @test(){
test_entrance_block    %call_malloc_func4 = call i8* @malloc(i32 40004)
    store i32 10000, i32* %call_malloc_func4
    %call_array_head5 = getelementptr i32, i32* %call_malloc_func4, i32 1
    call_array_head_cast_6 = bitcast i32* %call_array_head5 to i32*
    br label %for_cond_block0

for_cond_block0; preds = %test_entrance_block
    %i|addr71 = phi i32[ 0, %test_entrance_block], [ %SelfAdd46, %for_dest_block7]
    %slt13 = icmp slt i32 %i|addr71, 10
    br i1 %slt13, label %for_body_block2, label %for_dest_block3

for_body_block2; preds = %for_cond_block0
    mul25 = mul i32 %i|addr71, 1000
    br label %for_cond_block4

for_cond_block4; preds = %for_body_block2
    %j|addr84 = phi i32[ 0, %for_body_block2], [ %SelfAdd44, %for_dest_block11]
    %slt16 = icmp slt i32 %j|addr84, 10
    br i1 %slt16, label %for_body_block6, label %for_dest_block7

for_body_block6; preds = %for_cond_block4
    mul27 = mul i32 %j|addr84, 100
    add28 = add i32 %mul25, %mul27
    br label %for_cond_block8

for_cond_block8; preds = %for_body_block6
    %k|addr99 = phi i32[ 0, %for_body_block6], [ %SelfAdd42, %for_dest_block15]
    %slt19 = icmp slt i32 %k|addr99, 10
    br i1 %slt19, label %for_body_block10, label %for_dest_block11

for_body_block10; preds = %for_cond_block8
    mul30 = mul i32 %k|addr99, 10
    add31 = add i32 %add28, %mul30
    br label %for_cond_block12

for_cond_block12; preds = %for_body_block10
    %l|addr1013 = phi i32[ 0, %for_body_block10], [ %SelfAdd40, %for_body_block14]
    %slt22 = icmp slt i32 %l|addr1013, 10
    br i1 %slt22, label %for_body_block14, label %for_dest_block15

for_body_block14; preds = %for_cond_block12
    add33 = add i32 %add31, %l|addr1013
    %getElementPtr34 = getelementptr i32, i32* %call_array_head_cast_6, i32 %add33
    add38 = add i32 %i|addr71, %l|addr1013
    store i32 %add38, i32* %getElementPtr34
    SelfAdd40 = add i32 %l|addr1013, 1
    br label %for_cond_block12

for_dest_block15; preds = %for_body_block14
    SelfAdd42 = add i32 %k|addr99, 1
    br label %for_cond_block8

for_dest_block11; preds = %for_dest_block15
    SelfAdd44 = add i32 %j|addr84, 1
    br label %for_cond_block4

for_dest_block7; preds = %for_dest_block11
    SelfAdd46 = add i32 %i|addr71, 1
    br label %for_cond_block0

for_dest_block3; preds = %for_dest_block7
    br label %for_cond_block16

for_cond_block16; preds = %for_dest_block3
    %i|addr70 = phi i32[ 0, %for_dest_block3], [ %SelfAdd102, %for_dest_block23]
    %sum|addr4724 = phi i32[ 0, %for_dest_block3], [ %sum|addr4723, %for_dest_block23]
    %slt50 = icmp slt i32 %i|addr70, 10
    br i1 %slt50, label %for_body_block18, label %for_dest_block19

for_body_block18; preds = %for_cond_block16
    mul83 = mul i32 %i|addr70, 1000
    br label %for_cond_block20

for_cond_block20; preds = %for_body_block18
    %j|addr82 = phi i32[ 0, %for_body_block18], [ %SelfAdd100, %for_dest_block27]
    %sum|addr4723 = phi i32[ %sum|addr4724, %for_body_block18], [ %sum|addr4722, %for_dest_block27]
    %slt53 = icmp slt i32 %j|addr82, 10
    br i1 %slt53, label %for_body_block22, label %for_dest_block23

for_body_block22; preds = %for_cond_block20
    mul85 = mul i32 %j|addr82, 100
    add70 = add i32 %mul83, %mul85
    br label %for_cond_block24

for_cond_block24; preds = %for_body_block22
    %k|addr96 = phi i32[ 0, %for_body_block22], [ %SelfAdd98, %for_dest_block31]
    %sum|addr4722 = phi i32[ %sum|addr4723, %for_body_block22], [ %sum|addr4721, %for_dest_block31]
    %slt56 = icmp slt i32 %k|addr96, 10
    br i1 %slt56, label %for_body_block26, label %for_dest_block27

for_body_block26; preds = %for_cond_block24
    mul88 = mul i32 %k|addr96, 10
    add89 = add i32 %add70, %mul88
    br label %for_cond_block28

for_cond_block28; preds = %for_body_block26
    %l|addr1015 = phi i32[ 0, %for_body_block26], [ %SelfAdd96, %if_dest_block34]
    %sum|addr4721 = phi i32[ %sum|addr4722, %for_body_block26], [ %sum|addr4720, %if_dest_block34]
    %slt59 = icmp slt i32 %l|addr1015, 10
    br i1 %slt59, label %for_body_block30, label %for_dest_block31

for_body_block30; preds = %for_cond_block28
    and61 = and i32 %l|addr1015, 1
    %eq62 = icmp eq i32 %and61, 1
    br i1 %eq62, label %if_then_block32, label %if_else_block33

if_then_block32; preds = %for_body_block30
    add75 = add i32 %add89, %l|addr1015
    %getElementPtr76 = getelementptr i32, i32* %call_array_head_cast_6, i32 %add75
    %GEP_Load77 = load i32, i32* %getElementPtr76
    add78 = add i32 %sum|addr4721, %GEP_Load77
    br label %if_dest_block34

if_else_block33; preds = %if_then_block32
    add91 = add i32 %add89, %l|addr1015
    %getElementPtr92 = getelementptr i32, i32* %call_array_head_cast_6, i32 %add91
    %GEP_Load93 = load i32, i32* %getElementPtr92
    sub94 = sub i32 %sum|addr4721, %GEP_Load93
    br label %if_dest_block34

if_dest_block34; preds = %if_else_block33
    %sum|addr4720 = phi i32[ %add78, %if_then_block32], [ %sub94, %if_else_block33]
    SelfAdd96 = add i32 %l|addr1015, 1
    br label %for_cond_block28

for_dest_block31; preds = %if_dest_block34
    SelfAdd98 = add i32 %k|addr96, 1
    br label %for_cond_block24

for_dest_block27; preds = %for_dest_block31
    SelfAdd100 = add i32 %j|addr82, 1
    br label %for_cond_block20

for_dest_block23; preds = %for_dest_block27
    SelfAdd102 = add i32 %i|addr70, 1
    br label %for_cond_block16

for_dest_block19; preds = %for_dest_block23
    %testreturn_value0=%sum|addr4724
    br label %test_return_block

test_return_block; preds = %for_dest_block19
    ret i32 %testreturn_value0

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    %funccal105 = call i32 @test()
    ashr106 = xor i32 %funccal105, 5000
    %mainreturn_value104=%ashr106
    br label %main_return_block

main_return_block; preds = %__init___entrance_block_i0
    ret i32 %mainreturn_value104

}

