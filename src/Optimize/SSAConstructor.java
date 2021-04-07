package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.IROperand;
import IR.Operand.NullConstant;
import IR.Operand.Register;

import java.util.*;

public class SSAConstructor extends Pass {

    public HashMap<IRInstruction, allocaInstruction> UseAlloca;// move or load
    public HashMap<IRInstruction, allocaInstruction> DefAlloca;//store
    public HashMap<IRBasicBlock, HashMap<allocaInstruction, phiInstruction>> PhiInstMap;
    public HashMap<IRBasicBlock, HashMap<allocaInstruction, IROperand>> ReachingDefMap;
    public HashSet<IRBasicBlock> Visited;
    public IRFunction curFunction;
    public Integer RegNum;

    public SSAConstructor(IRModule tmpModule) {
        super(tmpModule);
        RegNum = 0;
    }


    @Override
    public boolean run() {
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {

                curFunction = tmpFunc;
                UseAlloca = new LinkedHashMap<>();
                DefAlloca = new LinkedHashMap<>();
                PhiInstMap = new LinkedHashMap<>();
                ReachingDefMap = new LinkedHashMap<>();

                for (IRBasicBlock tmpBlock = tmpFunc.thisEntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks)
                    /*if (tmpBlock.DFN != 0) */ {
                    PhiInstMap.put(tmpBlock, new LinkedHashMap<>());
                    ReachingDefMap.put(tmpBlock, new LinkedHashMap<>());
                }

                //phi insert
                for (var tmpAllocaInst : tmpFunc.allocaInstTable) {

                    Queue<IRBasicBlock> BlockW = new LinkedList<>();//set of BBs contain def of v
                    HashSet<IRBasicBlock> BlockF = new LinkedHashSet<>();//set of BB where phi is added
                    Visited = new LinkedHashSet<>();
                    for (var tmpInst : tmpAllocaInst.AllocaResult.use.keySet()) {
                        if (tmpInst instanceof storeInstruction) {
                            DefAlloca.put(tmpInst, tmpAllocaInst);
                            if (!Visited.contains(tmpInst.thisBasicBlock)) {
                                BlockW.add(tmpInst.thisBasicBlock);
                                Visited.add(tmpInst.thisBasicBlock);
                            }
                        } else if (tmpInst instanceof loadInstruction) {
                            UseAlloca.put(tmpInst, tmpAllocaInst);
                        } else if (tmpInst instanceof moveInstruction) {
                            UseAlloca.put(tmpInst, tmpAllocaInst);
                        }
                    }

                    while (!BlockW.isEmpty()) {
                        IRBasicBlock BlockX = BlockW.poll();
                        for (IRBasicBlock BlockY : BlockX.DominanceFrontier) {
                            if (!BlockF.contains(BlockY)) {
                                String VarName = tmpAllocaInst.AllocaResult.RegisterName.split("|")[0];
                                Register tmpPhiResult = new Register(tmpAllocaInst.AllocaType, VarName + (RegNum++));
                                phiInstruction tmpPhiInst = new phiInstruction(BlockY, tmpPhiResult);

                                PhiInstMap.get(BlockY).put(tmpAllocaInst, tmpPhiInst);

                                BlockF.add(BlockY);
                                if (!Visited.contains(BlockY)) {
                                    BlockW.add(BlockY);
                                    Visited.add(BlockY);
                                }
                            }
                        }
                    }
                    tmpAllocaInst.thisBasicBlock.removeInst(tmpAllocaInst);
                }

                //renaming
                for (IRBasicBlock tmpBlock = tmpFunc.thisEntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
                    for (IRInstruction tmpInst = tmpBlock.HeadInst;
                         tmpInst != null; ) {
                        IRInstruction thisInst = tmpInst;
                        tmpInst = tmpInst.nextIRInstruction;
                        if (thisInst instanceof loadInstruction &&
                                ((loadInstruction) thisInst).LoadResult.use.isEmpty()) {
                            tmpBlock.removeInst(thisInst);
                        } else if (thisInst instanceof moveInstruction &&
                                ((moveInstruction) thisInst).rd.use.isEmpty()) {
                            tmpBlock.removeInst(thisInst);
                        }
                    }
                }

                Visited = new LinkedHashSet<>();
                VariableRenaming(tmpFunc.thisEntranceBlock, null);
            }

        return false;
    }

    void VariableRenaming(IRBasicBlock curBlock, IRBasicBlock preBlock) {
        if (!PhiInstMap.containsKey(curBlock)) return;// maybe to be debugged

        //define phi Inst
        for (allocaInstruction tmpAllocInst : PhiInstMap.get(curBlock).keySet()) {
            phiInstruction tmpPhiInst = PhiInstMap.get(curBlock).get(tmpAllocInst);
            tmpPhiInst.PhiLabel.add(preBlock);
            if (!ReachingDefMap.get(preBlock).containsKey(tmpAllocInst) ||
                    ReachingDefMap.get(preBlock).get(tmpAllocInst) == null) {
                tmpPhiInst.PhiValue.add(tmpAllocInst.AllocaType.getValue());
            } else {
                tmpPhiInst.PhiValue.add(ReachingDefMap.get(preBlock).get(tmpAllocInst));
            }
        }


        if (preBlock != null) {
            for (allocaInstruction tmpAllocInst : curFunction.allocaInstTable) {
                if (!PhiInstMap.get(curBlock).containsKey(tmpAllocInst))
                    ReachingDefMap.get(curBlock).put(tmpAllocInst,
                            ReachingDefMap.get(preBlock).get(tmpAllocInst));
            }
        }

        if (Visited.contains(curBlock)) return;
        Visited.add(curBlock);

        for (allocaInstruction tmpAllocaInst : PhiInstMap.get(curBlock).keySet()) {
            ReachingDefMap.get(curBlock).put(tmpAllocaInst,
                    PhiInstMap.get(curBlock).get(tmpAllocaInst).PhiResult);
        }

        for (IRInstruction tmpInst = curBlock.HeadInst; tmpInst != null;
             tmpInst = tmpInst.nextIRInstruction) {
            if (tmpInst instanceof loadInstruction && UseAlloca.containsKey(tmpInst)
                    && ReachingDefMap.get(curBlock).get(UseAlloca.get(tmpInst)) != null) {
//                System.out.println(tmpInst+","+
                //                      (ReachingDefMap.get(curBlock).get(UseAlloca.get(tmpInst)) == null));
                ((loadInstruction) tmpInst).LoadResult.ReplaceRegisterUse(
                        ReachingDefMap.get(curBlock).get(UseAlloca.get(tmpInst)));
                tmpInst.thisBasicBlock.removeInst(tmpInst);
          /*  } else if (tmpInst instanceof moveInstruction &&
                    ((moveInstruction) tmpInst).rd instanceof Register
                    && UseAlloca.containsKey(tmpInst)
                    && ReachingDefMap.get(curBlock).get(UseAlloca.get(tmpInst)) != null) {
                ((moveInstruction) tmpInst).rd.ReplaceRegisterUse(
                        ReachingDefMap.get(curBlock).get(UseAlloca.get(tmpInst)));
                tmpInst.thisBasicBlock.removeInst(tmpInst);
           */
            } else if (tmpInst instanceof storeInstruction && DefAlloca.containsKey(tmpInst)) {
                allocaInstruction tmpAllocInst = DefAlloca.get(tmpInst);
                if (!ReachingDefMap.get(curBlock).containsKey(tmpAllocInst))
                    ReachingDefMap.get(curBlock).put(tmpAllocInst, ((storeInstruction) tmpInst).StoreValue);
                else
                    ReachingDefMap.get(curBlock).replace(tmpAllocInst, ((storeInstruction) tmpInst).StoreValue);
                tmpInst.thisBasicBlock.removeInst(tmpInst);
            }
        }

        for (IRBasicBlock sucBasicBlock : curBlock.CFGSuccessor)
            VariableRenaming(sucBasicBlock, curBlock);

        for (IRInstruction tmpPhiInst : PhiInstMap.get(curBlock).values())
            curBlock.addBasicBlockInstAtFront(tmpPhiInst);
    }
}