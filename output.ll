
@rng_seed

define ReturnType : void
Parameter :  @__init__()
define ReturnType : i32
Parameter : i32 i32  @unsigned_shl(i32*, i32*)
define ReturnType : i32
Parameter : i32 i32  @unsigned_shr(i32*, i32*)
define ReturnType : i32
Parameter :  @rng()
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    null
    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : i32
Parameter : i32 i32  @unsigned_shl(i32*, i32*){
unsigned_shl_entrance_block    %Id_load1 = load i32, i32* %x
    %Id_load2 = load i32, i32* %k
    shl3 = shl i32 %Id_load1, %Id_load2
    %unsigned_shlreturn_value0=%shl3
    br label %unsigned_shl_return_block

unsigned_shl_return_block                          ; preds = %unsigned_shl_entrance_block
    ret i32 %unsigned_shlreturn_value0

}

define ReturnType : i32
Parameter : i32 i32  @unsigned_shr(i32*, i32*){
unsigned_shr_entrance_block    %Id_load7 = load i32, i32* %x
    %sge8 = icmp sge i32 %Id_load7, 0
    br i1 %sge8, label %if_then_block0, label %if_else_block1

if_then_block0                                     ; preds = %unsigned_shr_entrance_block
    br label %unsigned_shr_return_block

if_else_block1                                     ; preds = %if_then_block0
    %Id_load12 = load i32, i32* %k
    sub13 = sub i32 31, %Id_load12
    shl14 = shl i32 1, %sub13
    %Id_load15 = load i32, i32* %x
    ashr17 = xor i32 %Id_load15, 2147483648
    %Id_load18 = load i32, i32* %k
    ashr19 = ashr i32 %ashr17, %Id_load18
    or20 = or i32 %shl14, %ashr19
    %unsigned_shrreturn_value4=%or20
    br label %unsigned_shr_return_block

unsigned_shr_return_block                          ; preds = %if_else_block1
    ret i32 %unsigned_shrreturn_value4

}

define ReturnType : i32
Parameter :  @rng(){
rng_entrance_block    %rng_seed24 = load i32, i32 @rng_seed
    %funccal28 = call i32 @unsigned_shl(i32 %rng_seed24, i32 13)
    ashr29 = xor i32 %rng_seed24, %funccal28
    %funccal33 = call i32 @unsigned_shr(i32 %ashr29, i32 17)
    ashr34 = xor i32 %ashr29, %funccal33
    %funccal38 = call i32 @unsigned_shl(i32 %ashr34, i32 5)
    ashr39 = xor i32 %ashr34, %funccal38
    null
    and44 = and i32 %ashr39, 1073741823
    %rngreturn_value21=%and44
    br label %rng_return_block

rng_return_block                                   ; preds = %rng_entrance_block
    ret i32 %rngreturn_value21

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init46 = call void @__init__()
    br label %while_cond_block3

while_cond_block3                                  ; preds = %main_entrance_block
    %rng_seed47 = load i32, i32 @rng_seed
    srem48 = srem i32 %rng_seed47, 100
    %ne49 = icmp ne i32 %srem48, 0
    br i1 %ne49, label %while_body_block4, label %while_dest_block5

while_body_block4                                  ; preds = %while_cond_block3
    %rng_seed50 = load i32, i32 @rng_seed
    SelfSub51 = sub i32 %rng_seed50, 1
    null
    br label %while_cond_block3

while_dest_block5                                  ; preds = %while_body_block4
    %funccal53 = call i32 @rng()
    %funccal56 = call i32 @rng()
    and57 = and i32 %funccal56, 127
    add58 = add i32 %and57, 100000
    br label %for_cond_block6

for_cond_block6                                    ; preds = %while_dest_block5
    %i|addr541 = phi i32[ 0, %while_dest_block5], [ %PreAdd102, %for_step_block7]
    %slt62 = icmp slt i32 %i|addr541, %add58
    br i1 %slt62, label %for_body_block8, label %for_dest_block9

for_body_block8                                    ; preds = %for_cond_block6
    br label %for_step_block7

for_step_block7                                    ; preds = %for_body_block8
    PreAdd102 = add i32 %i|addr541, 1
    br label %for_cond_block6

for_dest_block9                                    ; preds = %for_step_block7
    %mainreturn_value45=0
    br label %main_return_block

main_return_block                                  ; preds = %for_dest_block9
    ret i32 %mainreturn_value45

}

