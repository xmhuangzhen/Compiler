package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.*;
import IR.Operand.GlobalVariables;
import IR.Operand.IROperand;
import IR.Operand.Register;
import IR.TypeSystem.VoidType;


import java.util.*;

public class InlineExpander extends Pass {

    public HashMap<IRFunction, Integer> FuncInstNumMap;
    public HashSet<IRFunction> CalleeFunc;
    public HashSet<IRFunction> CanBeInlined;
    public HashMap<IROperand, IROperand> CalleeIROperandMap;
    HashMap<IRBasicBlock, IRBasicBlock> BlockMap;


    public static int InstLimit = 600;
    public static int BlockNum = 0, RegNum = 0;

    public InlineExpander(IRModule tmpModule) {
        super(tmpModule);
        FuncInstNumMap = new HashMap<>();
        CanBeInlined = new HashSet<>();
        CalleeIROperandMap = new LinkedHashMap<>();
        BlockMap = new LinkedHashMap<>();
        CalleeFunc = new HashSet<>();
    }

    @Override
    public boolean run() {
        boolean modified = false;
        int InlineCnt = 10;
        while (true) {
            InlineCnt--;
            if (InlineCnt == 0) break;
            boolean changed = tryInline();
            modified |= changed;
            if (!changed) break;
        }
        return modified;
    }

    public boolean tryInline() {
        FuncInstNumMap.clear();
        CanBeInlined.clear();
        CalleeFunc.clear();
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                CanBeInlined.add(tmpFunc);
            }
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                updateFuncInstNumMap(tmpFunc);
            }
        HashSet<String> removeFuncList = new HashSet<>();
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                if (!CalleeFunc.contains(tmpFunc) &&
                        !tmpFunc.thisFunctionName.equals("main"))
                    removeFuncList.add(tmpFunc.thisFunctionName);
            }
        for (var tmpString : removeFuncList)
            curIRModule.IRFunctionTable.remove(tmpString);
        //   System.out.println("-------------------");
        //System.out.println(CanBeInlined);
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                for (IRBasicBlock tmpBlock = tmpFunc.thisEntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
                    for (IRInstruction tmpInst = tmpBlock.HeadInst;
                         tmpInst != null; tmpInst = tmpInst.nextIRInstruction)
                        if (tmpInst instanceof callInstruction &&
                                CanBeInlined.contains(((callInstruction) tmpInst).CallFunction)) {
                            boolean changed = InlineCall((callInstruction) tmpInst, tmpFunc);
                            if (changed) return true;
                        }
                }
            }
        return false;
    }

    public void updateFuncInstNumMap(IRFunction tmpFunc) {
        int cnt = 0;
        for (IRBasicBlock tmpBlock = tmpFunc.thisEntranceBlock;
             tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
            for (IRInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                cnt++;
                if (tmpInst instanceof callInstruction) {
                    if (CanBeInlined.contains(tmpFunc))
                        CanBeInlined.remove(tmpFunc);
                    if (!CalleeFunc.contains(((callInstruction) tmpInst).CallFunction))
                        CalleeFunc.add(((callInstruction) tmpInst).CallFunction);
                }
            }
        }
        if (!FuncInstNumMap.containsKey(tmpFunc))
            FuncInstNumMap.put(tmpFunc, cnt);
        else
            FuncInstNumMap.replace(tmpFunc, cnt);
    }

    public boolean InlineCall(callInstruction CallInst, IRFunction curFunc) {
        //    System.out.println("---------------------------");
        //  System.out.println(CallInst+","+CallInst.thisBasicBlock+","+curFunc.thisFunctionName);
        IRBasicBlock curBlock = CallInst.thisBasicBlock;
        IRFunction calleeFunc = CallInst.CallFunction;
        if (FuncInstNumMap.get(calleeFunc) + FuncInstNumMap.get(calleeFunc) >= InstLimit)
            return false;

        BlockMap.clear();
        for (IRBasicBlock tmpBlock = calleeFunc.thisEntranceBlock;
             tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
            IRBasicBlock repBlock = new IRBasicBlock(curFunc,
                    tmpBlock.BasicBlockName + "_i" + (BlockNum++));
            BlockMap.put(tmpBlock, repBlock);
        }
        IRBasicBlock repEndBlock = getReplaceBlock(calleeFunc.thisReturnBlock);
        IRBasicBlock repStartBlock = getReplaceBlock(calleeFunc.thisEntranceBlock);

        CalleeIROperandMap.clear();
        for (int i = 0; i < CallInst.CallParameters.size(); ++i) {
            Register tmpReg = new Register(calleeFunc.thisFunctionParameters.get(i).thisType,
                    calleeFunc.thisFunctionName + "_ip" + i + "_" + (RegNum++));
            tmpReg.NeedPtr = CallInst.CallParameters.get(i).NeedPtr;
            repStartBlock.addBasicBlockInst(new moveInstruction(repStartBlock,
                    tmpReg, CallInst.CallParameters.get(i)));
            CalleeIROperandMap.put(calleeFunc.thisFunctionParameters.get(i),
                    tmpReg);
        }

        for (IRBasicBlock tmpBlock = calleeFunc.thisEntranceBlock;
             tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
            IRBasicBlock repBlock = BlockMap.get(tmpBlock);
            repBlock.prevBasicBlocks = getReplaceBlock(tmpBlock.prevBasicBlocks);
            repBlock.nextBasicBlocks = getReplaceBlock(tmpBlock.nextBasicBlocks);
            for (IRInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                IRInstruction repInst = getReplaceInst(tmpInst, repBlock);
                if (repInst != null) {
                    repBlock.addBasicBlockInst(repInst);
                }
            }
        }


        IRBasicBlock AfterCallBlock = new IRBasicBlock(curFunc,
                CallInst.thisBasicBlock.BasicBlockName + "_AB_" + (BlockNum++));
        AfterCallBlock.prevBasicBlocks = repEndBlock;
        AfterCallBlock.nextBasicBlocks = curBlock.nextBasicBlocks;
        if (curBlock.nextBasicBlocks != null)
            curBlock.nextBasicBlocks.prevBasicBlocks = AfterCallBlock;
        repEndBlock.nextBasicBlocks = AfterCallBlock;
        curBlock.nextBasicBlocks = repStartBlock;
        repStartBlock.prevBasicBlocks = curBlock;

        if (!(calleeFunc.thisFunctionType.FuncReturnType instanceof VoidType)) {
            IRInstruction repInst = new moveInstruction(AfterCallBlock,
                    CallInst.CallResult, getReplaceOperand(calleeFunc.thisReturnValue));
            repInst.preIRInstruction = null;
            repInst.nextIRInstruction = null;
            AfterCallBlock.addBasicBlockInst(repInst);
            //    CallInst.CallResult.ReplaceRegisterUse(
            //          getReplaceOperand(calleeFunc.thisReturnValue));
            for (var tmp : CallInst.CallResult.use) {
                if (tmp instanceof phiInstruction) {
                    for (int i = 0; i < ((phiInstruction) tmp).PhiValue.size(); ++i)
                        if (((phiInstruction) tmp).PhiValue.get(i) == CallInst.CallResult) {
                            if (((phiInstruction) tmp).PhiLabel.get(i) == curBlock) {
                                ((phiInstruction) tmp).PhiLabel.set(i, AfterCallBlock);
                            }
                        }
                }
            }
        }


        for(IRInstruction tmpInstI= CallInst.nextIRInstruction;
        tmpInstI != null;){
            IRInstruction curInst = tmpInstI;
            tmpInstI = tmpInstI.nextIRInstruction;
            curInst.thisBasicBlock = AfterCallBlock;
            curInst.preIRInstruction = null;
            curInst.nextIRInstruction = null;
            AfterCallBlock.addBasicBlockInst(curInst);

            for (var tmp : curInst.getuse()) {
                for (var tmpInst : tmp.use) {
                    if (tmpInst instanceof phiInstruction) {
                        for (int i = 0; i < ((phiInstruction) tmpInst).PhiValue.size(); ++i)
                            if (((phiInstruction) tmpInst).PhiValue.get(i) == tmp) {
                                if (((phiInstruction) tmpInst).PhiLabel.get(i) == curBlock) {
                                    ((phiInstruction) tmpInst).PhiLabel.set(i, AfterCallBlock);
                                }
                            }
                    }
                }
            }

            for (var tmp : curInst.getdef()) {
                for (var tmpInst : tmp.use) {
                    if (tmpInst instanceof phiInstruction) {
                        for (int i = 0; i < ((phiInstruction) tmpInst).PhiValue.size(); ++i)
                            if (((phiInstruction) tmpInst).PhiValue.get(i) == tmp) {
                                if (((phiInstruction) tmpInst).PhiLabel.get(i) == curBlock) {
                                    ((phiInstruction) tmpInst).PhiLabel.set(i, AfterCallBlock);
                                }
                            }
                    }
                }
            }
        }

//        if(CallInst.nextIRInstruction != null)
  //          System.out.println(CallInst.nextIRInstruction.preIRInstruction);

        CallInst.nextIRInstruction = null;
        curBlock.TailInst = CallInst;
        CallInst.removeInst();
        curBlock.addBasicBlockInst(new brInstruction(curBlock,null,repStartBlock,null));


    /*    System.out.println("!!!!!!!!!!!!!!!!!!!!");
        for(var tmp = AfterCallBlock.HeadInst;tmp != null; tmp = tmp.nextIRInstruction){
            System.out.println(tmp);
        }
        System.out.println("@@@@@@@@@@@@@@@@@@@@");
        for(var tmp = AfterCallBlock.TailInst;tmp != null; tmp = tmp.preIRInstruction){
            System.out.println(tmp);
        }
        System.out.println("####################");

     */


        repEndBlock.addBasicBlockInst(new brInstruction(repEndBlock,
                null, AfterCallBlock, null));

        constructCFG(curFunc);//maybe not need?
        return true;
    }

    public IRInstruction getReplaceInst(IRInstruction curInst, IRBasicBlock repBlock) {
        if (curInst instanceof binaryOpInstruction) {
            binaryOpInstruction OriInst = (binaryOpInstruction) curInst;
            binaryOpInstruction resInst = new binaryOpInstruction(repBlock,
                    OriInst.BinaryOperandType,
                    getReplaceOperand(OriInst.BinaryOp1),
                    getReplaceOperand(OriInst.BinaryOp2),
                    (Register) getReplaceOperand(OriInst.BinaryResult));
            return resInst;
        } else if (curInst instanceof bitcastInstruction) {
            bitcastInstruction OriInst = (bitcastInstruction) curInst;
            bitcastInstruction resInst = new bitcastInstruction(repBlock,
                    getReplaceOperand(OriInst.bitcastOperand),
                    OriInst.bitcastType2,
                    (Register) getReplaceOperand(OriInst.bitcastResult));
            return resInst;
        } else if (curInst instanceof bitwiseBinaryInstruction) {
            bitwiseBinaryInstruction OriInst = (bitwiseBinaryInstruction) curInst;
            bitwiseBinaryInstruction resInst = new bitwiseBinaryInstruction(
                    repBlock, OriInst.bitwiseBinaryOperandType,
                    getReplaceOperand(OriInst.bitwiseBinaryOp1),
                    getReplaceOperand(OriInst.bitwiseBinaryOp2),
                    (Register) getReplaceOperand(OriInst.bitwiseBinaryResult));
            return resInst;
        } else if (curInst instanceof brInstruction) {
            brInstruction OriInst = (brInstruction) curInst;
            brInstruction resInst = new brInstruction(repBlock,
                    getReplaceOperand(OriInst.brCond),
                    getReplaceBlock(OriInst.brIfTrue),
                    getReplaceBlock(OriInst.brIfFalse));
            return resInst;
        } else if (curInst instanceof callInstruction) {
            callInstruction OriInst = (callInstruction) curInst;
            callInstruction resInst = new callInstruction(repBlock,
                    (Register) getReplaceOperand(OriInst.CallResult), OriInst.CallFunction);
            for (int i = 0; i < OriInst.CallParameters.size(); ++i)
                resInst.CallParameters.add(getReplaceOperand(OriInst.CallParameters.get(i)));
            return resInst;
        } else if (curInst instanceof getElementPtrInstruction) {
            getElementPtrInstruction OriInst = (getElementPtrInstruction) curInst;
            getElementPtrInstruction resInst = new getElementPtrInstruction(
                    repBlock, getReplaceOperand(OriInst.GetElementPtrPtr),
                    (Register) getReplaceOperand(OriInst.GetElementPtrResult));
            for (int i = 0; i < OriInst.GetElementPtrIdx.size(); ++i)
                resInst.GetElementPtrIdx.add(getReplaceOperand(OriInst.GetElementPtrIdx.get(i)));
            return resInst;
        } else if (curInst instanceof icmpInstruction) {
            icmpInstruction OriInst = (icmpInstruction) curInst;
            icmpInstruction resInst = new icmpInstruction(repBlock,
                    OriInst.IcmpOperandType, OriInst.IcmpType,
                    getReplaceOperand(OriInst.IcmpOp1),
                    getReplaceOperand(OriInst.IcmpOp2),
                    (Register) getReplaceOperand(OriInst.IcmpResult));
            return resInst;
        } else if (curInst instanceof loadInstruction) {
            loadInstruction OriInst = (loadInstruction) curInst;
            loadInstruction resInst = new loadInstruction(repBlock,
                    (Register) getReplaceOperand(OriInst.LoadResult),
                    getReplaceOperand(OriInst.LoadPointer));
            return resInst;
        } else if (curInst instanceof moveInstruction) {
            moveInstruction OriInst = (moveInstruction) curInst;
            moveInstruction resInst = new moveInstruction(repBlock,
                    getReplaceOperand(OriInst.rd), getReplaceOperand(OriInst.rs));
            return resInst;
        } else if (curInst instanceof phiInstruction) {
            phiInstruction OriInst = (phiInstruction) curInst;
            phiInstruction resInst = new phiInstruction(repBlock,
                    (Register) getReplaceOperand(OriInst.PhiResult));
            for (int i = 0; i < OriInst.PhiLabel.size(); ++i)
                resInst.PhiLabel.add(getReplaceBlock(OriInst.PhiLabel.get(i)));
            for (int i = 0; i < OriInst.PhiValue.size(); ++i)
                resInst.PhiValue.add(getReplaceOperand(OriInst.PhiValue.get(i)));
            return resInst;
        } else if (curInst instanceof storeInstruction) {
            storeInstruction OriInst = (storeInstruction) curInst;
            storeInstruction resInst = new storeInstruction(repBlock,
                    getReplaceOperand(OriInst.StoreValue),
                    getReplaceOperand(OriInst.StorePointer));
            return resInst;
        } else {
            return null;
        }
    }

    public IROperand getReplaceOperand(IROperand OriOperand) {
        if (OriOperand == null) return null;
        if (CalleeIROperandMap.containsKey(OriOperand))
            return CalleeIROperandMap.get(OriOperand);
        IROperand resOperand;
        if (OriOperand.isConstant())
            resOperand = OriOperand;
        else if (OriOperand instanceof GlobalVariables)
            resOperand = OriOperand;
        else if (OriOperand instanceof Register)
            resOperand = new Register(OriOperand.thisType,
                    ((Register) OriOperand).RegisterName + "_i" + (RegNum++));
        else throw new RuntimeException();
        CalleeIROperandMap.put(OriOperand, resOperand);
        return resOperand;
    }

    public IRBasicBlock getReplaceBlock(IRBasicBlock curBlock) {
        if (curBlock == null) return null;
        return BlockMap.get(curBlock);
    }

    public void constructCFG(IRFunction curFunc) {
        for (IRBasicBlock tmpIRBasicBlock = curFunc.thisEntranceBlock;
             tmpIRBasicBlock != null;
             tmpIRBasicBlock = tmpIRBasicBlock.nextBasicBlocks) {
            tmpIRBasicBlock.CFGSuccessor.clear();
            tmpIRBasicBlock.CFGPredecessor.clear();
        }

        for (IRBasicBlock tmpIRBasicBlock = curFunc.thisEntranceBlock;
             tmpIRBasicBlock != null;
             tmpIRBasicBlock = tmpIRBasicBlock.nextBasicBlocks) {
            for (IRInstruction tmpInst = tmpIRBasicBlock.HeadInst;
                 tmpInst != null;
                 tmpInst = tmpInst.nextIRInstruction) {
                if (tmpInst instanceof brInstruction) {
                    if (((brInstruction) tmpInst).brIfTrue != null) {
                        tmpIRBasicBlock.CFGSuccessor.add(((brInstruction) tmpInst).brIfTrue);
                        ((brInstruction) tmpInst).brIfTrue.CFGPredecessor.add(tmpIRBasicBlock);
                    }
                    if (((brInstruction) tmpInst).brIfFalse != null) {
                        tmpIRBasicBlock.CFGSuccessor.add(((brInstruction) tmpInst).brIfFalse);
                        ((brInstruction) tmpInst).brIfFalse.CFGPredecessor.add(tmpIRBasicBlock);
                    }
                }
            }
        }
    }
}