

define ReturnType : i32
Parameter :  @main()

define ReturnType : i32
Parameter :  @main(){
main_entrance_block    br label %__init___entrance_block_i0

__init___entrance_block_i0; preds = %main_entrance_block
    %call_malloc_func4 = call i8* @malloc(i32 124)
    store i32 30, i32* %call_malloc_func4
    %call_array_head5 = getelementptr i32, i32* %call_malloc_func4, i32 1
    call_array_head_cast_6 = bitcast i32* %call_array_head5 to i32***
    %Subarray_Cur_Reg7 = getelementptr i32, i32* %call_malloc_func4, i32 1
    %SubArray_end_reg8 = getelementptr i32**, i32*** %call_array_head_cast_6, i32 30
    br label %cond_block0

cond_block0; preds = %__init___entrance_block_i0
    %Subarray_Cond_9 = icmp slt i32*** %Subarray_Cur_Reg7, %SubArray_end_reg8
    br i1 %Subarray_Cond_9, label %body_block1, label %dest_block2

body_block1; preds = %cond_block0
    %call_malloc_func12 = call i8* @malloc(i32 124)
    store i32 30, i32* %call_malloc_func12
    %call_array_head13 = getelementptr i32, i32* %call_malloc_func12, i32 1
    call_array_head_cast_14 = bitcast i32* %call_array_head13 to i32**
    %Subarray_Cur_Reg15 = getelementptr i32, i32* %call_malloc_func12, i32 1
    %SubArray_end_reg16 = getelementptr i32*, i32** %call_array_head_cast_14, i32 30
    br label %cond_block3

cond_block3; preds = %body_block1
    %Subarray_Cond_17 = icmp slt i32** %Subarray_Cur_Reg15, %SubArray_end_reg16
    br i1 %Subarray_Cond_17, label %body_block4, label %dest_block5

body_block4; preds = %cond_block3
    %call_malloc_func20 = call i8* @malloc(i32 124)
    store i32 30, i32* %call_malloc_func20
    %call_array_head21 = getelementptr i32, i32* %call_malloc_func20, i32 1
    call_array_head_cast_22 = bitcast i32* %call_array_head21 to i32*
    store i32* %call_array_head_cast_22, i32** %Subarray_Cur_Reg15
    %Incr_reg23 = getelementptr i32*, i32** %Subarray_Cur_Reg15, i32 1
    %Subarray_Cur_Reg15=%Incr_reg23
    br label %cond_block3

dest_block5; preds = %body_block4
    store i32** %call_array_head_cast_14, i32*** %Subarray_Cur_Reg7
    %Incr_reg24 = getelementptr i32**, i32*** %Subarray_Cur_Reg7, i32 1
    %Subarray_Cur_Reg7=%Incr_reg24
    br label %cond_block0

dest_block2; preds = %dest_block5
    %call_malloc_func28 = call i8* @malloc(i32 124)
    store i32 30, i32* %call_malloc_func28
    %call_array_head29 = getelementptr i32, i32* %call_malloc_func28, i32 1
    call_array_head_cast_30 = bitcast i32* %call_array_head29 to i32*
    br label %for_cond_block6

for_cond_block6; preds = %dest_block2
    %i|addr311 = phi i32[ 0, %dest_block2], [ %PreAdd41, %for_body_block8]
    %slt35 = icmp slt i32 %i|addr311, 30
    br i1 %slt35, label %for_body_block8, label %for_dest_block9

for_body_block8; preds = %for_cond_block6
    %getElementPtr38 = getelementptr i32, i32* %call_array_head_cast_30, i32 %i|addr311
    store i32 1, i32* %getElementPtr38
    PreAdd41 = add i32 %i|addr311, 1
    br label %for_cond_block6

for_dest_block9; preds = %for_body_block8
    br label %for_cond_block10

for_cond_block10; preds = %for_dest_block9
    %i|addr310 = phi i32[ 0, %for_dest_block9], [ %PreAdd51, %for_body_block12]
    %slt44 = icmp slt i32 %i|addr310, 30
    br i1 %slt44, label %for_body_block12, label %for_dest_block13

for_body_block12; preds = %for_cond_block10
    %getElementPtr47 = getelementptr i32**, i32*** %call_array_head_cast_6, i32 %i|addr310
    store i32** %call_array_head_cast_30, i32*** %getElementPtr47
    PreAdd51 = add i32 %i|addr310, 1
    br label %for_cond_block10

for_dest_block13; preds = %for_body_block12
    %mainreturn_value0=0
    br label %main_return_block

main_return_block; preds = %for_dest_block13
    ret i32 %mainreturn_value0

}

