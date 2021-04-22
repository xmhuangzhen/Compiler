
@N
@h
@i
@j
@k
@total

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    store pointer is not pointertypei32
    %funccal8 = call i32 @getInt()
    store pointer is not pointertypei32
    br label %for_cond_block0

for_cond_block0; preds = %__init___entrance_block_i0
    %a|addr10 = phi i32[ 1, %__init___entrance_block_i0], [ %SelfAdd209, %for_dest_block7]
    %N11 = load i32, i32 @N
    %sle12 = icmp sle i32 %a|addr10, %N11
    br i1 %sle12, label %for_body_block2, label %for_dest_block3

for_body_block2; preds = %for_cond_block0
    br label %for_cond_block4

for_cond_block4; preds = %for_body_block2
    %b|addr21 = phi i32[ 1, %for_body_block2], [ %SelfAdd207, %for_dest_block11]
    %N15 = load i32, i32 @N
    %sle16 = icmp sle i32 %b|addr21, %N15
    br i1 %sle16, label %for_body_block6, label %for_dest_block7

for_body_block6; preds = %for_cond_block4
    br label %for_cond_block8

for_cond_block8; preds = %for_body_block6
    %c|addr33 = phi i32[ 1, %for_body_block6], [ %SelfAdd205, %for_dest_block15]
    %N19 = load i32, i32 @N
    %sle20 = icmp sle i32 %c|addr33, %N19
    br i1 %sle20, label %for_body_block10, label %for_dest_block11

for_body_block10; preds = %for_cond_block8
    br label %for_cond_block12

for_cond_block12; preds = %for_body_block10
    %d|addr47 = phi i32[ 1, %for_body_block10], [ %SelfAdd203, %for_dest_block19]
    %N23 = load i32, i32 @N
    %sle24 = icmp sle i32 %d|addr47, %N23
    br i1 %sle24, label %for_body_block14, label %for_dest_block15

for_body_block14; preds = %for_cond_block12
    br label %for_cond_block16

for_cond_block16; preds = %for_body_block14
    %e|addr511 = phi i32[ 1, %for_body_block14], [ %SelfAdd201, %for_dest_block23]
    %N27 = load i32, i32 @N
    %sle28 = icmp sle i32 %e|addr511, %N27
    br i1 %sle28, label %for_body_block18, label %for_dest_block19

for_body_block18; preds = %for_cond_block16
    br label %for_cond_block20

for_cond_block20; preds = %for_body_block18
    %f|addr616 = phi i32[ 1, %for_body_block18], [ %SelfAdd199, %if_dest_block25]
    %N31 = load i32, i32 @N
    %sle32 = icmp sle i32 %f|addr616, %N31
    br i1 %sle32, label %for_body_block22, label %for_dest_block23

for_body_block22; preds = %for_cond_block20
    %ne35 = icmp ne i32 %a|addr10, %b|addr21
    br i1 %ne35, label %andand_b_block104, label %andand_dest_block105

andand_b_block104; preds = %for_body_block22
    %ne38 = icmp ne i32 %a|addr10, %c|addr33
    br label %andand_dest_block105

andand_dest_block105; preds = %andand_b_block104
    %Andand_39 = phi i1[ false, %for_body_block22], [ %ne38, %andand_b_block104]
    br i1 %Andand_39, label %andand_b_block102, label %andand_dest_block103

andand_b_block102; preds = %andand_dest_block105
    %ne42 = icmp ne i32 %a|addr10, %d|addr47
    br label %andand_dest_block103

andand_dest_block103; preds = %andand_b_block102
    %Andand_43 = phi i1[ false, %andand_dest_block105], [ %ne42, %andand_b_block102]
    br i1 %Andand_43, label %andand_b_block100, label %andand_dest_block101

andand_b_block100; preds = %andand_dest_block103
    %ne46 = icmp ne i32 %a|addr10, %e|addr511
    br label %andand_dest_block101

andand_dest_block101; preds = %andand_b_block100
    %Andand_47 = phi i1[ false, %andand_dest_block103], [ %ne46, %andand_b_block100]
    br i1 %Andand_47, label %andand_b_block98, label %andand_dest_block99

andand_b_block98; preds = %andand_dest_block101
    %ne50 = icmp ne i32 %a|addr10, %f|addr616
    br label %andand_dest_block99

andand_dest_block99; preds = %andand_b_block98
    %Andand_51 = phi i1[ false, %andand_dest_block101], [ %ne50, %andand_b_block98]
    br i1 %Andand_51, label %andand_b_block96, label %andand_dest_block97

andand_b_block96; preds = %andand_dest_block99
    %h53 = load i32, i32 @h
    %ne54 = icmp ne i32 %a|addr10, %h53
    br label %andand_dest_block97

andand_dest_block97; preds = %andand_b_block96
    %Andand_55 = phi i1[ false, %andand_dest_block99], [ %ne54, %andand_b_block96]
    br i1 %Andand_55, label %andand_b_block94, label %andand_dest_block95

andand_b_block94; preds = %andand_dest_block97
    %i57 = load i32, i32 @i
    %ne58 = icmp ne i32 %a|addr10, %i57
    br label %andand_dest_block95

andand_dest_block95; preds = %andand_b_block94
    %Andand_59 = phi i1[ false, %andand_dest_block97], [ %ne58, %andand_b_block94]
    br i1 %Andand_59, label %andand_b_block92, label %andand_dest_block93

andand_b_block92; preds = %andand_dest_block95
    %j61 = load i32, i32 @j
    %ne62 = icmp ne i32 %a|addr10, %j61
    br label %andand_dest_block93

andand_dest_block93; preds = %andand_b_block92
    %Andand_63 = phi i1[ false, %andand_dest_block95], [ %ne62, %andand_b_block92]
    br i1 %Andand_63, label %andand_b_block90, label %andand_dest_block91

andand_b_block90; preds = %andand_dest_block93
    %k65 = load i32, i32 @k
    %ne66 = icmp ne i32 %a|addr10, %k65
    br label %andand_dest_block91

andand_dest_block91; preds = %andand_b_block90
    %Andand_67 = phi i1[ false, %andand_dest_block93], [ %ne66, %andand_b_block90]
    br i1 %Andand_67, label %andand_b_block88, label %andand_dest_block89

andand_b_block88; preds = %andand_dest_block91
    %ne70 = icmp ne i32 %b|addr21, %c|addr33
    br label %andand_dest_block89

andand_dest_block89; preds = %andand_b_block88
    %Andand_71 = phi i1[ false, %andand_dest_block91], [ %ne70, %andand_b_block88]
    br i1 %Andand_71, label %andand_b_block86, label %andand_dest_block87

andand_b_block86; preds = %andand_dest_block89
    %ne74 = icmp ne i32 %b|addr21, %d|addr47
    br label %andand_dest_block87

andand_dest_block87; preds = %andand_b_block86
    %Andand_75 = phi i1[ false, %andand_dest_block89], [ %ne74, %andand_b_block86]
    br i1 %Andand_75, label %andand_b_block84, label %andand_dest_block85

andand_b_block84; preds = %andand_dest_block87
    %ne78 = icmp ne i32 %b|addr21, %e|addr511
    br label %andand_dest_block85

andand_dest_block85; preds = %andand_b_block84
    %Andand_79 = phi i1[ false, %andand_dest_block87], [ %ne78, %andand_b_block84]
    br i1 %Andand_79, label %andand_b_block82, label %andand_dest_block83

andand_b_block82; preds = %andand_dest_block85
    %ne82 = icmp ne i32 %b|addr21, %f|addr616
    br label %andand_dest_block83

andand_dest_block83; preds = %andand_b_block82
    %Andand_83 = phi i1[ false, %andand_dest_block85], [ %ne82, %andand_b_block82]
    br i1 %Andand_83, label %andand_b_block80, label %andand_dest_block81

andand_b_block80; preds = %andand_dest_block83
    %h85 = load i32, i32 @h
    %ne86 = icmp ne i32 %b|addr21, %h85
    br label %andand_dest_block81

andand_dest_block81; preds = %andand_b_block80
    %Andand_87 = phi i1[ false, %andand_dest_block83], [ %ne86, %andand_b_block80]
    br i1 %Andand_87, label %andand_b_block78, label %andand_dest_block79

andand_b_block78; preds = %andand_dest_block81
    %i89 = load i32, i32 @i
    %ne90 = icmp ne i32 %b|addr21, %i89
    br label %andand_dest_block79

andand_dest_block79; preds = %andand_b_block78
    %Andand_91 = phi i1[ false, %andand_dest_block81], [ %ne90, %andand_b_block78]
    br i1 %Andand_91, label %andand_b_block76, label %andand_dest_block77

andand_b_block76; preds = %andand_dest_block79
    %j93 = load i32, i32 @j
    %ne94 = icmp ne i32 %b|addr21, %j93
    br label %andand_dest_block77

andand_dest_block77; preds = %andand_b_block76
    %Andand_95 = phi i1[ false, %andand_dest_block79], [ %ne94, %andand_b_block76]
    br i1 %Andand_95, label %andand_b_block74, label %andand_dest_block75

andand_b_block74; preds = %andand_dest_block77
    %k97 = load i32, i32 @k
    %ne98 = icmp ne i32 %b|addr21, %k97
    br label %andand_dest_block75

andand_dest_block75; preds = %andand_b_block74
    %Andand_99 = phi i1[ false, %andand_dest_block77], [ %ne98, %andand_b_block74]
    br i1 %Andand_99, label %andand_b_block72, label %andand_dest_block73

andand_b_block72; preds = %andand_dest_block75
    %ne102 = icmp ne i32 %c|addr33, %d|addr47
    br label %andand_dest_block73

andand_dest_block73; preds = %andand_b_block72
    %Andand_103 = phi i1[ false, %andand_dest_block75], [ %ne102, %andand_b_block72]
    br i1 %Andand_103, label %andand_b_block70, label %andand_dest_block71

andand_b_block70; preds = %andand_dest_block73
    %ne106 = icmp ne i32 %c|addr33, %e|addr511
    br label %andand_dest_block71

andand_dest_block71; preds = %andand_b_block70
    %Andand_107 = phi i1[ false, %andand_dest_block73], [ %ne106, %andand_b_block70]
    br i1 %Andand_107, label %andand_b_block68, label %andand_dest_block69

andand_b_block68; preds = %andand_dest_block71
    %ne110 = icmp ne i32 %c|addr33, %f|addr616
    br label %andand_dest_block69

andand_dest_block69; preds = %andand_b_block68
    %Andand_111 = phi i1[ false, %andand_dest_block71], [ %ne110, %andand_b_block68]
    br i1 %Andand_111, label %andand_b_block66, label %andand_dest_block67

andand_b_block66; preds = %andand_dest_block69
    %h113 = load i32, i32 @h
    %ne114 = icmp ne i32 %c|addr33, %h113
    br label %andand_dest_block67

andand_dest_block67; preds = %andand_b_block66
    %Andand_115 = phi i1[ false, %andand_dest_block69], [ %ne114, %andand_b_block66]
    br i1 %Andand_115, label %andand_b_block64, label %andand_dest_block65

andand_b_block64; preds = %andand_dest_block67
    %i117 = load i32, i32 @i
    %ne118 = icmp ne i32 %c|addr33, %i117
    br label %andand_dest_block65

andand_dest_block65; preds = %andand_b_block64
    %Andand_119 = phi i1[ false, %andand_dest_block67], [ %ne118, %andand_b_block64]
    br i1 %Andand_119, label %andand_b_block62, label %andand_dest_block63

andand_b_block62; preds = %andand_dest_block65
    %j121 = load i32, i32 @j
    %ne122 = icmp ne i32 %c|addr33, %j121
    br label %andand_dest_block63

andand_dest_block63; preds = %andand_b_block62
    %Andand_123 = phi i1[ false, %andand_dest_block65], [ %ne122, %andand_b_block62]
    br i1 %Andand_123, label %andand_b_block60, label %andand_dest_block61

andand_b_block60; preds = %andand_dest_block63
    %k125 = load i32, i32 @k
    %ne126 = icmp ne i32 %c|addr33, %k125
    br label %andand_dest_block61

andand_dest_block61; preds = %andand_b_block60
    %Andand_127 = phi i1[ false, %andand_dest_block63], [ %ne126, %andand_b_block60]
    br i1 %Andand_127, label %andand_b_block58, label %andand_dest_block59

andand_b_block58; preds = %andand_dest_block61
    %ne130 = icmp ne i32 %d|addr47, %e|addr511
    br label %andand_dest_block59

andand_dest_block59; preds = %andand_b_block58
    %Andand_131 = phi i1[ false, %andand_dest_block61], [ %ne130, %andand_b_block58]
    br i1 %Andand_131, label %andand_b_block56, label %andand_dest_block57

andand_b_block56; preds = %andand_dest_block59
    %ne134 = icmp ne i32 %d|addr47, %f|addr616
    br label %andand_dest_block57

andand_dest_block57; preds = %andand_b_block56
    %Andand_135 = phi i1[ false, %andand_dest_block59], [ %ne134, %andand_b_block56]
    br i1 %Andand_135, label %andand_b_block54, label %andand_dest_block55

andand_b_block54; preds = %andand_dest_block57
    %h137 = load i32, i32 @h
    %ne138 = icmp ne i32 %d|addr47, %h137
    br label %andand_dest_block55

andand_dest_block55; preds = %andand_b_block54
    %Andand_139 = phi i1[ false, %andand_dest_block57], [ %ne138, %andand_b_block54]
    br i1 %Andand_139, label %andand_b_block52, label %andand_dest_block53

andand_b_block52; preds = %andand_dest_block55
    %i141 = load i32, i32 @i
    %ne142 = icmp ne i32 %d|addr47, %i141
    br label %andand_dest_block53

andand_dest_block53; preds = %andand_b_block52
    %Andand_143 = phi i1[ false, %andand_dest_block55], [ %ne142, %andand_b_block52]
    br i1 %Andand_143, label %andand_b_block50, label %andand_dest_block51

andand_b_block50; preds = %andand_dest_block53
    %j145 = load i32, i32 @j
    %ne146 = icmp ne i32 %d|addr47, %j145
    br label %andand_dest_block51

andand_dest_block51; preds = %andand_b_block50
    %Andand_147 = phi i1[ false, %andand_dest_block53], [ %ne146, %andand_b_block50]
    br i1 %Andand_147, label %andand_b_block48, label %andand_dest_block49

andand_b_block48; preds = %andand_dest_block51
    %k149 = load i32, i32 @k
    %ne150 = icmp ne i32 %d|addr47, %k149
    br label %andand_dest_block49

andand_dest_block49; preds = %andand_b_block48
    %Andand_151 = phi i1[ false, %andand_dest_block51], [ %ne150, %andand_b_block48]
    br i1 %Andand_151, label %andand_b_block46, label %andand_dest_block47

andand_b_block46; preds = %andand_dest_block49
    %ne154 = icmp ne i32 %e|addr511, %f|addr616
    br label %andand_dest_block47

andand_dest_block47; preds = %andand_b_block46
    %Andand_155 = phi i1[ false, %andand_dest_block49], [ %ne154, %andand_b_block46]
    br i1 %Andand_155, label %andand_b_block44, label %andand_dest_block45

andand_b_block44; preds = %andand_dest_block47
    %h157 = load i32, i32 @h
    %ne158 = icmp ne i32 %e|addr511, %h157
    br label %andand_dest_block45

andand_dest_block45; preds = %andand_b_block44
    %Andand_159 = phi i1[ false, %andand_dest_block47], [ %ne158, %andand_b_block44]
    br i1 %Andand_159, label %andand_b_block42, label %andand_dest_block43

andand_b_block42; preds = %andand_dest_block45
    %i161 = load i32, i32 @i
    %ne162 = icmp ne i32 %e|addr511, %i161
    br label %andand_dest_block43

andand_dest_block43; preds = %andand_b_block42
    %Andand_163 = phi i1[ false, %andand_dest_block45], [ %ne162, %andand_b_block42]
    br i1 %Andand_163, label %andand_b_block40, label %andand_dest_block41

andand_b_block40; preds = %andand_dest_block43
    %j165 = load i32, i32 @j
    %ne166 = icmp ne i32 %e|addr511, %j165
    br label %andand_dest_block41

andand_dest_block41; preds = %andand_b_block40
    %Andand_167 = phi i1[ false, %andand_dest_block43], [ %ne166, %andand_b_block40]
    br i1 %Andand_167, label %andand_b_block38, label %andand_dest_block39

andand_b_block38; preds = %andand_dest_block41
    %k169 = load i32, i32 @k
    %ne170 = icmp ne i32 %e|addr511, %k169
    br label %andand_dest_block39

andand_dest_block39; preds = %andand_b_block38
    %Andand_171 = phi i1[ false, %andand_dest_block41], [ %ne170, %andand_b_block38]
    br i1 %Andand_171, label %andand_b_block36, label %andand_dest_block37

andand_b_block36; preds = %andand_dest_block39
    %h173 = load i32, i32 @h
    %ne174 = icmp ne i32 %f|addr616, %h173
    br label %andand_dest_block37

andand_dest_block37; preds = %andand_b_block36
    %Andand_175 = phi i1[ false, %andand_dest_block39], [ %ne174, %andand_b_block36]
    br i1 %Andand_175, label %andand_b_block34, label %andand_dest_block35

andand_b_block34; preds = %andand_dest_block37
    %i177 = load i32, i32 @i
    %ne178 = icmp ne i32 %f|addr616, %i177
    br label %andand_dest_block35

andand_dest_block35; preds = %andand_b_block34
    %Andand_179 = phi i1[ false, %andand_dest_block37], [ %ne178, %andand_b_block34]
    br i1 %Andand_179, label %andand_b_block32, label %andand_dest_block33

andand_b_block32; preds = %andand_dest_block35
    %j181 = load i32, i32 @j
    %ne182 = icmp ne i32 %f|addr616, %j181
    br label %andand_dest_block33

andand_dest_block33; preds = %andand_b_block32
    %Andand_183 = phi i1[ false, %andand_dest_block35], [ %ne182, %andand_b_block32]
    br i1 %Andand_183, label %andand_b_block30, label %andand_dest_block31

andand_b_block30; preds = %andand_dest_block33
    %k185 = load i32, i32 @k
    %ne186 = icmp ne i32 %f|addr616, %k185
    br label %andand_dest_block31

andand_dest_block31; preds = %andand_b_block30
    %Andand_187 = phi i1[ false, %andand_dest_block33], [ %ne186, %andand_b_block30]
    br i1 %Andand_187, label %andand_b_block28, label %andand_dest_block29

andand_b_block28; preds = %andand_dest_block31
    %i188 = load i32, i32 @i
    %j189 = load i32, i32 @j
    %ne190 = icmp ne i32 %i188, %j189
    br label %andand_dest_block29

andand_dest_block29; preds = %andand_b_block28
    %Andand_191 = phi i1[ false, %andand_dest_block31], [ %ne190, %andand_b_block28]
    br i1 %Andand_191, label %andand_b_block26, label %andand_dest_block27

andand_b_block26; preds = %andand_dest_block29
    %h192 = load i32, i32 @h
    %k193 = load i32, i32 @k
    %ne194 = icmp ne i32 %h192, %k193
    br label %andand_dest_block27

andand_dest_block27; preds = %andand_b_block26
    %Andand_195 = phi i1[ false, %andand_dest_block29], [ %ne194, %andand_b_block26]
    br i1 %Andand_195, label %if_then_block24, label %if_dest_block25

if_then_block24; preds = %andand_dest_block27
    %total196 = load i32, i32 @total
    SelfAdd197 = add i32 %total196, 1
    store pointer is not pointertypei32
    br label %if_dest_block25

if_dest_block25; preds = %if_then_block24
    SelfAdd199 = add i32 %f|addr616, 1
    br label %for_cond_block20

for_dest_block23; preds = %if_dest_block25
    SelfAdd201 = add i32 %e|addr511, 1
    br label %for_cond_block16

for_dest_block19; preds = %for_dest_block23
    SelfAdd203 = add i32 %d|addr47, 1
    br label %for_cond_block12

for_dest_block15; preds = %for_dest_block19
    SelfAdd205 = add i32 %c|addr33, 1
    br label %for_cond_block8

for_dest_block11; preds = %for_dest_block15
    SelfAdd207 = add i32 %b|addr21, 1
    br label %for_cond_block4

for_dest_block7; preds = %for_dest_block11
    SelfAdd209 = add i32 %a|addr10, 1
    br label %for_cond_block0

for_dest_block3; preds = %for_dest_block7
    %total210 = load i32, i32 @total
    %funccal211 = call i8* @toString(i32 %total210)
    %funccal212 = call void @println(i8* %funccal211)
    %mainreturn_value0=0
    br label %main_return_block

main_return_block; preds = %for_dest_block3
    ret i32 %mainreturn_value0

}

