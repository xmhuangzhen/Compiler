package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.brInstruction;
import IR.Instruction.phiInstruction;
import IR.Operand.IROperand;
import IR.Operand.Register;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Queue;

//http://www.cs.cmu.edu/afs/cs/academic/class/15745-s12/public/lectures/L14-SSA-Optimizations-1up.pdf

public class AggressiveDeadCodeElimination extends Pass {

    public IRFunction curFunc;
    public HashSet<IRInstruction> LiveInst;
    public Queue<IRInstruction> W;
    public HashSet<IRInstruction> WVisited;

    public AggressiveDeadCodeElimination(IRModule tmpModule) {
        super(tmpModule);
        LiveInst = new LinkedHashSet<>();
        W = new LinkedList<>();
        WVisited = new LinkedHashSet<>();
    }

    @Override
    public boolean run() {
        PostDominatorTreeConstructor tmpPostDT = new PostDominatorTreeConstructor(curIRModule);
        tmpPostDT.run();
        PostDominanceFrontierConstructor tmpPostDF =
                new PostDominanceFrontierConstructor(curIRModule);
        tmpPostDF.run();

        boolean modified = false;
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                curFunc = tmpFunc;
                LiveInst.clear();
                W.clear();
                WVisited.clear();

               // System.out.println("---------------------" + curFunc.thisFunctionName + "-------------");
                for (IRBasicBlock tmpBlock = curFunc.thisReturnBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.prevBasicBlocks) {
                    for (IRInstruction tmpInst = tmpBlock.TailInst;
                         tmpInst != null; tmpInst = tmpInst.preIRInstruction)
                        if (tmpInst.HasSideEffect) {
                            W.offer(tmpInst);
                            WVisited.add(tmpInst);
                        }
                }

                while (!W.isEmpty()) {
                    IRInstruction S = W.poll();
                  //  System.out.println(S);
                    if (LiveInst.contains(S)) continue;
                    LiveInst.add(S);
                    //       System.out.println("----------------");
                    //     System.out.println(S.toString());

                    for (IROperand tmpReg : S.getuse()) {
                        //                    System.out.println(tmpReg.toString());
                        for (IRInstruction tmpInst : tmpReg.Defs) {
                            if (tmpReg.Defs != null && !WVisited.contains(tmpInst)) {
                                W.offer(tmpInst);
                                WVisited.add(tmpInst);
                            }
                        }
                    }

                    if (S instanceof phiInstruction) {
                        for (IRBasicBlock tmpBlock : ((phiInstruction) S).PhiLabel) {
                            IRInstruction checkInst = tmpBlock.TailInst;
                            if (checkInst instanceof brInstruction && !WVisited.contains(checkInst)) {
                                W.offer(checkInst);
                                WVisited.add(checkInst);
                            }

                            if(checkInst != null) {
                                checkInst = checkInst.preIRInstruction;
                                if (checkInst instanceof brInstruction && !WVisited.contains(checkInst)) {
                                    W.offer(checkInst);
                                    WVisited.add(checkInst);
                                }
                            }
                        }
                    }

                    for (IRBasicBlock preBlock : S.thisBasicBlock.PostDominanceFrontier) {
                        IRInstruction checkInst = preBlock.TailInst;
                        if (checkInst instanceof brInstruction && !WVisited.contains(checkInst)) {
                            W.offer(checkInst);
                            WVisited.add(checkInst);
                        }

                        checkInst = checkInst.preIRInstruction;
                        if (checkInst instanceof brInstruction && !WVisited.contains(checkInst)) {
                            W.offer(checkInst);
                            WVisited.add(checkInst);
                        }
                    }

                    for(var preBlock : S.thisBasicBlock.CFGSuccessor){
                        IRInstruction checkInst = preBlock.TailInst;
                        if (checkInst instanceof brInstruction && !WVisited.contains(checkInst)) {
                            W.offer(checkInst);
                            WVisited.add(checkInst);
                        }

                        checkInst = checkInst.preIRInstruction;
                        if (checkInst instanceof brInstruction && !WVisited.contains(checkInst)) {
                            W.offer(checkInst);
                            WVisited.add(checkInst);
                        }
                    }

                    IRInstruction checkInst = S.thisBasicBlock.TailInst;
                    if (checkInst instanceof brInstruction && !WVisited.contains(checkInst)) {
                        W.offer(checkInst);
                        WVisited.add(checkInst);
                    }

                    if(checkInst != null) {
                        checkInst = checkInst.preIRInstruction;
                        if (checkInst instanceof brInstruction && !WVisited.contains(checkInst)) {
                            W.offer(checkInst);
                            WVisited.add(checkInst);
                        }
                    }

                }

                for (IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
                    for (IRInstruction tmpInst = tmpBlock.HeadInst;
                         tmpInst != null; tmpInst = tmpInst.nextIRInstruction)
                        if (!LiveInst.contains(tmpInst)) {
                            tmpInst.removeInst();
                            modified = true;
                        }
                }
            }
        return modified;
    }
}
