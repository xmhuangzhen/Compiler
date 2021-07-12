package Optimize;

import IR.IRBasicBlock;
import IR.Operand.IROperand;

import java.util.ArrayList;

public class Loop {
    public ArrayList<IRBasicBlock> LoopBlock;
    public Loop ParentLoop, RootLoop;
    public int Depth;

    public IRBasicBlock initBlock, stepBlock;
    public ArrayList<IRBasicBlock> condBlock;

    public ArrayList<IROperand> InitVar;
    public ArrayList<IROperand> NumInitVar;
    public ArrayList<Loop> ChildLoop;
    public ArrayList<IRBasicBlock> BodyBlock;

    public ArrayList<IROperand> NestedInitVar;
    public ArrayList<IRBasicBlock> NestedInitBlock;

    public ArrayList<IRBasicBlock> condNestedBlock;
    public ArrayList<IROperand> condNestedVar;
    public ArrayList<Constraint> cons;
    //constraints : init + cond_block

    public ArrayList<ArrayList<Integer>> consMatrix;
    public ArrayList<IROperand> consVar;
    public int num_cons, num_var;
    //consMatrix * consVar <= 0

    public Loop(int tmpDepth, Loop tmpparentLoop){
        LoopBlock = new ArrayList<>();
        ParentLoop = tmpparentLoop;
        RootLoop = null;
        Depth = tmpDepth;
        InitVar = new ArrayList<>();
        ChildLoop = new ArrayList<>();
        BodyBlock = new ArrayList<>();
        condBlock = new ArrayList<>();

        NestedInitVar = new ArrayList<>();
        NestedInitBlock = new ArrayList<>();
        condNestedBlock = new ArrayList<>();
        condNestedVar = new ArrayList<>();
        cons = new ArrayList<>();

        consMatrix = new ArrayList<>();
        consVar = new ArrayList<>();
    }


}
