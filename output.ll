

define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter : i32 i32 i32  @foo(i32, i32, i32)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block; preds = %__init___entrance_block
    ret void

}

define ReturnType : void
Parameter : i32 i32 i32  @foo(i32, i32, i32){
foo_entrance_block    mul5 = mul i32 %d, 1000
    mul7 = mul i32 %x, 10
    add8 = add i32 %mul5, %mul7
    add10 = add i32 %add8, %y
    %funccal11 = call i8* @toString(i32 %add10)
    %funccal12 = call void @println(i8* %funccal11)
    %eq14 = icmp eq i32 %d, 1
    br i1 %eq14, label %if_then_block0, label %if_dest_block1

if_then_block0; preds = %foo_entrance_block
    br label %if_dest_block1

if_dest_block1; preds = %if_then_block0
    %funccal23 = call void @foo(i32 1, i32 %y, i32 %x)
    mul25 = mul i32 %d, 1000
    mul27 = mul i32 %y, 10
    add28 = add i32 %mul25, %mul27
    add30 = add i32 %add28, %x
    %funccal31 = call i8* @toString(i32 %add30)
    %funccal32 = call void @println(i8* %funccal31)
    br label %foo_return_block

foo_return_block; preds = %if_dest_block1
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    call void @__init__()
    %funccal34 = call void @foo(i32 7, i32 5, i32 3)
    %mainreturn_value33=0
    br label %main_return_block

main_return_block; preds = %main_entrance_block
    ret i32 %mainreturn_value33

}

