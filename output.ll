

define ReturnType : i32
Parameter : i32 i32 i32 i32 i32 i32 i32 i32 i32 i32  @test(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)
define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter : i32 i32 i32 i32 i32 i32 i32 i32 i32 i32  @test(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32){
test_entrance_block    %eq63 = icmp eq i32 %q, %w
    br i1 %eq63, label %if_then_block3, label %if_else_block4

if_then_block3; preds = %test_entrance_block
    %ne66 = icmp ne i32 %w, %e
    %lhs_compare_67 = icmp eq i1 %ne66, 0
    br i1 %lhs_compare_67, label %oror_b_block9, label %oror_dest_block10

oror_b_block9; preds = %if_then_block3
    %ne70 = icmp ne i32 %e, %r
    br label %oror_dest_block10

oror_dest_block10; preds = %oror_b_block9
    Oror_71 = or i1 %ne66, %ne70
    br i1 %Oror_71, label %if_then_block6, label %if_else_block7

if_then_block6; preds = %oror_dest_block10
    %funccal82 = call i32 @test(i32 %w, i32 %e, i32 %r, i32 %t, i32 %y, i32 %u, i32 %i, i32 %o, i32 %p, i32 %q)
    add83 = add i32 %funccal82, 1
    %testreturn_value60=%add83
    br label %test_return_block

if_else_block7; preds = %if_then_block6
    sub89 = sub i32 %y, 1
    sub91 = sub i32 %u, 2
    %funccal96 = call i32 @test(i32 %w, i32 %e, i32 %r, i32 %t, i32 %sub89, i32 %sub91, i32 %i, i32 %o, i32 %p, i32 %q)
    add97 = add i32 %funccal96, 2
    %testreturn_value60=%add97
    br label %test_return_block

if_else_block4; preds = %if_else_block7
    add100 = add i32 %q, %w
    add102 = add i32 %add100, %q
    %testreturn_value60=%add102
    br label %test_return_block

test_return_block; preds = %if_else_block4
    ret i32 %testreturn_value60

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i11

__init___entrance_block_i11; preds = %main_entrance_block
    br label %__init___return_block_i12

__init___return_block_i12; preds = %__init___entrance_block_i11
    br label %main_entrance_block_AB_13

main_entrance_block_AB_13; preds = %__init___return_block_i12
    %sum|addr1051=0
    %rng_seed|addr1040=19260817
    br label %for_body_block11

for_body_block11; preds = %main_entrance_block_AB_13
    br label %rng_entrance_block_i14

rng_entrance_block_i14; preds = %for_body_block11
    %rng_ip0_18=%rng_seed|addr1040
    br label %unsigned_shl_entrance_block_i0_i15

unsigned_shl_entrance_block_i0_i15; preds = %rng_entrance_block_i14
    %unsigned_shl_ip0_0_i19=%rng_ip0_18
    %unsigned_shl_ip1_1_i20=13
    shl5_i2_i21 = shl i32 %unsigned_shl_ip0_0_i19, %unsigned_shl_ip1_1_i20
    %unsigned_shlreturn_value2_i3_i22=%shl5_i2_i21
    br label %unsigned_shl_return_block_i1_i16

unsigned_shl_return_block_i1_i16; preds = %unsigned_shl_entrance_block_i0_i15
    br label %rng_entrance_block_AB_2_i17

rng_entrance_block_AB_2_i17; preds = %unsigned_shl_return_block_i1_i16
    %funccal33_i23=%unsigned_shlreturn_value2_i3_i22
    ashr34_i24 = xor i32 %rng_ip0_18, %funccal33_i23
    br label %unsigned_shr_entrance_block_i3_i18

unsigned_shr_entrance_block_i3_i18; preds = %rng_entrance_block_AB_2_i17
    %unsigned_shr_ip0_4_i25=%ashr34_i24
    %unsigned_shr_ip1_5_i26=17
    %sge12_i6_i27 = icmp sge i32 %unsigned_shr_ip0_4_i25, 0
    br i1 %sge12_i6_i27, label %if_then_block0_i4_i19, label %if_else_block1_i5_i20

if_then_block0_i4_i19; preds = %unsigned_shr_entrance_block_i3_i18
    ashr15_i7_i28 = ashr i32 %unsigned_shr_ip0_4_i25, %unsigned_shr_ip1_5_i26
    %unsigned_shrreturn_value8_i8_i29=%ashr15_i7_i28
    br label %unsigned_shr_return_block_i6_i21

if_else_block1_i5_i20; preds = %if_then_block0_i4_i19
    sub17_i9_i30 = sub i32 31, %unsigned_shr_ip1_5_i26
    shl18_i10_i31 = shl i32 1, %sub17_i9_i30
    ashr21_i11_i32 = xor i32 %unsigned_shr_ip0_4_i25, 2147483648
    ashr23_i12_i33 = ashr i32 %ashr21_i11_i32, %unsigned_shr_ip1_5_i26
    or24_i13_i34 = or i32 %shl18_i10_i31, %ashr23_i12_i33
    %unsigned_shrreturn_value8_i8_i29=%or24_i13_i34
    br label %unsigned_shr_return_block_i6_i21

unsigned_shr_return_block_i6_i21; preds = %if_else_block1_i5_i20
    br label %rng_entrance_block_AB_2_AB_7_i22

rng_entrance_block_AB_2_AB_7_i22; preds = %unsigned_shr_return_block_i6_i21
    %funccal38_i35=%unsigned_shrreturn_value8_i8_i29
    ashr39_i36 = xor i32 %ashr34_i24, %funccal38_i35
    br label %unsigned_shl_entrance_block_i8_i23

unsigned_shl_entrance_block_i8_i23; preds = %rng_entrance_block_AB_2_AB_7_i22
    %unsigned_shl_ip0_14_i37=%ashr39_i36
    %unsigned_shl_ip1_15_i38=5
    shl5_i16_i39 = shl i32 %unsigned_shl_ip0_14_i37, %unsigned_shl_ip1_15_i38
    %unsigned_shlreturn_value2_i17_i40=%shl5_i16_i39
    br label %unsigned_shl_return_block_i9_i24

unsigned_shl_return_block_i9_i24; preds = %unsigned_shl_entrance_block_i8_i23
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i25

rng_entrance_block_AB_2_AB_7_AB_10_i25; preds = %unsigned_shl_return_block_i9_i24
    %funccal43_i41=%unsigned_shlreturn_value2_i17_i40
    ashr44_i42 = xor i32 %ashr39_i36, %funccal43_i41
    and48_i43 = and i32 %ashr44_i42, 1073741823
    %rngreturn_value26_i44=%and48_i43
    br label %rng_return_block_i26

rng_return_block_i26; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i25
    br label %for_body_block11_AB_27

for_body_block11_AB_27; preds = %rng_return_block_i26
    %funccal108=%rngreturn_value26_i44
    br label %rng_entrance_block_i28

rng_entrance_block_i28; preds = %for_body_block11_AB_27
    %rng_ip0_45=%funccal108
    br label %unsigned_shl_entrance_block_i0_i29

unsigned_shl_entrance_block_i0_i29; preds = %rng_entrance_block_i28
    %unsigned_shl_ip0_0_i46=%rng_ip0_45
    %unsigned_shl_ip1_1_i47=13
    shl5_i2_i48 = shl i32 %unsigned_shl_ip0_0_i46, %unsigned_shl_ip1_1_i47
    %unsigned_shlreturn_value2_i3_i49=%shl5_i2_i48
    br label %unsigned_shl_return_block_i1_i30

unsigned_shl_return_block_i1_i30; preds = %unsigned_shl_entrance_block_i0_i29
    br label %rng_entrance_block_AB_2_i31

rng_entrance_block_AB_2_i31; preds = %unsigned_shl_return_block_i1_i30
    %funccal33_i50=%unsigned_shlreturn_value2_i3_i49
    ashr34_i51 = xor i32 %rng_ip0_45, %funccal33_i50
    br label %unsigned_shr_entrance_block_i3_i32

unsigned_shr_entrance_block_i3_i32; preds = %rng_entrance_block_AB_2_i31
    %unsigned_shr_ip0_4_i52=%ashr34_i51
    %unsigned_shr_ip1_5_i53=17
    %sge12_i6_i54 = icmp sge i32 %unsigned_shr_ip0_4_i52, 0
    br i1 %sge12_i6_i54, label %if_then_block0_i4_i33, label %if_else_block1_i5_i34

if_then_block0_i4_i33; preds = %unsigned_shr_entrance_block_i3_i32
    ashr15_i7_i55 = ashr i32 %unsigned_shr_ip0_4_i52, %unsigned_shr_ip1_5_i53
    %unsigned_shrreturn_value8_i8_i56=%ashr15_i7_i55
    br label %unsigned_shr_return_block_i6_i35

if_else_block1_i5_i34; preds = %if_then_block0_i4_i33
    sub17_i9_i57 = sub i32 31, %unsigned_shr_ip1_5_i53
    shl18_i10_i58 = shl i32 1, %sub17_i9_i57
    ashr21_i11_i59 = xor i32 %unsigned_shr_ip0_4_i52, 2147483648
    ashr23_i12_i60 = ashr i32 %ashr21_i11_i59, %unsigned_shr_ip1_5_i53
    or24_i13_i61 = or i32 %shl18_i10_i58, %ashr23_i12_i60
    %unsigned_shrreturn_value8_i8_i56=%or24_i13_i61
    br label %unsigned_shr_return_block_i6_i35

unsigned_shr_return_block_i6_i35; preds = %if_else_block1_i5_i34
    br label %rng_entrance_block_AB_2_AB_7_i36

rng_entrance_block_AB_2_AB_7_i36; preds = %unsigned_shr_return_block_i6_i35
    %funccal38_i62=%unsigned_shrreturn_value8_i8_i56
    ashr39_i63 = xor i32 %ashr34_i51, %funccal38_i62
    br label %unsigned_shl_entrance_block_i8_i37

unsigned_shl_entrance_block_i8_i37; preds = %rng_entrance_block_AB_2_AB_7_i36
    %unsigned_shl_ip0_14_i64=%ashr39_i63
    %unsigned_shl_ip1_15_i65=5
    shl5_i16_i66 = shl i32 %unsigned_shl_ip0_14_i64, %unsigned_shl_ip1_15_i65
    %unsigned_shlreturn_value2_i17_i67=%shl5_i16_i66
    br label %unsigned_shl_return_block_i9_i38

unsigned_shl_return_block_i9_i38; preds = %unsigned_shl_entrance_block_i8_i37
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i39

rng_entrance_block_AB_2_AB_7_AB_10_i39; preds = %unsigned_shl_return_block_i9_i38
    %funccal43_i68=%unsigned_shlreturn_value2_i17_i67
    ashr44_i69 = xor i32 %ashr39_i63, %funccal43_i68
    and48_i70 = and i32 %ashr44_i69, 1073741823
    %rngreturn_value26_i71=%and48_i70
    br label %rng_return_block_i40

rng_return_block_i40; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i39
    br label %for_body_block11_AB_27_AB_41

for_body_block11_AB_27_AB_41; preds = %rng_return_block_i40
    %funccal111=%rngreturn_value26_i71
    and115 = and i32 %funccal108, 255
    and117 = and i32 %funccal111, 255
    %ne118 = icmp ne i32 %and115, %and117
    br i1 %ne118, label %if_then_block13, label %if_else_block14

if_then_block13; preds = %for_body_block11_AB_27_AB_41
    br label %rng_entrance_block_i42

rng_entrance_block_i42; preds = %if_then_block13
    %rng_ip0_72=%funccal111
    br label %unsigned_shl_entrance_block_i0_i43

unsigned_shl_entrance_block_i0_i43; preds = %rng_entrance_block_i42
    %unsigned_shl_ip0_0_i73=%rng_ip0_72
    %unsigned_shl_ip1_1_i74=13
    shl5_i2_i75 = shl i32 %unsigned_shl_ip0_0_i73, %unsigned_shl_ip1_1_i74
    %unsigned_shlreturn_value2_i3_i76=%shl5_i2_i75
    br label %unsigned_shl_return_block_i1_i44

unsigned_shl_return_block_i1_i44; preds = %unsigned_shl_entrance_block_i0_i43
    br label %rng_entrance_block_AB_2_i45

rng_entrance_block_AB_2_i45; preds = %unsigned_shl_return_block_i1_i44
    %funccal33_i77=%unsigned_shlreturn_value2_i3_i76
    ashr34_i78 = xor i32 %rng_ip0_72, %funccal33_i77
    br label %unsigned_shr_entrance_block_i3_i46

unsigned_shr_entrance_block_i3_i46; preds = %rng_entrance_block_AB_2_i45
    %unsigned_shr_ip0_4_i79=%ashr34_i78
    %unsigned_shr_ip1_5_i80=17
    %sge12_i6_i81 = icmp sge i32 %unsigned_shr_ip0_4_i79, 0
    br i1 %sge12_i6_i81, label %if_then_block0_i4_i47, label %if_else_block1_i5_i48

if_then_block0_i4_i47; preds = %unsigned_shr_entrance_block_i3_i46
    ashr15_i7_i82 = ashr i32 %unsigned_shr_ip0_4_i79, %unsigned_shr_ip1_5_i80
    %unsigned_shrreturn_value8_i8_i83=%ashr15_i7_i82
    br label %unsigned_shr_return_block_i6_i49

if_else_block1_i5_i48; preds = %if_then_block0_i4_i47
    sub17_i9_i84 = sub i32 31, %unsigned_shr_ip1_5_i80
    shl18_i10_i85 = shl i32 1, %sub17_i9_i84
    ashr21_i11_i86 = xor i32 %unsigned_shr_ip0_4_i79, 2147483648
    ashr23_i12_i87 = ashr i32 %ashr21_i11_i86, %unsigned_shr_ip1_5_i80
    or24_i13_i88 = or i32 %shl18_i10_i85, %ashr23_i12_i87
    %unsigned_shrreturn_value8_i8_i83=%or24_i13_i88
    br label %unsigned_shr_return_block_i6_i49

unsigned_shr_return_block_i6_i49; preds = %if_else_block1_i5_i48
    br label %rng_entrance_block_AB_2_AB_7_i50

rng_entrance_block_AB_2_AB_7_i50; preds = %unsigned_shr_return_block_i6_i49
    %funccal38_i89=%unsigned_shrreturn_value8_i8_i83
    ashr39_i90 = xor i32 %ashr34_i78, %funccal38_i89
    br label %unsigned_shl_entrance_block_i8_i51

unsigned_shl_entrance_block_i8_i51; preds = %rng_entrance_block_AB_2_AB_7_i50
    %unsigned_shl_ip0_14_i91=%ashr39_i90
    %unsigned_shl_ip1_15_i92=5
    shl5_i16_i93 = shl i32 %unsigned_shl_ip0_14_i91, %unsigned_shl_ip1_15_i92
    %unsigned_shlreturn_value2_i17_i94=%shl5_i16_i93
    br label %unsigned_shl_return_block_i9_i52

unsigned_shl_return_block_i9_i52; preds = %unsigned_shl_entrance_block_i8_i51
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i53

rng_entrance_block_AB_2_AB_7_AB_10_i53; preds = %unsigned_shl_return_block_i9_i52
    %funccal43_i95=%unsigned_shlreturn_value2_i17_i94
    ashr44_i96 = xor i32 %ashr39_i90, %funccal43_i95
    and48_i97 = and i32 %ashr44_i96, 1073741823
    %rngreturn_value26_i98=%and48_i97
    br label %rng_return_block_i54

rng_return_block_i54; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i53
    br label %if_then_block13_AB_55

if_then_block13_AB_55; preds = %rng_return_block_i54
    %funccal121=%rngreturn_value26_i98
    br label %rng_entrance_block_i56

rng_entrance_block_i56; preds = %if_then_block13_AB_55
    %rng_ip0_99=%funccal121
    br label %unsigned_shl_entrance_block_i0_i57

unsigned_shl_entrance_block_i0_i57; preds = %rng_entrance_block_i56
    %unsigned_shl_ip0_0_i100=%rng_ip0_99
    %unsigned_shl_ip1_1_i101=13
    shl5_i2_i102 = shl i32 %unsigned_shl_ip0_0_i100, %unsigned_shl_ip1_1_i101
    %unsigned_shlreturn_value2_i3_i103=%shl5_i2_i102
    br label %unsigned_shl_return_block_i1_i58

unsigned_shl_return_block_i1_i58; preds = %unsigned_shl_entrance_block_i0_i57
    br label %rng_entrance_block_AB_2_i59

rng_entrance_block_AB_2_i59; preds = %unsigned_shl_return_block_i1_i58
    %funccal33_i104=%unsigned_shlreturn_value2_i3_i103
    ashr34_i105 = xor i32 %rng_ip0_99, %funccal33_i104
    br label %unsigned_shr_entrance_block_i3_i60

unsigned_shr_entrance_block_i3_i60; preds = %rng_entrance_block_AB_2_i59
    %unsigned_shr_ip0_4_i106=%ashr34_i105
    %unsigned_shr_ip1_5_i107=17
    %sge12_i6_i108 = icmp sge i32 %unsigned_shr_ip0_4_i106, 0
    br i1 %sge12_i6_i108, label %if_then_block0_i4_i61, label %if_else_block1_i5_i62

if_then_block0_i4_i61; preds = %unsigned_shr_entrance_block_i3_i60
    ashr15_i7_i109 = ashr i32 %unsigned_shr_ip0_4_i106, %unsigned_shr_ip1_5_i107
    %unsigned_shrreturn_value8_i8_i110=%ashr15_i7_i109
    br label %unsigned_shr_return_block_i6_i63

if_else_block1_i5_i62; preds = %if_then_block0_i4_i61
    sub17_i9_i111 = sub i32 31, %unsigned_shr_ip1_5_i107
    shl18_i10_i112 = shl i32 1, %sub17_i9_i111
    ashr21_i11_i113 = xor i32 %unsigned_shr_ip0_4_i106, 2147483648
    ashr23_i12_i114 = ashr i32 %ashr21_i11_i113, %unsigned_shr_ip1_5_i107
    or24_i13_i115 = or i32 %shl18_i10_i112, %ashr23_i12_i114
    %unsigned_shrreturn_value8_i8_i110=%or24_i13_i115
    br label %unsigned_shr_return_block_i6_i63

unsigned_shr_return_block_i6_i63; preds = %if_else_block1_i5_i62
    br label %rng_entrance_block_AB_2_AB_7_i64

rng_entrance_block_AB_2_AB_7_i64; preds = %unsigned_shr_return_block_i6_i63
    %funccal38_i116=%unsigned_shrreturn_value8_i8_i110
    ashr39_i117 = xor i32 %ashr34_i105, %funccal38_i116
    br label %unsigned_shl_entrance_block_i8_i65

unsigned_shl_entrance_block_i8_i65; preds = %rng_entrance_block_AB_2_AB_7_i64
    %unsigned_shl_ip0_14_i118=%ashr39_i117
    %unsigned_shl_ip1_15_i119=5
    shl5_i16_i120 = shl i32 %unsigned_shl_ip0_14_i118, %unsigned_shl_ip1_15_i119
    %unsigned_shlreturn_value2_i17_i121=%shl5_i16_i120
    br label %unsigned_shl_return_block_i9_i66

unsigned_shl_return_block_i9_i66; preds = %unsigned_shl_entrance_block_i8_i65
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i67

rng_entrance_block_AB_2_AB_7_AB_10_i67; preds = %unsigned_shl_return_block_i9_i66
    %funccal43_i122=%unsigned_shlreturn_value2_i17_i121
    ashr44_i123 = xor i32 %ashr39_i117, %funccal43_i122
    and48_i124 = and i32 %ashr44_i123, 1073741823
    %rngreturn_value26_i125=%and48_i124
    br label %rng_return_block_i68

rng_return_block_i68; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i67
    br label %if_then_block13_AB_55_AB_69

if_then_block13_AB_55_AB_69; preds = %rng_return_block_i68
    %funccal124=%rngreturn_value26_i125
    br label %rng_entrance_block_i70

rng_entrance_block_i70; preds = %if_then_block13_AB_55_AB_69
    %rng_ip0_126=%funccal124
    br label %unsigned_shl_entrance_block_i0_i71

unsigned_shl_entrance_block_i0_i71; preds = %rng_entrance_block_i70
    %unsigned_shl_ip0_0_i127=%rng_ip0_126
    %unsigned_shl_ip1_1_i128=13
    shl5_i2_i129 = shl i32 %unsigned_shl_ip0_0_i127, %unsigned_shl_ip1_1_i128
    %unsigned_shlreturn_value2_i3_i130=%shl5_i2_i129
    br label %unsigned_shl_return_block_i1_i72

unsigned_shl_return_block_i1_i72; preds = %unsigned_shl_entrance_block_i0_i71
    br label %rng_entrance_block_AB_2_i73

rng_entrance_block_AB_2_i73; preds = %unsigned_shl_return_block_i1_i72
    %funccal33_i131=%unsigned_shlreturn_value2_i3_i130
    ashr34_i132 = xor i32 %rng_ip0_126, %funccal33_i131
    br label %unsigned_shr_entrance_block_i3_i74

unsigned_shr_entrance_block_i3_i74; preds = %rng_entrance_block_AB_2_i73
    %unsigned_shr_ip0_4_i133=%ashr34_i132
    %unsigned_shr_ip1_5_i134=17
    %sge12_i6_i135 = icmp sge i32 %unsigned_shr_ip0_4_i133, 0
    br i1 %sge12_i6_i135, label %if_then_block0_i4_i75, label %if_else_block1_i5_i76

if_then_block0_i4_i75; preds = %unsigned_shr_entrance_block_i3_i74
    ashr15_i7_i136 = ashr i32 %unsigned_shr_ip0_4_i133, %unsigned_shr_ip1_5_i134
    %unsigned_shrreturn_value8_i8_i137=%ashr15_i7_i136
    br label %unsigned_shr_return_block_i6_i77

if_else_block1_i5_i76; preds = %if_then_block0_i4_i75
    sub17_i9_i138 = sub i32 31, %unsigned_shr_ip1_5_i134
    shl18_i10_i139 = shl i32 1, %sub17_i9_i138
    ashr21_i11_i140 = xor i32 %unsigned_shr_ip0_4_i133, 2147483648
    ashr23_i12_i141 = ashr i32 %ashr21_i11_i140, %unsigned_shr_ip1_5_i134
    or24_i13_i142 = or i32 %shl18_i10_i139, %ashr23_i12_i141
    %unsigned_shrreturn_value8_i8_i137=%or24_i13_i142
    br label %unsigned_shr_return_block_i6_i77

unsigned_shr_return_block_i6_i77; preds = %if_else_block1_i5_i76
    br label %rng_entrance_block_AB_2_AB_7_i78

rng_entrance_block_AB_2_AB_7_i78; preds = %unsigned_shr_return_block_i6_i77
    %funccal38_i143=%unsigned_shrreturn_value8_i8_i137
    ashr39_i144 = xor i32 %ashr34_i132, %funccal38_i143
    br label %unsigned_shl_entrance_block_i8_i79

unsigned_shl_entrance_block_i8_i79; preds = %rng_entrance_block_AB_2_AB_7_i78
    %unsigned_shl_ip0_14_i145=%ashr39_i144
    %unsigned_shl_ip1_15_i146=5
    shl5_i16_i147 = shl i32 %unsigned_shl_ip0_14_i145, %unsigned_shl_ip1_15_i146
    %unsigned_shlreturn_value2_i17_i148=%shl5_i16_i147
    br label %unsigned_shl_return_block_i9_i80

unsigned_shl_return_block_i9_i80; preds = %unsigned_shl_entrance_block_i8_i79
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i81

rng_entrance_block_AB_2_AB_7_AB_10_i81; preds = %unsigned_shl_return_block_i9_i80
    %funccal43_i149=%unsigned_shlreturn_value2_i17_i148
    ashr44_i150 = xor i32 %ashr39_i144, %funccal43_i149
    and48_i151 = and i32 %ashr44_i150, 1073741823
    %rngreturn_value26_i152=%and48_i151
    br label %rng_return_block_i82

rng_return_block_i82; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i81
    br label %if_then_block13_AB_55_AB_69_AB_83

if_then_block13_AB_55_AB_69_AB_83; preds = %rng_return_block_i82
    %funccal127=%rngreturn_value26_i152
    br label %rng_entrance_block_i84

rng_entrance_block_i84; preds = %if_then_block13_AB_55_AB_69_AB_83
    %rng_ip0_153=%funccal127
    br label %unsigned_shl_entrance_block_i0_i85

unsigned_shl_entrance_block_i0_i85; preds = %rng_entrance_block_i84
    %unsigned_shl_ip0_0_i154=%rng_ip0_153
    %unsigned_shl_ip1_1_i155=13
    shl5_i2_i156 = shl i32 %unsigned_shl_ip0_0_i154, %unsigned_shl_ip1_1_i155
    %unsigned_shlreturn_value2_i3_i157=%shl5_i2_i156
    br label %unsigned_shl_return_block_i1_i86

unsigned_shl_return_block_i1_i86; preds = %unsigned_shl_entrance_block_i0_i85
    br label %rng_entrance_block_AB_2_i87

rng_entrance_block_AB_2_i87; preds = %unsigned_shl_return_block_i1_i86
    %funccal33_i158=%unsigned_shlreturn_value2_i3_i157
    ashr34_i159 = xor i32 %rng_ip0_153, %funccal33_i158
    br label %unsigned_shr_entrance_block_i3_i88

unsigned_shr_entrance_block_i3_i88; preds = %rng_entrance_block_AB_2_i87
    %unsigned_shr_ip0_4_i160=%ashr34_i159
    %unsigned_shr_ip1_5_i161=17
    %sge12_i6_i162 = icmp sge i32 %unsigned_shr_ip0_4_i160, 0
    br i1 %sge12_i6_i162, label %if_then_block0_i4_i89, label %if_else_block1_i5_i90

if_then_block0_i4_i89; preds = %unsigned_shr_entrance_block_i3_i88
    ashr15_i7_i163 = ashr i32 %unsigned_shr_ip0_4_i160, %unsigned_shr_ip1_5_i161
    %unsigned_shrreturn_value8_i8_i164=%ashr15_i7_i163
    br label %unsigned_shr_return_block_i6_i91

if_else_block1_i5_i90; preds = %if_then_block0_i4_i89
    sub17_i9_i165 = sub i32 31, %unsigned_shr_ip1_5_i161
    shl18_i10_i166 = shl i32 1, %sub17_i9_i165
    ashr21_i11_i167 = xor i32 %unsigned_shr_ip0_4_i160, 2147483648
    ashr23_i12_i168 = ashr i32 %ashr21_i11_i167, %unsigned_shr_ip1_5_i161
    or24_i13_i169 = or i32 %shl18_i10_i166, %ashr23_i12_i168
    %unsigned_shrreturn_value8_i8_i164=%or24_i13_i169
    br label %unsigned_shr_return_block_i6_i91

unsigned_shr_return_block_i6_i91; preds = %if_else_block1_i5_i90
    br label %rng_entrance_block_AB_2_AB_7_i92

rng_entrance_block_AB_2_AB_7_i92; preds = %unsigned_shr_return_block_i6_i91
    %funccal38_i170=%unsigned_shrreturn_value8_i8_i164
    ashr39_i171 = xor i32 %ashr34_i159, %funccal38_i170
    br label %unsigned_shl_entrance_block_i8_i93

unsigned_shl_entrance_block_i8_i93; preds = %rng_entrance_block_AB_2_AB_7_i92
    %unsigned_shl_ip0_14_i172=%ashr39_i171
    %unsigned_shl_ip1_15_i173=5
    shl5_i16_i174 = shl i32 %unsigned_shl_ip0_14_i172, %unsigned_shl_ip1_15_i173
    %unsigned_shlreturn_value2_i17_i175=%shl5_i16_i174
    br label %unsigned_shl_return_block_i9_i94

unsigned_shl_return_block_i9_i94; preds = %unsigned_shl_entrance_block_i8_i93
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i95

rng_entrance_block_AB_2_AB_7_AB_10_i95; preds = %unsigned_shl_return_block_i9_i94
    %funccal43_i176=%unsigned_shlreturn_value2_i17_i175
    ashr44_i177 = xor i32 %ashr39_i171, %funccal43_i176
    and48_i178 = and i32 %ashr44_i177, 1073741823
    %rngreturn_value26_i179=%and48_i178
    br label %rng_return_block_i96

rng_return_block_i96; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i95
    br label %if_then_block13_AB_55_AB_69_AB_83_AB_97

if_then_block13_AB_55_AB_69_AB_83_AB_97; preds = %rng_return_block_i96
    %funccal130=%rngreturn_value26_i179
    br label %rng_entrance_block_i98

rng_entrance_block_i98; preds = %if_then_block13_AB_55_AB_69_AB_83_AB_97
    %rng_ip0_180=%funccal130
    br label %unsigned_shl_entrance_block_i0_i99

unsigned_shl_entrance_block_i0_i99; preds = %rng_entrance_block_i98
    %unsigned_shl_ip0_0_i181=%rng_ip0_180
    %unsigned_shl_ip1_1_i182=13
    shl5_i2_i183 = shl i32 %unsigned_shl_ip0_0_i181, %unsigned_shl_ip1_1_i182
    %unsigned_shlreturn_value2_i3_i184=%shl5_i2_i183
    br label %unsigned_shl_return_block_i1_i100

unsigned_shl_return_block_i1_i100; preds = %unsigned_shl_entrance_block_i0_i99
    br label %rng_entrance_block_AB_2_i101

rng_entrance_block_AB_2_i101; preds = %unsigned_shl_return_block_i1_i100
    %funccal33_i185=%unsigned_shlreturn_value2_i3_i184
    ashr34_i186 = xor i32 %rng_ip0_180, %funccal33_i185
    br label %unsigned_shr_entrance_block_i3_i102

unsigned_shr_entrance_block_i3_i102; preds = %rng_entrance_block_AB_2_i101
    %unsigned_shr_ip0_4_i187=%ashr34_i186
    %unsigned_shr_ip1_5_i188=17
    %sge12_i6_i189 = icmp sge i32 %unsigned_shr_ip0_4_i187, 0
    br i1 %sge12_i6_i189, label %if_then_block0_i4_i103, label %if_else_block1_i5_i104

if_then_block0_i4_i103; preds = %unsigned_shr_entrance_block_i3_i102
    ashr15_i7_i190 = ashr i32 %unsigned_shr_ip0_4_i187, %unsigned_shr_ip1_5_i188
    %unsigned_shrreturn_value8_i8_i191=%ashr15_i7_i190
    br label %unsigned_shr_return_block_i6_i105

if_else_block1_i5_i104; preds = %if_then_block0_i4_i103
    sub17_i9_i192 = sub i32 31, %unsigned_shr_ip1_5_i188
    shl18_i10_i193 = shl i32 1, %sub17_i9_i192
    ashr21_i11_i194 = xor i32 %unsigned_shr_ip0_4_i187, 2147483648
    ashr23_i12_i195 = ashr i32 %ashr21_i11_i194, %unsigned_shr_ip1_5_i188
    or24_i13_i196 = or i32 %shl18_i10_i193, %ashr23_i12_i195
    %unsigned_shrreturn_value8_i8_i191=%or24_i13_i196
    br label %unsigned_shr_return_block_i6_i105

unsigned_shr_return_block_i6_i105; preds = %if_else_block1_i5_i104
    br label %rng_entrance_block_AB_2_AB_7_i106

rng_entrance_block_AB_2_AB_7_i106; preds = %unsigned_shr_return_block_i6_i105
    %funccal38_i197=%unsigned_shrreturn_value8_i8_i191
    ashr39_i198 = xor i32 %ashr34_i186, %funccal38_i197
    br label %unsigned_shl_entrance_block_i8_i107

unsigned_shl_entrance_block_i8_i107; preds = %rng_entrance_block_AB_2_AB_7_i106
    %unsigned_shl_ip0_14_i199=%ashr39_i198
    %unsigned_shl_ip1_15_i200=5
    shl5_i16_i201 = shl i32 %unsigned_shl_ip0_14_i199, %unsigned_shl_ip1_15_i200
    %unsigned_shlreturn_value2_i17_i202=%shl5_i16_i201
    br label %unsigned_shl_return_block_i9_i108

unsigned_shl_return_block_i9_i108; preds = %unsigned_shl_entrance_block_i8_i107
    br label %rng_entrance_block_AB_2_AB_7_AB_10_i109

rng_entrance_block_AB_2_AB_7_AB_10_i109; preds = %unsigned_shl_return_block_i9_i108
    %funccal43_i203=%unsigned_shlreturn_value2_i17_i202
    ashr44_i204 = xor i32 %ashr39_i198, %funccal43_i203
    and48_i205 = and i32 %ashr44_i204, 1073741823
    %rngreturn_value26_i206=%and48_i205
    br label %rng_return_block_i110

rng_return_block_i110; preds = %rng_entrance_block_AB_2_AB_7_AB_10_i109
    br label %if_then_block13_AB_55_AB_69_AB_83_AB_97_AB_111

if_then_block13_AB_55_AB_69_AB_83_AB_97_AB_111; preds = %rng_return_block_i110
    %funccal133=%rngreturn_value26_i206
    and139 = and i32 %funccal121, 3
    ashr141 = ashr i32 %funccal121, 28
    and143 = and i32 %funccal124, 1
    ashr145 = ashr i32 %funccal124, 29
    ashr147 = ashr i32 %funccal127, 25
    and149 = and i32 %funccal127, 31
    ashr151 = ashr i32 %funccal130, 15
    and153 = and i32 %funccal130, 32767
    ashr155 = ashr i32 %funccal133, 15
    and157 = and i32 %funccal133, 32767
    %funccal158 = call i32 @test(i32 %and139, i32 %ashr141, i32 %and143, i32 %ashr145, i32 %ashr147, i32 %and149, i32 %ashr151, i32 %and153, i32 %ashr155, i32 %and157)
    ashr159 = xor i32 %sum|addr1051, %funccal158
    br label %if_dest_block15

if_else_block14; preds = %if_then_block13_AB_55_AB_69_AB_83_AB_97_AB_111
    br label %for_dest_block12

if_dest_block15; preds = %if_else_block14
    %sum|addr1051=%ashr159
    %rng_seed|addr1040=%funccal133
    br label %for_body_block11

for_dest_block12; preds = %if_dest_block15
    sub161 = sub i32 %sum|addr1051, 19
    %mainreturn_value103=%sub161
    br label %main_return_block

main_return_block; preds = %for_dest_block12
    ret i32 %mainreturn_value103

}

