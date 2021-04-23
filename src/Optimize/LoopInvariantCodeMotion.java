package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.*;
import IR.Operand.IROperand;
import IR.Operand.Register;
import org.antlr.v4.runtime.misc.Pair;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;

//https://www.cs.cornell.edu/courses/cs6120/2019fa/blog/loop-reduction/
//http://www.cs.toronto.edu/~pekhimenko/courses/cscd70-w18/docs/Lecture%205%20[LICM%20and%20Strength%20Reduction]%2002.08.2018.pdf

public class LoopInvariantCodeMotion extends Pass {

    public IRFunction curFunc;
    public ArrayList<Pair<IRBasicBlock, IRBasicBlock>> backEdges; //Tail,Head
    public HashMap<IROperand, HashSet<IRInstruction>> reachDefMap;
    public HashMap<IRBasicBlock, HashSet<Loop>> allLoops;//head,loop
    public HashSet<IRBasicBlock> Visited;
    public ArrayList<IRBasicBlock> curLoopBlockStack;

    public LoopInvariantCodeMotion(IRModule tmpModule) {
        super(tmpModule);
        backEdges = new ArrayList<>();
        allLoops = new HashMap<>();
        Visited = new HashSet<>();
        reachDefMap = new HashMap<>();
        curLoopBlockStack = new ArrayList<>();
    }

    @Override
    public boolean run() {
        DominatorTreeConstructor tmpDTC =
                new DominatorTreeConstructor(curIRModule);
        tmpDTC.run();

        boolean modified = false;
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                curFunc = tmpFunc;

                //(1) finding loops
                FindingLoops();

                //(2) reaching definitions
                ReachingDefinitions();

                modified |= LCIMInLoop();
            }
        return modified;
    }

    public void FindingLoops() {
        for (IRBasicBlock curBlock = curFunc.thisEntranceBlock;
             curBlock != null; curBlock = curBlock.nextBasicBlocks) {
            for (IRBasicBlock sucBlock : curBlock.CFGSuccessor) {
                if (IsDom(curBlock, sucBlock)) {
                    backEdges.add(new Pair<>(curBlock, sucBlock));//tail, head
                //    System.out.println(sucBlock+"->"+curBlock);
                }
            }
        }

        for (var tmp : backEdges) {
            IRBasicBlock blockTail = tmp.a;
            IRBasicBlock blockHead = tmp.b;

            Visited.clear();
            curLoopBlockStack.clear();
            if (!allLoops.containsKey(blockHead))
                allLoops.put(blockHead, new HashSet<>());
            getLoop(blockTail, blockHead);
        }
    }

    public boolean IsDom(IRBasicBlock curBlock, IRBasicBlock sucBlock) {
        //check whether sucBlock is the ancestor of curblock
        IRBasicBlock tmpBlock = curBlock;
        while (tmpBlock != null) {
            if (tmpBlock == sucBlock)
                return true;
            tmpBlock = tmpBlock.DominatorTreeImmediateDominator;
        }
        return false;
    }

    public void getLoop(IRBasicBlock curBlock, IRBasicBlock HeadBlock) {
        Visited.add(curBlock);
        curLoopBlockStack.add(curBlock);
        if(allLoops.get(HeadBlock).size() > 20) return;
        if (curBlock == HeadBlock) {
            Loop curLoop = new Loop();
            for(int i = curLoopBlockStack.size()-1; i >= 0;--i)
                curLoop.LoopBlock.add(curLoopBlockStack.get(i));
       //     for(var tmp : curLoop.LoopBlock)
         //       System.out.print(tmp+"->");
           // System.out.println("");
            allLoops.get(HeadBlock).add(curLoop);
            curLoopBlockStack.remove(curBlock);
            return;
        }
        for (var tmpBlock : curBlock.CFGPredecessor)
          //  if (!Visited.contains(tmpBlock)) {
            if(!curLoopBlockStack.contains(tmpBlock)){
                getLoop(tmpBlock, HeadBlock);
            }
        curLoopBlockStack.remove(curBlock);
    }

    public void ReachingDefinitions() {
        reachDefMap.clear();
        for (IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;
             tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
            for (IRInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                for (var tmpDef : tmpInst.getdef()) {
                    if (!reachDefMap.containsKey(tmpDef))
                        reachDefMap.put(tmpDef, new HashSet<>());
                    reachDefMap.get(tmpDef).add(tmpInst);
                }
            }
        }
    }

    public boolean LCIMInLoop() {
        boolean changed = false;
        for (IRBasicBlock preBlock = curFunc.thisEntranceBlock;
             preBlock != null; preBlock = preBlock.nextBasicBlocks) {
            if (preBlock.TailInst instanceof brInstruction &&
                    ((brInstruction) preBlock.TailInst).brCond == null) {// can be the preheader
                IRBasicBlock LoopHead = ((brInstruction) preBlock.TailInst).brIfTrue;
                if (!allLoops.containsKey(LoopHead)) continue;

                //check no call
                boolean LoopHasCall = false;
                HashSet<Loop> LoopSet = allLoops.get(LoopHead);
                HashSet<IRBasicBlock> LoopBlock = new HashSet<>();
                Visited.clear();
                for (Loop tmpLoop : LoopSet) {
                    for (IRBasicBlock tmpBlock : tmpLoop.LoopBlock) {
                        if (!Visited.contains(tmpBlock)) {
                            Visited.add(tmpBlock);
                            LoopBlock.add(tmpBlock);
                            for (IRInstruction tmpInst = tmpBlock.HeadInst;
                                 tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                                if (tmpInst instanceof callInstruction) {
                                    LoopHasCall = true;
                                    break;
                                }
                            }
                            if (LoopHasCall) break;
                        }
                    }
                    if (LoopHasCall) break;
                }
                if (LoopHasCall) continue;

            //    System.out.println(LoopBlock);

                Visited.clear();
                for (Loop tmpLoop : LoopSet) {
                    boolean canLoop = true;

                    for(IRBasicBlock tmpBlock : tmpLoop.LoopBlock){
                        if(!IsDom(tmpBlock,preBlock)){
                            canLoop = false;
                            break;
                        }
                    }

                    if(!canLoop) continue;

                    for (IRBasicBlock tmpBlock : tmpLoop.LoopBlock) {
                        if (!Visited.contains(tmpBlock)) {
                            Visited.add(tmpBlock);

                            for (IRInstruction curInst = tmpBlock.HeadInst;
                                 curInst != null; ) {
                                IRInstruction tmpInst = curInst;
                                curInst = curInst.nextIRInstruction;
                                if (tmpInst instanceof binaryOpInstruction) {
                                    boolean AllUseDontChange = true;
                                    for (var tmp : tmpInst.getuse()) {
                                        if (reachDefMap.containsKey(tmp)) {
                                            for (var tmpUseDef : reachDefMap.get(tmp)) {
                                                if (LoopBlock.contains(tmpUseDef.thisBasicBlock)) {
                                                    AllUseDontChange = false;
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                    if (AllUseDontChange) {
                                        tmpInst.removeInst();
                                        preBlock.addBasicBlockInstPreInst(preBlock.TailInst,
                                                new binaryOpInstruction(preBlock,
                                                        ((binaryOpInstruction) tmpInst).BinaryOperandType,
                                                        ((binaryOpInstruction) tmpInst).BinaryOp1,
                                                        ((binaryOpInstruction) tmpInst).BinaryOp2,
                                                        ((binaryOpInstruction) tmpInst).BinaryResult));
                                        changed = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return changed;
    }
}