package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.IROperand;
import IR.Operand.NullConstant;
import IR.Operand.Register;
import IR.TypeSystem.PointerType;

import java.util.*;

public class SSAConstructor extends Pass {

    public HashMap<IRInstruction, allocaInstruction> UseAlloca;//load
    public HashMap<IRInstruction, allocaInstruction> DefAlloca;//store
    public HashMap<IRBasicBlock, HashMap<allocaInstruction, phiInstruction>> PhiInstMap;
    public HashMap<IRBasicBlock, HashMap<allocaInstruction,IROperand>> ReachingDefMap;
    public HashSet<IRBasicBlock> Visited;
    public IRFunction curFunction;
    public Integer RegNum;

    public SSAConstructor(IRModule tmpModule) {
        super(tmpModule);
        RegNum = 0;
        Visited = new LinkedHashSet<>();
    }


    @Override
    public boolean run() {
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {

                curFunction = tmpFunc;
       /*         System.out.println("-------------");
                System.out.println(curFunction.thisFunctionName);
                for(var tmp = curFunction.thisEntranceBlock;tmp != null; tmp = tmp.nextBasicBlocks){
                    System.out.print(tmp+":");
//                    System.out.print(tmp.DominatorTreeImmediateDominator);
                    for(var t : tmp.DominanceFrontier)
                        System.out.print(t+",");
                    System.out.println("");
                }
**/

                UseAlloca = new LinkedHashMap<>();
                DefAlloca = new LinkedHashMap<>();
                PhiInstMap = new LinkedHashMap<>();
                ReachingDefMap = new LinkedHashMap<>();

                for (IRBasicBlock tmpBlock = tmpFunc.thisEntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
                    PhiInstMap.put(tmpBlock, new LinkedHashMap<>());
                    ReachingDefMap.put(tmpBlock, new LinkedHashMap<>());
                }

                //phi insert (Algorithm 3.1)
                for (var tmpAllocaInst : tmpFunc.allocaInstTable) {
                    HashSet<IRBasicBlock> BlockF = new LinkedHashSet<>();//set of BB where phi is added
                    Queue<IRBasicBlock> BlockW = new LinkedList<>();//set of BBs contain def of v
                    HashSet<IRBasicBlock> DefsV  = new LinkedHashSet<>();

                    //Line 4-6
                    for (var tmpInst : tmpAllocaInst.AllocaResult.use) {
                        if (tmpInst instanceof storeInstruction) {
//                            System.out.println(tmpAllocaInst +","+tmpInst+","+tmpInst.thisBasicBlock);
                            DefAlloca.put(tmpInst, tmpAllocaInst);
                            BlockW.offer(tmpInst.thisBasicBlock);
                            DefsV.add(tmpInst.thisBasicBlock);
                        } else if (tmpInst instanceof loadInstruction) {
                            UseAlloca.put(tmpInst, tmpAllocaInst);
                        } else {
                            throw new RuntimeException();
                        }
                    }

                    //Line 7-14
                    while (!BlockW.isEmpty()) {
                        IRBasicBlock BlockX = BlockW.poll();
                        for (IRBasicBlock BlockY : BlockX.DominanceFrontier) {
                            if (!BlockF.contains(BlockY)) {
                                //Line 11
                                String VarName = tmpAllocaInst.AllocaResult.RegisterName;
                                if(!(tmpAllocaInst.AllocaType instanceof PointerType))
                                    throw new RuntimeException();
                                Register tmpPhiResult =
                                        new Register(((PointerType) tmpAllocaInst.AllocaType).baseType,
                                                VarName + (RegNum++));
                                phiInstruction tmpPhiInst = new phiInstruction(BlockY, tmpPhiResult);
                                PhiInstMap.get(BlockY).put(tmpAllocaInst, tmpPhiInst);

//                                System.out.println(BlockY+","+tmpAllocaInst);

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

                for(var tmpAllocaInst : curFunction.allocaInstTable){
                    tmpAllocaInst.thisBasicBlock.removeInst(tmpAllocaInst);
                }
            }

        return false;
    }

    void VariableRenaming(IRBasicBlock curBlock, IRBasicBlock preBlock) {
        if(!PhiInstMap.containsKey(curBlock)) return;

        //Line 14-17 (define phi Inst)
        for (allocaInstruction tmpAllocInst : PhiInstMap.get(curBlock).keySet()) {
            // System.out.println(curBlock+","+tmpAllocInst);
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
                ((loadInstruction) tmpInst).LoadResult.ReplaceRegisterUse(
                        ReachingDefMap.get(curBlock).get(UseAlloca.get(tmpInst)));
                tmpInst.thisBasicBlock.removeInst(tmpInst);
            } else if (tmpInst instanceof storeInstruction && DefAlloca.containsKey(tmpInst)) {
                //  System.out.println(curBlock+","+tmpInst);
                allocaInstruction tmpAllocInst = DefAlloca.get(tmpInst);
                if (!ReachingDefMap.get(curBlock).containsKey(tmpAllocInst)) {
                    //System.out.println("1");
                    ReachingDefMap.get(curBlock).put(tmpAllocInst, ((storeInstruction) tmpInst).StoreValue);
                }
                else
                    ReachingDefMap.get(curBlock).replace(tmpAllocInst, ((storeInstruction) tmpInst).StoreValue);
                tmpInst.thisBasicBlock.removeInst(tmpInst);
            }
        }

        for (IRBasicBlock sucBasicBlock : curBlock.CFGSuccessor)
            VariableRenaming(sucBasicBlock, curBlock);

        for (IRInstruction tmpPhiInst : PhiInstMap.get(curBlock).values())
            curBlock.addBasicBlockInstAtFront(tmpPhiInst);
    }}