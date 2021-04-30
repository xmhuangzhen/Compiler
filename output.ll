Edge
EdgeList
Array_Node
Heap_Node
Node

@n
@m
@g
@INF
@const_string_no0
@const_string_no1
@const_string_no2

define ReturnType : void
Parameter :  @__init__()
define ReturnType : void
Parameter : EdgeList i32 i32  @EdgeList.init(EdgeList*, i32, i32)
define ReturnType : void
Parameter : EdgeList i32 i32 i32  @EdgeList.addEdge(EdgeList*, i32, i32, i32)
define ReturnType : i32
Parameter : EdgeList  @EdgeList.nVertices(EdgeList*)
define ReturnType : i32
Parameter : EdgeList  @EdgeList.nEdges(EdgeList*)
define ReturnType : void
Parameter : Array_Node  @Array_Node.Array_Node(Array_Node*)
define ReturnType : void
Parameter : Array_Node Node*  @Array_Node.push_back(Array_Node*, Node*)
define ReturnType : Node*
Parameter : Array_Node  @Array_Node.pop_back(Array_Node*)
define ReturnType : Node*
Parameter : Array_Node  @Array_Node.back(Array_Node*)
define ReturnType : Node*
Parameter : Array_Node  @Array_Node.front(Array_Node*)
define ReturnType : i32
Parameter : Array_Node  @Array_Node.size(Array_Node*)
define ReturnType : void
Parameter : Array_Node i32  @Array_Node.resize(Array_Node*, i32)
define ReturnType : Node*
Parameter : Array_Node i32  @Array_Node.get(Array_Node*, i32)
define ReturnType : void
Parameter : Array_Node i32 Node*  @Array_Node.set(Array_Node*, i32, Node*)
define ReturnType : void
Parameter : Array_Node i32 i32  @Array_Node.swap(Array_Node*, i32, i32)
define ReturnType : void
Parameter : Array_Node  @Array_Node.doubleStorage(Array_Node*)
define ReturnType : void
Parameter : Heap_Node  @Heap_Node.Heap_Node(Heap_Node*)
define ReturnType : void
Parameter : Heap_Node Node*  @Heap_Node.push(Heap_Node*, Node*)
define ReturnType : Node*
Parameter : Heap_Node  @Heap_Node.pop(Heap_Node*)
define ReturnType : Node*
Parameter : Heap_Node  @Heap_Node.top(Heap_Node*)
define ReturnType : i32
Parameter : Heap_Node  @Heap_Node.size(Heap_Node*)
define ReturnType : i32
Parameter : Heap_Node i32  @Heap_Node.lchild(Heap_Node*, i32)
define ReturnType : i32
Parameter : Heap_Node i32  @Heap_Node.rchild(Heap_Node*, i32)
define ReturnType : i32
Parameter : Heap_Node i32  @Heap_Node.pnt(Heap_Node*, i32)
define ReturnType : void
Parameter : Heap_Node i32  @Heap_Node.maxHeapify(Heap_Node*, i32)
define ReturnType : i32
Parameter : Node  @Node.key_(Node*)
define ReturnType : void
Parameter :  @init()
define ReturnType : i32*
Parameter : i32  @dijkstra(i32)
define ReturnType : i32
Parameter :  @main()

define ReturnType : void
Parameter :  @__init__(){
__init___entrance_block    store pointer is not pointertypei32
    br label %__init___return_block

__init___return_block; preds = %__init___entrance_block
    ret void

}

define ReturnType : void
Parameter : EdgeList i32 i32  @EdgeList.init(EdgeList*, i32, i32){
EdgeList.init_entrance_block    %this|addr0 = alloca EdgeList**
    store EdgeList* %this, EdgeList** %this|addr0
    %n|addr1 = alloca i32*
    store i32 %n, i32* %n|addr1
    %m|addr2 = alloca i32*
    store i32 %m, i32* %m|addr2
    %ClassAddr_turnto_reg_4 = load EdgeList*, EdgeList** %this|addr0
    %Id_GEP_5 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_4, i32 0, i32 0
    %Id_GEP_Load6 = load Edge**, Edge*** %Id_GEP_5
    %Id_load7 = load i32, i32* %m|addr2
    call_size_18 = mul i32 %Id_load7, 4
    call_size_29 = add i32 %call_size_18, 4
    %call_malloc_func10 = call i8* @malloc(i32 %call_size_29)
    store i32 %Id_load7, i32* %call_malloc_func10
    %call_array_head11 = getelementptr i32, i32* %call_malloc_func10, i32 1
    call_array_head_cast_12 = bitcast i32* %call_array_head11 to Edge**
    store Edge** %call_array_head_cast_12, Edge*** %Id_GEP_5
    %ClassAddr_turnto_reg_13 = load EdgeList*, EdgeList** %this|addr0
    %Id_GEP_14 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_13, i32 0, i32 1
    %Id_GEP_Load15 = load i32*, i32** %Id_GEP_14
    %Id_load16 = load i32, i32* %m|addr2
    call_size_117 = mul i32 %Id_load16, 4
    call_size_218 = add i32 %call_size_117, 4
    %call_malloc_func19 = call i8* @malloc(i32 %call_size_218)
    store i32 %Id_load16, i32* %call_malloc_func19
    %call_array_head20 = getelementptr i32, i32* %call_malloc_func19, i32 1
    call_array_head_cast_21 = bitcast i32* %call_array_head20 to i32*
    store i32* %call_array_head_cast_21, i32** %Id_GEP_14
    %ClassAddr_turnto_reg_22 = load EdgeList*, EdgeList** %this|addr0
    %Id_GEP_23 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_22, i32 0, i32 2
    %Id_GEP_Load24 = load i32*, i32** %Id_GEP_23
    %Id_load25 = load i32, i32* %n|addr1
    call_size_126 = mul i32 %Id_load25, 4
    call_size_227 = add i32 %call_size_126, 4
    %call_malloc_func28 = call i8* @malloc(i32 %call_size_227)
    store i32 %Id_load25, i32* %call_malloc_func28
    %call_array_head29 = getelementptr i32, i32* %call_malloc_func28, i32 1
    call_array_head_cast_30 = bitcast i32* %call_array_head29 to i32*
    store i32* %call_array_head_cast_30, i32** %Id_GEP_23
    %i|addr31 = alloca i32*
    %Id_load32 = load i32, i32* %i|addr31
    store i32 0, i32* %i|addr31
    br label %for_cond_block0

for_cond_block0; preds = %EdgeList.init_entrance_block
    %Id_load33 = load i32, i32* %i|addr31
    %Id_load34 = load i32, i32* %m|addr2
    %slt35 = icmp slt i32 %Id_load33, %Id_load34
    br i1 %slt35, label %for_body_block2, label %for_dest_block3

for_body_block2; preds = %for_cond_block0
    %ClassAddr_turnto_reg_36 = load EdgeList*, EdgeList** %this|addr0
    %Id_GEP_37 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_36, i32 0, i32 1
    %Id_GEP_Load38 = load i32*, i32** %Id_GEP_37
    %Id_load39 = load i32, i32* %i|addr31
    %getElementPtr40 = getelementptr i32, i32* %Id_GEP_Load38, i32 %Id_load39
    %GEP_Load41 = load i32, i32* %getElementPtr40
    store i32 -1, i32* %getElementPtr40
    br label %for_step_block1

for_step_block1; preds = %for_body_block2
    %Id_load42 = load i32, i32* %i|addr31
    PreAdd43 = add i32 %Id_load42, 1
    store i32 %PreAdd43, i32* %i|addr31
    br label %for_cond_block0

for_dest_block3; preds = %for_step_block1
    %Id_load44 = load i32, i32* %i|addr31
    store i32 0, i32* %i|addr31
    br label %for_cond_block4

for_cond_block4; preds = %for_dest_block3
    %Id_load45 = load i32, i32* %i|addr31
    %Id_load46 = load i32, i32* %n|addr1
    %slt47 = icmp slt i32 %Id_load45, %Id_load46
    br i1 %slt47, label %for_body_block6, label %for_dest_block7

for_body_block6; preds = %for_cond_block4
    %ClassAddr_turnto_reg_48 = load EdgeList*, EdgeList** %this|addr0
    %Id_GEP_49 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_48, i32 0, i32 2
    %Id_GEP_Load50 = load i32*, i32** %Id_GEP_49
    %Id_load51 = load i32, i32* %i|addr31
    %getElementPtr52 = getelementptr i32, i32* %Id_GEP_Load50, i32 %Id_load51
    %GEP_Load53 = load i32, i32* %getElementPtr52
    store i32 -1, i32* %getElementPtr52
    br label %for_step_block5

for_step_block5; preds = %for_body_block6
    %Id_load54 = load i32, i32* %i|addr31
    PreAdd55 = add i32 %Id_load54, 1
    store i32 %PreAdd55, i32* %i|addr31
    br label %for_cond_block4

for_dest_block7; preds = %for_step_block5
    %ClassAddr_turnto_reg_56 = load EdgeList*, EdgeList** %this|addr0
    %Id_GEP_57 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_56, i32 0, i32 3
    %Id_GEP_Load58 = load i32, i32* %Id_GEP_57
    store i32 0, i32* %Id_GEP_57
    br label %EdgeList.init_return_block

EdgeList.init_return_block; preds = %for_dest_block7
    ret void

}

define ReturnType : void
Parameter : EdgeList i32 i32 i32  @EdgeList.addEdge(EdgeList*, i32, i32, i32){
EdgeList.addEdge_entrance_block    %this|addr59 = alloca EdgeList**
    store EdgeList* %this, EdgeList** %this|addr59
    %u|addr60 = alloca i32*
    store i32 %u, i32* %u|addr60
    %v|addr61 = alloca i32*
    store i32 %v, i32* %v|addr61
    %w|addr62 = alloca i32*
    store i32 %w, i32* %w|addr62
    %e|addr64 = alloca Edge**
    %Malloc_Result65 = call i8* @malloc(i32 12)
    Malloc_Cast_Result_66 = bitcast i32* %Malloc_Result65 to Edge*
    store Edge* %Malloc_Cast_Result_66, Edge** %e|addr64
    %Id_load67 = load Edge*, Edge** %e|addr64
    %memacc_result68 = getelementptr Edge, Edge* %Id_load67, i32 0, i32 0
    %memacc_result69 = load i32, i32* %memacc_result68
    %Id_load70 = load i32, i32* %u|addr60
    store i32 %Id_load70, i32* %memacc_result68
    %Id_load71 = load Edge*, Edge** %e|addr64
    %memacc_result72 = getelementptr Edge, Edge* %Id_load71, i32 0, i32 1
    %memacc_result73 = load i32, i32* %memacc_result72
    %Id_load74 = load i32, i32* %v|addr61
    store i32 %Id_load74, i32* %memacc_result72
    %Id_load75 = load Edge*, Edge** %e|addr64
    %memacc_result76 = getelementptr Edge, Edge* %Id_load75, i32 0, i32 2
    %memacc_result77 = load i32, i32* %memacc_result76
    %Id_load78 = load i32, i32* %w|addr62
    store i32 %Id_load78, i32* %memacc_result76
    %ClassAddr_turnto_reg_79 = load EdgeList*, EdgeList** %this|addr59
    %Id_GEP_80 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_79, i32 0, i32 0
    %Id_GEP_Load81 = load Edge**, Edge*** %Id_GEP_80
    %ClassAddr_turnto_reg_82 = load EdgeList*, EdgeList** %this|addr59
    %Id_GEP_83 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_82, i32 0, i32 3
    %Id_GEP_Load84 = load i32, i32* %Id_GEP_83
    %getElementPtr85 = getelementptr Edge*, Edge** %Id_GEP_Load81, i32 %Id_GEP_Load84
    %GEP_Load86 = load Edge*, Edge** %getElementPtr85
    %Id_load87 = load Edge*, Edge** %e|addr64
    store Edge* %Id_load87, Edge** %getElementPtr85
    %ClassAddr_turnto_reg_88 = load EdgeList*, EdgeList** %this|addr59
    %Id_GEP_89 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_88, i32 0, i32 1
    %Id_GEP_Load90 = load i32*, i32** %Id_GEP_89
    %ClassAddr_turnto_reg_91 = load EdgeList*, EdgeList** %this|addr59
    %Id_GEP_92 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_91, i32 0, i32 3
    %Id_GEP_Load93 = load i32, i32* %Id_GEP_92
    %getElementPtr94 = getelementptr i32, i32* %Id_GEP_Load90, i32 %Id_GEP_Load93
    %GEP_Load95 = load i32, i32* %getElementPtr94
    %ClassAddr_turnto_reg_96 = load EdgeList*, EdgeList** %this|addr59
    %Id_GEP_97 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_96, i32 0, i32 2
    %Id_GEP_Load98 = load i32*, i32** %Id_GEP_97
    %Id_load99 = load i32, i32* %u|addr60
    %getElementPtr100 = getelementptr i32, i32* %Id_GEP_Load98, i32 %Id_load99
    %GEP_Load101 = load i32, i32* %getElementPtr100
    store i32 %GEP_Load101, i32* %getElementPtr94
    %ClassAddr_turnto_reg_102 = load EdgeList*, EdgeList** %this|addr59
    %Id_GEP_103 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_102, i32 0, i32 2
    %Id_GEP_Load104 = load i32*, i32** %Id_GEP_103
    %Id_load105 = load i32, i32* %u|addr60
    %getElementPtr106 = getelementptr i32, i32* %Id_GEP_Load104, i32 %Id_load105
    %GEP_Load107 = load i32, i32* %getElementPtr106
    %ClassAddr_turnto_reg_108 = load EdgeList*, EdgeList** %this|addr59
    %Id_GEP_109 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_108, i32 0, i32 3
    %Id_GEP_Load110 = load i32, i32* %Id_GEP_109
    store i32 %Id_GEP_Load110, i32* %getElementPtr106
    %ClassAddr_turnto_reg_111 = load EdgeList*, EdgeList** %this|addr59
    %Id_GEP_112 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_111, i32 0, i32 3
    %Id_GEP_Load113 = load i32, i32* %Id_GEP_112
    PreAdd114 = add i32 %Id_GEP_Load113, 1
    store i32 %PreAdd114, i32* %Id_GEP_112
    br label %EdgeList.addEdge_return_block

EdgeList.addEdge_return_block; preds = %EdgeList.addEdge_entrance_block
    ret void

}

define ReturnType : i32
Parameter : EdgeList  @EdgeList.nVertices(EdgeList*){
EdgeList.nVertices_entrance_block    %this|addr115 = alloca EdgeList**
    store EdgeList* %this, EdgeList** %this|addr115
    %ClassAddr_turnto_reg_117 = load EdgeList*, EdgeList** %this|addr115
    %Id_GEP_118 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_117, i32 0, i32 2
    %Id_GEP_Load119 = load i32*, i32** %Id_GEP_118
    %array_size120 = getelementptr i32, i32* %Id_GEP_Load119, i32 -1
    %array_size_load121 = load i32, i32* %array_size120
    %EdgeList.nVerticesreturn_value116=%array_size_load121
    br label %EdgeList.nVertices_return_block
    br label %EdgeList.nVertices_return_block

EdgeList.nVertices_return_block; preds = %EdgeList.nVertices_entrance_block
    ret i32 %EdgeList.nVerticesreturn_value116

}

define ReturnType : i32
Parameter : EdgeList  @EdgeList.nEdges(EdgeList*){
EdgeList.nEdges_entrance_block    %this|addr122 = alloca EdgeList**
    store EdgeList* %this, EdgeList** %this|addr122
    %ClassAddr_turnto_reg_124 = load EdgeList*, EdgeList** %this|addr122
    %Id_GEP_125 = getelementptr EdgeList, EdgeList* %ClassAddr_turnto_reg_124, i32 0, i32 0
    %Id_GEP_Load126 = load Edge**, Edge*** %Id_GEP_125
    %array_size127 = getelementptr Edge*, Edge** %Id_GEP_Load126, i32 -1
    %array_size_load128 = load i32, i32* %array_size127
    %EdgeList.nEdgesreturn_value123=%array_size_load128
    br label %EdgeList.nEdges_return_block
    br label %EdgeList.nEdges_return_block

EdgeList.nEdges_return_block; preds = %EdgeList.nEdges_entrance_block
    ret i32 %EdgeList.nEdgesreturn_value123

}

define ReturnType : void
Parameter : Array_Node  @Array_Node.Array_Node(Array_Node*){
Array_Node.Array_Node_entrance_block    %this|addr306 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr306
    %ClassAddr_turnto_reg_307 = load Array_Node*, Array_Node** %this|addr306
    %Id_GEP_308 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_307, i32 0, i32 1
    %Id_GEP_Load309 = load i32, i32* %Id_GEP_308
    store i32 0, i32* %Id_GEP_308
    %ClassAddr_turnto_reg_310 = load Array_Node*, Array_Node** %this|addr306
    %Id_GEP_311 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_310, i32 0, i32 0
    %Id_GEP_Load312 = load Node**, Node*** %Id_GEP_311
    call_size_1313 = mul i32 16, 4
    call_size_2314 = add i32 %call_size_1313, 4
    %call_malloc_func315 = call i8* @malloc(i32 %call_size_2314)
    store i32 16, i32* %call_malloc_func315
    %call_array_head316 = getelementptr i32, i32* %call_malloc_func315, i32 1
    call_array_head_cast_317 = bitcast i32* %call_array_head316 to Node**
    store Node** %call_array_head_cast_317, Node*** %Id_GEP_311
    br label %Array_Node.Array_Node_return_block

Array_Node.Array_Node_return_block; preds = %Array_Node.Array_Node_entrance_block
    ret void

}

define ReturnType : void
Parameter : Array_Node Node*  @Array_Node.push_back(Array_Node*, Node*){
Array_Node.push_back_entrance_block    %this|addr129 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr129
    %v|addr130 = alloca Node**
    store Node* %v, Node** %v|addr130
    %CastToResult133 = load Array_Node*, Array_Node** %this|addr129
    %funccal132 = call i32 @Array_Node.size(Array_Node* %CastToResult133)
    %ClassAddr_turnto_reg_134 = load Array_Node*, Array_Node** %this|addr129
    %Id_GEP_135 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_134, i32 0, i32 0
    %Id_GEP_Load136 = load Node**, Node*** %Id_GEP_135
    %array_size137 = getelementptr Node*, Node** %Id_GEP_Load136, i32 -1
    %array_size_load138 = load i32, i32* %array_size137
    %eq139 = icmp eq i32 %funccal132, %array_size_load138
    br i1 %eq139, label %if_then_block8, label %if_dest_block9

if_then_block8; preds = %Array_Node.push_back_entrance_block
    %CastToResult141 = load Array_Node*, Array_Node** %this|addr129
    %funccal140 = call void @Array_Node.doubleStorage(Array_Node* %CastToResult141)
    br label %if_dest_block9

if_dest_block9; preds = %if_then_block8
    %ClassAddr_turnto_reg_142 = load Array_Node*, Array_Node** %this|addr129
    %Id_GEP_143 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_142, i32 0, i32 0
    %Id_GEP_Load144 = load Node**, Node*** %Id_GEP_143
    %ClassAddr_turnto_reg_145 = load Array_Node*, Array_Node** %this|addr129
    %Id_GEP_146 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_145, i32 0, i32 1
    %Id_GEP_Load147 = load i32, i32* %Id_GEP_146
    %getElementPtr148 = getelementptr Node*, Node** %Id_GEP_Load144, i32 %Id_GEP_Load147
    %GEP_Load149 = load Node*, Node** %getElementPtr148
    %Id_load150 = load Node*, Node** %v|addr130
    store Node* %Id_load150, Node** %getElementPtr148
    %ClassAddr_turnto_reg_151 = load Array_Node*, Array_Node** %this|addr129
    %Id_GEP_152 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_151, i32 0, i32 1
    %Id_GEP_Load153 = load i32, i32* %Id_GEP_152
    PreAdd154 = add i32 %Id_GEP_Load153, 1
    store i32 %PreAdd154, i32* %Id_GEP_152
    br label %Array_Node.push_back_return_block

Array_Node.push_back_return_block; preds = %if_dest_block9
    ret void

}

define ReturnType : Node*
Parameter : Array_Node  @Array_Node.pop_back(Array_Node*){
Array_Node.pop_back_entrance_block    %this|addr155 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr155
    %ClassAddr_turnto_reg_157 = load Array_Node*, Array_Node** %this|addr155
    %Id_GEP_158 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_157, i32 0, i32 1
    %Id_GEP_Load159 = load i32, i32* %Id_GEP_158
    PreSub160 = sub i32 %Id_GEP_Load159, 1
    store i32 %PreSub160, i32* %Id_GEP_158
    %ClassAddr_turnto_reg_161 = load Array_Node*, Array_Node** %this|addr155
    %Id_GEP_162 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_161, i32 0, i32 0
    %Id_GEP_Load163 = load Node**, Node*** %Id_GEP_162
    %ClassAddr_turnto_reg_164 = load Array_Node*, Array_Node** %this|addr155
    %Id_GEP_165 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_164, i32 0, i32 1
    %Id_GEP_Load166 = load i32, i32* %Id_GEP_165
    %getElementPtr167 = getelementptr Node*, Node** %Id_GEP_Load163, i32 %Id_GEP_Load166
    %GEP_Load168 = load Node*, Node** %getElementPtr167
    %Array_Node.pop_backreturn_value156=%GEP_Load168
    br label %Array_Node.pop_back_return_block
    br label %Array_Node.pop_back_return_block

Array_Node.pop_back_return_block; preds = %Array_Node.pop_back_entrance_block
    ret Node* %Array_Node.pop_backreturn_value156

}

define ReturnType : Node*
Parameter : Array_Node  @Array_Node.back(Array_Node*){
Array_Node.back_entrance_block    %this|addr169 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr169
    %ClassAddr_turnto_reg_171 = load Array_Node*, Array_Node** %this|addr169
    %Id_GEP_172 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_171, i32 0, i32 0
    %Id_GEP_Load173 = load Node**, Node*** %Id_GEP_172
    %ClassAddr_turnto_reg_174 = load Array_Node*, Array_Node** %this|addr169
    %Id_GEP_175 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_174, i32 0, i32 1
    %Id_GEP_Load176 = load i32, i32* %Id_GEP_175
    sub177 = sub i32 %Id_GEP_Load176, 1
    %getElementPtr178 = getelementptr Node*, Node** %Id_GEP_Load173, i32 %sub177
    %GEP_Load179 = load Node*, Node** %getElementPtr178
    %Array_Node.backreturn_value170=%GEP_Load179
    br label %Array_Node.back_return_block
    br label %Array_Node.back_return_block

Array_Node.back_return_block; preds = %Array_Node.back_entrance_block
    ret Node* %Array_Node.backreturn_value170

}

define ReturnType : Node*
Parameter : Array_Node  @Array_Node.front(Array_Node*){
Array_Node.front_entrance_block    %this|addr180 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr180
    %ClassAddr_turnto_reg_182 = load Array_Node*, Array_Node** %this|addr180
    %Id_GEP_183 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_182, i32 0, i32 0
    %Id_GEP_Load184 = load Node**, Node*** %Id_GEP_183
    %getElementPtr185 = getelementptr Node*, Node** %Id_GEP_Load184, i32 0
    %GEP_Load186 = load Node*, Node** %getElementPtr185
    %Array_Node.frontreturn_value181=%GEP_Load186
    br label %Array_Node.front_return_block
    br label %Array_Node.front_return_block

Array_Node.front_return_block; preds = %Array_Node.front_entrance_block
    ret Node* %Array_Node.frontreturn_value181

}

define ReturnType : i32
Parameter : Array_Node  @Array_Node.size(Array_Node*){
Array_Node.size_entrance_block    %this|addr187 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr187
    %ClassAddr_turnto_reg_189 = load Array_Node*, Array_Node** %this|addr187
    %Id_GEP_190 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_189, i32 0, i32 1
    %Id_GEP_Load191 = load i32, i32* %Id_GEP_190
    %Array_Node.sizereturn_value188=%Id_GEP_Load191
    br label %Array_Node.size_return_block
    br label %Array_Node.size_return_block

Array_Node.size_return_block; preds = %Array_Node.size_entrance_block
    ret i32 %Array_Node.sizereturn_value188

}

define ReturnType : void
Parameter : Array_Node i32  @Array_Node.resize(Array_Node*, i32){
Array_Node.resize_entrance_block    %this|addr192 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr192
    %newSize|addr193 = alloca i32*
    store i32 %newSize, i32* %newSize|addr193
    br label %while_cond_block10

while_cond_block10; preds = %Array_Node.resize_entrance_block
    %ClassAddr_turnto_reg_195 = load Array_Node*, Array_Node** %this|addr192
    %Id_GEP_196 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_195, i32 0, i32 0
    %Id_GEP_Load197 = load Node**, Node*** %Id_GEP_196
    %array_size198 = getelementptr Node*, Node** %Id_GEP_Load197, i32 -1
    %array_size_load199 = load i32, i32* %array_size198
    %Id_load200 = load i32, i32* %newSize|addr193
    %slt201 = icmp slt i32 %array_size_load199, %Id_load200
    br i1 %slt201, label %while_body_block11, label %while_dest_block12

while_body_block11; preds = %while_cond_block10
    %CastToResult203 = load Array_Node*, Array_Node** %this|addr192
    %funccal202 = call void @Array_Node.doubleStorage(Array_Node* %CastToResult203)
    br label %while_cond_block10

while_dest_block12; preds = %while_body_block11
    %ClassAddr_turnto_reg_204 = load Array_Node*, Array_Node** %this|addr192
    %Id_GEP_205 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_204, i32 0, i32 1
    %Id_GEP_Load206 = load i32, i32* %Id_GEP_205
    %Id_load207 = load i32, i32* %newSize|addr193
    store i32 %Id_load207, i32* %Id_GEP_205
    br label %Array_Node.resize_return_block

Array_Node.resize_return_block; preds = %while_dest_block12
    ret void

}

define ReturnType : Node*
Parameter : Array_Node i32  @Array_Node.get(Array_Node*, i32){
Array_Node.get_entrance_block    %this|addr208 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr208
    %i|addr209 = alloca i32*
    store i32 %i, i32* %i|addr209
    %ClassAddr_turnto_reg_211 = load Array_Node*, Array_Node** %this|addr208
    %Id_GEP_212 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_211, i32 0, i32 0
    %Id_GEP_Load213 = load Node**, Node*** %Id_GEP_212
    %Id_load214 = load i32, i32* %i|addr209
    %getElementPtr215 = getelementptr Node*, Node** %Id_GEP_Load213, i32 %Id_load214
    %GEP_Load216 = load Node*, Node** %getElementPtr215
    %Array_Node.getreturn_value210=%GEP_Load216
    br label %Array_Node.get_return_block
    br label %Array_Node.get_return_block

Array_Node.get_return_block; preds = %Array_Node.get_entrance_block
    ret Node* %Array_Node.getreturn_value210

}

define ReturnType : void
Parameter : Array_Node i32 Node*  @Array_Node.set(Array_Node*, i32, Node*){
Array_Node.set_entrance_block    %this|addr217 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr217
    %i|addr218 = alloca i32*
    store i32 %i, i32* %i|addr218
    %v|addr219 = alloca Node**
    store Node* %v, Node** %v|addr219
    %ClassAddr_turnto_reg_221 = load Array_Node*, Array_Node** %this|addr217
    %Id_GEP_222 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_221, i32 0, i32 0
    %Id_GEP_Load223 = load Node**, Node*** %Id_GEP_222
    %Id_load224 = load i32, i32* %i|addr218
    %getElementPtr225 = getelementptr Node*, Node** %Id_GEP_Load223, i32 %Id_load224
    %GEP_Load226 = load Node*, Node** %getElementPtr225
    %Id_load227 = load Node*, Node** %v|addr219
    store Node* %Id_load227, Node** %getElementPtr225
    br label %Array_Node.set_return_block

Array_Node.set_return_block; preds = %Array_Node.set_entrance_block
    ret void

}

define ReturnType : void
Parameter : Array_Node i32 i32  @Array_Node.swap(Array_Node*, i32, i32){
Array_Node.swap_entrance_block    %this|addr228 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr228
    %i|addr229 = alloca i32*
    store i32 %i, i32* %i|addr229
    %j|addr230 = alloca i32*
    store i32 %j, i32* %j|addr230
    %t|addr232 = alloca Node**
    %ClassAddr_turnto_reg_233 = load Array_Node*, Array_Node** %this|addr228
    %Id_GEP_234 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_233, i32 0, i32 0
    %Id_GEP_Load235 = load Node**, Node*** %Id_GEP_234
    %Id_load236 = load i32, i32* %i|addr229
    %getElementPtr237 = getelementptr Node*, Node** %Id_GEP_Load235, i32 %Id_load236
    %GEP_Load238 = load Node*, Node** %getElementPtr237
    store Node* %GEP_Load238, Node** %t|addr232
    %ClassAddr_turnto_reg_239 = load Array_Node*, Array_Node** %this|addr228
    %Id_GEP_240 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_239, i32 0, i32 0
    %Id_GEP_Load241 = load Node**, Node*** %Id_GEP_240
    %Id_load242 = load i32, i32* %i|addr229
    %getElementPtr243 = getelementptr Node*, Node** %Id_GEP_Load241, i32 %Id_load242
    %GEP_Load244 = load Node*, Node** %getElementPtr243
    %ClassAddr_turnto_reg_245 = load Array_Node*, Array_Node** %this|addr228
    %Id_GEP_246 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_245, i32 0, i32 0
    %Id_GEP_Load247 = load Node**, Node*** %Id_GEP_246
    %Id_load248 = load i32, i32* %j|addr230
    %getElementPtr249 = getelementptr Node*, Node** %Id_GEP_Load247, i32 %Id_load248
    %GEP_Load250 = load Node*, Node** %getElementPtr249
    store Node* %GEP_Load250, Node** %getElementPtr243
    %ClassAddr_turnto_reg_251 = load Array_Node*, Array_Node** %this|addr228
    %Id_GEP_252 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_251, i32 0, i32 0
    %Id_GEP_Load253 = load Node**, Node*** %Id_GEP_252
    %Id_load254 = load i32, i32* %j|addr230
    %getElementPtr255 = getelementptr Node*, Node** %Id_GEP_Load253, i32 %Id_load254
    %GEP_Load256 = load Node*, Node** %getElementPtr255
    %Id_load257 = load Node*, Node** %t|addr232
    store Node* %Id_load257, Node** %getElementPtr255
    br label %Array_Node.swap_return_block

Array_Node.swap_return_block; preds = %Array_Node.swap_entrance_block
    ret void

}

define ReturnType : void
Parameter : Array_Node  @Array_Node.doubleStorage(Array_Node*){
Array_Node.doubleStorage_entrance_block    %this|addr258 = alloca Array_Node**
    store Array_Node* %this, Array_Node** %this|addr258
    %copy|addr260 = alloca Node***
    %ClassAddr_turnto_reg_261 = load Array_Node*, Array_Node** %this|addr258
    %Id_GEP_262 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_261, i32 0, i32 0
    %Id_GEP_Load263 = load Node**, Node*** %Id_GEP_262
    store Node** %Id_GEP_Load263, Node*** %copy|addr260
    %szCopy|addr264 = alloca i32*
    %ClassAddr_turnto_reg_265 = load Array_Node*, Array_Node** %this|addr258
    %Id_GEP_266 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_265, i32 0, i32 1
    %Id_GEP_Load267 = load i32, i32* %Id_GEP_266
    store i32 %Id_GEP_Load267, i32* %szCopy|addr264
    %ClassAddr_turnto_reg_268 = load Array_Node*, Array_Node** %this|addr258
    %Id_GEP_269 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_268, i32 0, i32 0
    %Id_GEP_Load270 = load Node**, Node*** %Id_GEP_269
    %Id_load271 = load Node**, Node*** %copy|addr260
    %array_size272 = getelementptr Node*, Node** %Id_load271, i32 -1
    %array_size_load273 = load i32, i32* %array_size272
    mul274 = mul i32 %array_size_load273, 2
    call_size_1275 = mul i32 %mul274, 4
    call_size_2276 = add i32 %call_size_1275, 4
    %call_malloc_func277 = call i8* @malloc(i32 %call_size_2276)
    store i32 %mul274, i32* %call_malloc_func277
    %call_array_head278 = getelementptr i32, i32* %call_malloc_func277, i32 1
    call_array_head_cast_279 = bitcast i32* %call_array_head278 to Node**
    store Node** %call_array_head_cast_279, Node*** %Id_GEP_269
    %ClassAddr_turnto_reg_280 = load Array_Node*, Array_Node** %this|addr258
    %Id_GEP_281 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_280, i32 0, i32 1
    %Id_GEP_Load282 = load i32, i32* %Id_GEP_281
    store i32 0, i32* %Id_GEP_281
    br label %for_cond_block13

for_cond_block13; preds = %Array_Node.doubleStorage_entrance_block
    %ClassAddr_turnto_reg_283 = load Array_Node*, Array_Node** %this|addr258
    %Id_GEP_284 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_283, i32 0, i32 1
    %Id_GEP_Load285 = load i32, i32* %Id_GEP_284
    %Id_load286 = load i32, i32* %szCopy|addr264
    %ne287 = icmp ne i32 %Id_GEP_Load285, %Id_load286
    br i1 %ne287, label %for_body_block15, label %for_dest_block16

for_body_block15; preds = %for_cond_block13
    %ClassAddr_turnto_reg_288 = load Array_Node*, Array_Node** %this|addr258
    %Id_GEP_289 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_288, i32 0, i32 0
    %Id_GEP_Load290 = load Node**, Node*** %Id_GEP_289
    %ClassAddr_turnto_reg_291 = load Array_Node*, Array_Node** %this|addr258
    %Id_GEP_292 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_291, i32 0, i32 1
    %Id_GEP_Load293 = load i32, i32* %Id_GEP_292
    %getElementPtr294 = getelementptr Node*, Node** %Id_GEP_Load290, i32 %Id_GEP_Load293
    %GEP_Load295 = load Node*, Node** %getElementPtr294
    %Id_load296 = load Node**, Node*** %copy|addr260
    %ClassAddr_turnto_reg_297 = load Array_Node*, Array_Node** %this|addr258
    %Id_GEP_298 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_297, i32 0, i32 1
    %Id_GEP_Load299 = load i32, i32* %Id_GEP_298
    %getElementPtr300 = getelementptr Node*, Node** %Id_load296, i32 %Id_GEP_Load299
    %GEP_Load301 = load Node*, Node** %getElementPtr300
    store Node* %GEP_Load301, Node** %getElementPtr294
    br label %for_step_block14

for_step_block14; preds = %for_body_block15
    %ClassAddr_turnto_reg_302 = load Array_Node*, Array_Node** %this|addr258
    %Id_GEP_303 = getelementptr Array_Node, Array_Node* %ClassAddr_turnto_reg_302, i32 0, i32 1
    %Id_GEP_Load304 = load i32, i32* %Id_GEP_303
    PreAdd305 = add i32 %Id_GEP_Load304, 1
    store i32 %PreAdd305, i32* %Id_GEP_303
    br label %for_cond_block13

for_dest_block16; preds = %for_step_block14
    br label %Array_Node.doubleStorage_return_block

Array_Node.doubleStorage_return_block; preds = %for_dest_block16
    ret void

}

define ReturnType : void
Parameter : Heap_Node  @Heap_Node.Heap_Node(Heap_Node*){
Heap_Node.Heap_Node_entrance_block    %this|addr471 = alloca Heap_Node**
    store Heap_Node* %this, Heap_Node** %this|addr471
    %ClassAddr_turnto_reg_472 = load Heap_Node*, Heap_Node** %this|addr471
    %Id_GEP_473 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_472, i32 0, i32 0
    %Id_GEP_Load474 = load Array_Node*, Array_Node** %Id_GEP_473
    %Malloc_Result475 = call i8* @malloc(i32 8)
    Malloc_Cast_Result_476 = bitcast i32* %Malloc_Result475 to Array_Node*
    call void @Array_Node.Array_Node(Array_Node* %Malloc_Cast_Result_476)
    store Array_Node* %Malloc_Cast_Result_476, Array_Node** %Id_GEP_473
    br label %Heap_Node.Heap_Node_return_block

Heap_Node.Heap_Node_return_block; preds = %Heap_Node.Heap_Node_entrance_block
    ret void

}

define ReturnType : void
Parameter : Heap_Node Node*  @Heap_Node.push(Heap_Node*, Node*){
Heap_Node.push_entrance_block    %this|addr318 = alloca Heap_Node**
    store Heap_Node* %this, Heap_Node** %this|addr318
    %v|addr319 = alloca Node**
    store Node* %v, Node** %v|addr319
    %ClassAddr_turnto_reg_321 = load Heap_Node*, Heap_Node** %this|addr318
    %Id_GEP_322 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_321, i32 0, i32 0
    %Id_GEP_Load323 = load Array_Node*, Array_Node** %Id_GEP_322
    %Id_load324 = load Node*, Node** %v|addr319
    %funccal325 = call void @Array_Node.push_back(Array_Node* %Id_GEP_Load323, Node* %Id_load324)
    %x|addr326 = alloca i32*
    %CastToResult328 = load Heap_Node*, Heap_Node** %this|addr318
    %funccal327 = call i32 @Heap_Node.size(Heap_Node* %CastToResult328)
    sub329 = sub i32 %funccal327, 1
    store i32 %sub329, i32* %x|addr326
    br label %while_cond_block17

while_cond_block17; preds = %Heap_Node.push_entrance_block
    %Id_load330 = load i32, i32* %x|addr326
    %sgt331 = icmp sgt i32 %Id_load330, 0
    br i1 %sgt331, label %while_body_block18, label %while_dest_block19

while_body_block18; preds = %while_cond_block17
    %p|addr332 = alloca i32*
    %Id_load333 = load i32, i32* %x|addr326
    %CastToResult335 = load Heap_Node*, Heap_Node** %this|addr318
    %funccal334 = call i32 @Heap_Node.pnt(Heap_Node* %CastToResult335, i32 %Id_load333)
    store i32 %funccal334, i32* %p|addr332
    %ClassAddr_turnto_reg_336 = load Heap_Node*, Heap_Node** %this|addr318
    %Id_GEP_337 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_336, i32 0, i32 0
    %Id_GEP_Load338 = load Array_Node*, Array_Node** %Id_GEP_337
    %Id_load339 = load i32, i32* %p|addr332
    %funccal340 = call Node* @Array_Node.get(Array_Node* %Id_GEP_Load338, i32 %Id_load339)
    %funccal341 = call i32 @Node.key_(Node* %funccal340)
    %ClassAddr_turnto_reg_342 = load Heap_Node*, Heap_Node** %this|addr318
    %Id_GEP_343 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_342, i32 0, i32 0
    %Id_GEP_Load344 = load Array_Node*, Array_Node** %Id_GEP_343
    %Id_load345 = load i32, i32* %x|addr326
    %funccal346 = call Node* @Array_Node.get(Array_Node* %Id_GEP_Load344, i32 %Id_load345)
    %funccal347 = call i32 @Node.key_(Node* %funccal346)
    %sge348 = icmp sge i32 %funccal341, %funccal347
    br i1 %sge348, label %if_then_block20, label %if_dest_block21

if_then_block20; preds = %while_body_block18
    br label %while_dest_block19
    br label %if_dest_block21

if_dest_block21; preds = %if_then_block20
    %ClassAddr_turnto_reg_349 = load Heap_Node*, Heap_Node** %this|addr318
    %Id_GEP_350 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_349, i32 0, i32 0
    %Id_GEP_Load351 = load Array_Node*, Array_Node** %Id_GEP_350
    %Id_load352 = load i32, i32* %p|addr332
    %Id_load353 = load i32, i32* %x|addr326
    %funccal354 = call void @Array_Node.swap(Array_Node* %Id_GEP_Load351, i32 %Id_load352, i32 %Id_load353)
    %Id_load355 = load i32, i32* %x|addr326
    %Id_load356 = load i32, i32* %p|addr332
    store i32 %Id_load356, i32* %x|addr326
    br label %while_cond_block17

while_dest_block19; preds = %if_dest_block21
    br label %Heap_Node.push_return_block

Heap_Node.push_return_block; preds = %while_dest_block19
    ret void

}

define ReturnType : Node*
Parameter : Heap_Node  @Heap_Node.pop(Heap_Node*){
Heap_Node.pop_entrance_block    %this|addr357 = alloca Heap_Node**
    store Heap_Node* %this, Heap_Node** %this|addr357
    %res|addr359 = alloca Node**
    %ClassAddr_turnto_reg_360 = load Heap_Node*, Heap_Node** %this|addr357
    %Id_GEP_361 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_360, i32 0, i32 0
    %Id_GEP_Load362 = load Array_Node*, Array_Node** %Id_GEP_361
    %funccal363 = call Node* @Array_Node.front(Array_Node* %Id_GEP_Load362)
    store Node* %funccal363, Node** %res|addr359
    %ClassAddr_turnto_reg_364 = load Heap_Node*, Heap_Node** %this|addr357
    %Id_GEP_365 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_364, i32 0, i32 0
    %Id_GEP_Load366 = load Array_Node*, Array_Node** %Id_GEP_365
    %CastToResult368 = load Heap_Node*, Heap_Node** %this|addr357
    %funccal367 = call i32 @Heap_Node.size(Heap_Node* %CastToResult368)
    sub369 = sub i32 %funccal367, 1
    %funccal370 = call void @Array_Node.swap(Array_Node* %Id_GEP_Load366, i32 0, i32 %sub369)
    %ClassAddr_turnto_reg_371 = load Heap_Node*, Heap_Node** %this|addr357
    %Id_GEP_372 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_371, i32 0, i32 0
    %Id_GEP_Load373 = load Array_Node*, Array_Node** %Id_GEP_372
    %funccal374 = call Node* @Array_Node.pop_back(Array_Node* %Id_GEP_Load373)
    %CastToResult376 = load Heap_Node*, Heap_Node** %this|addr357
    %funccal375 = call void @Heap_Node.maxHeapify(Heap_Node* %CastToResult376, i32 0)
    %Id_load377 = load Node*, Node** %res|addr359
    %Heap_Node.popreturn_value358=%Id_load377
    br label %Heap_Node.pop_return_block
    br label %Heap_Node.pop_return_block

Heap_Node.pop_return_block; preds = %Heap_Node.pop_entrance_block
    ret Node* %Heap_Node.popreturn_value358

}

define ReturnType : Node*
Parameter : Heap_Node  @Heap_Node.top(Heap_Node*){
Heap_Node.top_entrance_block    %this|addr378 = alloca Heap_Node**
    store Heap_Node* %this, Heap_Node** %this|addr378
    %ClassAddr_turnto_reg_380 = load Heap_Node*, Heap_Node** %this|addr378
    %Id_GEP_381 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_380, i32 0, i32 0
    %Id_GEP_Load382 = load Array_Node*, Array_Node** %Id_GEP_381
    %funccal383 = call Node* @Array_Node.front(Array_Node* %Id_GEP_Load382)
    %Heap_Node.topreturn_value379=%funccal383
    br label %Heap_Node.top_return_block
    br label %Heap_Node.top_return_block

Heap_Node.top_return_block; preds = %Heap_Node.top_entrance_block
    ret Node* %Heap_Node.topreturn_value379

}

define ReturnType : i32
Parameter : Heap_Node  @Heap_Node.size(Heap_Node*){
Heap_Node.size_entrance_block    %this|addr384 = alloca Heap_Node**
    store Heap_Node* %this, Heap_Node** %this|addr384
    %ClassAddr_turnto_reg_386 = load Heap_Node*, Heap_Node** %this|addr384
    %Id_GEP_387 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_386, i32 0, i32 0
    %Id_GEP_Load388 = load Array_Node*, Array_Node** %Id_GEP_387
    %funccal389 = call i32 @Array_Node.size(Array_Node* %Id_GEP_Load388)
    %Heap_Node.sizereturn_value385=%funccal389
    br label %Heap_Node.size_return_block
    br label %Heap_Node.size_return_block

Heap_Node.size_return_block; preds = %Heap_Node.size_entrance_block
    ret i32 %Heap_Node.sizereturn_value385

}

define ReturnType : i32
Parameter : Heap_Node i32  @Heap_Node.lchild(Heap_Node*, i32){
Heap_Node.lchild_entrance_block    %this|addr390 = alloca Heap_Node**
    store Heap_Node* %this, Heap_Node** %this|addr390
    %x|addr391 = alloca i32*
    store i32 %x, i32* %x|addr391
    %Id_load393 = load i32, i32* %x|addr391
    mul394 = mul i32 %Id_load393, 2
    add395 = add i32 %mul394, 1
    %Heap_Node.lchildreturn_value392=%add395
    br label %Heap_Node.lchild_return_block
    br label %Heap_Node.lchild_return_block

Heap_Node.lchild_return_block; preds = %Heap_Node.lchild_entrance_block
    ret i32 %Heap_Node.lchildreturn_value392

}

define ReturnType : i32
Parameter : Heap_Node i32  @Heap_Node.rchild(Heap_Node*, i32){
Heap_Node.rchild_entrance_block    %this|addr396 = alloca Heap_Node**
    store Heap_Node* %this, Heap_Node** %this|addr396
    %x|addr397 = alloca i32*
    store i32 %x, i32* %x|addr397
    %Id_load399 = load i32, i32* %x|addr397
    mul400 = mul i32 %Id_load399, 2
    add401 = add i32 %mul400, 2
    %Heap_Node.rchildreturn_value398=%add401
    br label %Heap_Node.rchild_return_block
    br label %Heap_Node.rchild_return_block

Heap_Node.rchild_return_block; preds = %Heap_Node.rchild_entrance_block
    ret i32 %Heap_Node.rchildreturn_value398

}

define ReturnType : i32
Parameter : Heap_Node i32  @Heap_Node.pnt(Heap_Node*, i32){
Heap_Node.pnt_entrance_block    %this|addr402 = alloca Heap_Node**
    store Heap_Node* %this, Heap_Node** %this|addr402
    %x|addr403 = alloca i32*
    store i32 %x, i32* %x|addr403
    %Id_load405 = load i32, i32* %x|addr403
    sub406 = sub i32 %Id_load405, 1
    sdiv407 = sdiv i32 %sub406, 2
    %Heap_Node.pntreturn_value404=%sdiv407
    br label %Heap_Node.pnt_return_block
    br label %Heap_Node.pnt_return_block

Heap_Node.pnt_return_block; preds = %Heap_Node.pnt_entrance_block
    ret i32 %Heap_Node.pntreturn_value404

}

define ReturnType : void
Parameter : Heap_Node i32  @Heap_Node.maxHeapify(Heap_Node*, i32){
Heap_Node.maxHeapify_entrance_block    %this|addr408 = alloca Heap_Node**
    store Heap_Node* %this, Heap_Node** %this|addr408
    %x|addr409 = alloca i32*
    store i32 %x, i32* %x|addr409
    %l|addr411 = alloca i32*
    %Id_load412 = load i32, i32* %x|addr409
    %CastToResult414 = load Heap_Node*, Heap_Node** %this|addr408
    %funccal413 = call i32 @Heap_Node.lchild(Heap_Node* %CastToResult414, i32 %Id_load412)
    store i32 %funccal413, i32* %l|addr411
    %r|addr415 = alloca i32*
    %Id_load416 = load i32, i32* %x|addr409
    %CastToResult418 = load Heap_Node*, Heap_Node** %this|addr408
    %funccal417 = call i32 @Heap_Node.rchild(Heap_Node* %CastToResult418, i32 %Id_load416)
    store i32 %funccal417, i32* %r|addr415
    %largest|addr419 = alloca i32*
    %Id_load420 = load i32, i32* %x|addr409
    store i32 %Id_load420, i32* %largest|addr419
    %Id_load421 = load i32, i32* %l|addr411
    %CastToResult423 = load Heap_Node*, Heap_Node** %this|addr408
    %funccal422 = call i32 @Heap_Node.size(Heap_Node* %CastToResult423)
    %slt424 = icmp slt i32 %Id_load421, %funccal422
    br i1 %slt424, label %andand_bb24, label %if_dest_block23

andand_bb24; preds = %Heap_Node.maxHeapify_entrance_block
    %ClassAddr_turnto_reg_425 = load Heap_Node*, Heap_Node** %this|addr408
    %Id_GEP_426 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_425, i32 0, i32 0
    %Id_GEP_Load427 = load Array_Node*, Array_Node** %Id_GEP_426
    %Id_load428 = load i32, i32* %l|addr411
    %funccal429 = call Node* @Array_Node.get(Array_Node* %Id_GEP_Load427, i32 %Id_load428)
    %funccal430 = call i32 @Node.key_(Node* %funccal429)
    %ClassAddr_turnto_reg_431 = load Heap_Node*, Heap_Node** %this|addr408
    %Id_GEP_432 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_431, i32 0, i32 0
    %Id_GEP_Load433 = load Array_Node*, Array_Node** %Id_GEP_432
    %Id_load434 = load i32, i32* %largest|addr419
    %funccal435 = call Node* @Array_Node.get(Array_Node* %Id_GEP_Load433, i32 %Id_load434)
    %funccal436 = call i32 @Node.key_(Node* %funccal435)
    %sgt437 = icmp sgt i32 %funccal430, %funccal436
    br i1 %sgt437, label %if_then_block22, label %if_dest_block23

if_then_block22; preds = %andand_bb24
    %Id_load438 = load i32, i32* %largest|addr419
    %Id_load439 = load i32, i32* %l|addr411
    store i32 %Id_load439, i32* %largest|addr419
    br label %if_dest_block23

if_dest_block23; preds = %if_then_block22
    %Id_load440 = load i32, i32* %r|addr415
    %CastToResult442 = load Heap_Node*, Heap_Node** %this|addr408
    %funccal441 = call i32 @Heap_Node.size(Heap_Node* %CastToResult442)
    %slt443 = icmp slt i32 %Id_load440, %funccal441
    br i1 %slt443, label %andand_bb27, label %if_dest_block26

andand_bb27; preds = %if_dest_block23
    %ClassAddr_turnto_reg_444 = load Heap_Node*, Heap_Node** %this|addr408
    %Id_GEP_445 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_444, i32 0, i32 0
    %Id_GEP_Load446 = load Array_Node*, Array_Node** %Id_GEP_445
    %Id_load447 = load i32, i32* %r|addr415
    %funccal448 = call Node* @Array_Node.get(Array_Node* %Id_GEP_Load446, i32 %Id_load447)
    %funccal449 = call i32 @Node.key_(Node* %funccal448)
    %ClassAddr_turnto_reg_450 = load Heap_Node*, Heap_Node** %this|addr408
    %Id_GEP_451 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_450, i32 0, i32 0
    %Id_GEP_Load452 = load Array_Node*, Array_Node** %Id_GEP_451
    %Id_load453 = load i32, i32* %largest|addr419
    %funccal454 = call Node* @Array_Node.get(Array_Node* %Id_GEP_Load452, i32 %Id_load453)
    %funccal455 = call i32 @Node.key_(Node* %funccal454)
    %sgt456 = icmp sgt i32 %funccal449, %funccal455
    br i1 %sgt456, label %if_then_block25, label %if_dest_block26

if_then_block25; preds = %andand_bb27
    %Id_load457 = load i32, i32* %largest|addr419
    %Id_load458 = load i32, i32* %r|addr415
    store i32 %Id_load458, i32* %largest|addr419
    br label %if_dest_block26

if_dest_block26; preds = %if_then_block25
    %Id_load459 = load i32, i32* %largest|addr419
    %Id_load460 = load i32, i32* %x|addr409
    %eq461 = icmp eq i32 %Id_load459, %Id_load460
    br i1 %eq461, label %if_then_block28, label %if_dest_block29

if_then_block28; preds = %if_dest_block26
    br label %Heap_Node.maxHeapify_return_block
    br label %if_dest_block29

if_dest_block29; preds = %if_then_block28
    %ClassAddr_turnto_reg_462 = load Heap_Node*, Heap_Node** %this|addr408
    %Id_GEP_463 = getelementptr Heap_Node, Heap_Node* %ClassAddr_turnto_reg_462, i32 0, i32 0
    %Id_GEP_Load464 = load Array_Node*, Array_Node** %Id_GEP_463
    %Id_load465 = load i32, i32* %x|addr409
    %Id_load466 = load i32, i32* %largest|addr419
    %funccal467 = call void @Array_Node.swap(Array_Node* %Id_GEP_Load464, i32 %Id_load465, i32 %Id_load466)
    %Id_load468 = load i32, i32* %largest|addr419
    %CastToResult470 = load Heap_Node*, Heap_Node** %this|addr408
    %funccal469 = call void @Heap_Node.maxHeapify(Heap_Node* %CastToResult470, i32 %Id_load468)
    br label %Heap_Node.maxHeapify_return_block

Heap_Node.maxHeapify_return_block; preds = %if_dest_block29
    ret void

}

define ReturnType : i32
Parameter : Node  @Node.key_(Node*){
Node.key__entrance_block    %this|addr477 = alloca Node**
    store Node* %this, Node** %this|addr477
    %ClassAddr_turnto_reg_479 = load Node*, Node** %this|addr477
    %Id_GEP_480 = getelementptr Node, Node* %ClassAddr_turnto_reg_479, i32 0, i32 1
    %Id_GEP_Load481 = load i32, i32* %Id_GEP_480
    minus482 = sub i32 0, %Id_GEP_Load481
    %Node.key_return_value478=%minus482
    br label %Node.key__return_block
    br label %Node.key__return_block

Node.key__return_block; preds = %Node.key__entrance_block
    ret i32 %Node.key_return_value478

}

define ReturnType : void
Parameter :  @init(){
init_entrance_block    %n484 = load i32, i32 @n
    %funccal485 = call i32 @getInt()
    store pointer is not pointertypei32
    %m486 = load i32, i32 @m
    %funccal487 = call i32 @getInt()
    store pointer is not pointertypei32
    %g488 = load EdgeList*, EdgeList* @g
    %Malloc_Result489 = call i8* @malloc(i32 16)
    Malloc_Cast_Result_490 = bitcast i32* %Malloc_Result489 to EdgeList*
    store EdgeList %Malloc_Cast_Result_490, EdgeList* @g
    %g491 = load EdgeList*, EdgeList* @g
    %n492 = load i32, i32 @n
    %m493 = load i32, i32 @m
    %funccal494 = call void @EdgeList.init(EdgeList* %g491, i32 %n492, i32 %m493)
    %i|addr495 = alloca i32*
    %Id_load496 = load i32, i32* %i|addr495
    store i32 0, i32* %i|addr495
    br label %for_cond_block30

for_cond_block30; preds = %init_entrance_block
    %Id_load497 = load i32, i32* %i|addr495
    %m498 = load i32, i32 @m
    %slt499 = icmp slt i32 %Id_load497, %m498
    br i1 %slt499, label %for_body_block32, label %for_dest_block33

for_body_block32; preds = %for_cond_block30
    %u|addr500 = alloca i32*
    %funccal501 = call i32 @getInt()
    store i32 %funccal501, i32* %u|addr500
    %v|addr502 = alloca i32*
    %funccal503 = call i32 @getInt()
    store i32 %funccal503, i32* %v|addr502
    %w|addr504 = alloca i32*
    %funccal505 = call i32 @getInt()
    store i32 %funccal505, i32* %w|addr504
    %g506 = load EdgeList*, EdgeList* @g
    %Id_load507 = load i32, i32* %u|addr500
    %Id_load508 = load i32, i32* %v|addr502
    %Id_load509 = load i32, i32* %w|addr504
    %funccal510 = call void @EdgeList.addEdge(EdgeList* %g506, i32 %Id_load507, i32 %Id_load508, i32 %Id_load509)
    br label %for_step_block31

for_step_block31; preds = %for_body_block32
    %Id_load511 = load i32, i32* %i|addr495
    PreAdd512 = add i32 %Id_load511, 1
    store i32 %PreAdd512, i32* %i|addr495
    br label %for_cond_block30

for_dest_block33; preds = %for_step_block31
    br label %init_return_block

init_return_block; preds = %for_dest_block33
    ret void

}

define ReturnType : i32*
Parameter : i32  @dijkstra(i32){
dijkstra_entrance_block    %s|addr513 = alloca i32*
    store i32 %s, i32* %s|addr513
    %visited|addr515 = alloca i32**
    %n516 = load i32, i32 @n
    call_size_1517 = mul i32 %n516, 4
    call_size_2518 = add i32 %call_size_1517, 4
    %call_malloc_func519 = call i8* @malloc(i32 %call_size_2518)
    store i32 %n516, i32* %call_malloc_func519
    %call_array_head520 = getelementptr i32, i32* %call_malloc_func519, i32 1
    call_array_head_cast_521 = bitcast i32* %call_array_head520 to i32*
    store i32* %call_array_head_cast_521, i32** %visited|addr515
    %d|addr522 = alloca i32**
    %n523 = load i32, i32 @n
    call_size_1524 = mul i32 %n523, 4
    call_size_2525 = add i32 %call_size_1524, 4
    %call_malloc_func526 = call i8* @malloc(i32 %call_size_2525)
    store i32 %n523, i32* %call_malloc_func526
    %call_array_head527 = getelementptr i32, i32* %call_malloc_func526, i32 1
    call_array_head_cast_528 = bitcast i32* %call_array_head527 to i32*
    store i32* %call_array_head_cast_528, i32** %d|addr522
    %i|addr529 = alloca i32*
    %Id_load530 = load i32, i32* %i|addr529
    store i32 0, i32* %i|addr529
    br label %for_cond_block34

for_cond_block34; preds = %dijkstra_entrance_block
    %Id_load531 = load i32, i32* %i|addr529
    %n532 = load i32, i32 @n
    %slt533 = icmp slt i32 %Id_load531, %n532
    br i1 %slt533, label %for_body_block36, label %for_dest_block37

for_body_block36; preds = %for_cond_block34
    %Id_load534 = load i32*, i32** %d|addr522
    %Id_load535 = load i32, i32* %i|addr529
    %getElementPtr536 = getelementptr i32, i32* %Id_load534, i32 %Id_load535
    %GEP_Load537 = load i32, i32* %getElementPtr536
    %INF538 = load i32, i32 @INF
    store i32 %INF538, i32* %getElementPtr536
    %Id_load539 = load i32*, i32** %visited|addr515
    %Id_load540 = load i32, i32* %i|addr529
    %getElementPtr541 = getelementptr i32, i32* %Id_load539, i32 %Id_load540
    %GEP_Load542 = load i32, i32* %getElementPtr541
    store i32 0, i32* %getElementPtr541
    br label %for_step_block35

for_step_block35; preds = %for_body_block36
    %Id_load543 = load i32, i32* %i|addr529
    PreAdd544 = add i32 %Id_load543, 1
    store i32 %PreAdd544, i32* %i|addr529
    br label %for_cond_block34

for_dest_block37; preds = %for_step_block35
    %Id_load545 = load i32*, i32** %d|addr522
    %Id_load546 = load i32, i32* %s|addr513
    %getElementPtr547 = getelementptr i32, i32* %Id_load545, i32 %Id_load546
    %GEP_Load548 = load i32, i32* %getElementPtr547
    store i32 0, i32* %getElementPtr547
    %q|addr549 = alloca Heap_Node**
    %Malloc_Result550 = call i8* @malloc(i32 4)
    Malloc_Cast_Result_551 = bitcast i32* %Malloc_Result550 to Heap_Node*
    call void @Heap_Node.Heap_Node(Heap_Node* %Malloc_Cast_Result_551)
    store Heap_Node* %Malloc_Cast_Result_551, Heap_Node** %q|addr549
    %src|addr552 = alloca Node**
    %Malloc_Result553 = call i8* @malloc(i32 8)
    Malloc_Cast_Result_554 = bitcast i32* %Malloc_Result553 to Node*
    store Node* %Malloc_Cast_Result_554, Node** %src|addr552
    %Id_load555 = load Node*, Node** %src|addr552
    %memacc_result556 = getelementptr Node, Node* %Id_load555, i32 0, i32 1
    %memacc_result557 = load i32, i32* %memacc_result556
    store i32 0, i32* %memacc_result556
    %Id_load558 = load Node*, Node** %src|addr552
    %memacc_result559 = getelementptr Node, Node* %Id_load558, i32 0, i32 0
    %memacc_result560 = load i32, i32* %memacc_result559
    %Id_load561 = load i32, i32* %s|addr513
    store i32 %Id_load561, i32* %memacc_result559
    %Id_load562 = load Heap_Node*, Heap_Node** %q|addr549
    %Id_load563 = load Node*, Node** %src|addr552
    %funccal564 = call void @Heap_Node.push(Heap_Node* %Id_load562, Node* %Id_load563)
    br label %while_cond_block38

while_cond_block38; preds = %for_dest_block37
    %Id_load565 = load Heap_Node*, Heap_Node** %q|addr549
    %funccal566 = call i32 @Heap_Node.size(Heap_Node* %Id_load565)
    %ne567 = icmp ne i32 %funccal566, 0
    br i1 %ne567, label %while_body_block39, label %while_dest_block40

while_body_block39; preds = %while_cond_block38
    %node|addr568 = alloca Node**
    %Id_load569 = load Heap_Node*, Heap_Node** %q|addr549
    %funccal570 = call Node* @Heap_Node.pop(Heap_Node* %Id_load569)
    store Node* %funccal570, Node** %node|addr568
    %u|addr571 = alloca i32*
    %Id_load572 = load Node*, Node** %node|addr568
    %memacc_result573 = getelementptr Node, Node* %Id_load572, i32 0, i32 0
    %memacc_result574 = load i32, i32* %memacc_result573
    store i32 %memacc_result574, i32* %u|addr571
    %Id_load575 = load i32*, i32** %visited|addr515
    %Id_load576 = load i32, i32* %u|addr571
    %getElementPtr577 = getelementptr i32, i32* %Id_load575, i32 %Id_load576
    %GEP_Load578 = load i32, i32* %getElementPtr577
    %eq579 = icmp eq i32 %GEP_Load578, 1
    br i1 %eq579, label %if_then_block41, label %if_dest_block42

if_then_block41; preds = %while_body_block39
    br label %while_cond_block38
    br label %if_dest_block42

if_dest_block42; preds = %if_then_block41
    %Id_load580 = load i32*, i32** %visited|addr515
    %Id_load581 = load i32, i32* %u|addr571
    %getElementPtr582 = getelementptr i32, i32* %Id_load580, i32 %Id_load581
    %GEP_Load583 = load i32, i32* %getElementPtr582
    store i32 1, i32* %getElementPtr582
    %k|addr584 = alloca i32*
    %Id_load585 = load i32, i32* %k|addr584
    %g586 = load EdgeList*, EdgeList* @g
    %memacc_result587 = getelementptr EdgeList, EdgeList* %g586, i32 0, i32 2
    %memacc_result588 = load i32*, i32** %memacc_result587
    %Id_load589 = load i32, i32* %u|addr571
    %getElementPtr590 = getelementptr i32, i32* %memacc_result588, i32 %Id_load589
    %GEP_Load591 = load i32, i32* %getElementPtr590
    store i32 %GEP_Load591, i32* %k|addr584
    br label %for_cond_block43

for_cond_block43; preds = %if_dest_block42
    %Id_load592 = load i32, i32* %k|addr584
    %ne593 = icmp ne i32 %Id_load592, -1
    br i1 %ne593, label %for_body_block45, label %for_dest_block46

for_body_block45; preds = %for_cond_block43
    %v|addr594 = alloca i32*
    %g595 = load EdgeList*, EdgeList* @g
    %memacc_result596 = getelementptr EdgeList, EdgeList* %g595, i32 0, i32 0
    %memacc_result597 = load Edge**, Edge*** %memacc_result596
    %Id_load598 = load i32, i32* %k|addr584
    %getElementPtr599 = getelementptr Edge*, Edge** %memacc_result597, i32 %Id_load598
    %GEP_Load600 = load Edge*, Edge** %getElementPtr599
    %memacc_result601 = getelementptr Edge, Edge* %GEP_Load600, i32 0, i32 1
    %memacc_result602 = load i32, i32* %memacc_result601
    store i32 %memacc_result602, i32* %v|addr594
    %w|addr603 = alloca i32*
    %g604 = load EdgeList*, EdgeList* @g
    %memacc_result605 = getelementptr EdgeList, EdgeList* %g604, i32 0, i32 0
    %memacc_result606 = load Edge**, Edge*** %memacc_result605
    %Id_load607 = load i32, i32* %k|addr584
    %getElementPtr608 = getelementptr Edge*, Edge** %memacc_result606, i32 %Id_load607
    %GEP_Load609 = load Edge*, Edge** %getElementPtr608
    %memacc_result610 = getelementptr Edge, Edge* %GEP_Load609, i32 0, i32 2
    %memacc_result611 = load i32, i32* %memacc_result610
    store i32 %memacc_result611, i32* %w|addr603
    %alt|addr612 = alloca i32*
    %Id_load613 = load i32*, i32** %d|addr522
    %Id_load614 = load i32, i32* %u|addr571
    %getElementPtr615 = getelementptr i32, i32* %Id_load613, i32 %Id_load614
    %GEP_Load616 = load i32, i32* %getElementPtr615
    %Id_load617 = load i32, i32* %w|addr603
    add618 = add i32 %GEP_Load616, %Id_load617
    store i32 %add618, i32* %alt|addr612
    %Id_load619 = load i32, i32* %alt|addr612
    %Id_load620 = load i32*, i32** %d|addr522
    %Id_load621 = load i32, i32* %v|addr594
    %getElementPtr622 = getelementptr i32, i32* %Id_load620, i32 %Id_load621
    %GEP_Load623 = load i32, i32* %getElementPtr622
    %sge624 = icmp sge i32 %Id_load619, %GEP_Load623
    br i1 %sge624, label %if_then_block47, label %if_dest_block48

if_then_block47; preds = %for_body_block45
    br label %for_step_block44
    br label %if_dest_block48

if_dest_block48; preds = %if_then_block47
    %Id_load625 = load i32*, i32** %d|addr522
    %Id_load626 = load i32, i32* %v|addr594
    %getElementPtr627 = getelementptr i32, i32* %Id_load625, i32 %Id_load626
    %GEP_Load628 = load i32, i32* %getElementPtr627
    %Id_load629 = load i32, i32* %alt|addr612
    store i32 %Id_load629, i32* %getElementPtr627
    %Id_load630 = load Node*, Node** %node|addr568
    %Malloc_Result631 = call i8* @malloc(i32 8)
    Malloc_Cast_Result_632 = bitcast i32* %Malloc_Result631 to Node*
    store Node* %Malloc_Cast_Result_632, Node** %node|addr568
    %Id_load633 = load Node*, Node** %node|addr568
    %memacc_result634 = getelementptr Node, Node* %Id_load633, i32 0, i32 0
    %memacc_result635 = load i32, i32* %memacc_result634
    %Id_load636 = load i32, i32* %v|addr594
    store i32 %Id_load636, i32* %memacc_result634
    %Id_load637 = load Node*, Node** %node|addr568
    %memacc_result638 = getelementptr Node, Node* %Id_load637, i32 0, i32 1
    %memacc_result639 = load i32, i32* %memacc_result638
    %Id_load640 = load i32*, i32** %d|addr522
    %Id_load641 = load i32, i32* %v|addr594
    %getElementPtr642 = getelementptr i32, i32* %Id_load640, i32 %Id_load641
    %GEP_Load643 = load i32, i32* %getElementPtr642
    store i32 %GEP_Load643, i32* %memacc_result638
    %Id_load644 = load Heap_Node*, Heap_Node** %q|addr549
    %Id_load645 = load Node*, Node** %node|addr568
    %funccal646 = call void @Heap_Node.push(Heap_Node* %Id_load644, Node* %Id_load645)
    br label %for_step_block44

for_step_block44; preds = %if_dest_block48
    %Id_load647 = load i32, i32* %k|addr584
    %g648 = load EdgeList*, EdgeList* @g
    %memacc_result649 = getelementptr EdgeList, EdgeList* %g648, i32 0, i32 1
    %memacc_result650 = load i32*, i32** %memacc_result649
    %Id_load651 = load i32, i32* %k|addr584
    %getElementPtr652 = getelementptr i32, i32* %memacc_result650, i32 %Id_load651
    %GEP_Load653 = load i32, i32* %getElementPtr652
    store i32 %GEP_Load653, i32* %k|addr584
    br label %for_cond_block43

for_dest_block46; preds = %for_step_block44
    br label %while_cond_block38

while_dest_block40; preds = %for_dest_block46
    %Id_load654 = load i32*, i32** %d|addr522
    %dijkstrareturn_value514=%Id_load654
    br label %dijkstra_return_block
    br label %dijkstra_return_block

dijkstra_return_block; preds = %while_dest_block40
    ret i32* %dijkstrareturn_value514

}

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    call void @__init__()
    %funccal656 = call void @init()
    %i|addr657 = alloca i32*
    %j|addr658 = alloca i32*
    %Id_load659 = load i32, i32* %i|addr657
    store i32 0, i32* %i|addr657
    br label %for_cond_block49

for_cond_block49; preds = %main_entrance_block
    %Id_load660 = load i32, i32* %i|addr657
    %n661 = load i32, i32 @n
    %slt662 = icmp slt i32 %Id_load660, %n661
    br i1 %slt662, label %for_body_block51, label %for_dest_block52

for_body_block51; preds = %for_cond_block49
    %d|addr663 = alloca i32**
    %Id_load664 = load i32, i32* %i|addr657
    %funccal665 = call i32* @dijkstra(i32 %Id_load664)
    store i32* %funccal665, i32** %d|addr663
    %Id_load666 = load i32, i32* %j|addr658
    store i32 0, i32* %j|addr658
    br label %for_cond_block53

for_cond_block53; preds = %for_body_block51
    %Id_load667 = load i32, i32* %j|addr658
    %n668 = load i32, i32 @n
    %slt669 = icmp slt i32 %Id_load667, %n668
    br i1 %slt669, label %for_body_block55, label %for_dest_block56

for_body_block55; preds = %for_cond_block53
    %Id_load670 = load i32*, i32** %d|addr663
    %Id_load671 = load i32, i32* %j|addr658
    %getElementPtr672 = getelementptr i32, i32* %Id_load670, i32 %Id_load671
    %GEP_Load673 = load i32, i32* %getElementPtr672
    %INF674 = load i32, i32 @INF
    %eq675 = icmp eq i32 %GEP_Load673, %INF674
    br i1 %eq675, label %if_then_block57, label %if_else_block58

if_then_block57; preds = %for_body_block55
    %StringConst676 = getelementptr [2 x i8], [2 x i8]* @const_string_no0, i32 0, i32 0
    %funccal677 = call void @print(i8* %StringConst676)
    br label %if_dest_block59

if_else_block58; preds = %if_then_block57
    %Id_load678 = load i32*, i32** %d|addr663
    %Id_load679 = load i32, i32* %j|addr658
    %getElementPtr680 = getelementptr i32, i32* %Id_load678, i32 %Id_load679
    %GEP_Load681 = load i32, i32* %getElementPtr680
    %funccal682 = call i8* @toString(i32 %GEP_Load681)
    %funccal683 = call void @print(i8* %funccal682)
    br label %if_dest_block59

if_dest_block59; preds = %if_else_block58
    %StringConst684 = getelementptr [1 x i8], [1 x i8]* @const_string_no1, i32 0, i32 0
    %funccal685 = call void @print(i8* %StringConst684)
    br label %for_step_block54

for_step_block54; preds = %if_dest_block59
    %Id_load686 = load i32, i32* %j|addr658
    PreAdd687 = add i32 %Id_load686, 1
    store i32 %PreAdd687, i32* %j|addr658
    br label %for_cond_block53

for_dest_block56; preds = %for_step_block54
    %StringConst688 = getelementptr [0 x i8], [0 x i8]* @const_string_no2, i32 0, i32 0
    %funccal689 = call void @println(i8* %StringConst688)
    br label %for_step_block50

for_step_block50; preds = %for_dest_block56
    %Id_load690 = load i32, i32* %i|addr657
    PreAdd691 = add i32 %Id_load690, 1
    store i32 %PreAdd691, i32* %i|addr657
    br label %for_cond_block49

for_dest_block52; preds = %for_step_block50
    %mainreturn_value655=0
    br label %main_return_block
    br label %main_return_block

main_return_block; preds = %for_dest_block52
    ret i32 %mainreturn_value655

}

