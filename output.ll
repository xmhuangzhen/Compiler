point

@const_string_no0
@const_string_no1
@const_string_no2

define ReturnType : point*
Parameter : point point*  @point.cross(point*, point**)
define ReturnType : void
Parameter : point  @point.printPoint(point*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : point*
Parameter : point point*  @point.cross(point*, point**){
point.cross_entrance_block    %Malloc_Result111 = call i8* @malloc(i32 12)
    Malloc_Cast_Result_112 = bitcast i32* %Malloc_Result111 to point*
    br label %point.point_entrance_block_i0

point.point_entrance_block_i0; preds = %point.cross_entrance_block
    %point.point_ip0_0=%Malloc_Cast_Result_112
    %ClassAddr_turnto_reg_249_i1=%point.point_ip0_0
    %Id_GEP_250_i2 = getelementptr point, point* %ClassAddr_turnto_reg_249_i1, i32 0, i32 0
    store i32 0, i32* %Id_GEP_250_i2
    %ClassAddr_turnto_reg_252_i3=%point.point_ip0_0
    %Id_GEP_253_i4 = getelementptr point, point* %ClassAddr_turnto_reg_252_i3, i32 0, i32 1
    store i32 0, i32* %Id_GEP_253_i4
    %ClassAddr_turnto_reg_255_i5=%point.point_ip0_0
    %Id_GEP_256_i6 = getelementptr point, point* %ClassAddr_turnto_reg_255_i5, i32 0, i32 2
    store i32 0, i32* %Id_GEP_256_i6
    br label %point.point_return_block_i1

point.point_return_block_i1; preds = %point.point_entrance_block_i0
    br label %point.cross_entrance_block_AB_2

point.cross_entrance_block_AB_2; preds = %point.point_return_block_i1
    %ClassAddr_turnto_reg_114=%this
    %Id_GEP_115 = getelementptr point, point* %ClassAddr_turnto_reg_114, i32 0, i32 1
    %Id_GEP_Load116 = load i32, i32* %Id_GEP_115
    %Id_load117 = load point*, point** %other
    %memacc_result118 = getelementptr point, point* %Id_load117, i32 0, i32 2
    %memacc_result119 = load i32, i32* %memacc_result118
    mul120 = mul i32 %Id_GEP_Load116, %memacc_result119
    %ClassAddr_turnto_reg_121=%this
    %Id_GEP_122 = getelementptr point, point* %ClassAddr_turnto_reg_121, i32 0, i32 2
    %Id_GEP_Load123 = load i32, i32* %Id_GEP_122
    %Id_load124 = load point*, point** %other
    %memacc_result125 = getelementptr point, point* %Id_load124, i32 0, i32 1
    %memacc_result126 = load i32, i32* %memacc_result125
    mul127 = mul i32 %Id_GEP_Load123, %memacc_result126
    sub128 = sub i32 %mul120, %mul127
    %ClassAddr_turnto_reg_129=%this
    %Id_GEP_130 = getelementptr point, point* %ClassAddr_turnto_reg_129, i32 0, i32 2
    %Id_GEP_Load131 = load i32, i32* %Id_GEP_130
    %Id_load132 = load point*, point** %other
    %memacc_result133 = getelementptr point, point* %Id_load132, i32 0, i32 0
    %memacc_result134 = load i32, i32* %memacc_result133
    mul135 = mul i32 %Id_GEP_Load131, %memacc_result134
    %ClassAddr_turnto_reg_136=%this
    %Id_GEP_137 = getelementptr point, point* %ClassAddr_turnto_reg_136, i32 0, i32 0
    %Id_GEP_Load138 = load i32, i32* %Id_GEP_137
    %Id_load139 = load point*, point** %other
    %memacc_result140 = getelementptr point, point* %Id_load139, i32 0, i32 2
    %memacc_result141 = load i32, i32* %memacc_result140
    mul142 = mul i32 %Id_GEP_Load138, %memacc_result141
    sub143 = sub i32 %mul135, %mul142
    %ClassAddr_turnto_reg_144=%this
    %Id_GEP_145 = getelementptr point, point* %ClassAddr_turnto_reg_144, i32 0, i32 0
    %Id_GEP_Load146 = load i32, i32* %Id_GEP_145
    %Id_load147 = load point*, point** %other
    %memacc_result148 = getelementptr point, point* %Id_load147, i32 0, i32 1
    %memacc_result149 = load i32, i32* %memacc_result148
    mul150 = mul i32 %Id_GEP_Load146, %memacc_result149
    %ClassAddr_turnto_reg_151=%this
    %Id_GEP_152 = getelementptr point, point* %ClassAddr_turnto_reg_151, i32 0, i32 1
    %Id_GEP_Load153 = load i32, i32* %Id_GEP_152
    %Id_load154 = load point*, point** %other
    %memacc_result155 = getelementptr point, point* %Id_load154, i32 0, i32 0
    %memacc_result156 = load i32, i32* %memacc_result155
    mul157 = mul i32 %Id_GEP_Load153, %memacc_result156
    sub158 = sub i32 %mul150, %mul157
    br label %point.set_entrance_block_i3

point.set_entrance_block_i3; preds = %point.cross_entrance_block_AB_2
    %point.set_ip0_7=%Malloc_Cast_Result_112
    %point.set_ip1_8=%sub128
    %point.set_ip2_9=%sub143
    %point.set_ip3_10=%sub158
    %ClassAddr_turnto_reg_1_i11=%point.set_ip0_7
    %Id_GEP_2_i12 = getelementptr point, point* %ClassAddr_turnto_reg_1_i11, i32 0, i32 0
    %Id_load4_i13 = load i32, i32* %point.set_ip1_8
    store i32 %Id_load4_i13, i32* %Id_GEP_2_i12
    %ClassAddr_turnto_reg_5_i14=%point.set_ip0_7
    %Id_GEP_6_i15 = getelementptr point, point* %ClassAddr_turnto_reg_5_i14, i32 0, i32 1
    %Id_load8_i16 = load i32, i32* %point.set_ip2_9
    store i32 %Id_load8_i16, i32* %Id_GEP_6_i15
    %ClassAddr_turnto_reg_9_i17=%point.set_ip0_7
    %Id_GEP_10_i18 = getelementptr point, point* %ClassAddr_turnto_reg_9_i17, i32 0, i32 2
    %Id_load12_i19 = load i32, i32* %point.set_ip3_10
    store i32 %Id_load12_i19, i32* %Id_GEP_10_i18
    br label %point.set_return_block_i4

point.set_return_block_i4; preds = %point.set_entrance_block_i3
    br label %point.cross_entrance_block_AB_2_AB_5

point.cross_entrance_block_AB_2_AB_5; preds = %point.set_return_block_i4
    %point.crossreturn_value109=%Malloc_Cast_Result_112
    br label %point.cross_return_block

point.cross_return_block; preds = %point.cross_entrance_block_AB_2_AB_5
    ret point* %point.crossreturn_value109

}

define ReturnType : void
Parameter : point  @point.printPoint(point*){
point.printPoint_entrance_block    %StringConst226 = getelementptr [1 x i8], [1 x i8]* @const_string_no0, i32 0, i32 0
    %ClassAddr_turnto_reg_227=%this
    %Id_GEP_228 = getelementptr point, point* %ClassAddr_turnto_reg_227, i32 0, i32 0
    %Id_GEP_Load229 = load i32, i32* %Id_GEP_228
    %funccal230 = call i8* @toString(i32 %Id_GEP_Load229)
    %add231 = call i8* @__string_add(i8* %StringConst226, i8* %funccal230)
    %StringConst232 = getelementptr [2 x i8], [2 x i8]* @const_string_no1, i32 0, i32 0
    %add233 = call i8* @__string_add(i8* %add231, i8* %StringConst232)
    %ClassAddr_turnto_reg_234=%this
    %Id_GEP_235 = getelementptr point, point* %ClassAddr_turnto_reg_234, i32 0, i32 1
    %Id_GEP_Load236 = load i32, i32* %Id_GEP_235
    %funccal237 = call i8* @toString(i32 %Id_GEP_Load236)
    %add238 = call i8* @__string_add(i8* %add233, i8* %funccal237)
    %StringConst239 = getelementptr [2 x i8], [2 x i8]* @const_string_no1, i32 0, i32 0
    %add240 = call i8* @__string_add(i8* %add238, i8* %StringConst239)
    %ClassAddr_turnto_reg_241=%this
    %Id_GEP_242 = getelementptr point, point* %ClassAddr_turnto_reg_241, i32 0, i32 2
    %Id_GEP_Load243 = load i32, i32* %Id_GEP_242
    %funccal244 = call i8* @toString(i32 %Id_GEP_Load243)
    %add245 = call i8* @__string_add(i8* %add240, i8* %funccal244)
    %StringConst246 = getelementptr [1 x i8], [1 x i8]* @const_string_no2, i32 0, i32 0
    %add247 = call i8* @__string_add(i8* %add245, i8* %StringConst246)
    %funccal248 = call void @println(i8* %add247)
    br label %point.printPoint_return_block

point.printPoint_return_block; preds = %point.printPoint_entrance_block
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i6

__init___entrance_block_i6; preds = %main_entrance_block
    br label %__init___return_block_i7

__init___return_block_i7; preds = %__init___entrance_block_i6
    br label %main_entrance_block_AB_8

main_entrance_block_AB_8; preds = %__init___return_block_i7
    %Malloc_Result260 = call i8* @malloc(i32 12)
    Malloc_Cast_Result_261 = bitcast i32* %Malloc_Result260 to point*
    br label %point.point_entrance_block_i9

point.point_entrance_block_i9; preds = %main_entrance_block_AB_8
    %point.point_ip0_20=%Malloc_Cast_Result_261
    %ClassAddr_turnto_reg_249_i21=%point.point_ip0_20
    %Id_GEP_250_i22 = getelementptr point, point* %ClassAddr_turnto_reg_249_i21, i32 0, i32 0
    store i32 0, i32* %Id_GEP_250_i22
    %ClassAddr_turnto_reg_252_i23=%point.point_ip0_20
    %Id_GEP_253_i24 = getelementptr point, point* %ClassAddr_turnto_reg_252_i23, i32 0, i32 1
    store i32 0, i32* %Id_GEP_253_i24
    %ClassAddr_turnto_reg_255_i25=%point.point_ip0_20
    %Id_GEP_256_i26 = getelementptr point, point* %ClassAddr_turnto_reg_255_i25, i32 0, i32 2
    store i32 0, i32* %Id_GEP_256_i26
    br label %point.point_return_block_i10

point.point_return_block_i10; preds = %point.point_entrance_block_i9
    br label %main_entrance_block_AB_8_AB_11

main_entrance_block_AB_8_AB_11; preds = %point.point_return_block_i10
    %Malloc_Result263 = call i8* @malloc(i32 12)
    Malloc_Cast_Result_264 = bitcast i32* %Malloc_Result263 to point*
    br label %point.point_entrance_block_i12

point.point_entrance_block_i12; preds = %main_entrance_block_AB_8_AB_11
    %point.point_ip0_27=%Malloc_Cast_Result_264
    %ClassAddr_turnto_reg_249_i28=%point.point_ip0_27
    %Id_GEP_250_i29 = getelementptr point, point* %ClassAddr_turnto_reg_249_i28, i32 0, i32 0
    store i32 0, i32* %Id_GEP_250_i29
    %ClassAddr_turnto_reg_252_i30=%point.point_ip0_27
    %Id_GEP_253_i31 = getelementptr point, point* %ClassAddr_turnto_reg_252_i30, i32 0, i32 1
    store i32 0, i32* %Id_GEP_253_i31
    %ClassAddr_turnto_reg_255_i32=%point.point_ip0_27
    %Id_GEP_256_i33 = getelementptr point, point* %ClassAddr_turnto_reg_255_i32, i32 0, i32 2
    store i32 0, i32* %Id_GEP_256_i33
    br label %point.point_return_block_i13

point.point_return_block_i13; preds = %point.point_entrance_block_i12
    br label %main_entrance_block_AB_8_AB_11_AB_14

main_entrance_block_AB_8_AB_11_AB_14; preds = %point.point_return_block_i13
    %Malloc_Result266 = call i8* @malloc(i32 12)
    Malloc_Cast_Result_267 = bitcast i32* %Malloc_Result266 to point*
    br label %point.point_entrance_block_i15

point.point_entrance_block_i15; preds = %main_entrance_block_AB_8_AB_11_AB_14
    %point.point_ip0_34=%Malloc_Cast_Result_267
    %ClassAddr_turnto_reg_249_i35=%point.point_ip0_34
    %Id_GEP_250_i36 = getelementptr point, point* %ClassAddr_turnto_reg_249_i35, i32 0, i32 0
    store i32 0, i32* %Id_GEP_250_i36
    %ClassAddr_turnto_reg_252_i37=%point.point_ip0_34
    %Id_GEP_253_i38 = getelementptr point, point* %ClassAddr_turnto_reg_252_i37, i32 0, i32 1
    store i32 0, i32* %Id_GEP_253_i38
    %ClassAddr_turnto_reg_255_i39=%point.point_ip0_34
    %Id_GEP_256_i40 = getelementptr point, point* %ClassAddr_turnto_reg_255_i39, i32 0, i32 2
    store i32 0, i32* %Id_GEP_256_i40
    br label %point.point_return_block_i16

point.point_return_block_i16; preds = %point.point_entrance_block_i15
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17

main_entrance_block_AB_8_AB_11_AB_14_AB_17; preds = %point.point_return_block_i16
    %Malloc_Result269 = call i8* @malloc(i32 12)
    Malloc_Cast_Result_270 = bitcast i32* %Malloc_Result269 to point*
    br label %point.point_entrance_block_i18

point.point_entrance_block_i18; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17
    %point.point_ip0_41=%Malloc_Cast_Result_270
    %ClassAddr_turnto_reg_249_i42=%point.point_ip0_41
    %Id_GEP_250_i43 = getelementptr point, point* %ClassAddr_turnto_reg_249_i42, i32 0, i32 0
    store i32 0, i32* %Id_GEP_250_i43
    %ClassAddr_turnto_reg_252_i44=%point.point_ip0_41
    %Id_GEP_253_i45 = getelementptr point, point* %ClassAddr_turnto_reg_252_i44, i32 0, i32 1
    store i32 0, i32* %Id_GEP_253_i45
    %ClassAddr_turnto_reg_255_i46=%point.point_ip0_41
    %Id_GEP_256_i47 = getelementptr point, point* %ClassAddr_turnto_reg_255_i46, i32 0, i32 2
    store i32 0, i32* %Id_GEP_256_i47
    br label %point.point_return_block_i19

point.point_return_block_i19; preds = %point.point_entrance_block_i18
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20; preds = %point.point_return_block_i19
    %funccal272 = call void @point.printPoint(point* %Malloc_Cast_Result_261)
    br label %point.set_entrance_block_i21

point.set_entrance_block_i21; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20
    %point.set_ip0_48=%Malloc_Cast_Result_261
    %point.set_ip1_49=849
    %point.set_ip2_50=-463
    %point.set_ip3_51=480
    %ClassAddr_turnto_reg_1_i52=%point.set_ip0_48
    %Id_GEP_2_i53 = getelementptr point, point* %ClassAddr_turnto_reg_1_i52, i32 0, i32 0
    %Id_load4_i54 = load i32, i32* %point.set_ip1_49
    store i32 %Id_load4_i54, i32* %Id_GEP_2_i53
    %ClassAddr_turnto_reg_5_i55=%point.set_ip0_48
    %Id_GEP_6_i56 = getelementptr point, point* %ClassAddr_turnto_reg_5_i55, i32 0, i32 1
    %Id_load8_i57 = load i32, i32* %point.set_ip2_50
    store i32 %Id_load8_i57, i32* %Id_GEP_6_i56
    %ClassAddr_turnto_reg_9_i58=%point.set_ip0_48
    %Id_GEP_10_i59 = getelementptr point, point* %ClassAddr_turnto_reg_9_i58, i32 0, i32 2
    %Id_load12_i60 = load i32, i32* %point.set_ip3_51
    store i32 %Id_load12_i60, i32* %Id_GEP_10_i59
    br label %point.set_return_block_i22

point.set_return_block_i22; preds = %point.set_entrance_block_i21
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23; preds = %point.set_return_block_i22
    br label %point.set_entrance_block_i24

point.set_entrance_block_i24; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23
    %point.set_ip0_61=%Malloc_Cast_Result_264
    %point.set_ip1_62=-208
    %point.set_ip2_63=585
    %point.set_ip3_64=-150
    %ClassAddr_turnto_reg_1_i65=%point.set_ip0_61
    %Id_GEP_2_i66 = getelementptr point, point* %ClassAddr_turnto_reg_1_i65, i32 0, i32 0
    %Id_load4_i67 = load i32, i32* %point.set_ip1_62
    store i32 %Id_load4_i67, i32* %Id_GEP_2_i66
    %ClassAddr_turnto_reg_5_i68=%point.set_ip0_61
    %Id_GEP_6_i69 = getelementptr point, point* %ClassAddr_turnto_reg_5_i68, i32 0, i32 1
    %Id_load8_i70 = load i32, i32* %point.set_ip2_63
    store i32 %Id_load8_i70, i32* %Id_GEP_6_i69
    %ClassAddr_turnto_reg_9_i71=%point.set_ip0_61
    %Id_GEP_10_i72 = getelementptr point, point* %ClassAddr_turnto_reg_9_i71, i32 0, i32 2
    %Id_load12_i73 = load i32, i32* %point.set_ip3_64
    store i32 %Id_load12_i73, i32* %Id_GEP_10_i72
    br label %point.set_return_block_i25

point.set_return_block_i25; preds = %point.set_entrance_block_i24
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26; preds = %point.set_return_block_i25
    br label %point.set_entrance_block_i27

point.set_entrance_block_i27; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26
    %point.set_ip0_74=%Malloc_Cast_Result_267
    %point.set_ip1_75=360
    %point.set_ip2_76=-670
    %point.set_ip3_77=-742
    %ClassAddr_turnto_reg_1_i78=%point.set_ip0_74
    %Id_GEP_2_i79 = getelementptr point, point* %ClassAddr_turnto_reg_1_i78, i32 0, i32 0
    %Id_load4_i80 = load i32, i32* %point.set_ip1_75
    store i32 %Id_load4_i80, i32* %Id_GEP_2_i79
    %ClassAddr_turnto_reg_5_i81=%point.set_ip0_74
    %Id_GEP_6_i82 = getelementptr point, point* %ClassAddr_turnto_reg_5_i81, i32 0, i32 1
    %Id_load8_i83 = load i32, i32* %point.set_ip2_76
    store i32 %Id_load8_i83, i32* %Id_GEP_6_i82
    %ClassAddr_turnto_reg_9_i84=%point.set_ip0_74
    %Id_GEP_10_i85 = getelementptr point, point* %ClassAddr_turnto_reg_9_i84, i32 0, i32 2
    %Id_load12_i86 = load i32, i32* %point.set_ip3_77
    store i32 %Id_load12_i86, i32* %Id_GEP_10_i85
    br label %point.set_return_block_i28

point.set_return_block_i28; preds = %point.set_entrance_block_i27
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29; preds = %point.set_return_block_i28
    br label %point.set_entrance_block_i30

point.set_entrance_block_i30; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29
    %point.set_ip0_87=%Malloc_Cast_Result_270
    %point.set_ip1_88=-29
    %point.set_ip2_89=-591
    %point.set_ip3_90=-960
    %ClassAddr_turnto_reg_1_i91=%point.set_ip0_87
    %Id_GEP_2_i92 = getelementptr point, point* %ClassAddr_turnto_reg_1_i91, i32 0, i32 0
    %Id_load4_i93 = load i32, i32* %point.set_ip1_88
    store i32 %Id_load4_i93, i32* %Id_GEP_2_i92
    %ClassAddr_turnto_reg_5_i94=%point.set_ip0_87
    %Id_GEP_6_i95 = getelementptr point, point* %ClassAddr_turnto_reg_5_i94, i32 0, i32 1
    %Id_load8_i96 = load i32, i32* %point.set_ip2_89
    store i32 %Id_load8_i96, i32* %Id_GEP_6_i95
    %ClassAddr_turnto_reg_9_i97=%point.set_ip0_87
    %Id_GEP_10_i98 = getelementptr point, point* %ClassAddr_turnto_reg_9_i97, i32 0, i32 2
    %Id_load12_i99 = load i32, i32* %point.set_ip3_90
    store i32 %Id_load12_i99, i32* %Id_GEP_10_i98
    br label %point.set_return_block_i31

point.set_return_block_i31; preds = %point.set_entrance_block_i30
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32; preds = %point.set_return_block_i31
    br label %point.add_entrance_block_i33

point.add_entrance_block_i33; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32
    %point.add_ip0_100=%Malloc_Cast_Result_261
    %point.add_ip1_101=%Malloc_Cast_Result_264
    %ClassAddr_turnto_reg_162_i102=%point.add_ip0_100
    %Id_GEP_163_i103 = getelementptr point, point* %ClassAddr_turnto_reg_162_i102, i32 0, i32 0
    %ClassAddr_turnto_reg_165_i104=%point.add_ip0_100
    %Id_GEP_166_i105 = getelementptr point, point* %ClassAddr_turnto_reg_165_i104, i32 0, i32 0
    %Id_GEP_Load167_i106 = load i32, i32* %Id_GEP_166_i105
    %Id_load168_i107 = load point*, point** %point.add_ip1_101
    %memacc_result169_i108 = getelementptr point, point* %Id_load168_i107, i32 0, i32 0
    %memacc_result170_i109 = load i32, i32* %memacc_result169_i108
    add171_i110 = add i32 %Id_GEP_Load167_i106, %memacc_result170_i109
    store i32 %add171_i110, i32* %Id_GEP_163_i103
    %ClassAddr_turnto_reg_172_i111=%point.add_ip0_100
    %Id_GEP_173_i112 = getelementptr point, point* %ClassAddr_turnto_reg_172_i111, i32 0, i32 1
    %ClassAddr_turnto_reg_175_i113=%point.add_ip0_100
    %Id_GEP_176_i114 = getelementptr point, point* %ClassAddr_turnto_reg_175_i113, i32 0, i32 1
    %Id_GEP_Load177_i115 = load i32, i32* %Id_GEP_176_i114
    %Id_load178_i116 = load point*, point** %point.add_ip1_101
    %memacc_result179_i117 = getelementptr point, point* %Id_load178_i116, i32 0, i32 1
    %memacc_result180_i118 = load i32, i32* %memacc_result179_i117
    add181_i119 = add i32 %Id_GEP_Load177_i115, %memacc_result180_i118
    store i32 %add181_i119, i32* %Id_GEP_173_i112
    %ClassAddr_turnto_reg_182_i120=%point.add_ip0_100
    %Id_GEP_183_i121 = getelementptr point, point* %ClassAddr_turnto_reg_182_i120, i32 0, i32 2
    %ClassAddr_turnto_reg_185_i122=%point.add_ip0_100
    %Id_GEP_186_i123 = getelementptr point, point* %ClassAddr_turnto_reg_185_i122, i32 0, i32 2
    %Id_GEP_Load187_i124 = load i32, i32* %Id_GEP_186_i123
    %Id_load188_i125 = load point*, point** %point.add_ip1_101
    %memacc_result189_i126 = getelementptr point, point* %Id_load188_i125, i32 0, i32 2
    %memacc_result190_i127 = load i32, i32* %memacc_result189_i126
    add191_i128 = add i32 %Id_GEP_Load187_i124, %memacc_result190_i127
    store i32 %add191_i128, i32* %Id_GEP_183_i121
    br label %point.add_return_block_i34

point.add_return_block_i34; preds = %point.add_entrance_block_i33
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35; preds = %point.add_return_block_i34
    br label %point.add_entrance_block_i36

point.add_entrance_block_i36; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35
    %point.add_ip0_131=%Malloc_Cast_Result_264
    %point.add_ip1_132=%Malloc_Cast_Result_267
    %ClassAddr_turnto_reg_162_i133=%point.add_ip0_131
    %Id_GEP_163_i134 = getelementptr point, point* %ClassAddr_turnto_reg_162_i133, i32 0, i32 0
    %ClassAddr_turnto_reg_165_i135=%point.add_ip0_131
    %Id_GEP_166_i136 = getelementptr point, point* %ClassAddr_turnto_reg_165_i135, i32 0, i32 0
    %Id_GEP_Load167_i137 = load i32, i32* %Id_GEP_166_i136
    %Id_load168_i138 = load point*, point** %point.add_ip1_132
    %memacc_result169_i139 = getelementptr point, point* %Id_load168_i138, i32 0, i32 0
    %memacc_result170_i140 = load i32, i32* %memacc_result169_i139
    add171_i141 = add i32 %Id_GEP_Load167_i137, %memacc_result170_i140
    store i32 %add171_i141, i32* %Id_GEP_163_i134
    %ClassAddr_turnto_reg_172_i142=%point.add_ip0_131
    %Id_GEP_173_i143 = getelementptr point, point* %ClassAddr_turnto_reg_172_i142, i32 0, i32 1
    %ClassAddr_turnto_reg_175_i144=%point.add_ip0_131
    %Id_GEP_176_i145 = getelementptr point, point* %ClassAddr_turnto_reg_175_i144, i32 0, i32 1
    %Id_GEP_Load177_i146 = load i32, i32* %Id_GEP_176_i145
    %Id_load178_i147 = load point*, point** %point.add_ip1_132
    %memacc_result179_i148 = getelementptr point, point* %Id_load178_i147, i32 0, i32 1
    %memacc_result180_i149 = load i32, i32* %memacc_result179_i148
    add181_i150 = add i32 %Id_GEP_Load177_i146, %memacc_result180_i149
    store i32 %add181_i150, i32* %Id_GEP_173_i143
    %ClassAddr_turnto_reg_182_i151=%point.add_ip0_131
    %Id_GEP_183_i152 = getelementptr point, point* %ClassAddr_turnto_reg_182_i151, i32 0, i32 2
    %ClassAddr_turnto_reg_185_i153=%point.add_ip0_131
    %Id_GEP_186_i154 = getelementptr point, point* %ClassAddr_turnto_reg_185_i153, i32 0, i32 2
    %Id_GEP_Load187_i155 = load i32, i32* %Id_GEP_186_i154
    %Id_load188_i156 = load point*, point** %point.add_ip1_132
    %memacc_result189_i157 = getelementptr point, point* %Id_load188_i156, i32 0, i32 2
    %memacc_result190_i158 = load i32, i32* %memacc_result189_i157
    add191_i159 = add i32 %Id_GEP_Load187_i155, %memacc_result190_i158
    store i32 %add191_i159, i32* %Id_GEP_183_i152
    br label %point.add_return_block_i37

point.add_return_block_i37; preds = %point.add_entrance_block_i36
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38; preds = %point.add_return_block_i37
    br label %point.add_entrance_block_i39

point.add_entrance_block_i39; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38
    %point.add_ip0_162=%Malloc_Cast_Result_270
    %point.add_ip1_163=%Malloc_Cast_Result_267
    %ClassAddr_turnto_reg_162_i164=%point.add_ip0_162
    %Id_GEP_163_i165 = getelementptr point, point* %ClassAddr_turnto_reg_162_i164, i32 0, i32 0
    %ClassAddr_turnto_reg_165_i166=%point.add_ip0_162
    %Id_GEP_166_i167 = getelementptr point, point* %ClassAddr_turnto_reg_165_i166, i32 0, i32 0
    %Id_GEP_Load167_i168 = load i32, i32* %Id_GEP_166_i167
    %Id_load168_i169 = load point*, point** %point.add_ip1_163
    %memacc_result169_i170 = getelementptr point, point* %Id_load168_i169, i32 0, i32 0
    %memacc_result170_i171 = load i32, i32* %memacc_result169_i170
    add171_i172 = add i32 %Id_GEP_Load167_i168, %memacc_result170_i171
    store i32 %add171_i172, i32* %Id_GEP_163_i165
    %ClassAddr_turnto_reg_172_i173=%point.add_ip0_162
    %Id_GEP_173_i174 = getelementptr point, point* %ClassAddr_turnto_reg_172_i173, i32 0, i32 1
    %ClassAddr_turnto_reg_175_i175=%point.add_ip0_162
    %Id_GEP_176_i176 = getelementptr point, point* %ClassAddr_turnto_reg_175_i175, i32 0, i32 1
    %Id_GEP_Load177_i177 = load i32, i32* %Id_GEP_176_i176
    %Id_load178_i178 = load point*, point** %point.add_ip1_163
    %memacc_result179_i179 = getelementptr point, point* %Id_load178_i178, i32 0, i32 1
    %memacc_result180_i180 = load i32, i32* %memacc_result179_i179
    add181_i181 = add i32 %Id_GEP_Load177_i177, %memacc_result180_i180
    store i32 %add181_i181, i32* %Id_GEP_173_i174
    %ClassAddr_turnto_reg_182_i182=%point.add_ip0_162
    %Id_GEP_183_i183 = getelementptr point, point* %ClassAddr_turnto_reg_182_i182, i32 0, i32 2
    %ClassAddr_turnto_reg_185_i184=%point.add_ip0_162
    %Id_GEP_186_i185 = getelementptr point, point* %ClassAddr_turnto_reg_185_i184, i32 0, i32 2
    %Id_GEP_Load187_i186 = load i32, i32* %Id_GEP_186_i185
    %Id_load188_i187 = load point*, point** %point.add_ip1_163
    %memacc_result189_i188 = getelementptr point, point* %Id_load188_i187, i32 0, i32 2
    %memacc_result190_i189 = load i32, i32* %memacc_result189_i188
    add191_i190 = add i32 %Id_GEP_Load187_i186, %memacc_result190_i189
    store i32 %add191_i190, i32* %Id_GEP_183_i183
    br label %point.add_return_block_i40

point.add_return_block_i40; preds = %point.add_entrance_block_i39
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41; preds = %point.add_return_block_i40
    br label %point.sub_entrance_block_i42

point.sub_entrance_block_i42; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41
    %point.sub_ip0_193=%Malloc_Cast_Result_267
    %point.sub_ip1_194=%Malloc_Cast_Result_261
    %ClassAddr_turnto_reg_194_i195=%point.sub_ip0_193
    %Id_GEP_195_i196 = getelementptr point, point* %ClassAddr_turnto_reg_194_i195, i32 0, i32 0
    %ClassAddr_turnto_reg_197_i197=%point.sub_ip0_193
    %Id_GEP_198_i198 = getelementptr point, point* %ClassAddr_turnto_reg_197_i197, i32 0, i32 0
    %Id_GEP_Load199_i199 = load i32, i32* %Id_GEP_198_i198
    %Id_load200_i200 = load point*, point** %point.sub_ip1_194
    %memacc_result201_i201 = getelementptr point, point* %Id_load200_i200, i32 0, i32 0
    %memacc_result202_i202 = load i32, i32* %memacc_result201_i201
    sub203_i203 = sub i32 %Id_GEP_Load199_i199, %memacc_result202_i202
    store i32 %sub203_i203, i32* %Id_GEP_195_i196
    %ClassAddr_turnto_reg_204_i204=%point.sub_ip0_193
    %Id_GEP_205_i205 = getelementptr point, point* %ClassAddr_turnto_reg_204_i204, i32 0, i32 1
    %ClassAddr_turnto_reg_207_i206=%point.sub_ip0_193
    %Id_GEP_208_i207 = getelementptr point, point* %ClassAddr_turnto_reg_207_i206, i32 0, i32 1
    %Id_GEP_Load209_i208 = load i32, i32* %Id_GEP_208_i207
    %Id_load210_i209 = load point*, point** %point.sub_ip1_194
    %memacc_result211_i210 = getelementptr point, point* %Id_load210_i209, i32 0, i32 1
    %memacc_result212_i211 = load i32, i32* %memacc_result211_i210
    sub213_i212 = sub i32 %Id_GEP_Load209_i208, %memacc_result212_i211
    store i32 %sub213_i212, i32* %Id_GEP_205_i205
    %ClassAddr_turnto_reg_214_i213=%point.sub_ip0_193
    %Id_GEP_215_i214 = getelementptr point, point* %ClassAddr_turnto_reg_214_i213, i32 0, i32 2
    %ClassAddr_turnto_reg_217_i215=%point.sub_ip0_193
    %Id_GEP_218_i216 = getelementptr point, point* %ClassAddr_turnto_reg_217_i215, i32 0, i32 2
    %Id_GEP_Load219_i217 = load i32, i32* %Id_GEP_218_i216
    %Id_load220_i218 = load point*, point** %point.sub_ip1_194
    %memacc_result221_i219 = getelementptr point, point* %Id_load220_i218, i32 0, i32 2
    %memacc_result222_i220 = load i32, i32* %memacc_result221_i219
    sub223_i221 = sub i32 %Id_GEP_Load219_i217, %memacc_result222_i220
    store i32 %sub223_i221, i32* %Id_GEP_215_i214
    br label %point.sub_return_block_i43

point.sub_return_block_i43; preds = %point.sub_entrance_block_i42
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44; preds = %point.sub_return_block_i43
    br label %point.sub_entrance_block_i45

point.sub_entrance_block_i45; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44
    %point.sub_ip0_224=%Malloc_Cast_Result_264
    %point.sub_ip1_225=%Malloc_Cast_Result_270
    %ClassAddr_turnto_reg_194_i226=%point.sub_ip0_224
    %Id_GEP_195_i227 = getelementptr point, point* %ClassAddr_turnto_reg_194_i226, i32 0, i32 0
    %ClassAddr_turnto_reg_197_i228=%point.sub_ip0_224
    %Id_GEP_198_i229 = getelementptr point, point* %ClassAddr_turnto_reg_197_i228, i32 0, i32 0
    %Id_GEP_Load199_i230 = load i32, i32* %Id_GEP_198_i229
    %Id_load200_i231 = load point*, point** %point.sub_ip1_225
    %memacc_result201_i232 = getelementptr point, point* %Id_load200_i231, i32 0, i32 0
    %memacc_result202_i233 = load i32, i32* %memacc_result201_i232
    sub203_i234 = sub i32 %Id_GEP_Load199_i230, %memacc_result202_i233
    store i32 %sub203_i234, i32* %Id_GEP_195_i227
    %ClassAddr_turnto_reg_204_i235=%point.sub_ip0_224
    %Id_GEP_205_i236 = getelementptr point, point* %ClassAddr_turnto_reg_204_i235, i32 0, i32 1
    %ClassAddr_turnto_reg_207_i237=%point.sub_ip0_224
    %Id_GEP_208_i238 = getelementptr point, point* %ClassAddr_turnto_reg_207_i237, i32 0, i32 1
    %Id_GEP_Load209_i239 = load i32, i32* %Id_GEP_208_i238
    %Id_load210_i240 = load point*, point** %point.sub_ip1_225
    %memacc_result211_i241 = getelementptr point, point* %Id_load210_i240, i32 0, i32 1
    %memacc_result212_i242 = load i32, i32* %memacc_result211_i241
    sub213_i243 = sub i32 %Id_GEP_Load209_i239, %memacc_result212_i242
    store i32 %sub213_i243, i32* %Id_GEP_205_i236
    %ClassAddr_turnto_reg_214_i244=%point.sub_ip0_224
    %Id_GEP_215_i245 = getelementptr point, point* %ClassAddr_turnto_reg_214_i244, i32 0, i32 2
    %ClassAddr_turnto_reg_217_i246=%point.sub_ip0_224
    %Id_GEP_218_i247 = getelementptr point, point* %ClassAddr_turnto_reg_217_i246, i32 0, i32 2
    %Id_GEP_Load219_i248 = load i32, i32* %Id_GEP_218_i247
    %Id_load220_i249 = load point*, point** %point.sub_ip1_225
    %memacc_result221_i250 = getelementptr point, point* %Id_load220_i249, i32 0, i32 2
    %memacc_result222_i251 = load i32, i32* %memacc_result221_i250
    sub223_i252 = sub i32 %Id_GEP_Load219_i248, %memacc_result222_i251
    store i32 %sub223_i252, i32* %Id_GEP_215_i245
    br label %point.sub_return_block_i46

point.sub_return_block_i46; preds = %point.sub_entrance_block_i45
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47; preds = %point.sub_return_block_i46
    br label %point.sub_entrance_block_i48

point.sub_entrance_block_i48; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47
    %point.sub_ip0_255=%Malloc_Cast_Result_270
    %point.sub_ip1_256=%Malloc_Cast_Result_267
    %ClassAddr_turnto_reg_194_i257=%point.sub_ip0_255
    %Id_GEP_195_i258 = getelementptr point, point* %ClassAddr_turnto_reg_194_i257, i32 0, i32 0
    %ClassAddr_turnto_reg_197_i259=%point.sub_ip0_255
    %Id_GEP_198_i260 = getelementptr point, point* %ClassAddr_turnto_reg_197_i259, i32 0, i32 0
    %Id_GEP_Load199_i261 = load i32, i32* %Id_GEP_198_i260
    %Id_load200_i262 = load point*, point** %point.sub_ip1_256
    %memacc_result201_i263 = getelementptr point, point* %Id_load200_i262, i32 0, i32 0
    %memacc_result202_i264 = load i32, i32* %memacc_result201_i263
    sub203_i265 = sub i32 %Id_GEP_Load199_i261, %memacc_result202_i264
    store i32 %sub203_i265, i32* %Id_GEP_195_i258
    %ClassAddr_turnto_reg_204_i266=%point.sub_ip0_255
    %Id_GEP_205_i267 = getelementptr point, point* %ClassAddr_turnto_reg_204_i266, i32 0, i32 1
    %ClassAddr_turnto_reg_207_i268=%point.sub_ip0_255
    %Id_GEP_208_i269 = getelementptr point, point* %ClassAddr_turnto_reg_207_i268, i32 0, i32 1
    %Id_GEP_Load209_i270 = load i32, i32* %Id_GEP_208_i269
    %Id_load210_i271 = load point*, point** %point.sub_ip1_256
    %memacc_result211_i272 = getelementptr point, point* %Id_load210_i271, i32 0, i32 1
    %memacc_result212_i273 = load i32, i32* %memacc_result211_i272
    sub213_i274 = sub i32 %Id_GEP_Load209_i270, %memacc_result212_i273
    store i32 %sub213_i274, i32* %Id_GEP_205_i267
    %ClassAddr_turnto_reg_214_i275=%point.sub_ip0_255
    %Id_GEP_215_i276 = getelementptr point, point* %ClassAddr_turnto_reg_214_i275, i32 0, i32 2
    %ClassAddr_turnto_reg_217_i277=%point.sub_ip0_255
    %Id_GEP_218_i278 = getelementptr point, point* %ClassAddr_turnto_reg_217_i277, i32 0, i32 2
    %Id_GEP_Load219_i279 = load i32, i32* %Id_GEP_218_i278
    %Id_load220_i280 = load point*, point** %point.sub_ip1_256
    %memacc_result221_i281 = getelementptr point, point* %Id_load220_i280, i32 0, i32 2
    %memacc_result222_i282 = load i32, i32* %memacc_result221_i281
    sub223_i283 = sub i32 %Id_GEP_Load219_i279, %memacc_result222_i282
    store i32 %sub223_i283, i32* %Id_GEP_215_i276
    br label %point.sub_return_block_i49

point.sub_return_block_i49; preds = %point.sub_entrance_block_i48
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50; preds = %point.sub_return_block_i49
    br label %point.add_entrance_block_i51

point.add_entrance_block_i51; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50
    %point.add_ip0_286=%Malloc_Cast_Result_267
    %point.add_ip1_287=%Malloc_Cast_Result_264
    %ClassAddr_turnto_reg_162_i288=%point.add_ip0_286
    %Id_GEP_163_i289 = getelementptr point, point* %ClassAddr_turnto_reg_162_i288, i32 0, i32 0
    %ClassAddr_turnto_reg_165_i290=%point.add_ip0_286
    %Id_GEP_166_i291 = getelementptr point, point* %ClassAddr_turnto_reg_165_i290, i32 0, i32 0
    %Id_GEP_Load167_i292 = load i32, i32* %Id_GEP_166_i291
    %Id_load168_i293 = load point*, point** %point.add_ip1_287
    %memacc_result169_i294 = getelementptr point, point* %Id_load168_i293, i32 0, i32 0
    %memacc_result170_i295 = load i32, i32* %memacc_result169_i294
    add171_i296 = add i32 %Id_GEP_Load167_i292, %memacc_result170_i295
    store i32 %add171_i296, i32* %Id_GEP_163_i289
    %ClassAddr_turnto_reg_172_i297=%point.add_ip0_286
    %Id_GEP_173_i298 = getelementptr point, point* %ClassAddr_turnto_reg_172_i297, i32 0, i32 1
    %ClassAddr_turnto_reg_175_i299=%point.add_ip0_286
    %Id_GEP_176_i300 = getelementptr point, point* %ClassAddr_turnto_reg_175_i299, i32 0, i32 1
    %Id_GEP_Load177_i301 = load i32, i32* %Id_GEP_176_i300
    %Id_load178_i302 = load point*, point** %point.add_ip1_287
    %memacc_result179_i303 = getelementptr point, point* %Id_load178_i302, i32 0, i32 1
    %memacc_result180_i304 = load i32, i32* %memacc_result179_i303
    add181_i305 = add i32 %Id_GEP_Load177_i301, %memacc_result180_i304
    store i32 %add181_i305, i32* %Id_GEP_173_i298
    %ClassAddr_turnto_reg_182_i306=%point.add_ip0_286
    %Id_GEP_183_i307 = getelementptr point, point* %ClassAddr_turnto_reg_182_i306, i32 0, i32 2
    %ClassAddr_turnto_reg_185_i308=%point.add_ip0_286
    %Id_GEP_186_i309 = getelementptr point, point* %ClassAddr_turnto_reg_185_i308, i32 0, i32 2
    %Id_GEP_Load187_i310 = load i32, i32* %Id_GEP_186_i309
    %Id_load188_i311 = load point*, point** %point.add_ip1_287
    %memacc_result189_i312 = getelementptr point, point* %Id_load188_i311, i32 0, i32 2
    %memacc_result190_i313 = load i32, i32* %memacc_result189_i312
    add191_i314 = add i32 %Id_GEP_Load187_i310, %memacc_result190_i313
    store i32 %add191_i314, i32* %Id_GEP_183_i307
    br label %point.add_return_block_i52

point.add_return_block_i52; preds = %point.add_entrance_block_i51
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53; preds = %point.add_return_block_i52
    br label %point.add_entrance_block_i54

point.add_entrance_block_i54; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53
    %point.add_ip0_317=%Malloc_Cast_Result_261
    %point.add_ip1_318=%Malloc_Cast_Result_264
    %ClassAddr_turnto_reg_162_i319=%point.add_ip0_317
    %Id_GEP_163_i320 = getelementptr point, point* %ClassAddr_turnto_reg_162_i319, i32 0, i32 0
    %ClassAddr_turnto_reg_165_i321=%point.add_ip0_317
    %Id_GEP_166_i322 = getelementptr point, point* %ClassAddr_turnto_reg_165_i321, i32 0, i32 0
    %Id_GEP_Load167_i323 = load i32, i32* %Id_GEP_166_i322
    %Id_load168_i324 = load point*, point** %point.add_ip1_318
    %memacc_result169_i325 = getelementptr point, point* %Id_load168_i324, i32 0, i32 0
    %memacc_result170_i326 = load i32, i32* %memacc_result169_i325
    add171_i327 = add i32 %Id_GEP_Load167_i323, %memacc_result170_i326
    store i32 %add171_i327, i32* %Id_GEP_163_i320
    %ClassAddr_turnto_reg_172_i328=%point.add_ip0_317
    %Id_GEP_173_i329 = getelementptr point, point* %ClassAddr_turnto_reg_172_i328, i32 0, i32 1
    %ClassAddr_turnto_reg_175_i330=%point.add_ip0_317
    %Id_GEP_176_i331 = getelementptr point, point* %ClassAddr_turnto_reg_175_i330, i32 0, i32 1
    %Id_GEP_Load177_i332 = load i32, i32* %Id_GEP_176_i331
    %Id_load178_i333 = load point*, point** %point.add_ip1_318
    %memacc_result179_i334 = getelementptr point, point* %Id_load178_i333, i32 0, i32 1
    %memacc_result180_i335 = load i32, i32* %memacc_result179_i334
    add181_i336 = add i32 %Id_GEP_Load177_i332, %memacc_result180_i335
    store i32 %add181_i336, i32* %Id_GEP_173_i329
    %ClassAddr_turnto_reg_182_i337=%point.add_ip0_317
    %Id_GEP_183_i338 = getelementptr point, point* %ClassAddr_turnto_reg_182_i337, i32 0, i32 2
    %ClassAddr_turnto_reg_185_i339=%point.add_ip0_317
    %Id_GEP_186_i340 = getelementptr point, point* %ClassAddr_turnto_reg_185_i339, i32 0, i32 2
    %Id_GEP_Load187_i341 = load i32, i32* %Id_GEP_186_i340
    %Id_load188_i342 = load point*, point** %point.add_ip1_318
    %memacc_result189_i343 = getelementptr point, point* %Id_load188_i342, i32 0, i32 2
    %memacc_result190_i344 = load i32, i32* %memacc_result189_i343
    add191_i345 = add i32 %Id_GEP_Load187_i341, %memacc_result190_i344
    store i32 %add191_i345, i32* %Id_GEP_183_i338
    br label %point.add_return_block_i55

point.add_return_block_i55; preds = %point.add_entrance_block_i54
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56; preds = %point.add_return_block_i55
    br label %point.add_entrance_block_i57

point.add_entrance_block_i57; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56
    %point.add_ip0_348=%Malloc_Cast_Result_264
    %point.add_ip1_349=%Malloc_Cast_Result_264
    %ClassAddr_turnto_reg_162_i350=%point.add_ip0_348
    %Id_GEP_163_i351 = getelementptr point, point* %ClassAddr_turnto_reg_162_i350, i32 0, i32 0
    %ClassAddr_turnto_reg_165_i352=%point.add_ip0_348
    %Id_GEP_166_i353 = getelementptr point, point* %ClassAddr_turnto_reg_165_i352, i32 0, i32 0
    %Id_GEP_Load167_i354 = load i32, i32* %Id_GEP_166_i353
    %Id_load168_i355 = load point*, point** %point.add_ip1_349
    %memacc_result169_i356 = getelementptr point, point* %Id_load168_i355, i32 0, i32 0
    %memacc_result170_i357 = load i32, i32* %memacc_result169_i356
    add171_i358 = add i32 %Id_GEP_Load167_i354, %memacc_result170_i357
    store i32 %add171_i358, i32* %Id_GEP_163_i351
    %ClassAddr_turnto_reg_172_i359=%point.add_ip0_348
    %Id_GEP_173_i360 = getelementptr point, point* %ClassAddr_turnto_reg_172_i359, i32 0, i32 1
    %ClassAddr_turnto_reg_175_i361=%point.add_ip0_348
    %Id_GEP_176_i362 = getelementptr point, point* %ClassAddr_turnto_reg_175_i361, i32 0, i32 1
    %Id_GEP_Load177_i363 = load i32, i32* %Id_GEP_176_i362
    %Id_load178_i364 = load point*, point** %point.add_ip1_349
    %memacc_result179_i365 = getelementptr point, point* %Id_load178_i364, i32 0, i32 1
    %memacc_result180_i366 = load i32, i32* %memacc_result179_i365
    add181_i367 = add i32 %Id_GEP_Load177_i363, %memacc_result180_i366
    store i32 %add181_i367, i32* %Id_GEP_173_i360
    %ClassAddr_turnto_reg_182_i368=%point.add_ip0_348
    %Id_GEP_183_i369 = getelementptr point, point* %ClassAddr_turnto_reg_182_i368, i32 0, i32 2
    %ClassAddr_turnto_reg_185_i370=%point.add_ip0_348
    %Id_GEP_186_i371 = getelementptr point, point* %ClassAddr_turnto_reg_185_i370, i32 0, i32 2
    %Id_GEP_Load187_i372 = load i32, i32* %Id_GEP_186_i371
    %Id_load188_i373 = load point*, point** %point.add_ip1_349
    %memacc_result189_i374 = getelementptr point, point* %Id_load188_i373, i32 0, i32 2
    %memacc_result190_i375 = load i32, i32* %memacc_result189_i374
    add191_i376 = add i32 %Id_GEP_Load187_i372, %memacc_result190_i375
    store i32 %add191_i376, i32* %Id_GEP_183_i369
    br label %point.add_return_block_i58

point.add_return_block_i58; preds = %point.add_entrance_block_i57
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59; preds = %point.add_return_block_i58
    br label %point.add_entrance_block_i60

point.add_entrance_block_i60; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59
    %point.add_ip0_379=%Malloc_Cast_Result_267
    %point.add_ip1_380=%Malloc_Cast_Result_267
    %ClassAddr_turnto_reg_162_i381=%point.add_ip0_379
    %Id_GEP_163_i382 = getelementptr point, point* %ClassAddr_turnto_reg_162_i381, i32 0, i32 0
    %ClassAddr_turnto_reg_165_i383=%point.add_ip0_379
    %Id_GEP_166_i384 = getelementptr point, point* %ClassAddr_turnto_reg_165_i383, i32 0, i32 0
    %Id_GEP_Load167_i385 = load i32, i32* %Id_GEP_166_i384
    %Id_load168_i386 = load point*, point** %point.add_ip1_380
    %memacc_result169_i387 = getelementptr point, point* %Id_load168_i386, i32 0, i32 0
    %memacc_result170_i388 = load i32, i32* %memacc_result169_i387
    add171_i389 = add i32 %Id_GEP_Load167_i385, %memacc_result170_i388
    store i32 %add171_i389, i32* %Id_GEP_163_i382
    %ClassAddr_turnto_reg_172_i390=%point.add_ip0_379
    %Id_GEP_173_i391 = getelementptr point, point* %ClassAddr_turnto_reg_172_i390, i32 0, i32 1
    %ClassAddr_turnto_reg_175_i392=%point.add_ip0_379
    %Id_GEP_176_i393 = getelementptr point, point* %ClassAddr_turnto_reg_175_i392, i32 0, i32 1
    %Id_GEP_Load177_i394 = load i32, i32* %Id_GEP_176_i393
    %Id_load178_i395 = load point*, point** %point.add_ip1_380
    %memacc_result179_i396 = getelementptr point, point* %Id_load178_i395, i32 0, i32 1
    %memacc_result180_i397 = load i32, i32* %memacc_result179_i396
    add181_i398 = add i32 %Id_GEP_Load177_i394, %memacc_result180_i397
    store i32 %add181_i398, i32* %Id_GEP_173_i391
    %ClassAddr_turnto_reg_182_i399=%point.add_ip0_379
    %Id_GEP_183_i400 = getelementptr point, point* %ClassAddr_turnto_reg_182_i399, i32 0, i32 2
    %ClassAddr_turnto_reg_185_i401=%point.add_ip0_379
    %Id_GEP_186_i402 = getelementptr point, point* %ClassAddr_turnto_reg_185_i401, i32 0, i32 2
    %Id_GEP_Load187_i403 = load i32, i32* %Id_GEP_186_i402
    %Id_load188_i404 = load point*, point** %point.add_ip1_380
    %memacc_result189_i405 = getelementptr point, point* %Id_load188_i404, i32 0, i32 2
    %memacc_result190_i406 = load i32, i32* %memacc_result189_i405
    add191_i407 = add i32 %Id_GEP_Load187_i403, %memacc_result190_i406
    store i32 %add191_i407, i32* %Id_GEP_183_i400
    br label %point.add_return_block_i61

point.add_return_block_i61; preds = %point.add_entrance_block_i60
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62; preds = %point.add_return_block_i61
    br label %point.sub_entrance_block_i63

point.sub_entrance_block_i63; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62
    %point.sub_ip0_410=%Malloc_Cast_Result_261
    %point.sub_ip1_411=%Malloc_Cast_Result_270
    %ClassAddr_turnto_reg_194_i412=%point.sub_ip0_410
    %Id_GEP_195_i413 = getelementptr point, point* %ClassAddr_turnto_reg_194_i412, i32 0, i32 0
    %ClassAddr_turnto_reg_197_i414=%point.sub_ip0_410
    %Id_GEP_198_i415 = getelementptr point, point* %ClassAddr_turnto_reg_197_i414, i32 0, i32 0
    %Id_GEP_Load199_i416 = load i32, i32* %Id_GEP_198_i415
    %Id_load200_i417 = load point*, point** %point.sub_ip1_411
    %memacc_result201_i418 = getelementptr point, point* %Id_load200_i417, i32 0, i32 0
    %memacc_result202_i419 = load i32, i32* %memacc_result201_i418
    sub203_i420 = sub i32 %Id_GEP_Load199_i416, %memacc_result202_i419
    store i32 %sub203_i420, i32* %Id_GEP_195_i413
    %ClassAddr_turnto_reg_204_i421=%point.sub_ip0_410
    %Id_GEP_205_i422 = getelementptr point, point* %ClassAddr_turnto_reg_204_i421, i32 0, i32 1
    %ClassAddr_turnto_reg_207_i423=%point.sub_ip0_410
    %Id_GEP_208_i424 = getelementptr point, point* %ClassAddr_turnto_reg_207_i423, i32 0, i32 1
    %Id_GEP_Load209_i425 = load i32, i32* %Id_GEP_208_i424
    %Id_load210_i426 = load point*, point** %point.sub_ip1_411
    %memacc_result211_i427 = getelementptr point, point* %Id_load210_i426, i32 0, i32 1
    %memacc_result212_i428 = load i32, i32* %memacc_result211_i427
    sub213_i429 = sub i32 %Id_GEP_Load209_i425, %memacc_result212_i428
    store i32 %sub213_i429, i32* %Id_GEP_205_i422
    %ClassAddr_turnto_reg_214_i430=%point.sub_ip0_410
    %Id_GEP_215_i431 = getelementptr point, point* %ClassAddr_turnto_reg_214_i430, i32 0, i32 2
    %ClassAddr_turnto_reg_217_i432=%point.sub_ip0_410
    %Id_GEP_218_i433 = getelementptr point, point* %ClassAddr_turnto_reg_217_i432, i32 0, i32 2
    %Id_GEP_Load219_i434 = load i32, i32* %Id_GEP_218_i433
    %Id_load220_i435 = load point*, point** %point.sub_ip1_411
    %memacc_result221_i436 = getelementptr point, point* %Id_load220_i435, i32 0, i32 2
    %memacc_result222_i437 = load i32, i32* %memacc_result221_i436
    sub223_i438 = sub i32 %Id_GEP_Load219_i434, %memacc_result222_i437
    store i32 %sub223_i438, i32* %Id_GEP_215_i431
    br label %point.sub_return_block_i64

point.sub_return_block_i64; preds = %point.sub_entrance_block_i63
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65; preds = %point.sub_return_block_i64
    br label %point.add_entrance_block_i66

point.add_entrance_block_i66; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65
    %point.add_ip0_441=%Malloc_Cast_Result_261
    %point.add_ip1_442=%Malloc_Cast_Result_264
    %ClassAddr_turnto_reg_162_i443=%point.add_ip0_441
    %Id_GEP_163_i444 = getelementptr point, point* %ClassAddr_turnto_reg_162_i443, i32 0, i32 0
    %ClassAddr_turnto_reg_165_i445=%point.add_ip0_441
    %Id_GEP_166_i446 = getelementptr point, point* %ClassAddr_turnto_reg_165_i445, i32 0, i32 0
    %Id_GEP_Load167_i447 = load i32, i32* %Id_GEP_166_i446
    %Id_load168_i448 = load point*, point** %point.add_ip1_442
    %memacc_result169_i449 = getelementptr point, point* %Id_load168_i448, i32 0, i32 0
    %memacc_result170_i450 = load i32, i32* %memacc_result169_i449
    add171_i451 = add i32 %Id_GEP_Load167_i447, %memacc_result170_i450
    store i32 %add171_i451, i32* %Id_GEP_163_i444
    %ClassAddr_turnto_reg_172_i452=%point.add_ip0_441
    %Id_GEP_173_i453 = getelementptr point, point* %ClassAddr_turnto_reg_172_i452, i32 0, i32 1
    %ClassAddr_turnto_reg_175_i454=%point.add_ip0_441
    %Id_GEP_176_i455 = getelementptr point, point* %ClassAddr_turnto_reg_175_i454, i32 0, i32 1
    %Id_GEP_Load177_i456 = load i32, i32* %Id_GEP_176_i455
    %Id_load178_i457 = load point*, point** %point.add_ip1_442
    %memacc_result179_i458 = getelementptr point, point* %Id_load178_i457, i32 0, i32 1
    %memacc_result180_i459 = load i32, i32* %memacc_result179_i458
    add181_i460 = add i32 %Id_GEP_Load177_i456, %memacc_result180_i459
    store i32 %add181_i460, i32* %Id_GEP_173_i453
    %ClassAddr_turnto_reg_182_i461=%point.add_ip0_441
    %Id_GEP_183_i462 = getelementptr point, point* %ClassAddr_turnto_reg_182_i461, i32 0, i32 2
    %ClassAddr_turnto_reg_185_i463=%point.add_ip0_441
    %Id_GEP_186_i464 = getelementptr point, point* %ClassAddr_turnto_reg_185_i463, i32 0, i32 2
    %Id_GEP_Load187_i465 = load i32, i32* %Id_GEP_186_i464
    %Id_load188_i466 = load point*, point** %point.add_ip1_442
    %memacc_result189_i467 = getelementptr point, point* %Id_load188_i466, i32 0, i32 2
    %memacc_result190_i468 = load i32, i32* %memacc_result189_i467
    add191_i469 = add i32 %Id_GEP_Load187_i465, %memacc_result190_i468
    store i32 %add191_i469, i32* %Id_GEP_183_i462
    br label %point.add_return_block_i67

point.add_return_block_i67; preds = %point.add_entrance_block_i66
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68; preds = %point.add_return_block_i67
    br label %point.sub_entrance_block_i69

point.sub_entrance_block_i69; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68
    %point.sub_ip0_472=%Malloc_Cast_Result_264
    %point.sub_ip1_473=%Malloc_Cast_Result_267
    %ClassAddr_turnto_reg_194_i474=%point.sub_ip0_472
    %Id_GEP_195_i475 = getelementptr point, point* %ClassAddr_turnto_reg_194_i474, i32 0, i32 0
    %ClassAddr_turnto_reg_197_i476=%point.sub_ip0_472
    %Id_GEP_198_i477 = getelementptr point, point* %ClassAddr_turnto_reg_197_i476, i32 0, i32 0
    %Id_GEP_Load199_i478 = load i32, i32* %Id_GEP_198_i477
    %Id_load200_i479 = load point*, point** %point.sub_ip1_473
    %memacc_result201_i480 = getelementptr point, point* %Id_load200_i479, i32 0, i32 0
    %memacc_result202_i481 = load i32, i32* %memacc_result201_i480
    sub203_i482 = sub i32 %Id_GEP_Load199_i478, %memacc_result202_i481
    store i32 %sub203_i482, i32* %Id_GEP_195_i475
    %ClassAddr_turnto_reg_204_i483=%point.sub_ip0_472
    %Id_GEP_205_i484 = getelementptr point, point* %ClassAddr_turnto_reg_204_i483, i32 0, i32 1
    %ClassAddr_turnto_reg_207_i485=%point.sub_ip0_472
    %Id_GEP_208_i486 = getelementptr point, point* %ClassAddr_turnto_reg_207_i485, i32 0, i32 1
    %Id_GEP_Load209_i487 = load i32, i32* %Id_GEP_208_i486
    %Id_load210_i488 = load point*, point** %point.sub_ip1_473
    %memacc_result211_i489 = getelementptr point, point* %Id_load210_i488, i32 0, i32 1
    %memacc_result212_i490 = load i32, i32* %memacc_result211_i489
    sub213_i491 = sub i32 %Id_GEP_Load209_i487, %memacc_result212_i490
    store i32 %sub213_i491, i32* %Id_GEP_205_i484
    %ClassAddr_turnto_reg_214_i492=%point.sub_ip0_472
    %Id_GEP_215_i493 = getelementptr point, point* %ClassAddr_turnto_reg_214_i492, i32 0, i32 2
    %ClassAddr_turnto_reg_217_i494=%point.sub_ip0_472
    %Id_GEP_218_i495 = getelementptr point, point* %ClassAddr_turnto_reg_217_i494, i32 0, i32 2
    %Id_GEP_Load219_i496 = load i32, i32* %Id_GEP_218_i495
    %Id_load220_i497 = load point*, point** %point.sub_ip1_473
    %memacc_result221_i498 = getelementptr point, point* %Id_load220_i497, i32 0, i32 2
    %memacc_result222_i499 = load i32, i32* %memacc_result221_i498
    sub223_i500 = sub i32 %Id_GEP_Load219_i496, %memacc_result222_i499
    store i32 %sub223_i500, i32* %Id_GEP_215_i493
    br label %point.sub_return_block_i70

point.sub_return_block_i70; preds = %point.sub_entrance_block_i69
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71; preds = %point.sub_return_block_i70
    br label %point.sqrLen_entrance_block_i72

point.sqrLen_entrance_block_i72; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71
    %point.sqrLen_ip0_503=%Malloc_Cast_Result_261
    %ClassAddr_turnto_reg_14_i504=%point.sqrLen_ip0_503
    %Id_GEP_15_i505 = getelementptr point, point* %ClassAddr_turnto_reg_14_i504, i32 0, i32 0
    %Id_GEP_Load16_i506 = load i32, i32* %Id_GEP_15_i505
    %ClassAddr_turnto_reg_17_i507=%point.sqrLen_ip0_503
    %Id_GEP_18_i508 = getelementptr point, point* %ClassAddr_turnto_reg_17_i507, i32 0, i32 0
    %Id_GEP_Load19_i509 = load i32, i32* %Id_GEP_18_i508
    mul20_i510 = mul i32 %Id_GEP_Load16_i506, %Id_GEP_Load19_i509
    %ClassAddr_turnto_reg_21_i511=%point.sqrLen_ip0_503
    %Id_GEP_22_i512 = getelementptr point, point* %ClassAddr_turnto_reg_21_i511, i32 0, i32 1
    %Id_GEP_Load23_i513 = load i32, i32* %Id_GEP_22_i512
    %ClassAddr_turnto_reg_24_i514=%point.sqrLen_ip0_503
    %Id_GEP_25_i515 = getelementptr point, point* %ClassAddr_turnto_reg_24_i514, i32 0, i32 1
    %Id_GEP_Load26_i516 = load i32, i32* %Id_GEP_25_i515
    mul27_i517 = mul i32 %Id_GEP_Load23_i513, %Id_GEP_Load26_i516
    add28_i518 = add i32 %mul20_i510, %mul27_i517
    %ClassAddr_turnto_reg_29_i519=%point.sqrLen_ip0_503
    %Id_GEP_30_i520 = getelementptr point, point* %ClassAddr_turnto_reg_29_i519, i32 0, i32 2
    %Id_GEP_Load31_i521 = load i32, i32* %Id_GEP_30_i520
    %ClassAddr_turnto_reg_32_i522=%point.sqrLen_ip0_503
    %Id_GEP_33_i523 = getelementptr point, point* %ClassAddr_turnto_reg_32_i522, i32 0, i32 2
    %Id_GEP_Load34_i524 = load i32, i32* %Id_GEP_33_i523
    mul35_i525 = mul i32 %Id_GEP_Load31_i521, %Id_GEP_Load34_i524
    add36_i526 = add i32 %add28_i518, %mul35_i525
    %point.sqrLenreturn_value13_i527=%add36_i526
    br label %point.sqrLen_return_block_i73

point.sqrLen_return_block_i73; preds = %point.sqrLen_entrance_block_i72
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74; preds = %point.sqrLen_return_block_i73
    %funccal321=%point.sqrLenreturn_value13_i527
    %funccal322 = call i8* @toString(i32 %funccal321)
    %funccal323 = call void @println(i8* %funccal322)
    br label %point.sqrLen_entrance_block_i75

point.sqrLen_entrance_block_i75; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74
    %point.sqrLen_ip0_528=%Malloc_Cast_Result_264
    %ClassAddr_turnto_reg_14_i529=%point.sqrLen_ip0_528
    %Id_GEP_15_i530 = getelementptr point, point* %ClassAddr_turnto_reg_14_i529, i32 0, i32 0
    %Id_GEP_Load16_i531 = load i32, i32* %Id_GEP_15_i530
    %ClassAddr_turnto_reg_17_i532=%point.sqrLen_ip0_528
    %Id_GEP_18_i533 = getelementptr point, point* %ClassAddr_turnto_reg_17_i532, i32 0, i32 0
    %Id_GEP_Load19_i534 = load i32, i32* %Id_GEP_18_i533
    mul20_i535 = mul i32 %Id_GEP_Load16_i531, %Id_GEP_Load19_i534
    %ClassAddr_turnto_reg_21_i536=%point.sqrLen_ip0_528
    %Id_GEP_22_i537 = getelementptr point, point* %ClassAddr_turnto_reg_21_i536, i32 0, i32 1
    %Id_GEP_Load23_i538 = load i32, i32* %Id_GEP_22_i537
    %ClassAddr_turnto_reg_24_i539=%point.sqrLen_ip0_528
    %Id_GEP_25_i540 = getelementptr point, point* %ClassAddr_turnto_reg_24_i539, i32 0, i32 1
    %Id_GEP_Load26_i541 = load i32, i32* %Id_GEP_25_i540
    mul27_i542 = mul i32 %Id_GEP_Load23_i538, %Id_GEP_Load26_i541
    add28_i543 = add i32 %mul20_i535, %mul27_i542
    %ClassAddr_turnto_reg_29_i544=%point.sqrLen_ip0_528
    %Id_GEP_30_i545 = getelementptr point, point* %ClassAddr_turnto_reg_29_i544, i32 0, i32 2
    %Id_GEP_Load31_i546 = load i32, i32* %Id_GEP_30_i545
    %ClassAddr_turnto_reg_32_i547=%point.sqrLen_ip0_528
    %Id_GEP_33_i548 = getelementptr point, point* %ClassAddr_turnto_reg_32_i547, i32 0, i32 2
    %Id_GEP_Load34_i549 = load i32, i32* %Id_GEP_33_i548
    mul35_i550 = mul i32 %Id_GEP_Load31_i546, %Id_GEP_Load34_i549
    add36_i551 = add i32 %add28_i543, %mul35_i550
    %point.sqrLenreturn_value13_i552=%add36_i551
    br label %point.sqrLen_return_block_i76

point.sqrLen_return_block_i76; preds = %point.sqrLen_entrance_block_i75
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77; preds = %point.sqrLen_return_block_i76
    %funccal325=%point.sqrLenreturn_value13_i552
    %funccal326 = call i8* @toString(i32 %funccal325)
    %funccal327 = call void @println(i8* %funccal326)
    br label %point.sqrDis_entrance_block_i78

point.sqrDis_entrance_block_i78; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77
    %point.sqrDis_ip0_553=%Malloc_Cast_Result_264
    %point.sqrDis_ip1_554=%Malloc_Cast_Result_267
    %ClassAddr_turnto_reg_38_i555=%point.sqrDis_ip0_553
    %Id_GEP_39_i556 = getelementptr point, point* %ClassAddr_turnto_reg_38_i555, i32 0, i32 0
    %Id_GEP_Load40_i557 = load i32, i32* %Id_GEP_39_i556
    %Id_load41_i558 = load point*, point** %point.sqrDis_ip1_554
    %memacc_result42_i559 = getelementptr point, point* %Id_load41_i558, i32 0, i32 0
    %memacc_result43_i560 = load i32, i32* %memacc_result42_i559
    sub44_i561 = sub i32 %Id_GEP_Load40_i557, %memacc_result43_i560
    %ClassAddr_turnto_reg_45_i562=%point.sqrDis_ip0_553
    %Id_GEP_46_i563 = getelementptr point, point* %ClassAddr_turnto_reg_45_i562, i32 0, i32 0
    %Id_GEP_Load47_i564 = load i32, i32* %Id_GEP_46_i563
    %Id_load48_i565 = load point*, point** %point.sqrDis_ip1_554
    %memacc_result49_i566 = getelementptr point, point* %Id_load48_i565, i32 0, i32 0
    %memacc_result50_i567 = load i32, i32* %memacc_result49_i566
    sub51_i568 = sub i32 %Id_GEP_Load47_i564, %memacc_result50_i567
    mul52_i569 = mul i32 %sub44_i561, %sub51_i568
    %ClassAddr_turnto_reg_53_i570=%point.sqrDis_ip0_553
    %Id_GEP_54_i571 = getelementptr point, point* %ClassAddr_turnto_reg_53_i570, i32 0, i32 1
    %Id_GEP_Load55_i572 = load i32, i32* %Id_GEP_54_i571
    %Id_load56_i573 = load point*, point** %point.sqrDis_ip1_554
    %memacc_result57_i574 = getelementptr point, point* %Id_load56_i573, i32 0, i32 1
    %memacc_result58_i575 = load i32, i32* %memacc_result57_i574
    sub59_i576 = sub i32 %Id_GEP_Load55_i572, %memacc_result58_i575
    %ClassAddr_turnto_reg_60_i577=%point.sqrDis_ip0_553
    %Id_GEP_61_i578 = getelementptr point, point* %ClassAddr_turnto_reg_60_i577, i32 0, i32 1
    %Id_GEP_Load62_i579 = load i32, i32* %Id_GEP_61_i578
    %Id_load63_i580 = load point*, point** %point.sqrDis_ip1_554
    %memacc_result64_i581 = getelementptr point, point* %Id_load63_i580, i32 0, i32 1
    %memacc_result65_i582 = load i32, i32* %memacc_result64_i581
    sub66_i583 = sub i32 %Id_GEP_Load62_i579, %memacc_result65_i582
    mul67_i584 = mul i32 %sub59_i576, %sub66_i583
    add68_i585 = add i32 %mul52_i569, %mul67_i584
    %ClassAddr_turnto_reg_69_i586=%point.sqrDis_ip0_553
    %Id_GEP_70_i587 = getelementptr point, point* %ClassAddr_turnto_reg_69_i586, i32 0, i32 2
    %Id_GEP_Load71_i588 = load i32, i32* %Id_GEP_70_i587
    %Id_load72_i589 = load point*, point** %point.sqrDis_ip1_554
    %memacc_result73_i590 = getelementptr point, point* %Id_load72_i589, i32 0, i32 2
    %memacc_result74_i591 = load i32, i32* %memacc_result73_i590
    sub75_i592 = sub i32 %Id_GEP_Load71_i588, %memacc_result74_i591
    %ClassAddr_turnto_reg_76_i593=%point.sqrDis_ip0_553
    %Id_GEP_77_i594 = getelementptr point, point* %ClassAddr_turnto_reg_76_i593, i32 0, i32 2
    %Id_GEP_Load78_i595 = load i32, i32* %Id_GEP_77_i594
    %Id_load79_i596 = load point*, point** %point.sqrDis_ip1_554
    %memacc_result80_i597 = getelementptr point, point* %Id_load79_i596, i32 0, i32 2
    %memacc_result81_i598 = load i32, i32* %memacc_result80_i597
    sub82_i599 = sub i32 %Id_GEP_Load78_i595, %memacc_result81_i598
    mul83_i600 = mul i32 %sub75_i592, %sub82_i599
    add84_i601 = add i32 %add68_i585, %mul83_i600
    %point.sqrDisreturn_value37_i602=%add84_i601
    br label %point.sqrDis_return_block_i79

point.sqrDis_return_block_i79; preds = %point.sqrDis_entrance_block_i78
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77_AB_80

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77_AB_80; preds = %point.sqrDis_return_block_i79
    %funccal330=%point.sqrDisreturn_value37_i602
    %funccal331 = call i8* @toString(i32 %funccal330)
    %funccal332 = call void @println(i8* %funccal331)
    br label %point.sqrDis_entrance_block_i81

point.sqrDis_entrance_block_i81; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77_AB_80
    %point.sqrDis_ip0_603=%Malloc_Cast_Result_270
    %point.sqrDis_ip1_604=%Malloc_Cast_Result_261
    %ClassAddr_turnto_reg_38_i605=%point.sqrDis_ip0_603
    %Id_GEP_39_i606 = getelementptr point, point* %ClassAddr_turnto_reg_38_i605, i32 0, i32 0
    %Id_GEP_Load40_i607 = load i32, i32* %Id_GEP_39_i606
    %Id_load41_i608 = load point*, point** %point.sqrDis_ip1_604
    %memacc_result42_i609 = getelementptr point, point* %Id_load41_i608, i32 0, i32 0
    %memacc_result43_i610 = load i32, i32* %memacc_result42_i609
    sub44_i611 = sub i32 %Id_GEP_Load40_i607, %memacc_result43_i610
    %ClassAddr_turnto_reg_45_i612=%point.sqrDis_ip0_603
    %Id_GEP_46_i613 = getelementptr point, point* %ClassAddr_turnto_reg_45_i612, i32 0, i32 0
    %Id_GEP_Load47_i614 = load i32, i32* %Id_GEP_46_i613
    %Id_load48_i615 = load point*, point** %point.sqrDis_ip1_604
    %memacc_result49_i616 = getelementptr point, point* %Id_load48_i615, i32 0, i32 0
    %memacc_result50_i617 = load i32, i32* %memacc_result49_i616
    sub51_i618 = sub i32 %Id_GEP_Load47_i614, %memacc_result50_i617
    mul52_i619 = mul i32 %sub44_i611, %sub51_i618
    %ClassAddr_turnto_reg_53_i620=%point.sqrDis_ip0_603
    %Id_GEP_54_i621 = getelementptr point, point* %ClassAddr_turnto_reg_53_i620, i32 0, i32 1
    %Id_GEP_Load55_i622 = load i32, i32* %Id_GEP_54_i621
    %Id_load56_i623 = load point*, point** %point.sqrDis_ip1_604
    %memacc_result57_i624 = getelementptr point, point* %Id_load56_i623, i32 0, i32 1
    %memacc_result58_i625 = load i32, i32* %memacc_result57_i624
    sub59_i626 = sub i32 %Id_GEP_Load55_i622, %memacc_result58_i625
    %ClassAddr_turnto_reg_60_i627=%point.sqrDis_ip0_603
    %Id_GEP_61_i628 = getelementptr point, point* %ClassAddr_turnto_reg_60_i627, i32 0, i32 1
    %Id_GEP_Load62_i629 = load i32, i32* %Id_GEP_61_i628
    %Id_load63_i630 = load point*, point** %point.sqrDis_ip1_604
    %memacc_result64_i631 = getelementptr point, point* %Id_load63_i630, i32 0, i32 1
    %memacc_result65_i632 = load i32, i32* %memacc_result64_i631
    sub66_i633 = sub i32 %Id_GEP_Load62_i629, %memacc_result65_i632
    mul67_i634 = mul i32 %sub59_i626, %sub66_i633
    add68_i635 = add i32 %mul52_i619, %mul67_i634
    %ClassAddr_turnto_reg_69_i636=%point.sqrDis_ip0_603
    %Id_GEP_70_i637 = getelementptr point, point* %ClassAddr_turnto_reg_69_i636, i32 0, i32 2
    %Id_GEP_Load71_i638 = load i32, i32* %Id_GEP_70_i637
    %Id_load72_i639 = load point*, point** %point.sqrDis_ip1_604
    %memacc_result73_i640 = getelementptr point, point* %Id_load72_i639, i32 0, i32 2
    %memacc_result74_i641 = load i32, i32* %memacc_result73_i640
    sub75_i642 = sub i32 %Id_GEP_Load71_i638, %memacc_result74_i641
    %ClassAddr_turnto_reg_76_i643=%point.sqrDis_ip0_603
    %Id_GEP_77_i644 = getelementptr point, point* %ClassAddr_turnto_reg_76_i643, i32 0, i32 2
    %Id_GEP_Load78_i645 = load i32, i32* %Id_GEP_77_i644
    %Id_load79_i646 = load point*, point** %point.sqrDis_ip1_604
    %memacc_result80_i647 = getelementptr point, point* %Id_load79_i646, i32 0, i32 2
    %memacc_result81_i648 = load i32, i32* %memacc_result80_i647
    sub82_i649 = sub i32 %Id_GEP_Load78_i645, %memacc_result81_i648
    mul83_i650 = mul i32 %sub75_i642, %sub82_i649
    add84_i651 = add i32 %add68_i635, %mul83_i650
    %point.sqrDisreturn_value37_i652=%add84_i651
    br label %point.sqrDis_return_block_i82

point.sqrDis_return_block_i82; preds = %point.sqrDis_entrance_block_i81
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77_AB_80_AB_83

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77_AB_80_AB_83; preds = %point.sqrDis_return_block_i82
    %funccal335=%point.sqrDisreturn_value37_i652
    %funccal336 = call i8* @toString(i32 %funccal335)
    %funccal337 = call void @println(i8* %funccal336)
    br label %point.dot_entrance_block_i84

point.dot_entrance_block_i84; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77_AB_80_AB_83
    %point.dot_ip0_653=%Malloc_Cast_Result_267
    %point.dot_ip1_654=%Malloc_Cast_Result_261
    %ClassAddr_turnto_reg_86_i655=%point.dot_ip0_653
    %Id_GEP_87_i656 = getelementptr point, point* %ClassAddr_turnto_reg_86_i655, i32 0, i32 0
    %Id_GEP_Load88_i657 = load i32, i32* %Id_GEP_87_i656
    %Id_load89_i658 = load point*, point** %point.dot_ip1_654
    %memacc_result90_i659 = getelementptr point, point* %Id_load89_i658, i32 0, i32 0
    %memacc_result91_i660 = load i32, i32* %memacc_result90_i659
    mul92_i661 = mul i32 %Id_GEP_Load88_i657, %memacc_result91_i660
    %ClassAddr_turnto_reg_93_i662=%point.dot_ip0_653
    %Id_GEP_94_i663 = getelementptr point, point* %ClassAddr_turnto_reg_93_i662, i32 0, i32 1
    %Id_GEP_Load95_i664 = load i32, i32* %Id_GEP_94_i663
    %Id_load96_i665 = load point*, point** %point.dot_ip1_654
    %memacc_result97_i666 = getelementptr point, point* %Id_load96_i665, i32 0, i32 1
    %memacc_result98_i667 = load i32, i32* %memacc_result97_i666
    mul99_i668 = mul i32 %Id_GEP_Load95_i664, %memacc_result98_i667
    add100_i669 = add i32 %mul92_i661, %mul99_i668
    %ClassAddr_turnto_reg_101_i670=%point.dot_ip0_653
    %Id_GEP_102_i671 = getelementptr point, point* %ClassAddr_turnto_reg_101_i670, i32 0, i32 2
    %Id_GEP_Load103_i672 = load i32, i32* %Id_GEP_102_i671
    %Id_load104_i673 = load point*, point** %point.dot_ip1_654
    %memacc_result105_i674 = getelementptr point, point* %Id_load104_i673, i32 0, i32 2
    %memacc_result106_i675 = load i32, i32* %memacc_result105_i674
    mul107_i676 = mul i32 %Id_GEP_Load103_i672, %memacc_result106_i675
    add108_i677 = add i32 %add100_i669, %mul107_i676
    %point.dotreturn_value85_i678=%add108_i677
    br label %point.dot_return_block_i85

point.dot_return_block_i85; preds = %point.dot_entrance_block_i84
    br label %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77_AB_80_AB_83_AB_86

main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77_AB_80_AB_83_AB_86; preds = %point.dot_return_block_i85
    %funccal340=%point.dotreturn_value85_i678
    %funccal341 = call i8* @toString(i32 %funccal340)
    %funccal342 = call void @println(i8* %funccal341)
    %funccal345 = call point* @point.cross(point* %Malloc_Cast_Result_264, point* %Malloc_Cast_Result_270)
    %funccal346 = call void @point.printPoint(point* %funccal345)
    %funccal348 = call void @point.printPoint(point* %Malloc_Cast_Result_261)
    %funccal350 = call void @point.printPoint(point* %Malloc_Cast_Result_264)
    %funccal352 = call void @point.printPoint(point* %Malloc_Cast_Result_267)
    %funccal354 = call void @point.printPoint(point* %Malloc_Cast_Result_270)
    %mainreturn_value258=0
    br label %main_return_block

main_return_block; preds = %main_entrance_block_AB_8_AB_11_AB_14_AB_17_AB_20_AB_23_AB_26_AB_29_AB_32_AB_35_AB_38_AB_41_AB_44_AB_47_AB_50_AB_53_AB_56_AB_59_AB_62_AB_65_AB_68_AB_71_AB_74_AB_77_AB_80_AB_83_AB_86
    ret i32 %mainreturn_value258

}

