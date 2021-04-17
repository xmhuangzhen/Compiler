

define ReturnType : i32
Parameter : i32  @A(i32*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter : i32  @A(i32*){
A_entrance_block    %Id_load3 = load i32, i32* %x
    br label %B_entrance_block_i0

B_entrance_block_i0; preds = %A_entrance_block
    %B_ip0_0=%Id_load3
    %Id_load1_i1 = load i32, i32* %B_ip0_0
    %Breturn_value0_i2=%Id_load1_i1
    br label %B_return_block_i1

B_return_block_i1; preds = %B_entrance_block_i0
    br label %A_entrance_block_AB_2

A_entrance_block_AB_2; preds = %B_return_block_i1
    %funccal4=%Breturn_value0_i2
    add5 = add i32 %funccal4, 7
    %Areturn_value2=%add5
    br label %A_return_block

A_return_block; preds = %A_entrance_block_AB_2
    ret i32 %Areturn_value2

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i3

__init___entrance_block_i3; preds = %main_entrance_block
    br label %__init___return_block_i4

__init___return_block_i4; preds = %__init___entrance_block_i3
    br label %main_entrance_block_AB_5

main_entrance_block_AB_5; preds = %__init___return_block_i4
    br label %for_body_block0

for_body_block0; preds = %main_entrance_block_AB_5
    %slt13 = icmp slt i32 %x|addr70, 1000
    br i1 %slt13, label %if_then_block2, label %if_else_block3

if_then_block2; preds = %for_body_block0
    br label %A_entrance_block_i6

A_entrance_block_i6; preds = %if_then_block2
    %A_ip0_3=%x|addr70
    %Id_load3_i4 = load i32, i32* %A_ip0_3
    br label %B_entrance_block_i0_i7

B_entrance_block_i0_i7; preds = %A_entrance_block_i6
    %B_ip0_0_i5=%Id_load3_i4
    %Id_load1_i1_i6 = load i32, i32* %B_ip0_0_i5
    %Breturn_value0_i2_i7=%Id_load1_i1_i6
    br label %B_return_block_i1_i8

B_return_block_i1_i8; preds = %B_entrance_block_i0_i7
    br label %A_entrance_block_AB_2_i9

A_entrance_block_AB_2_i9; preds = %B_return_block_i1_i8
    %funccal4_i8=%Breturn_value0_i2_i7
    add5_i9 = add i32 %funccal4_i8, 7
    %Areturn_value2_i10=%add5_i9
    br label %A_return_block_i10

A_return_block_i10; preds = %A_entrance_block_AB_2_i9
    br label %if_then_block2_AB_11

if_then_block2_AB_11; preds = %A_return_block_i10
    %funccal16=%Areturn_value2_i10
    br label %A_entrance_block_i12

A_entrance_block_i12; preds = %if_then_block2_AB_11
    %A_ip0_11=%funccal16
    %Id_load3_i12 = load i32, i32* %A_ip0_11
    br label %B_entrance_block_i0_i13

B_entrance_block_i0_i13; preds = %A_entrance_block_i12
    %B_ip0_0_i13=%Id_load3_i12
    %Id_load1_i1_i14 = load i32, i32* %B_ip0_0_i13
    %Breturn_value0_i2_i15=%Id_load1_i1_i14
    br label %B_return_block_i1_i14

B_return_block_i1_i14; preds = %B_entrance_block_i0_i13
    br label %A_entrance_block_AB_2_i15

A_entrance_block_AB_2_i15; preds = %B_return_block_i1_i14
    %funccal4_i16=%Breturn_value0_i2_i15
    add5_i17 = add i32 %funccal4_i16, 7
    %Areturn_value2_i18=%add5_i17
    br label %A_return_block_i16

A_return_block_i16; preds = %A_entrance_block_AB_2_i15
    br label %if_then_block2_AB_11_AB_17

if_then_block2_AB_11_AB_17; preds = %A_return_block_i16
    %funccal19=%Areturn_value2_i18
    br label %A_entrance_block_i18

A_entrance_block_i18; preds = %if_then_block2_AB_11_AB_17
    %A_ip0_19=%funccal19
    %Id_load3_i20 = load i32, i32* %A_ip0_19
    br label %B_entrance_block_i0_i19

B_entrance_block_i0_i19; preds = %A_entrance_block_i18
    %B_ip0_0_i21=%Id_load3_i20
    %Id_load1_i1_i22 = load i32, i32* %B_ip0_0_i21
    %Breturn_value0_i2_i23=%Id_load1_i1_i22
    br label %B_return_block_i1_i20

B_return_block_i1_i20; preds = %B_entrance_block_i0_i19
    br label %A_entrance_block_AB_2_i21

A_entrance_block_AB_2_i21; preds = %B_return_block_i1_i20
    %funccal4_i24=%Breturn_value0_i2_i23
    add5_i25 = add i32 %funccal4_i24, 7
    %Areturn_value2_i26=%add5_i25
    br label %A_return_block_i22

A_return_block_i22; preds = %A_entrance_block_AB_2_i21
    br label %if_then_block2_AB_11_AB_17_AB_23

if_then_block2_AB_11_AB_17_AB_23; preds = %A_return_block_i22
    %funccal22=%Areturn_value2_i26
    br label %A_entrance_block_i24

A_entrance_block_i24; preds = %if_then_block2_AB_11_AB_17_AB_23
    %A_ip0_27=%funccal22
    %Id_load3_i28 = load i32, i32* %A_ip0_27
    br label %B_entrance_block_i0_i25

B_entrance_block_i0_i25; preds = %A_entrance_block_i24
    %B_ip0_0_i29=%Id_load3_i28
    %Id_load1_i1_i30 = load i32, i32* %B_ip0_0_i29
    %Breturn_value0_i2_i31=%Id_load1_i1_i30
    br label %B_return_block_i1_i26

B_return_block_i1_i26; preds = %B_entrance_block_i0_i25
    br label %A_entrance_block_AB_2_i27

A_entrance_block_AB_2_i27; preds = %B_return_block_i1_i26
    %funccal4_i32=%Breturn_value0_i2_i31
    add5_i33 = add i32 %funccal4_i32, 7
    %Areturn_value2_i34=%add5_i33
    br label %A_return_block_i28

A_return_block_i28; preds = %A_entrance_block_AB_2_i27
    br label %if_then_block2_AB_11_AB_17_AB_23_AB_29

if_then_block2_AB_11_AB_17_AB_23_AB_29; preds = %A_return_block_i28
    %funccal25=%Areturn_value2_i34
    br label %A_entrance_block_i30

A_entrance_block_i30; preds = %if_then_block2_AB_11_AB_17_AB_23_AB_29
    %A_ip0_35=%funccal25
    %Id_load3_i36 = load i32, i32* %A_ip0_35
    br label %B_entrance_block_i0_i31

B_entrance_block_i0_i31; preds = %A_entrance_block_i30
    %B_ip0_0_i37=%Id_load3_i36
    %Id_load1_i1_i38 = load i32, i32* %B_ip0_0_i37
    %Breturn_value0_i2_i39=%Id_load1_i1_i38
    br label %B_return_block_i1_i32

B_return_block_i1_i32; preds = %B_entrance_block_i0_i31
    br label %A_entrance_block_AB_2_i33

A_entrance_block_AB_2_i33; preds = %B_return_block_i1_i32
    %funccal4_i40=%Breturn_value0_i2_i39
    add5_i41 = add i32 %funccal4_i40, 7
    %Areturn_value2_i42=%add5_i41
    br label %A_return_block_i34

A_return_block_i34; preds = %A_entrance_block_AB_2_i33
    br label %if_then_block2_AB_11_AB_17_AB_23_AB_29_AB_35

if_then_block2_AB_11_AB_17_AB_23_AB_29_AB_35; preds = %A_return_block_i34
    %funccal28=%Areturn_value2_i42
    br label %A_entrance_block_i36

A_entrance_block_i36; preds = %if_then_block2_AB_11_AB_17_AB_23_AB_29_AB_35
    %A_ip0_43=%funccal28
    %Id_load3_i44 = load i32, i32* %A_ip0_43
    br label %B_entrance_block_i0_i37

B_entrance_block_i0_i37; preds = %A_entrance_block_i36
    %B_ip0_0_i45=%Id_load3_i44
    %Id_load1_i1_i46 = load i32, i32* %B_ip0_0_i45
    %Breturn_value0_i2_i47=%Id_load1_i1_i46
    br label %B_return_block_i1_i38

B_return_block_i1_i38; preds = %B_entrance_block_i0_i37
    br label %A_entrance_block_AB_2_i39

A_entrance_block_AB_2_i39; preds = %B_return_block_i1_i38
    %funccal4_i48=%Breturn_value0_i2_i47
    add5_i49 = add i32 %funccal4_i48, 7
    %Areturn_value2_i50=%add5_i49
    br label %A_return_block_i40

A_return_block_i40; preds = %A_entrance_block_AB_2_i39
    br label %if_then_block2_AB_11_AB_17_AB_23_AB_29_AB_35_AB_41

if_then_block2_AB_11_AB_17_AB_23_AB_29_AB_35_AB_41; preds = %A_return_block_i40
    %funccal31=%Areturn_value2_i50
    br label %A_entrance_block_i42

A_entrance_block_i42; preds = %if_then_block2_AB_11_AB_17_AB_23_AB_29_AB_35_AB_41
    %A_ip0_51=%funccal31
    %Id_load3_i52 = load i32, i32* %A_ip0_51
    br label %B_entrance_block_i0_i43

B_entrance_block_i0_i43; preds = %A_entrance_block_i42
    %B_ip0_0_i53=%Id_load3_i52
    %Id_load1_i1_i54 = load i32, i32* %B_ip0_0_i53
    %Breturn_value0_i2_i55=%Id_load1_i1_i54
    br label %B_return_block_i1_i44

B_return_block_i1_i44; preds = %B_entrance_block_i0_i43
    br label %A_entrance_block_AB_2_i45

A_entrance_block_AB_2_i45; preds = %B_return_block_i1_i44
    %funccal4_i56=%Breturn_value0_i2_i55
    add5_i57 = add i32 %funccal4_i56, 7
    %Areturn_value2_i58=%add5_i57
    br label %A_return_block_i46

A_return_block_i46; preds = %A_entrance_block_AB_2_i45
    br label %if_then_block2_AB_11_AB_17_AB_23_AB_29_AB_35_AB_41_AB_47

if_then_block2_AB_11_AB_17_AB_23_AB_29_AB_35_AB_41_AB_47; preds = %A_return_block_i46
    %funccal34=%Areturn_value2_i58
    %funccal37 = call i32 @A(i32 %funccal34)
    %funccal40 = call i32 @A(i32 %funccal37)
    %funccal43 = call i32 @A(i32 %funccal40)
    %funccal46 = call i32 @A(i32 %funccal43)
    %funccal49 = call i32 @A(i32 %funccal46)
    %funccal52 = call i32 @A(i32 %funccal49)
    %funccal55 = call i32 @A(i32 %funccal52)
    %funccal58 = call i32 @A(i32 %funccal55)
    %funccal61 = call i32 @A(i32 %funccal58)
    %funccal64 = call i32 @A(i32 %funccal61)
    %funccal67 = call i32 @A(i32 %funccal64)
    %funccal70 = call i32 @A(i32 %funccal67)
    %funccal73 = call i32 @A(i32 %funccal70)
    %funccal76 = call i32 @A(i32 %funccal73)
    %funccal79 = call i32 @A(i32 %funccal76)
    %funccal82 = call i32 @A(i32 %funccal79)
    %funccal85 = call i32 @A(i32 %funccal82)
    %funccal88 = call i32 @A(i32 %funccal85)
    %funccal91 = call i32 @A(i32 %funccal88)
    %funccal94 = call i32 @A(i32 %funccal91)
    %funccal97 = call i32 @A(i32 %funccal94)
    %funccal100 = call i32 @A(i32 %funccal97)
    %funccal103 = call i32 @A(i32 %funccal100)
    %funccal106 = call i32 @A(i32 %funccal103)
    %funccal109 = call i32 @A(i32 %funccal106)
    %funccal112 = call i32 @A(i32 %funccal109)
    %funccal115 = call i32 @A(i32 %funccal112)
    %funccal118 = call i32 @A(i32 %funccal115)
    %funccal121 = call i32 @A(i32 %funccal118)
    %funccal124 = call i32 @A(i32 %funccal121)
    %funccal127 = call i32 @A(i32 %funccal124)
    %funccal130 = call i32 @A(i32 %funccal127)
    %funccal133 = call i32 @A(i32 %funccal130)
    br label %if_dest_block4

if_else_block3; preds = %if_then_block2_AB_11_AB_17_AB_23_AB_29_AB_35_AB_41_AB_47
    br label %for_dest_block1

if_dest_block4; preds = %if_else_block3
    %x|addr70=%funccal133
    br label %for_body_block0

for_dest_block1; preds = %if_dest_block4
    %mainreturn_value6=%x|addr70
    br label %main_return_block

main_return_block; preds = %for_dest_block1
    ret i32 %mainreturn_value6

}

