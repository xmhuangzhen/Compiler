
@N

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i6

__init___entrance_block_i6; preds = %main_entrance_block
    store pointer is not pointertypei32
    br label %__init___return_block_i7

__init___return_block_i7; preds = %__init___entrance_block_i6
    br label %main_entrance_block_AB_8

main_entrance_block_AB_8; preds = %__init___return_block_i7
    %N15 = load i32, i32 @N
    br label %add4_entrance_block_i27

add4_entrance_block_i27; preds = %main_entrance_block_AB_8
    %add4_ip0_42=%N15
    %x|addr9_i43=%add4_ip0_42
    %Id_load11_i44 = load i32, i32* %x|addr9_i43
    br label %add2_entrance_block_i9_i28

add2_entrance_block_i9_i28; preds = %add4_entrance_block_i27
    %add2_ip0_10_i45=%Id_load11_i44
    %x|addr4_i11_i46=%add2_ip0_10_i45
    %Id_load6_i12_i47 = load i32, i32* %x|addr4_i11_i46
    br label %add1_entrance_block_i0_i10_i29

add1_entrance_block_i0_i10_i29; preds = %add2_entrance_block_i9_i28
    %add1_ip0_0_i13_i48=%Id_load6_i12_i47
    %x|addr0_i1_i14_i49=%add1_ip0_0_i13_i48
    %Id_load2_i2_i15_i50 = load i32, i32* %x|addr0_i1_i14_i49
    add3_i3_i16_i51 = add i32 %Id_load2_i2_i15_i50, 1
    %add1return_value1_i4_i17_i52=%add3_i3_i16_i51
    br label %add1_return_block_i1_i11_i30

add1_return_block_i1_i11_i30; preds = %add1_entrance_block_i0_i10_i29
    br label %add2_entrance_block_AB_2_i12_i31

add2_entrance_block_AB_2_i12_i31; preds = %add1_return_block_i1_i11_i30
    %funccal7_i18_i53=%add1return_value1_i4_i17_i52
    br label %add1_entrance_block_i3_i13_i32

add1_entrance_block_i3_i13_i32; preds = %add2_entrance_block_AB_2_i12_i31
    %add1_ip0_5_i19_i54=%funccal7_i18_i53
    %x|addr0_i6_i20_i55=%add1_ip0_5_i19_i54
    %Id_load2_i7_i21_i56 = load i32, i32* %x|addr0_i6_i20_i55
    add3_i8_i22_i57 = add i32 %Id_load2_i7_i21_i56, 1
    %add1return_value1_i9_i23_i58=%add3_i8_i22_i57
    br label %add1_return_block_i4_i14_i33

add1_return_block_i4_i14_i33; preds = %add1_entrance_block_i3_i13_i32
    br label %add2_entrance_block_AB_2_AB_5_i15_i34

add2_entrance_block_AB_2_AB_5_i15_i34; preds = %add1_return_block_i4_i14_i33
    %funccal8_i24_i59=%add1return_value1_i9_i23_i58
    %add2return_value5_i25_i60=%funccal8_i24_i59
    br label %add2_return_block_i16_i35

add2_return_block_i16_i35; preds = %add2_entrance_block_AB_2_AB_5_i15_i34
    br label %add4_entrance_block_AB_17_i36

add4_entrance_block_AB_17_i36; preds = %add2_return_block_i16_i35
    %funccal12_i61=%add2return_value5_i25_i60
    br label %add2_entrance_block_i18_i37

add2_entrance_block_i18_i37; preds = %add4_entrance_block_AB_17_i36
    %add2_ip0_26_i62=%funccal12_i61
    %x|addr4_i27_i63=%add2_ip0_26_i62
    %Id_load6_i28_i64 = load i32, i32* %x|addr4_i27_i63
    br label %add1_entrance_block_i0_i19_i38

add1_entrance_block_i0_i19_i38; preds = %add2_entrance_block_i18_i37
    %add1_ip0_0_i29_i65=%Id_load6_i28_i64
    %x|addr0_i1_i30_i66=%add1_ip0_0_i29_i65
    %Id_load2_i2_i31_i67 = load i32, i32* %x|addr0_i1_i30_i66
    add3_i3_i32_i68 = add i32 %Id_load2_i2_i31_i67, 1
    %add1return_value1_i4_i33_i69=%add3_i3_i32_i68
    br label %add1_return_block_i1_i20_i39

add1_return_block_i1_i20_i39; preds = %add1_entrance_block_i0_i19_i38
    br label %add2_entrance_block_AB_2_i21_i40

add2_entrance_block_AB_2_i21_i40; preds = %add1_return_block_i1_i20_i39
    %funccal7_i34_i70=%add1return_value1_i4_i33_i69
    br label %add1_entrance_block_i3_i22_i41

add1_entrance_block_i3_i22_i41; preds = %add2_entrance_block_AB_2_i21_i40
    %add1_ip0_5_i35_i71=%funccal7_i34_i70
    %x|addr0_i6_i36_i72=%add1_ip0_5_i35_i71
    %Id_load2_i7_i37_i73 = load i32, i32* %x|addr0_i6_i36_i72
    add3_i8_i38_i74 = add i32 %Id_load2_i7_i37_i73, 1
    %add1return_value1_i9_i39_i75=%add3_i8_i38_i74
    br label %add1_return_block_i4_i23_i42

add1_return_block_i4_i23_i42; preds = %add1_entrance_block_i3_i22_i41
    br label %add2_entrance_block_AB_2_AB_5_i24_i43

add2_entrance_block_AB_2_AB_5_i24_i43; preds = %add1_return_block_i4_i23_i42
    %funccal8_i40_i76=%add1return_value1_i9_i39_i75
    %add2return_value5_i41_i77=%funccal8_i40_i76
    br label %add2_return_block_i25_i44

add2_return_block_i25_i44; preds = %add2_entrance_block_AB_2_AB_5_i24_i43
    br label %add4_entrance_block_AB_17_AB_26_i45

add4_entrance_block_AB_17_AB_26_i45; preds = %add2_return_block_i25_i44
    %funccal13_i78=%add2return_value5_i41_i77
    %add4return_value10_i79=%funccal13_i78
    br label %add4_return_block_i46

add4_return_block_i46; preds = %add4_entrance_block_AB_17_AB_26_i45
    br label %main_entrance_block_AB_8_AB_47

main_entrance_block_AB_8_AB_47; preds = %add4_return_block_i46
    %funccal16=%add4return_value10_i79
    sub17 = sub i32 %funccal16, 3
    %mainreturn_value14=%sub17
    br label %main_return_block

main_return_block; preds = %main_entrance_block_AB_8_AB_47
    ret i32 %mainreturn_value14

}

