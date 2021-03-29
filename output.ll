vector

@const_string_no0
@const_string_no1
@const_string_no2
@const_string_no3
@const_string_no4
@const_string_no5
@const_string_no6
@const_string_no7
@const_string_no8

define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter : vector i32*  @vector.init(vector*, i32**)
define ReturnType : i32
Parameter : vector  @vector.getDim(vector*)
define ReturnType : i32
Parameter : vector vector*  @vector.dot(vector*, vector**)
define ReturnType : vector*
Parameter : vector i32  @vector.scalarInPlaceMultiply(vector*, i32*)
define ReturnType : vector*
Parameter : vector vector*  @vector.add(vector*, vector**)
define ReturnType : i1
Parameter : vector i32 i32  @vector.set(vector*, i32*, i32*)
define ReturnType : i8*
Parameter : vector  @vector.tostring(vector*)
define ReturnType : i1
Parameter : vector vector*  @vector.copy(vector*, vector**)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block                              ; preds = %__init___entrance_block
    ret void

}

define ReturnType : void
Parameter : vector i32*  @vector.init(vector*, i32**){
vector.init_entrance_block    %Id_load1 = load i32*, i32** %vec
    %eq2 = icmp eq i32 %Id_load1, null
    br i1 %eq2, label %if_then_block0, label %if_dest_block1

if_then_block0                                     ; preds = %vector.init_entrance_block
    br label %vector.init_return_block
    br label %if_dest_block1

if_dest_block1                                     ; preds = %if_then_block0
    %ClassAddr_turnto_reg_3=%this
    %Id_GEP_4 = getelementptr vector, vector* %ClassAddr_turnto_reg_3, i32 0, i32 0
    %Id_GEP_Load5 = load i32*, i32** %Id_GEP_4
    %Id_load6 = load i32*, i32** %vec
    %array_size7 = getelementptr i32, i32* %Id_load6, i32 -1
    %array_size_load8 = load i32, i32* %array_size7
    call_size_19 = mul i32 %array_size_load8, 4
    call_size_210 = add i32 %call_size_19, 4
    %call_malloc_func11 = call i8* @malloc(i32 %call_size_210)
    store i32 %array_size_load8, i32* %call_malloc_func11
    %call_array_head12 = getelementptr i32, i32* %call_malloc_func11, i32 1
    call_array_head_cast_13 = bitcast i32* %call_array_head12 to i32*
    store i32* %call_array_head_cast_13, i32** %Id_GEP_4
    %Id_load15 = load i32, i32* %i14
    store i32 0, i32* %i14
    br label %for_cond_block2

for_cond_block2                                    ; preds = %if_dest_block1
    %Id_load16 = load i32, i32* %i14
    %Id_load17 = load i32*, i32** %vec
    %array_size18 = getelementptr i32, i32* %Id_load17, i32 -1
    %array_size_load19 = load i32, i32* %array_size18
    %slt20 = icmp slt i32 %Id_load16, %array_size_load19
    br i1 %slt20, label %for_body_block4, label %for_dest_block5

for_body_block4                                    ; preds = %for_cond_block2
    %ClassAddr_turnto_reg_21=%this
    %Id_GEP_22 = getelementptr vector, vector* %ClassAddr_turnto_reg_21, i32 0, i32 0
    %Id_GEP_Load23 = load i32*, i32** %Id_GEP_22
    %Id_load24 = load i32, i32* %i14
    %getElementPtr25 = getelementptr i32, i32* %Id_GEP_Load23, i32 %Id_load24
    %GEP_Load26 = load i32, i32* %getElementPtr25
    %Id_load27 = load i32*, i32** %vec
    %Id_load28 = load i32, i32* %i14
    %getElementPtr29 = getelementptr i32, i32* %Id_load27, i32 %Id_load28
    %GEP_Load30 = load i32, i32* %getElementPtr29
    store i32 %GEP_Load30, i32* %getElementPtr25
    br label %for_step_block3

for_step_block3                                    ; preds = %for_body_block4
    %Id_load31 = load i32, i32* %i14
    PreAdd32 = add i32 %Id_load31, 1
    store i32 %PreAdd32, i32* %i14
    br label %for_cond_block2

for_dest_block5                                    ; preds = %for_step_block3
    br label %vector.init_return_block

vector.init_return_block                           ; preds = %for_dest_block5
    ret void

}

define ReturnType : i32
Parameter : vector  @vector.getDim(vector*){
vector.getDim_entrance_block    %ClassAddr_turnto_reg_34=%this
    %Id_GEP_35 = getelementptr vector, vector* %ClassAddr_turnto_reg_34, i32 0, i32 0
    %Id_GEP_Load36 = load i32*, i32** %Id_GEP_35
    %eq37 = icmp eq i32 %Id_GEP_Load36, null
    br i1 %eq37, label %if_then_block6, label %if_dest_block7

if_then_block6                                     ; preds = %vector.getDim_entrance_block
    store i32 0, i32* %vector.getDimreturn_value33
    br label %vector.getDim_return_block
    br label %if_dest_block7

if_dest_block7                                     ; preds = %if_then_block6
    %ClassAddr_turnto_reg_38=%this
    %Id_GEP_39 = getelementptr vector, vector* %ClassAddr_turnto_reg_38, i32 0, i32 0
    %Id_GEP_Load40 = load i32*, i32** %Id_GEP_39
    %array_size41 = getelementptr i32, i32* %Id_GEP_Load40, i32 -1
    %array_size_load42 = load i32, i32* %array_size41
    store i32 %array_size_load42, i32* %vector.getDimreturn_value33
    br label %vector.getDim_return_block
    br label %vector.getDim_return_block

vector.getDim_return_block                         ; preds = %if_dest_block7
    ret i32 %vector.getDimreturn_value33

}

define ReturnType : i32
Parameter : vector vector*  @vector.dot(vector*, vector**){
vector.dot_entrance_block    store i32 0, i32* %i44
    store i32 0, i32* %result45
    br label %while_cond_block8

while_cond_block8                                  ; preds = %vector.dot_entrance_block
    %Id_load46 = load i32, i32* %i44
    %funccal47 = call i32 @vector.getDim(vector* %this)
    %slt48 = icmp slt i32 %Id_load46, %funccal47
    br i1 %slt48, label %while_body_block9, label %while_dest_block10

while_body_block9                                  ; preds = %while_cond_block8
    %Id_load49 = load i32, i32* %result45
    %ClassAddr_turnto_reg_50=%this
    %Id_GEP_51 = getelementptr vector, vector* %ClassAddr_turnto_reg_50, i32 0, i32 0
    %Id_GEP_Load52 = load i32*, i32** %Id_GEP_51
    %Id_load53 = load i32, i32* %i44
    %getElementPtr54 = getelementptr i32, i32* %Id_GEP_Load52, i32 %Id_load53
    %GEP_Load55 = load i32, i32* %getElementPtr54
    %Id_load56 = load vector*, vector** %rhs
    %memacc_result57 = getelementptr vector, vector* %Id_load56, i32 0, i32 0
    %memacc_result58 = load i32*, i32** %memacc_result57
    %Id_load59 = load i32, i32* %i44
    %getElementPtr60 = getelementptr i32, i32* %memacc_result58, i32 %Id_load59
    %GEP_Load61 = load i32, i32* %getElementPtr60
    mul62 = mul i32 %GEP_Load55, %GEP_Load61
    store i32 %mul62, i32* %result45
    %Id_load63 = load i32, i32* %i44
    PreAdd64 = add i32 %Id_load63, 1
    store i32 %PreAdd64, i32* %i44
    br label %while_cond_block8

while_dest_block10                                 ; preds = %while_body_block9
    %Id_load65 = load i32, i32* %result45
    store i32 %Id_load65, i32* %vector.dotreturn_value43
    br label %vector.dot_return_block
    br label %vector.dot_return_block

vector.dot_return_block                            ; preds = %while_dest_block10
    ret i32 %vector.dotreturn_value43

}

define ReturnType : vector*
Parameter : vector i32  @vector.scalarInPlaceMultiply(vector*, i32*){
vector.scalarInPlaceMultiply_entrance_block    %ClassAddr_turnto_reg_67=%this
    %Id_GEP_68 = getelementptr vector, vector* %ClassAddr_turnto_reg_67, i32 0, i32 0
    %Id_GEP_Load69 = load i32*, i32** %Id_GEP_68
    %eq70 = icmp eq i32 %Id_GEP_Load69, null
    br i1 %eq70, label %if_then_block11, label %if_dest_block12

if_then_block11                                    ; preds = %vector.scalarInPlaceMultiply_entrance_block
    store vector* null, vector** %vector.scalarInPlaceMultiplyreturn_value66
    br label %vector.scalarInPlaceMultiply_return_block
    br label %if_dest_block12

if_dest_block12                                    ; preds = %if_then_block11
    %Id_load72 = load i32, i32* %i71
    store i32 0, i32* %i71
    br label %for_cond_block13

for_cond_block13                                   ; preds = %if_dest_block12
    %Id_load73 = load i32, i32* %i71
    %funccal74 = call i32 @vector.getDim(vector* %this)
    %slt75 = icmp slt i32 %Id_load73, %funccal74
    br i1 %slt75, label %for_body_block15, label %for_dest_block16

for_body_block15                                   ; preds = %for_cond_block13
    %CastToResult76=%this
    %memacc_result77 = getelementptr vector, vector* %CastToResult76, i32 0, i32 0
    %memacc_result78 = load i32*, i32** %memacc_result77
    %Id_load79 = load i32, i32* %i71
    %getElementPtr80 = getelementptr i32, i32* %memacc_result78, i32 %Id_load79
    %GEP_Load81 = load i32, i32* %getElementPtr80
    %Id_load82 = load i32, i32* %c
    %CastToResult83=%this
    %memacc_result84 = getelementptr vector, vector* %CastToResult83, i32 0, i32 0
    %memacc_result85 = load i32*, i32** %memacc_result84
    %Id_load86 = load i32, i32* %i71
    %getElementPtr87 = getelementptr i32, i32* %memacc_result85, i32 %Id_load86
    %GEP_Load88 = load i32, i32* %getElementPtr87
    mul89 = mul i32 %Id_load82, %GEP_Load88
    store i32 %mul89, i32* %getElementPtr80
    br label %for_step_block14

for_step_block14                                   ; preds = %for_body_block15
    %Id_load90 = load i32, i32* %i71
    PreAdd91 = add i32 %Id_load90, 1
    store i32 %PreAdd91, i32* %i71
    br label %for_cond_block13

for_dest_block16                                   ; preds = %for_step_block14
    %CastToResult92=%this
    store vector* %CastToResult92, vector** %vector.scalarInPlaceMultiplyreturn_value66
    br label %vector.scalarInPlaceMultiply_return_block
    br label %vector.scalarInPlaceMultiply_return_block

vector.scalarInPlaceMultiply_return_block          ; preds = %for_dest_block16
    ret vector* %vector.scalarInPlaceMultiplyreturn_value66

}

define ReturnType : vector*
Parameter : vector vector*  @vector.add(vector*, vector**){
vector.add_entrance_block    %funccal94 = call i32 @vector.getDim(vector* %this)
    %Id_load95 = load vector*, vector** %rhs
    %funccal96 = call i32 @vector.getDim(vector* %Id_load95)
    %ne97 = icmp ne i32 %funccal94, %funccal96
    %lhs_compare_98 = icmp eq i1 %ne97, 0
    br i1 %lhs_compare_98, label %oror_b_block19, label %oror_dest_block20

oror_b_block19                                     ; preds = %vector.add_entrance_block
    %funccal99 = call i32 @vector.getDim(vector* %this)
    %eq100 = icmp eq i32 %funccal99, 0
    br label %oror_dest_block20

oror_dest_block20                                  ; preds = %oror_b_block19
    Oror_101 = or i1 %ne97, %eq100
    br i1 %Oror_101, label %if_then_block17, label %if_dest_block18

if_then_block17                                    ; preds = %oror_dest_block20
    store vector* null, vector** %vector.addreturn_value93
    br label %vector.add_return_block
    br label %if_dest_block18

if_dest_block18                                    ; preds = %if_then_block17
    %Malloc_Result103 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_104 = bitcast i32* %Malloc_Result103 to vector*
    store vector* %Malloc_Cast_Result_104, vector** %temp102
    %Id_load106 = load vector*, vector** %temp102
    %memacc_result107 = getelementptr vector, vector* %Id_load106, i32 0, i32 0
    %memacc_result108 = load i32*, i32** %memacc_result107
    %funccal109 = call i32 @vector.getDim(vector* %this)
    call_size_1110 = mul i32 %funccal109, 4
    call_size_2111 = add i32 %call_size_1110, 4
    %call_malloc_func112 = call i8* @malloc(i32 %call_size_2111)
    store i32 %funccal109, i32* %call_malloc_func112
    %call_array_head113 = getelementptr i32, i32* %call_malloc_func112, i32 1
    call_array_head_cast_114 = bitcast i32* %call_array_head113 to i32*
    store i32* %call_array_head_cast_114, i32** %memacc_result107
    %Id_load115 = load i32, i32* %i105
    store i32 0, i32* %i105
    br label %for_cond_block21

for_cond_block21                                   ; preds = %if_dest_block18
    %Id_load116 = load i32, i32* %i105
    %funccal117 = call i32 @vector.getDim(vector* %this)
    %slt118 = icmp slt i32 %Id_load116, %funccal117
    br i1 %slt118, label %for_body_block23, label %for_dest_block24

for_body_block23                                   ; preds = %for_cond_block21
    %Id_load119 = load vector*, vector** %temp102
    %memacc_result120 = getelementptr vector, vector* %Id_load119, i32 0, i32 0
    %memacc_result121 = load i32*, i32** %memacc_result120
    %Id_load122 = load i32, i32* %i105
    %getElementPtr123 = getelementptr i32, i32* %memacc_result121, i32 %Id_load122
    %GEP_Load124 = load i32, i32* %getElementPtr123
    %ClassAddr_turnto_reg_125=%this
    %Id_GEP_126 = getelementptr vector, vector* %ClassAddr_turnto_reg_125, i32 0, i32 0
    %Id_GEP_Load127 = load i32*, i32** %Id_GEP_126
    %Id_load128 = load i32, i32* %i105
    %getElementPtr129 = getelementptr i32, i32* %Id_GEP_Load127, i32 %Id_load128
    %GEP_Load130 = load i32, i32* %getElementPtr129
    %Id_load131 = load vector*, vector** %rhs
    %memacc_result132 = getelementptr vector, vector* %Id_load131, i32 0, i32 0
    %memacc_result133 = load i32*, i32** %memacc_result132
    %Id_load134 = load i32, i32* %i105
    %getElementPtr135 = getelementptr i32, i32* %memacc_result133, i32 %Id_load134
    %GEP_Load136 = load i32, i32* %getElementPtr135
    add137 = add i32 %GEP_Load130, %GEP_Load136
    store i32 %add137, i32* %getElementPtr123
    br label %for_step_block22

for_step_block22                                   ; preds = %for_body_block23
    %Id_load138 = load i32, i32* %i105
    PreAdd139 = add i32 %Id_load138, 1
    store i32 %PreAdd139, i32* %i105
    br label %for_cond_block21

for_dest_block24                                   ; preds = %for_step_block22
    %Id_load140 = load vector*, vector** %temp102
    store vector* %Id_load140, vector** %vector.addreturn_value93
    br label %vector.add_return_block
    br label %vector.add_return_block

vector.add_return_block                            ; preds = %for_dest_block24
    ret vector* %vector.addreturn_value93

}

define ReturnType : i1
Parameter : vector i32 i32  @vector.set(vector*, i32*, i32*){
vector.set_entrance_block    %funccal142 = call i32 @vector.getDim(vector* %this)
    %Id_load143 = load i32, i32* %idx
    %slt144 = icmp slt i32 %funccal142, %Id_load143
    br i1 %slt144, label %if_then_block25, label %if_dest_block26

if_then_block25                                    ; preds = %vector.set_entrance_block
    store i1 false, i1* %vector.setreturn_value141
    br label %vector.set_return_block
    br label %if_dest_block26

if_dest_block26                                    ; preds = %if_then_block25
    %ClassAddr_turnto_reg_145=%this
    %Id_GEP_146 = getelementptr vector, vector* %ClassAddr_turnto_reg_145, i32 0, i32 0
    %Id_GEP_Load147 = load i32*, i32** %Id_GEP_146
    %Id_load148 = load i32, i32* %idx
    %getElementPtr149 = getelementptr i32, i32* %Id_GEP_Load147, i32 %Id_load148
    %GEP_Load150 = load i32, i32* %getElementPtr149
    %Id_load151 = load i32, i32* %value
    store i32 %Id_load151, i32* %getElementPtr149
    store i1 true, i1* %vector.setreturn_value141
    br label %vector.set_return_block
    br label %vector.set_return_block

vector.set_return_block                            ; preds = %if_dest_block26
    ret i1 %vector.setreturn_value141

}

define ReturnType : i8*
Parameter : vector  @vector.tostring(vector*){
vector.tostring_entrance_block    %StringConst154 = getelementptr [2 x i8], [2 x i8]* @const_string_no0, i32 0, i32 0
    store i8* %StringConst154, i8** %temp153
    %funccal155 = call i32 @vector.getDim(vector* %this)
    %sgt156 = icmp sgt i32 %funccal155, 0
    br i1 %sgt156, label %if_then_block27, label %if_dest_block28

if_then_block27                                    ; preds = %vector.tostring_entrance_block
    %Id_load157 = load i8*, i8** %temp153
    %Id_load158 = load i8*, i8** %temp153
    %ClassAddr_turnto_reg_159=%this
    %Id_GEP_160 = getelementptr vector, vector* %ClassAddr_turnto_reg_159, i32 0, i32 0
    %Id_GEP_Load161 = load i32*, i32** %Id_GEP_160
    %getElementPtr162 = getelementptr i32, i32* %Id_GEP_Load161, i32 0
    %GEP_Load163 = load i32, i32* %getElementPtr162
    %funccal164 = call i8* @toString(i32 %GEP_Load163)
    %add165 = call i8* @__string_add(i8* %Id_load158, ReturnType : i8*
Parameter : i32  %funccal164)
    store i8* %add165, i8** %temp153
    br label %if_dest_block28

if_dest_block28                                    ; preds = %if_then_block27
    %Id_load167 = load i32, i32* %i166
    store i32 1, i32* %i166
    br label %for_cond_block29

for_cond_block29                                   ; preds = %if_dest_block28
    %Id_load168 = load i32, i32* %i166
    %funccal169 = call i32 @vector.getDim(vector* %this)
    %slt170 = icmp slt i32 %Id_load168, %funccal169
    br i1 %slt170, label %for_body_block31, label %for_dest_block32

for_body_block31                                   ; preds = %for_cond_block29
    %Id_load171 = load i8*, i8** %temp153
    %Id_load172 = load i8*, i8** %temp153
    %StringConst173 = getelementptr [2 x i8], [2 x i8]* @const_string_no1, i32 0, i32 0
    %add174 = call i8* @__string_add(i8* %Id_load172, i8* %StringConst173)
    %ClassAddr_turnto_reg_175=%this
    %Id_GEP_176 = getelementptr vector, vector* %ClassAddr_turnto_reg_175, i32 0, i32 0
    %Id_GEP_Load177 = load i32*, i32** %Id_GEP_176
    %Id_load178 = load i32, i32* %i166
    %getElementPtr179 = getelementptr i32, i32* %Id_GEP_Load177, i32 %Id_load178
    %GEP_Load180 = load i32, i32* %getElementPtr179
    %funccal181 = call i8* @toString(i32 %GEP_Load180)
    %add182 = call i8* @__string_add(i8* %add174, ReturnType : i8*
Parameter : i32  %funccal181)
    store i8* %add182, i8** %temp153
    br label %for_step_block30

for_step_block30                                   ; preds = %for_body_block31
    %Id_load183 = load i32, i32* %i166
    PreAdd184 = add i32 %Id_load183, 1
    store i32 %PreAdd184, i32* %i166
    br label %for_cond_block29

for_dest_block32                                   ; preds = %for_step_block30
    %Id_load185 = load i8*, i8** %temp153
    %Id_load186 = load i8*, i8** %temp153
    %StringConst187 = getelementptr [2 x i8], [2 x i8]* @const_string_no2, i32 0, i32 0
    %add188 = call i8* @__string_add(i8* %Id_load186, i8* %StringConst187)
    store i8* %add188, i8** %temp153
    %Id_load189 = load i8*, i8** %temp153
    store i8* %Id_load189, i8** %vector.tostringreturn_value152
    br label %vector.tostring_return_block
    br label %vector.tostring_return_block

vector.tostring_return_block                       ; preds = %for_dest_block32
    ret i8* %vector.tostringreturn_value152

}

define ReturnType : i1
Parameter : vector vector*  @vector.copy(vector*, vector**){
vector.copy_entrance_block    %Id_load191 = load vector*, vector** %rhs
    %eq192 = icmp eq vector* %Id_load191, null
    br i1 %eq192, label %if_then_block33, label %if_dest_block34

if_then_block33                                    ; preds = %vector.copy_entrance_block
    store i1 false, i1* %vector.copyreturn_value190
    br label %vector.copy_return_block
    br label %if_dest_block34

if_dest_block34                                    ; preds = %if_then_block33
    %Id_load193 = load vector*, vector** %rhs
    %funccal194 = call i32 @vector.getDim(vector* %Id_load193)
    %eq195 = icmp eq i32 %funccal194, 0
    br i1 %eq195, label %if_then_block35, label %if_else_block36

if_then_block35                                    ; preds = %if_dest_block34
    %ClassAddr_turnto_reg_196=%this
    %Id_GEP_197 = getelementptr vector, vector* %ClassAddr_turnto_reg_196, i32 0, i32 0
    %Id_GEP_Load198 = load i32*, i32** %Id_GEP_197
    store i32* null, i32** %Id_GEP_197
    br label %if_dest_block37

if_else_block36                                    ; preds = %if_then_block35
    %ClassAddr_turnto_reg_199=%this
    %Id_GEP_200 = getelementptr vector, vector* %ClassAddr_turnto_reg_199, i32 0, i32 0
    %Id_GEP_Load201 = load i32*, i32** %Id_GEP_200
    %Id_load202 = load vector*, vector** %rhs
    %funccal203 = call i32 @vector.getDim(vector* %Id_load202)
    call_size_1204 = mul i32 %funccal203, 4
    call_size_2205 = add i32 %call_size_1204, 4
    %call_malloc_func206 = call i8* @malloc(i32 %call_size_2205)
    store i32 %funccal203, i32* %call_malloc_func206
    %call_array_head207 = getelementptr i32, i32* %call_malloc_func206, i32 1
    call_array_head_cast_208 = bitcast i32* %call_array_head207 to i32*
    store i32* %call_array_head_cast_208, i32** %Id_GEP_200
    %Id_load210 = load i32, i32* %i209
    store i32 0, i32* %i209
    br label %for_cond_block38

for_cond_block38                                   ; preds = %if_else_block36
    %Id_load211 = load i32, i32* %i209
    %funccal212 = call i32 @vector.getDim(vector* %this)
    %slt213 = icmp slt i32 %Id_load211, %funccal212
    br i1 %slt213, label %for_body_block40, label %for_dest_block41

for_body_block40                                   ; preds = %for_cond_block38
    %ClassAddr_turnto_reg_214=%this
    %Id_GEP_215 = getelementptr vector, vector* %ClassAddr_turnto_reg_214, i32 0, i32 0
    %Id_GEP_Load216 = load i32*, i32** %Id_GEP_215
    %Id_load217 = load i32, i32* %i209
    %getElementPtr218 = getelementptr i32, i32* %Id_GEP_Load216, i32 %Id_load217
    %GEP_Load219 = load i32, i32* %getElementPtr218
    %Id_load220 = load vector*, vector** %rhs
    %memacc_result221 = getelementptr vector, vector* %Id_load220, i32 0, i32 0
    %memacc_result222 = load i32*, i32** %memacc_result221
    %Id_load223 = load i32, i32* %i209
    %getElementPtr224 = getelementptr i32, i32* %memacc_result222, i32 %Id_load223
    %GEP_Load225 = load i32, i32* %getElementPtr224
    store i32 %GEP_Load225, i32* %getElementPtr218
    br label %for_step_block39

for_step_block39                                   ; preds = %for_body_block40
    %Id_load226 = load i32, i32* %i209
    PreAdd227 = add i32 %Id_load226, 1
    store i32 %PreAdd227, i32* %i209
    br label %for_cond_block38

for_dest_block41                                   ; preds = %for_step_block39
    br label %if_dest_block37

if_dest_block37                                    ; preds = %for_dest_block41
    store i1 true, i1* %vector.copyreturn_value190
    br label %vector.copy_return_block
    br label %vector.copy_return_block

vector.copy_return_block                           ; preds = %if_dest_block37
    ret i1 %vector.copyreturn_value190

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    %call_init229 = call void @__init__()
    %Malloc_Result231 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_232 = bitcast i32* %Malloc_Result231 to vector*
    store vector* %Malloc_Cast_Result_232, vector** %x230
    call_size_1234 = mul i32 10, 4
    call_size_2235 = add i32 %call_size_1234, 4
    %call_malloc_func236 = call i8* @malloc(i32 %call_size_2235)
    store i32 10, i32* %call_malloc_func236
    %call_array_head237 = getelementptr i32, i32* %call_malloc_func236, i32 1
    call_array_head_cast_238 = bitcast i32* %call_array_head237 to i32*
    store i32* %call_array_head_cast_238, i32** %a233
    %Id_load240 = load i32, i32* %i239
    store i32 0, i32* %i239
    br label %for_cond_block42

for_cond_block42                                   ; preds = %main_entrance_block
    %Id_load241 = load i32, i32* %i239
    %slt242 = icmp slt i32 %Id_load241, 10
    br i1 %slt242, label %for_body_block44, label %for_dest_block45

for_body_block44                                   ; preds = %for_cond_block42
    %Id_load243 = load i32*, i32** %a233
    %Id_load244 = load i32, i32* %i239
    %getElementPtr245 = getelementptr i32, i32* %Id_load243, i32 %Id_load244
    %GEP_Load246 = load i32, i32* %getElementPtr245
    %Id_load247 = load i32, i32* %i239
    sub248 = sub i32 9, %Id_load247
    store i32 %sub248, i32* %getElementPtr245
    br label %for_step_block43

for_step_block43                                   ; preds = %for_body_block44
    %Id_load249 = load i32, i32* %i239
    PreAdd250 = add i32 %Id_load249, 1
    store i32 %PreAdd250, i32* %i239
    br label %for_cond_block42

for_dest_block45                                   ; preds = %for_step_block43
    %Id_load251 = load vector*, vector** %x230
    %Id_load252 = load i32*, i32** %a233
    %funccal253 = call void @vector.init(vector* %Id_load251, i32* %Id_load252)
    %StringConst254 = getelementptr [10 x i8], [10 x i8]* @const_string_no3, i32 0, i32 0
    %funccal255 = call void @print(i8* %StringConst254)
    %Id_load256 = load vector*, vector** %x230
    %funccal257 = call i8* @vector.tostring(vector* %Id_load256)
    %funccal258 = call void @println(i8* %funccal257)
    %Malloc_Result260 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_261 = bitcast i32* %Malloc_Result260 to vector*
    store vector* %Malloc_Cast_Result_261, vector** %y259
    %Id_load262 = load vector*, vector** %y259
    %Id_load263 = load vector*, vector** %x230
    %funccal264 = call i1 @vector.copy(vector* %Id_load262, vector* %Id_load263)
    %Id_load265 = load vector*, vector** %y259
    %funccal266 = call i1 @vector.set(vector* %Id_load265, i32 3, i32 817)
    br i1 %funccal266, label %if_then_block46, label %if_dest_block47

if_then_block46                                    ; preds = %for_dest_block45
    %StringConst267 = getelementptr [8 x i8], [8 x i8]* @const_string_no4, i32 0, i32 0
    %funccal268 = call void @println(i8* %StringConst267)
    br label %if_dest_block47

if_dest_block47                                    ; preds = %if_then_block46
    %StringConst269 = getelementptr [10 x i8], [10 x i8]* @const_string_no5, i32 0, i32 0
    %funccal270 = call void @print(i8* %StringConst269)
    %Id_load271 = load vector*, vector** %y259
    %funccal272 = call i8* @vector.tostring(vector* %Id_load271)
    %funccal273 = call void @println(i8* %funccal272)
    %StringConst274 = getelementptr [7 x i8], [7 x i8]* @const_string_no6, i32 0, i32 0
    %funccal275 = call void @print(i8* %StringConst274)
    %Id_load276 = load vector*, vector** %x230
    %Id_load277 = load vector*, vector** %y259
    %funccal278 = call vector* @vector.add(vector* %Id_load276, vector* %Id_load277)
    %funccal279 = call i8* @vector.tostring(vector* %funccal278)
    %funccal280 = call void @println(i8* %funccal279)
    %StringConst281 = getelementptr [7 x i8], [7 x i8]* @const_string_no7, i32 0, i32 0
    %funccal282 = call void @print(i8* %StringConst281)
    %Id_load283 = load vector*, vector** %x230
    %Id_load284 = load vector*, vector** %y259
    %funccal285 = call i32 @vector.dot(vector* %Id_load283, vector* %Id_load284)
    %funccal286 = call i8* @toString(i32 %funccal285)
    %funccal287 = call void @println(ReturnType : i8*
Parameter : i32  %funccal286)
    %StringConst288 = getelementptr [14 x i8], [14 x i8]* @const_string_no8, i32 0, i32 0
    %funccal289 = call void @print(i8* %StringConst288)
    %Id_load290 = load vector*, vector** %y259
    shl291 = shl i32 1, 3
    %funccal292 = call vector* @vector.scalarInPlaceMultiply(vector* %Id_load290, i32 %shl291)
    %funccal293 = call i8* @vector.tostring(vector* %funccal292)
    %funccal294 = call void @println(i8* %funccal293)
    store i32 0, i32* %mainreturn_value228
    br label %main_return_block
    br label %main_return_block

main_return_block                                  ; preds = %if_dest_block47
    ret i32 %mainreturn_value228

}

