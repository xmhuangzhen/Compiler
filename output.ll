

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter : i32 i32 i32  @tak(i32*, i32*, i32*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : i32
Parameter : i32 i32 i32  @tak(i32*, i32*, i32*){
tak_entrance_block    %Id_load1 = load i32, i32* %y
    %Id_load2 = load i32, i32* %x
    %slt3 = icmp slt i32 %Id_load1, %Id_load2
    br i1 %slt3, label %if_then_block0, label %if_else_block1

if_then_block0                                     ; preds = %tak_entrance_block
    %Id_load4 = load i32, i32* %x
    sub5 = sub i32 %Id_load4, 1
    %Id_load6 = load i32, i32* %y
    %Id_load7 = load i32, i32* %z
    %funccal8 = call i32 @tak(i32 %sub5, i32 %Id_load6, i32 %Id_load7)
    %Id_load9 = load i32, i32* %y
    sub10 = sub i32 %Id_load9, 1
    %Id_load11 = load i32, i32* %z
    %Id_load12 = load i32, i32* %x
    %funccal13 = call i32 @tak(i32 %sub10, i32 %Id_load11, i32 %Id_load12)
    %Id_load14 = load i32, i32* %z
    sub15 = sub i32 %Id_load14, 1
    %Id_load16 = load i32, i32* %x
    %Id_load17 = load i32, i32* %y
    %funccal18 = call i32 @tak(i32 %sub15, i32 %Id_load16, i32 %Id_load17)
    %funccal19 = call i32 @tak(i32 %funccal8, i32 %funccal13, i32 %funccal18)
    add20 = add i32 1, %funccal19
    %takreturn_value0=%add20
    br label %tak_return_block

if_else_block1                                     ; preds = %if_then_block0
    %Id_load21 = load i32, i32* %z
    %takreturn_value0=%Id_load21
    br label %tak_return_block

tak_return_block                                   ; preds = %if_else_block1
    ret i32 %takreturn_value0

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init23 = call void @__init__()
    %funccal24 = call i32 @tak(i32 18, i32 12, i32 6)
    %mainreturn_value22=%funccal24
    br label %main_return_block

main_return_block                                  ; preds = %main_entrance_block
    ret i32 %mainreturn_value22

}

