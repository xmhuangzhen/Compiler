

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
    br label %for_cond_block0

for_cond_block0                                    ; preds = %test_entrance_block
    %j|addr23 = phi i32[ 0, %test_entrance_block], [ %j|addr22, %for_step_block1]
    %i|addr11 = phi i32[ 0, %test_entrance_block], [ %SelfAdd125, %for_step_block1]
    %slt5 = icmp slt i32 %i|addr11, 200
    br i1 %slt5, label %for_body_block2, label %for_dest_block3

for_body_block2                                    ; preds = %for_cond_block0
    ashr6 = xor i32 1, 2
    %eq7 = icmp eq i32 %ashr6, 3
    br i1 %eq7, label %andand_b_block9, label %andand_dest_block10

andand_b_block9                                    ; preds = %for_body_block2
    and8 = and i32 1, 1
    sdiv9 = sdiv i32 5, 3
    %eq10 = icmp eq i32 %and8, %sdiv9
    br label %andand_dest_block10

andand_dest_block10                                ; preds = %andand_b_block9
    Andand_11 = and i1 %eq7, %eq10
    br i1 %Andand_11, label %andand_b_block7, label %andand_dest_block8

andand_b_block7                                    ; preds = %andand_dest_block10
    add12 = add i32 1, 2
    add13 = add i32 %add12, 3
    add14 = add i32 %add13, 4
    add15 = add i32 %add14, 5
    add16 = add i32 %add15, 6
    add17 = add i32 %add16, 7
    add18 = add i32 %add17, 8
    add19 = add i32 %add18, 9
    add20 = add i32 %add19, 10
    add21 = add i32 %add20, 11
    add22 = add i32 %add21, 12
    add23 = add i32 %add22, 13
    add24 = add i32 %add23, 14
    add25 = add i32 %add24, 15
    add26 = add i32 %add25, 16
    add27 = add i32 %add26, 17
    add28 = add i32 %add27, 18
    add29 = add i32 %add28, 19
    add30 = add i32 %add29, 20
    add31 = add i32 %add30, 21
    add32 = add i32 %add31, 22
    add33 = add i32 %add32, 23
    add34 = add i32 %add33, 24
    add35 = add i32 %add34, 25
    add36 = add i32 %add35, 26
    add37 = add i32 %add36, 27
    add38 = add i32 %add37, 28
    add39 = add i32 %add38, 29
    add40 = add i32 %add39, 30
    add41 = add i32 %add40, 31
    add42 = add i32 %add41, 32
    add43 = add i32 %add42, 33
    add44 = add i32 %add43, 34
    add45 = add i32 %add44, 35
    add46 = add i32 %add45, 36
    add47 = add i32 %add46, 37
    add48 = add i32 %add47, 38
    add49 = add i32 %add48, 39
    add50 = add i32 %add49, 40
    add51 = add i32 %add50, 41
    add52 = add i32 %add51, 42
    add53 = add i32 %add52, 43
    add54 = add i32 %add53, 44
    add55 = add i32 %add54, 45
    add56 = add i32 %add55, 46
    add57 = add i32 %add56, 47
    add58 = add i32 %add57, 48
    add59 = add i32 %add58, 49
    add60 = add i32 %add59, 50
    add61 = add i32 %add60, 51
    add62 = add i32 %add61, 52
    add63 = add i32 %add62, 53
    add64 = add i32 %add63, 54
    add65 = add i32 %add64, 55
    add66 = add i32 %add65, 56
    add67 = add i32 %add66, 57
    add68 = add i32 %add67, 58
    add69 = add i32 %add68, 59
    add70 = add i32 %add69, 60
    add71 = add i32 %add70, 61
    add72 = add i32 %add71, 62
    add73 = add i32 %add72, 63
    add74 = add i32 %add73, 64
    add75 = add i32 %add74, 65
    add76 = add i32 %add75, 66
    add77 = add i32 %add76, 67
    add78 = add i32 %add77, 68
    add79 = add i32 %add78, 69
    add80 = add i32 %add79, 70
    add81 = add i32 %add80, 71
    add82 = add i32 %add81, 72
    add83 = add i32 %add82, 73
    add84 = add i32 %add83, 74
    add85 = add i32 %add84, 75
    add86 = add i32 %add85, 76
    add87 = add i32 %add86, 77
    add88 = add i32 %add87, 78
    add89 = add i32 %add88, 79
    add90 = add i32 %add89, 80
    add91 = add i32 %add90, 81
    add92 = add i32 %add91, 82
    add93 = add i32 %add92, 83
    add94 = add i32 %add93, 84
    add95 = add i32 %add94, 85
    add96 = add i32 %add95, 86
    add97 = add i32 %add96, 87
    add98 = add i32 %add97, 88
    add99 = add i32 %add98, 89
    add100 = add i32 %add99, 90
    add101 = add i32 %add100, 91
    add102 = add i32 %add101, 92
    add103 = add i32 %add102, 93
    add104 = add i32 %add103, 94
    add105 = add i32 %add104, 95
    add106 = add i32 %add105, 96
    add107 = add i32 %add106, 97
    add108 = add i32 %add107, 98
    add109 = add i32 %add108, 99
    add110 = add i32 %add109, 100
    add111 = add i32 100, 1
    mul112 = mul i32 %add111, 100
    sdiv113 = sdiv i32 %mul112, 2
    %eq114 = icmp eq i32 %add110, %sdiv113
    br label %andand_dest_block8

andand_dest_block8                                 ; preds = %andand_b_block7
    Andand_115 = and i1 %Andand_11, %eq114
    br i1 %Andand_115, label %if_then_block4, label %if_else_block5

if_then_block4                                     ; preds = %andand_dest_block8
    SelfAdd117 = add i32 %i|addr11, 1
    SelfAdd119 = add i32 %j|addr23, 1
    br label %if_dest_block6

if_else_block5                                     ; preds = %if_then_block4
    add121 = add i32 1, 1
    sub122 = sub i32 1, 1
    sdiv123 = sdiv i32 %add121, %sub122
    br label %if_dest_block6

if_dest_block6                                     ; preds = %if_else_block5
    %j|addr22 = phi i32[ %SelfAdd119, %if_then_block4], [ %sdiv123, %if_else_block5]
    %i|addr10 = phi i32[ %SelfAdd117, %if_then_block4], [ %i|addr11, %if_else_block5]
    br label %for_step_block1

for_step_block1                                    ; preds = %if_dest_block6
    SelfAdd125 = add i32 %i|addr10, 1
    br label %for_cond_block0

for_dest_block3                                    ; preds = %for_step_block1
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

