package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.IROperand;
import IR.Operand.NullConstant;
import IR.Operand.Parameter;
import IR.Operand.Register;
import IR.TypeSystem.IRTypeSystem;
import IR.TypeSystem.PointerType;

import java.util.*;

public class SSAConstructor extends Pass {

    public HashMap<IRInstruction, allocaInstruction> UseAlloca;//load
    public HashMap<IRInstruction, allocaInstruction> DefAlloca;//store
    public HashMap<IRBasicBlock, HashMap<allocaInstruction, phiInstruction>> PhiInstMap;
    public HashMap<IRBasicBlock, HashMap<allocaInstruction, IROperand>> ReachingDefMap;
    public HashSet<IRBasicBlock> Visited;
    public IRFunction curFunction;
    public Integer RegNum;

    public SSAConstructor(IRModule tmpModule) {
        super(tmpModule);
        RegNum = 0;
        Visited = new HashSet<>();
        PhiInstMap = new HashMap<>();
    }


    @Override
    public boolean run() {
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {

                curFunction = tmpFunc;

                UseAlloca = new HashMap<>();
                DefAlloca = new HashMap<>();
                PhiInstMap.clear();
                ReachingDefMap = new HashMap<>();

                for (IRBasicBlock tmpBlock = tmpFunc.thisEntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
                    PhiInstMap.put(tmpBlock, new HashMap<>());
                    ReachingDefMap.put(tmpBlock, new HashMap<>());
                }


                //phi insert (Algorithm 3.1)
                for (var tmpAllocaInst : tmpFunc.allocaInstTable) {
                    HashSet<IRBasicBlock> BlockF = new HashSet<>();//set of BB where phi is added
                    Queue<IRBasicBlock> BlockW = new LinkedList<>();//set of BBs contain def of v
                    HashSet<IRBasicBlock> DefsV = new HashSet<>();

                    /*
                    System.out.println("--------------------");
                    System.out.println(tmpAllocaInst);
                    System.out.println(tmpAllocaInst.AllocaResult.use);
                    System.out.println(tmpAllocaInst.AllocaResult.Defs);

                     */

                    //Line 4-6
                    for (var tmpInst : tmpAllocaInst.AllocaResult.use) {
                        if (tmpInst instanceof storeInstruction) {
                            DefAlloca.put(tmpInst, tmpAllocaInst);
                            BlockW.offer(tmpInst.thisBasicBlock);
                            DefsV.add(tmpInst.thisBasicBlock);
                        } else if (tmpInst instanceof loadInstruction) {
                            UseAlloca.put(tmpInst, tmpAllocaInst);
                        } else {
//                            throw new RuntimeException();
                        }
                    }

                    //Line 7-14
                    while (!BlockW.isEmpty()) {
                        IRBasicBlock BlockX = BlockW.poll();
                        for (IRBasicBlock BlockY : BlockX.DominanceFrontier) {
                            if (!BlockF.contains(BlockY)) {
                                //Line 11
                                String VarName = tmpAllocaInst.AllocaName;
                                IRTypeSystem tmpType = null;
                                if (tmpAllocaInst.AllocaType instanceof PointerType)
                                    tmpType = ((PointerType) tmpAllocaInst.AllocaType).baseType;
                                else throw new RuntimeException();

                                Register tmpPhiResult = new Register(tmpType, VarName + (RegNum++));
                                phiInstruction tmpPhiInst = new phiInstruction(BlockY, tmpPhiResult);
                                PhiInstMap.get(BlockY).put(tmpAllocaInst, tmpPhiInst);

                                //Line 12
                                BlockF.add(BlockY);

                                //Line 13-14
                                if (!DefsV.contains(BlockY)) {
                                    BlockW.add(BlockY);
                                    DefsV.add(BlockY);
                                }
                            }
                        }
                    }
                }


                Visited.clear();
                VariableRenaming(curFunction.thisEntranceBlock, null);

                for (var tmpAllocaInst : curFunction.allocaInstTable) {
                    tmpAllocaInst.thisBasicBlock.removeInst(tmpAllocaInst);
                }
            }

        return false;
    }

    void VariableRenaming(IRBasicBlock curBlock, IRBasicBlock preBlock) {
        if (!PhiInstMap.containsKey(curBlock)) return;

        //Line 14-17 (define phi Inst)
        for (allocaInstruction tmpAllocInst : PhiInstMap.get(curBlock).keySet()) {
            phiInstruction tmpPhiInst = PhiInstMap.get(curBlock).get(tmpAllocInst);
            tmpPhiInst.PhiLabel.add(preBlock);
            if (!ReachingDefMap.get(preBlock).containsKey(tmpAllocInst) ||
                    ReachingDefMap.get(preBlock).get(tmpAllocInst) == null) {
                tmpPhiInst.PhiValue.add(tmpAllocInst.AllocaType.getValue());
            } else {
                IROperand tmpOperand = ReachingDefMap.get(preBlock).get(tmpAllocInst);
                tmpPhiInst.PhiValue.add(tmpOperand);
                tmpOperand.AddRegisterUseInInstruction(tmpPhiInst);
            }
        }


        if (preBlock != null) {
            for (allocaInstruction tmpAllocInst : curFunction.allocaInstTable) {
                if (!PhiInstMap.get(curBlock).containsKey(tmpAllocInst)) {
                    ReachingDefMap.get(curBlock).put(tmpAllocInst,
                            ReachingDefMap.get(preBlock).get(tmpAllocInst));
                }
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
                ((loadInstruction) tmpInst).LoadResult.ReplaceRegisterUse(
                        ReachingDefMap.get(curBlock).get(UseAlloca.get(tmpInst)));
                tmpInst.thisBasicBlock.removeInst(tmpInst);
            } else if (tmpInst instanceof storeInstruction && DefAlloca.containsKey(tmpInst)) {
                allocaInstruction tmpAllocInst = DefAlloca.get(tmpInst);
                if (!ReachingDefMap.get(curBlock).containsKey(tmpAllocInst)) {
                    ReachingDefMap.get(curBlock).put(tmpAllocInst, ((storeInstruction) tmpInst).StoreValue);
                } else
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