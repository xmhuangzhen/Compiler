vector

@const_string_no0
@const_string_no1
@const_string_no2
@const_string_no3

define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter : vector i32*  @vector.init(vector*, i32*)
define ReturnType : i32
Parameter : vector  @vector.getDim(vector*)
define ReturnType : i8*
Parameter : vector  @vector.tostring(vector*)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    br label %__init___return_block

__init___return_block; preds = %__init___entrance_block
    ret void

}

define ReturnType : void
Parameter : vector i32*  @vector.init(vector*, i32*){
vector.init_entrance_block    %this|addr0 = alloca vector**
    store vector* %this, vector** %this|addr0
    %vec|addr1 = alloca i32**
    store i32* %vec, i32** %vec|addr1
    %Id_load3 = load i32*, i32** %vec|addr1
    %eq4 = icmp eq i32 %Id_load3, null
    br i1 %eq4, label %if_then_block0, label %if_dest_block1

if_then_block0; preds = %vector.init_entrance_block
    br label %vector.init_return_block
    br label %if_dest_block1

if_dest_block1; preds = %if_then_block0
    %ClassAddr_turnto_reg_5 = load vector*, vector** %this|addr0
    %Id_GEP_6 = getelementptr vector, vector* %ClassAddr_turnto_reg_5, i32 0, i32 0
    %Id_GEP_Load7 = load i32*, i32** %Id_GEP_6
    %Id_load8 = load i32*, i32** %vec|addr1
    %array_size9 = getelementptr i32, i32* %Id_load8, i32 -1
    %array_size_load10 = load i32, i32* %array_size9
    call_size_111 = mul i32 %array_size_load10, 4
    call_size_212 = add i32 %call_size_111, 4
    %call_malloc_func13 = call i8* @malloc(i32 %call_size_212)
    store i32 %array_size_load10, i32* %call_malloc_func13
    %call_array_head14 = getelementptr i32, i32* %call_malloc_func13, i32 1
    call_array_head_cast_15 = bitcast i32* %call_array_head14 to i32*
    store i32* %call_array_head_cast_15, i32** %Id_GEP_6
    %i|addr16 = alloca i32*
    %Id_load17 = load i32, i32* %i|addr16
    store i32 0, i32* %i|addr16
    br label %for_cond_block2

for_cond_block2; preds = %if_dest_block1
    %Id_load18 = load i32, i32* %i|addr16
    %Id_load19 = load i32*, i32** %vec|addr1
    %array_size20 = getelementptr i32, i32* %Id_load19, i32 -1
    %array_size_load21 = load i32, i32* %array_size20
    %slt22 = icmp slt i32 %Id_load18, %array_size_load21
    br i1 %slt22, label %for_body_block4, label %for_dest_block5

for_body_block4; preds = %for_cond_block2
    %ClassAddr_turnto_reg_23 = load vector*, vector** %this|addr0
    %Id_GEP_24 = getelementptr vector, vector* %ClassAddr_turnto_reg_23, i32 0, i32 0
    %Id_GEP_Load25 = load i32*, i32** %Id_GEP_24
    %Id_load26 = load i32, i32* %i|addr16
    %getElementPtr27 = getelementptr i32, i32* %Id_GEP_Load25, i32 %Id_load26
    %GEP_Load28 = load i32, i32* %getElementPtr27
    %Id_load29 = load i32*, i32** %vec|addr1
    %Id_load30 = load i32, i32* %i|addr16
    %getElementPtr31 = getelementptr i32, i32* %Id_load29, i32 %Id_load30
    %GEP_Load32 = load i32, i32* %getElementPtr31
    store i32 %GEP_Load32, i32* %getElementPtr27
    br label %for_step_block3

for_step_block3; preds = %for_body_block4
    %Id_load33 = load i32, i32* %i|addr16
    PreAdd34 = add i32 %Id_load33, 1
    store i32 %PreAdd34, i32* %i|addr16
    br label %for_cond_block2

for_dest_block5; preds = %for_step_block3
    br label %vector.init_return_block

vector.init_return_block; preds = %for_dest_block5
    ret void

}

define ReturnType : i32
Parameter : vector  @vector.getDim(vector*){
vector.getDim_entrance_block    %this|addr35 = alloca vector**
    store vector* %this, vector** %this|addr35
    %ClassAddr_turnto_reg_37 = load vector*, vector** %this|addr35
    %Id_GEP_38 = getelementptr vector, vector* %ClassAddr_turnto_reg_37, i32 0, i32 0
    %Id_GEP_Load39 = load i32*, i32** %Id_GEP_38
    %eq40 = icmp eq i32 %Id_GEP_Load39, null
    br i1 %eq40, label %if_then_block6, label %if_dest_block7

if_then_block6; preds = %vector.getDim_entrance_block
    %vector.getDimreturn_value36=0
    br label %vector.getDim_return_block
    br label %if_dest_block7

if_dest_block7; preds = %if_then_block6
    %ClassAddr_turnto_reg_41 = load vector*, vector** %this|addr35
    %Id_GEP_42 = getelementptr vector, vector* %ClassAddr_turnto_reg_41, i32 0, i32 0
    %Id_GEP_Load43 = load i32*, i32** %Id_GEP_42
    %array_size44 = getelementptr i32, i32* %Id_GEP_Load43, i32 -1
    %array_size_load45 = load i32, i32* %array_size44
    %vector.getDimreturn_value36=%array_size_load45
    br label %vector.getDim_return_block
    br label %vector.getDim_return_block

vector.getDim_return_block; preds = %if_dest_block7
    ret i32 %vector.getDimreturn_value36

}

define ReturnType : i8*
Parameter : vector  @vector.tostring(vector*){
vector.tostring_entrance_block    %this|addr46 = alloca vector**
    store vector* %this, vector** %this|addr46
    %temp|addr48 = alloca i8**
    %StringConst49 = getelementptr [2 x i8], [2 x i8]* @const_string_no0, i32 0, i32 0
    store i8* %StringConst49, i8** %temp|addr48
    %CastToResult51 = load vector*, vector** %this|addr46
    %funccal50 = call i32 @vector.getDim(vector* %CastToResult51)
    %sgt52 = icmp sgt i32 %funccal50, 0
    br i1 %sgt52, label %if_then_block8, label %if_dest_block9

if_then_block8; preds = %vector.tostring_entrance_block
    %Id_load53 = load i8*, i8** %temp|addr48
    %Id_load54 = load i8*, i8** %temp|addr48
    %ClassAddr_turnto_reg_55 = load vector*, vector** %this|addr46
    %Id_GEP_56 = getelementptr vector, vector* %ClassAddr_turnto_reg_55, i32 0, i32 0
    %Id_GEP_Load57 = load i32*, i32** %Id_GEP_56
    %getElementPtr58 = getelementptr i32, i32* %Id_GEP_Load57, i32 0
    %GEP_Load59 = load i32, i32* %getElementPtr58
    %funccal60 = call i8* @toString(i32 %GEP_Load59)
    %add61 = call i8* @__string_add(i8* %Id_load54, i8* %funccal60)
    store i8* %add61, i8** %temp|addr48
    br label %if_dest_block9

if_dest_block9; preds = %if_then_block8
    %i|addr62 = alloca i32*
    %Id_load63 = load i32, i32* %i|addr62
    store i32 1, i32* %i|addr62
    br label %for_cond_block10

for_cond_block10; preds = %if_dest_block9
    %Id_load64 = load i32, i32* %i|addr62
    %CastToResult66 = load vector*, vector** %this|addr46
    %funccal65 = call i32 @vector.getDim(vector* %CastToResult66)
    %slt67 = icmp slt i32 %Id_load64, %funccal65
    br i1 %slt67, label %for_body_block12, label %for_dest_block13

for_body_block12; preds = %for_cond_block10
    %Id_load68 = load i8*, i8** %temp|addr48
    %Id_load69 = load i8*, i8** %temp|addr48
    %StringConst70 = getelementptr [2 x i8], [2 x i8]* @const_string_no1, i32 0, i32 0
    %add71 = call i8* @__string_add(i8* %Id_load69, i8* %StringConst70)
    %ClassAddr_turnto_reg_72 = load vector*, vector** %this|addr46
    %Id_GEP_73 = getelementptr vector, vector* %ClassAddr_turnto_reg_72, i32 0, i32 0
    %Id_GEP_Load74 = load i32*, i32** %Id_GEP_73
    %Id_load75 = load i32, i32* %i|addr62
    %getElementPtr76 = getelementptr i32, i32* %Id_GEP_Load74, i32 %Id_load75
    %GEP_Load77 = load i32, i32* %getElementPtr76
    %funccal78 = call i8* @toString(i32 %GEP_Load77)
    %add79 = call i8* @__string_add(i8* %add71, i8* %funccal78)
    store i8* %add79, i8** %temp|addr48
    br label %for_step_block11

for_step_block11; preds = %for_body_block12
    %Id_load80 = load i32, i32* %i|addr62
    PreAdd81 = add i32 %Id_load80, 1
    store i32 %PreAdd81, i32* %i|addr62
    br label %for_cond_block10

for_dest_block13; preds = %for_step_block11
    %Id_load82 = load i8*, i8** %temp|addr48
    %Id_load83 = load i8*, i8** %temp|addr48
    %StringConst84 = getelementptr [2 x i8], [2 x i8]* @const_string_no2, i32 0, i32 0
    %add85 = call i8* @__string_add(i8* %Id_load83, i8* %StringConst84)
    store i8* %add85, i8** %temp|addr48
    %Id_load86 = load i8*, i8** %temp|addr48
    %vector.tostringreturn_value47=%Id_load86
    br label %vector.tostring_return_block
    br label %vector.tostring_return_block

vector.tostring_return_block; preds = %for_dest_block13
    ret i8* %vector.tostringreturn_value47

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    call void @__init__()
    %x|addr88 = alloca vector**
    %Malloc_Result89 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_90 = bitcast i32* %Malloc_Result89 to vector*
    store vector* %Malloc_Cast_Result_90, vector** %x|addr88
    %a|addr91 = alloca i32**
    call_size_192 = mul i32 10, 4
    call_size_293 = add i32 %call_size_192, 4
    %call_malloc_func94 = call i8* @malloc(i32 %call_size_293)
    store i32 10, i32* %call_malloc_func94
    %call_array_head95 = getelementptr i32, i32* %call_malloc_func94, i32 1
    call_array_head_cast_96 = bitcast i32* %call_array_head95 to i32*
    store i32* %call_array_head_cast_96, i32** %a|addr91
    %i|addr97 = alloca i32*
    %Id_load98 = load i32, i32* %i|addr97
    store i32 0, i32* %i|addr97
    br label %for_cond_block14

for_cond_block14; preds = %main_entrance_block
    %Id_load99 = load i32, i32* %i|addr97
    %slt100 = icmp slt i32 %Id_load99, 10
    br i1 %slt100, label %for_body_block16, label %for_dest_block17

for_body_block16; preds = %for_cond_block14
    %Id_load101 = load i32*, i32** %a|addr91
    %Id_load102 = load i32, i32* %i|addr97
    %getElementPtr103 = getelementptr i32, i32* %Id_load101, i32 %Id_load102
    %GEP_Load104 = load i32, i32* %getElementPtr103
    %Id_load105 = load i32, i32* %i|addr97
    sub106 = sub i32 9, %Id_load105
    store i32 %sub106, i32* %getElementPtr103
    br label %for_step_block15

for_step_block15; preds = %for_body_block16
    %Id_load107 = load i32, i32* %i|addr97
    PreAdd108 = add i32 %Id_load107, 1
    store i32 %PreAdd108, i32* %i|addr97
    br label %for_cond_block14

for_dest_block17; preds = %for_step_block15
    %Id_load109 = load vector*, vector** %x|addr88
    %Id_load110 = load i32*, i32** %a|addr91
    %funccal111 = call void @vector.init(vector* %Id_load109, i32* %Id_load110)
    %StringConst112 = getelementptr [10 x i8], [10 x i8]* @const_string_no3, i32 0, i32 0
    %funccal113 = call void @print(i8* %StringConst112)
    %Id_load114 = load vector*, vector** %x|addr88
    %funccal115 = call i8* @vector.tostring(vector* %Id_load114)
    %funccal116 = call void @println(i8* %funccal115)
    %mainreturn_value87=0
    br label %main_return_block
    br label %main_return_block

main_return_block; preds = %for_dest_block17
    ret i32 %mainreturn_value87

}

