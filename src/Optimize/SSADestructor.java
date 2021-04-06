package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.IROperand;
import IR.Operand.Register;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class SSADestructor extends Pass {

    public IRFunction curFunction;
    public Integer RegNum = 0;

    public SSADestructor(IRModule tmpModule) {
        super(tmpModule);
    }

    @Override
    public boolean run() {
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                curFunction = tmpFunc;
                CriticalEdgeSpltting();
                SequentialCopy();
            }
        return false;
    }

    //Algorithm 3.5
    public void CriticalEdgeSpltting() {
        for (int cur_dfn = 1; cur_dfn <= curFunction.DFNcurNumber; ++cur_dfn) {
            IRBasicBlock curBlock = curFunction.DFSOrder.get(cur_dfn - 1);
            if (curBlock.DominatorTreePredecessor.size() > 0) {

                HashSet<phiInstruction> PhiInstLists = new LinkedHashSet<>();
                for (IRInstruction tmpInst = curBlock.HeadInst;
                     tmpInst != null; tmpInst = tmpInst.nextIRInstruction)
                    if (tmpInst instanceof phiInstruction)
                        PhiInstLists.add((phiInstruction) tmpInst);

                if (!PhiInstLists.isEmpty()) {
                    ArrayList<IRBasicBlock> tmpPredecessor = new ArrayList<>(curBlock.DominatorTreePredecessor);
                    for (IRBasicBlock preBlock : tmpPredecessor) {
                        parallelCopyInstruction PC_i;
                        if (preBlock.DominatorTreeSuccessor.size() > 1) {
                            //Line 6
                            IRBasicBlock BlockBPrime = new IRBasicBlock(curFunction,
                                    preBlock.BasicBlockName + "Prime");
                            PC_i = new parallelCopyInstruction(BlockBPrime);

                            //Line 7
                            if (preBlock.TailInst instanceof brInstruction)
                                ((brInstruction) preBlock.TailInst).replaceBlock(curBlock, BlockBPrime);
                            brInstruction brInstFromBPrimetocur =
                                    new brInstruction(BlockBPrime,
                                            null, curBlock, null);

                            //Line 8
                            BlockBPrime.addBasicBlockInst(PC_i);
                            BlockBPrime.addBasicBlockInst(brInstFromBPrimetocur);

                            //change CFG
                            preBlock.DominatorTreeSuccessor.remove(curBlock);
                            preBlock.DominatorTreeSuccessor.add(BlockBPrime);
                            BlockBPrime.DominatorTreeSuccessor.add(curBlock);
                            BlockBPrime.DominatorTreePredecessor.add(preBlock);
                            curBlock.DominatorTreePredecessor.remove(preBlock);
                            curBlock.DominatorTreePredecessor.add(BlockBPrime);

                            //addBlock
                            for (phiInstruction tmpPhiInst : PhiInstLists)
                                tmpPhiInst.replaceBlock(preBlock, BlockBPrime);
                            curFunction.addFunctionBasicBlockAfterBlock(preBlock, BlockBPrime);
                        } else {
                            //Line 10
                            PC_i = new parallelCopyInstruction(preBlock);
                            if (preBlock.TailInst instanceof brInstruction) {
                                preBlock.addBasicBlockInstPreInst(preBlock.TailInst, PC_i);
                            } else {
                                preBlock.addBasicBlockInst(PC_i);
                            }
                        }
                    }

                    //Line 11-15
                    for (var tmpPhiInst : PhiInstLists) {
                     //   System.out.println(tmpPhiInst.toString());
                        for (int i = 0; i < tmpPhiInst.PhiLabel.size(); ++i) {
                            IRBasicBlock B_i = tmpPhiInst.PhiLabel.get(i);
                            IROperand a_i = tmpPhiInst.PhiValue.get(i);
                            for (IRInstruction tmpInst = B_i.TailInst; tmpInst != null;
                                 tmpInst = tmpInst.preIRInstruction)
                                if (tmpInst instanceof parallelCopyInstruction) {
                                    ((parallelCopyInstruction) tmpInst).PCMoveInst.add(new moveInstruction(
                                            B_i, tmpPhiInst.PhiResult, a_i));
                                    break;
                                }
                        }
                        curBlock.removeInst(tmpPhiInst);
                    }
                }
            }
        }
    }

    //Algorithm 3.6
    public void SequentialCopy() {
        for (IRBasicBlock curBlock = curFunction.thisEntranceBlock;
             curBlock != null; curBlock = curBlock.nextBasicBlocks) {
            //Line 1
            parallelCopyInstruction pcopy = null;
            for (IRInstruction tmpInst = curBlock.TailInst;
                 tmpInst != null; tmpInst = tmpInst.preIRInstruction)
                if (tmpInst instanceof parallelCopyInstruction) {
                    pcopy = (parallelCopyInstruction) tmpInst;
                    break;
                }
            if(pcopy == null) continue;
            /*for(var tmpInst : pcopy.PCMoveInst){
                System.out.println(tmpInst.toString());
            }
            System.out.println("------");
*/

            //Line 2
            ArrayList<moveInstruction> seq = new ArrayList<>();

            while(!pcopy.PCMoveInst.isEmpty()){
                moveInstruction tmpMoveInst = null;
                for(var moveInst1 : pcopy.PCMoveInst) {
                    tmpMoveInst = moveInst1;
                    for (var moveInst2 : pcopy.PCMoveInst)
                        if (moveInst1.rd == (moveInst2.rs)) {
                            tmpMoveInst = null;
                            break;
                        }
                    if (tmpMoveInst != null) break;
                }

                //Line 4-6
                if(tmpMoveInst != null){
                    seq.add(tmpMoveInst);
                    pcopy.PCMoveInst.remove(tmpMoveInst);
                } else {
                    //Line 8
                    tmpMoveInst = pcopy.PCMoveInst.iterator().next();//b<-a
                    IROperand a = tmpMoveInst.rs;

                    //Line 9
                    Register aPrime = new Register(a.thisType,"aPrime"+(RegNum++));

                    //Line 10
                    seq.add(new moveInstruction(curBlock,aPrime,a));

                    //Line 11
                    tmpMoveInst.rs = aPrime;
                }
            }

            if(curBlock.TailInst instanceof brInstruction){
                for(var tmpMoveInst : seq)
                    curBlock.addBasicBlockInstPreInst(curBlock.TailInst,tmpMoveInst);
            } else {
                for(var tmpMoveInst : seq)
                    curBlock.addBasicBlockInstAtFront(tmpMoveInst);
            }

            curBlock.removeInst(pcopy);
        }
    }
}
