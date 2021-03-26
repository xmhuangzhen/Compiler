

define ReturnType : i32
Parameter : i32 i32 i32  @tak(i32, i32, i32)
define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter : i32 i32 i32  @tak(i32, i32, i32){
tak_entrance_block    %slt1 = icmp slt i32 %y, %x
    br i1 %slt1, label %if_then_block0, label %if_else_block1

if_then_block0                                     ; preds = %tak_entrance_block
    store i32 0, i32* %takreturn_value0
    br label %tak_last_block

if_else_block1                                     ; preds = %if_then_block0
    store i32 %z, i32* %takreturn_value0
    br label %tak_last_block

if_dest_block2                                     ; preds = %if_else_block1
    br label %tak_return_block

tak_last_block                                     ; preds = %if_dest_block2
    br label %if_dest_block2
    br label %if_dest_block2

tak_return_block                                   ; preds = %tak_last_block
    ret i32 %takreturn_value0

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %funccal6 = call i32 @getInt()
    store i32 %funccal6, i32* %a3
    %funccal7 = call i32 @getInt()
    store i32 %funccal7, i32* %b4
    %funccal8 = call i32 @getInt()
    store i32 %funccal8, i32* %c5
    %funccal9 = call i32 @tak(i32* %a3, i32* %b4, i32* %c5)
    store i32 %funccal9, i32* %mainreturn_value2
    br label %main_last_block

main_last_block                                    ; preds = %main_entrance_block
    br label %main_return_block

main_return_block                                  ; preds = %main_last_block
    ret i32 %mainreturn_value2

}

