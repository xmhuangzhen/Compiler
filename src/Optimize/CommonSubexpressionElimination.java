package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.*;
import IR.Operand.GlobalVariables;
import IR.Operand.IROperand;
import IR.Operand.Register;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;

//useless

public class CommonSubexpressionElimination extends Pass {

    public HashMap<String, Register> CSEInstMap;
    public HashMap<IRBasicBlock, IROperand> GlobalVarMap;

    public CommonSubexpressionElimination(IRModule tmpModule) {
        super(tmpModule);
        CSEInstMap = new HashMap<>();
        GlobalVarMap = new HashMap<>();
    }

    @Override
    public boolean run() {
        boolean modified = false;
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                for (IRBasicBlock tmpBlock = tmpFunc.thisEntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
                    CSEInstMap.clear();
                    for (IRInstruction tmpInst = tmpBlock.HeadInst;
                         tmpInst != null; tmpInst = tmpInst.nextIRInstruction)
                        if (tmpInst instanceof binaryOpInstruction
                                || tmpInst instanceof bitcastInstruction
                                || tmpInst instanceof bitwiseBinaryInstruction
                                || tmpInst instanceof icmpInstruction) {
                            String tmpString = getCSEString(tmpInst);
                            if (CSEInstMap.containsKey(tmpString)) {
                                Register rd = getRd(tmpInst);
                                Register rs = CSEInstMap.get(tmpString);
                                IRInstruction repInst =
                                        new moveInstruction(tmpBlock, rd, rs);
                                tmpInst.replaceInst(repInst);
                                tmpInst = repInst;
                                rd.ReplaceRegisterUse(rs);
                                modified = true;
                            } else {
                                CSEInstMap.put(tmpString, getRd(tmpInst));
                            }
                        }
                }
            }


        ArrayList<IRInstruction> NeedMoveInst = new ArrayList<>();
        GlobalVarMap.clear();
        for (GlobalVariables curGlobalVar : curIRModule.IRGlobalVarTable.values()) {
            for (IRFunction curFunc : curIRModule.IRFunctionTable.values())
                if (!curFunc.IsBuiltIn) {
                    for (IRBasicBlock curBlock = curFunc.thisEntranceBlock;
                         curBlock != null; curBlock = curBlock.nextBasicBlocks) {
                        IROperand curGVReg = null;
                        if (GlobalVarMap.containsKey(curBlock))
                            curGVReg = GlobalVarMap.get(curBlock);

                        NeedMoveInst.clear();
                        boolean NeedStoreAtLast = false;
                        for (IRInstruction curInst = curBlock.HeadInst;
                             curInst != null; curInst = curInst.nextIRInstruction) {
                            if (curInst instanceof loadInstruction &&
                                    ((loadInstruction) curInst).LoadPointer == curGlobalVar) {
                                if (curGVReg == null) curGVReg = ((loadInstruction) curInst).LoadResult;
                                else {
                                    ((loadInstruction) curInst).LoadResult.ReplaceRegisterUse(curGVReg);
                                    NeedMoveInst.add(curInst);
                                }
                            } else if (curInst instanceof storeInstruction &&
                                    ((storeInstruction) curInst).StorePointer == curGlobalVar) {
                                curGVReg = ((storeInstruction) curInst).StoreValue;
                                NeedMoveInst.add(curInst);
                                NeedStoreAtLast = true;
                            } else if (curInst instanceof callInstruction &&
                                    !((callInstruction) curInst).CallFunction.IsBuiltIn &&
                                    BeUsedInCalleeFunc(curGlobalVar, (callInstruction) curInst)) {
                                if (NeedStoreAtLast) {
                                    curBlock.addBasicBlockInstPreInst(curInst,
                                            new storeInstruction(curBlock, curGVReg, curGlobalVar));
                                    NeedStoreAtLast = false;
                                }
                                curGVReg = null;
                            }
                        }

                        if (NeedStoreAtLast) {
                            curBlock.addBasicBlockInstPreInst(curBlock.TailInst,
                                    new storeInstruction(curBlock, curGVReg, curGlobalVar));
                        }

                        if (curGVReg != null) {
                            if(curBlock.CFGSuccessor.size() == 1){
                                IRBasicBlock sucBlock = curBlock.CFGSuccessor.get(0);
                                if (sucBlock.CFGPredecessor.size() == 1 &&
                                        sucBlock.CFGPredecessor.get(0) == curBlock) {
                                    GlobalVarMap.put(sucBlock, curGVReg);
                                }
                            }
                        }

                        for(IRInstruction tmpInst : NeedMoveInst){
                            tmpInst.removeInst();
                            modified = true;
                        }
                    }
                }
        }

        return modified;
    }

    public String getCSEString(IRInstruction curInst) {
        if (curInst instanceof binaryOpInstruction) {
            binaryOpInstruction tmpInst = (binaryOpInstruction) curInst;
            return tmpInst.BinaryOp1 + "|" + tmpInst.BinaryOperandType.name() +
                    "|" + tmpInst.BinaryOp2;
        } else if (curInst instanceof bitcastInstruction) {
            bitcastInstruction tmpInst = (bitcastInstruction) curInst;
            return tmpInst.bitcastOperand + "|" + tmpInst.bitcastType2;
        } else if (curInst instanceof bitwiseBinaryInstruction) {
            bitwiseBinaryInstruction tmpInst = (bitwiseBinaryInstruction) curInst;
            return tmpInst.bitwiseBinaryOp1 + "|" + tmpInst.bitwiseBinaryOperandType.name() +
                    "|" + tmpInst.bitwiseBinaryOp2;
        } else if (curInst instanceof icmpInstruction) {
            icmpInstruction tmpInst = (icmpInstruction) curInst;
            return tmpInst.IcmpOp1 + "|" + tmpInst.IcmpOperandType.name() + "|" +
                    tmpInst.IcmpOp2;
/*        } else if(curInst instanceof getElementPtrInstruction){
            getElementPtrInstruction tmpInst = (getElementPtrInstruction) curInst;
            StringBuilder tmpRet = new StringBuilder();
            tmpRet.append(tmpInst.GetElementPtrResult+"|"+tmpInst.GetElementPtrPtr+"|");
            for(int i = 0;i < tmpInst.GetElementPtrIdx.size();++i)
                tmpRet.append(tmpInst.GetElementPtrIdx.get(i)+"|");
            return tmpRet.toString();
  */
        } else {
            throw new RuntimeException();
        }
    }

    public Register getRd(IRInstruction curInst) {
        if (curInst instanceof binaryOpInstruction) {
            return ((binaryOpInstruction) curInst).BinaryResult;
        } else if (curInst instanceof bitcastInstruction) {
            return ((bitcastInstruction) curInst).bitcastResult;
        } else if (curInst instanceof bitwiseBinaryInstruction) {
            return ((bitwiseBinaryInstruction) curInst).bitwiseBinaryResult;
        } else if (curInst instanceof icmpInstruction) {
            return ((icmpInstruction) curInst).IcmpResult;
/*        } else if(curInst instanceof getElementPtrInstruction){
            return ((getElementPtrInstruction) curInst).GetElementPtrResult;
  */
        } else {
            throw new RuntimeException();
        }
    }

    public boolean BeUsedInCalleeFunc(GlobalVariables curGlobalVar, callInstruction curInst) {
        IRFunction curFunc = curInst.thisBasicBlock.BasicBlockFunction;
        if (curFunc == curInst.CallFunction) return true;
        return QueryAtCalleeFunc(curGlobalVar, curInst.CallFunction);
    }

    public boolean QueryAtCalleeFunc(GlobalVariables curGlobalVar, IRFunction calleeFunc) {
        for (IRBasicBlock tmpBlock = calleeFunc.thisEntranceBlock;
             tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
            for (IRInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                if (tmpInst instanceof loadInstruction &&
                        ((loadInstruction) tmpInst).LoadPointer == curGlobalVar) {
                    return true;
                }
                if (tmpInst instanceof storeInstruction &&
                        ((storeInstruction) tmpInst).StorePointer == curGlobalVar) {
                    return true;
                }
                if (tmpInst instanceof callInstruction &&
                        !((callInstruction) tmpInst).CallFunction.IsBuiltIn) {
                    return true;
                }
            }
        }
        return false;
    }
}