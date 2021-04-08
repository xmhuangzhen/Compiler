
@INF
@n
@m
@a
@const_string_no0
@const_string_no1
@const_string_no2

define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter :  @init()
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    null
    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : void
Parameter :  @init(){
init_entrance_block    %funccal2 = call i32 @getInt()
    null
    %funccal4 = call i32 @getInt()
    null
    %n6 = load i32, i32 @n
    %n7 = load i32, i32 @n
    call_size_18 = mul i32 %n6, 4
    call_size_29 = add i32 %call_size_18, 4
    %call_malloc_func10 = call i8* @malloc(i32 %call_size_29)
    store i32 %n6, i32* %call_malloc_func10
    %call_array_head11 = getelementptr i32, i32* %call_malloc_func10, i32 1
    call_array_head_cast_12 = bitcast i32* %call_array_head11 to i32**
    %Subarray_Cur_Reg13 = getelementptr i32, i32* %call_malloc_func10, i32 1
    %SubArray_end_reg14 = getelementptr i32*, i32** %call_array_head_cast_12, i32 %n6
    br label %cond_block0

cond_block0                                        ; preds = %init_entrance_block
    %Subarray_Cond_15 = icmp slt i32** %Subarray_Cur_Reg13, %SubArray_end_reg14
    br i1 %Subarray_Cond_15, label %body_block1, label %dest_block2

body_block1                                        ; preds = %cond_block0
    call_size_116 = mul i32 %n7, 4
    call_size_217 = add i32 %call_size_116, 4
    %call_malloc_func18 = call i8* @malloc(i32 %call_size_217)
    store i32 %n7, i32* %call_malloc_func18
    %call_array_head19 = getelementptr i32, i32* %call_malloc_func18, i32 1
    call_array_head_cast_20 = bitcast i32* %call_array_head19 to i32*
    store i32* %call_array_head_cast_20, i32** %Subarray_Cur_Reg13
    %Incr_reg21 = getelementptr i32*, i32** %Subarray_Cur_Reg13, i32 1
    %Subarray_Cur_Reg13=%Incr_reg21
    br label %cond_block0

dest_block2                                        ; preds = %body_block1
    store i32* %call_array_head_cast_12, i32** @a
    %i0=0
    br label %for_cond_block3

for_cond_block3                                    ; preds = %dest_block2
    %n26 = load i32, i32 @n
    %slt27 = icmp slt i32 %i0, %n26
    br i1 %slt27, label %for_cond_block3Prime0, label %for_cond_block3Prime3

for_cond_block3Prime3                              ; preds = %for_cond_block3
    %i2=%i0
    br label %for_dest_block6

for_cond_block3Prime0                              ; preds = %for_cond_block3Prime3
    %i1=%i0
    br label %for_body_block5

for_body_block5                                    ; preds = %for_cond_block3Prime0
    %j17=0
    %i3=%i1
    br label %for_cond_block7

for_cond_block7                                    ; preds = %for_body_block5
    %n30 = load i32, i32 @n
    %slt31 = icmp slt i32 %j17, %n30
    br i1 %slt31, label %for_cond_block7Prime1, label %for_cond_block7Prime2

for_cond_block7Prime2                              ; preds = %for_cond_block7
    %j19=%j17
    %i5=%i3
    br label %for_dest_block10

for_cond_block7Prime1                              ; preds = %for_cond_block7Prime2
    %j18=%j17
    %i4=%i3
    br label %for_body_block9

for_body_block9                                    ; preds = %for_cond_block7Prime1
    %a32 = load i32**, i32** @a
    %getElementPtr34 = getelementptr i32*, i32** %a32, i32 %i4
    %GEP_Load35 = load i32*, i32** %getElementPtr34
    %getElementPtr37 = getelementptr i32, i32* %GEP_Load35, i32 %j18
    %INF39 = load i32, i32 @INF
    store i32 %INF39, i32* %getElementPtr37
    %j20=%j18
    %i6=%i4
    br label %for_step_block8

for_step_block8                                    ; preds = %for_body_block9
    PreAdd41 = add i32 %j20, 1
    %j17=%PreAdd41
    %i3=%i6
    br label %for_cond_block7

for_dest_block10                                   ; preds = %for_step_block8
    %j21=%j19
    %i7=%i5
    br label %for_step_block4

for_step_block4                                    ; preds = %for_dest_block10
    PreAdd43 = add i32 %i7, 1
    %i0=%PreAdd43
    br label %for_cond_block3

for_dest_block6                                    ; preds = %for_step_block4
    %i8=0
    br label %for_cond_block11

for_cond_block11                                   ; preds = %for_dest_block6
    %n46 = load i32, i32 @n
    %slt47 = icmp slt i32 %i8, %n46
    br i1 %slt47, label %for_cond_block11Prime4, label %for_cond_block11Prime5

for_cond_block11Prime5                             ; preds = %for_cond_block11
    %i10=%i8
    br label %for_dest_block14

for_cond_block11Prime4                             ; preds = %for_cond_block11Prime5
    %i9=%i8
    br label %for_body_block13

for_body_block13                                   ; preds = %for_cond_block11Prime4
    %a48 = load i32**, i32** @a
    %getElementPtr50 = getelementptr i32*, i32** %a48, i32 %i9
    %GEP_Load51 = load i32*, i32** %getElementPtr50
    %getElementPtr53 = getelementptr i32, i32* %GEP_Load51, i32 %i9
    store i32 0, i32* %getElementPtr53
    %i11=%i9
    br label %for_step_block12

for_step_block12                                   ; preds = %for_body_block13
    PreAdd56 = add i32 %i11, 1
    %i8=%PreAdd56
    br label %for_cond_block11

for_dest_block14                                   ; preds = %for_step_block12
    %i12=0
    br label %for_cond_block15

for_cond_block15                                   ; preds = %for_dest_block14
    %m59 = load i32, i32 @m
    %slt60 = icmp slt i32 %i12, %m59
    br i1 %slt60, label %for_cond_block15Prime6, label %for_cond_block15Prime7

for_cond_block15Prime7                             ; preds = %for_cond_block15
    %i14=%i12
    br label %for_dest_block18

for_cond_block15Prime6                             ; preds = %for_cond_block15Prime7
    %i13=%i12
    br label %for_body_block17

for_body_block17                                   ; preds = %for_cond_block15Prime6
    %funccal62 = call i32 @getInt()
    %funccal64 = call i32 @getInt()
    %funccal66 = call i32 @getInt()
    %a67 = load i32**, i32** @a
    %getElementPtr69 = getelementptr i32*, i32** %a67, ReturnType : i32
Parameter :  %funccal62
    %GEP_Load70 = load i32*, i32** %getElementPtr69
    %getElementPtr72 = getelementptr i32, i32* %GEP_Load70, ReturnType : i32
Parameter :  %funccal64
    store i32 %funccal66, i32* %getElementPtr72
    %w24=%funccal66
    %v23=%funccal64
    %u22=%funccal62
    %i15=%i13
    br label %for_step_block16

for_step_block16                                   ; preds = %for_body_block17
    PreAdd76 = add i32 %i15, 1
    %i12=%PreAdd76
    br label %for_cond_block15

for_dest_block18                                   ; preds = %for_step_block16
    %i16=%i14
    br label %init_return_block

init_return_block                                  ; preds = %for_dest_block18
    ret void

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init78 = call void @__init__()
    %funccal79 = call void @init()
    %k63=0
    br label %for_cond_block19

for_cond_block19                                   ; preds = %main_entrance_block
    %n85 = load i32, i32 @n
    %slt86 = icmp slt i32 %k63, %n85
    br i1 %slt86, label %for_cond_block19Prime8, label %for_cond_block19Prime15

for_cond_block19Prime15                            ; preds = %for_cond_block19
    %k65=%k63
    br label %for_dest_block22

for_cond_block19Prime8                             ; preds = %for_cond_block19Prime15
    %k64=%k63
    br label %for_body_block21

for_body_block21                                   ; preds = %for_cond_block19Prime8
    %k66=%k64
    %i25=0
    br label %for_cond_block23

for_cond_block23                                   ; preds = %for_body_block21
    %n89 = load i32, i32 @n
    %slt90 = icmp slt i32 %i25, %n89
    br i1 %slt90, label %for_cond_block23Prime9, label %for_cond_block23Prime14

for_cond_block23Prime14                            ; preds = %for_cond_block23
    %k68=%k66
    %i27=%i25
    br label %for_dest_block26

for_cond_block23Prime9                             ; preds = %for_cond_block23Prime14
    %k67=%k66
    %i26=%i25
    br label %for_body_block25

for_body_block25                                   ; preds = %for_cond_block23Prime9
    %k69=%k67
    %j48=0
    %i28=%i26
    br label %for_cond_block27

for_cond_block27                                   ; preds = %for_body_block25
    %n93 = load i32, i32 @n
    %slt94 = icmp slt i32 %j48, %n93
    br i1 %slt94, label %for_cond_block27Prime10, label %for_cond_block27Prime13

for_cond_block27Prime13                            ; preds = %for_cond_block27
    %k71=%k69
    %j50=%j48
    %i30=%i28
    br label %for_dest_block30

for_cond_block27Prime10                            ; preds = %for_cond_block27Prime13
    %k70=%k69
    %j49=%j48
    %i29=%i28
    br label %for_body_block29

for_body_block29                                   ; preds = %for_cond_block27Prime10
    %a95 = load i32**, i32** @a
    %getElementPtr97 = getelementptr i32*, i32** %a95, i32 %i29
    %GEP_Load98 = load i32*, i32** %getElementPtr97
    %getElementPtr100 = getelementptr i32, i32* %GEP_Load98, i32 %j49
    %GEP_Load101 = load i32, i32* %getElementPtr100
    %a102 = load i32**, i32** @a
    %getElementPtr104 = getelementptr i32*, i32** %a102, i32 %i29
    %GEP_Load105 = load i32*, i32** %getElementPtr104
    %getElementPtr107 = getelementptr i32, i32* %GEP_Load105, i32 %k70
    %GEP_Load108 = load i32, i32* %getElementPtr107
    %a109 = load i32**, i32** @a
    %getElementPtr111 = getelementptr i32*, i32** %a109, i32 %k70
    %GEP_Load112 = load i32*, i32** %getElementPtr111
    %getElementPtr114 = getelementptr i32, i32* %GEP_Load112, i32 %j49
    %GEP_Load115 = load i32, i32* %getElementPtr114
    add116 = add i32 %GEP_Load108, %GEP_Load115
    %sgt117 = icmp sgt i32 %GEP_Load101, %add116
    br i1 %sgt117, label %for_body_block29Prime11, label %for_body_block29Prime12

for_body_block29Prime12                            ; preds = %for_body_block29
    %k73=%k70
    %j52=%j49
    %i32=%i29
    br label %if_dest_block32

for_body_block29Prime11                            ; preds = %for_body_block29Prime12
    %k72=%k70
    %j51=%j49
    %i31=%i29
    br label %if_then_block31

if_then_block31                                    ; preds = %for_body_block29Prime11
    %a118 = load i32**, i32** @a
    %getElementPtr120 = getelementptr i32*, i32** %a118, i32 %i31
    %GEP_Load121 = load i32*, i32** %getElementPtr120
    %getElementPtr123 = getelementptr i32, i32* %GEP_Load121, i32 %j51
    %a125 = load i32**, i32** @a
    %getElementPtr127 = getelementptr i32*, i32** %a125, i32 %i31
    %GEP_Load128 = load i32*, i32** %getElementPtr127
    %getElementPtr130 = getelementptr i32, i32* %GEP_Load128, i32 %k72
    %GEP_Load131 = load i32, i32* %getElementPtr130
    %a132 = load i32**, i32** @a
    %getElementPtr134 = getelementptr i32*, i32** %a132, i32 %k72
    %GEP_Load135 = load i32*, i32** %getElementPtr134
    %getElementPtr137 = getelementptr i32, i32* %GEP_Load135, i32 %j51
    %GEP_Load138 = load i32, i32* %getElementPtr137
    add139 = add i32 %GEP_Load131, %GEP_Load138
    store i32 %add139, i32* %getElementPtr123
    %k73=%k72
    %j52=%j51
    %i32=%i31
    br label %if_dest_block32

if_dest_block32                                    ; preds = %if_then_block31
    %k74=%k73
    %j53=%j52
    %i33=%i32
    br label %for_step_block28

for_step_block28                                   ; preds = %if_dest_block32
    PreAdd141 = add i32 %j53, 1
    %k69=%k74
    %j48=%PreAdd141
    %i28=%i33
    br label %for_cond_block27

for_dest_block30                                   ; preds = %for_step_block28
    %k75=%k71
    %j54=%j50
    %i34=%i30
    br label %for_step_block24

for_step_block24                                   ; preds = %for_dest_block30
    PreAdd143 = add i32 %i34, 1
    %k66=%k75
    %i25=%PreAdd143
    br label %for_cond_block23

for_dest_block26                                   ; preds = %for_step_block24
    %k76=%k68
    %i35=%i27
    br label %for_step_block20

for_step_block20                                   ; preds = %for_dest_block26
    PreAdd145 = add i32 %k76, 1
    %k63=%PreAdd145
    br label %for_cond_block19

for_dest_block22                                   ; preds = %for_step_block20
    %k77=%k65
    %i36=0
    br label %for_cond_block33

for_cond_block33                                   ; preds = %for_dest_block22
    %n148 = load i32, i32 @n
    %slt149 = icmp slt i32 %i36, %n148
    br i1 %slt149, label %for_cond_block33Prime16, label %for_cond_block33Prime21

for_cond_block33Prime21                            ; preds = %for_cond_block33
    %k79=%k77
    %i38=%i36
    br label %for_dest_block36

for_cond_block33Prime16                            ; preds = %for_cond_block33Prime21
    %k78=%k77
    %i37=%i36
    br label %for_body_block35

for_body_block35                                   ; preds = %for_cond_block33Prime16
    %k80=%k78
    %j55=0
    %i39=%i37
    br label %for_cond_block37

for_cond_block37                                   ; preds = %for_body_block35
    %n152 = load i32, i32 @n
    %slt153 = icmp slt i32 %j55, %n152
    br i1 %slt153, label %for_cond_block37Prime17, label %for_cond_block37Prime20

for_cond_block37Prime20                            ; preds = %for_cond_block37
    %k82=%k80
    %j57=%j55
    %i41=%i39
    br label %for_dest_block40

for_cond_block37Prime17                            ; preds = %for_cond_block37Prime20
    %k81=%k80
    %j56=%j55
    %i40=%i39
    br label %for_body_block39

for_body_block39                                   ; preds = %for_cond_block37Prime17
    %a154 = load i32**, i32** @a
    %getElementPtr156 = getelementptr i32*, i32** %a154, i32 %i40
    %GEP_Load157 = load i32*, i32** %getElementPtr156
    %getElementPtr159 = getelementptr i32, i32* %GEP_Load157, i32 %j56
    %GEP_Load160 = load i32, i32* %getElementPtr159
    %INF161 = load i32, i32 @INF
    %eq162 = icmp eq i32 %GEP_Load160, %INF161
    br i1 %eq162, label %for_body_block39Prime18, label %for_body_block39Prime19

for_body_block39Prime19                            ; preds = %for_body_block39
    %k84=%k81
    %j59=%j56
    %i43=%i40
    br label %if_else_block42

for_body_block39Prime18                            ; preds = %for_body_block39Prime19
    %k83=%k81
    %j58=%j56
    %i42=%i40
    br label %if_then_block41

if_then_block41                                    ; preds = %for_body_block39Prime18
    %StringConst163 = getelementptr [2 x i8], [2 x i8]* @const_string_no0, i32 0, i32 0
    %funccal164 = call void @print(i8* %StringConst163)
    %k85=%k83
    %j60=%j58
    %i44=%i42
    br label %if_dest_block43

if_else_block42                                    ; preds = %if_then_block41
    %a165 = load i32**, i32** @a
    %getElementPtr167 = getelementptr i32*, i32** %a165, i32 %i43
    %GEP_Load168 = load i32*, i32** %getElementPtr167
    %getElementPtr170 = getelementptr i32, i32* %GEP_Load168, i32 %j59
    %GEP_Load171 = load i32, i32* %getElementPtr170
    %funccal172 = call i8* @toString(i32 %GEP_Load171)
    %funccal173 = call void @print(ReturnType : i8*
Parameter : i32  %funccal172)
    %k85=%k84
    %j60=%j59
    %i44=%i43
    br label %if_dest_block43

if_dest_block43                                    ; preds = %if_else_block42
    %StringConst174 = getelementptr [1 x i8], [1 x i8]* @const_string_no1, i32 0, i32 0
    %funccal175 = call void @print(i8* %StringConst174)
    %k86=%k85
    %j61=%j60
    %i45=%i44
    br label %for_step_block38

for_step_block38                                   ; preds = %if_dest_block43
    PreAdd177 = add i32 %j61, 1
    %k80=%k86
    %j55=%PreAdd177
    %i39=%i45
    br label %for_cond_block37

for_dest_block40                                   ; preds = %for_step_block38
    %StringConst178 = getelementptr [0 x i8], [0 x i8]* @const_string_no2, i32 0, i32 0
    %funccal179 = call void @println(i8* %StringConst178)
    %k87=%k82
    %j62=%j57
    %i46=%i41
    br label %for_step_block34

for_step_block34                                   ; preds = %for_dest_block40
    PreAdd181 = add i32 %i46, 1
    %k77=%k87
    %i36=%PreAdd181
    br label %for_cond_block33

for_dest_block36                                   ; preds = %for_step_block34
    %mainreturn_value77=0
    %k88=%k79
    %i47=%i38
    br label %main_return_block

main_return_block                                  ; preds = %for_dest_block36
    ret i32 %mainreturn_value77

}

