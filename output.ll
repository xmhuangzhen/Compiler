
@n
@r
@c
@i
@j

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter : i32  @abs(i32*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : i32
Parameter : i32  @abs(i32*){
abs_entrance_block    %Id_load1 = load i32, i32* %c
    %sgt2 = icmp sgt i32 %Id_load1, 0
    br i1 %sgt2, label %if_then_block0, label %if_dest_block1

if_then_block0                                     ; preds = %abs_entrance_block
    %Id_load3 = load i32, i32* %c
    store i32 %Id_load3, i32* %absreturn_value0
    br label %abs_return_block
    br label %if_dest_block1

if_dest_block1                                     ; preds = %if_then_block0
    %Id_load4 = load i32, i32* %c
    minus5 = sub i32 0, %Id_load4
    store i32 %minus5, i32* %absreturn_value0
    br label %abs_return_block
    br label %abs_return_block

abs_return_block                                   ; preds = %if_dest_block1
    ret i32 %absreturn_value0

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init7 = call void @__init__()
    %i8 = load i32, i32 @i
    null
    br label %for_cond_block2

for_cond_block2                                    ; preds = %main_entrance_block
    %i9 = load i32, i32 @i
    %slt10 = icmp slt i32 %i9, 5
    br i1 %slt10, label %for_body_block4, label %for_dest_block5

for_body_block4                                    ; preds = %for_cond_block2
    %j11 = load i32, i32 @j
    null
    br label %for_cond_block6

for_cond_block6                                    ; preds = %for_body_block4
    %j12 = load i32, i32 @j
    %slt13 = icmp slt i32 %j12, 5
    br i1 %slt13, label %for_body_block8, label %for_dest_block9

for_body_block8                                    ; preds = %for_cond_block6
    %n14 = load i32, i32 @n
    %funccal15 = call i32 @getInt()
    null
    %n16 = load i32, i32 @n
    %eq17 = icmp eq i32 %n16, 1
    br i1 %eq17, label %if_then_block10, label %if_dest_block11

if_then_block10                                    ; preds = %for_body_block8
    %r18 = load i32, i32 @r
    %i19 = load i32, i32 @i
    null
    %c20 = load i32, i32 @c
    %j21 = load i32, i32 @j
    null
    br label %if_dest_block11

if_dest_block11                                    ; preds = %if_then_block10
    br label %for_step_block7

for_step_block7                                    ; preds = %if_dest_block11
    %j22 = load i32, i32 @j
    SelfAdd23 = add i32 %j22, 1
    null
    br label %for_cond_block6

for_dest_block9                                    ; preds = %for_step_block7
    br label %for_step_block3

for_step_block3                                    ; preds = %for_dest_block9
    %i24 = load i32, i32 @i
    SelfAdd25 = add i32 %i24, 1
    null
    br label %for_cond_block2

for_dest_block5                                    ; preds = %for_step_block3
    %r26 = load i32, i32 @r
    sub27 = sub i32 2, %r26
    %funccal28 = call i32 @abs(i32 %sub27)
    %c29 = load i32, i32 @c
    sub30 = sub i32 2, %c29
    %funccal31 = call i32 @abs(i32 %sub30)
    add32 = add i32 %funccal28, %funccal31
    store i32 %add32, i32* %mainreturn_value6
    br label %main_return_block
    br label %main_return_block

main_return_block                                  ; preds = %for_dest_block5
    ret i32 %mainreturn_value6

}

