package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.*;
import IR.TypeSystem.IntegerType;
import RISCV.Inst.RISCVInstruction;

import java.util.*;

public class SparseConditionalConstantPropagation extends Pass {

    public boolean ReturnChanged;
    public boolean ChangedInFunc;
    public IRFunction curFunc;
    public HashSet<IRBasicBlock> BlockVisited;

    public HashMap<IROperand, IROperand> ConstValueMap;

    public SparseConditionalConstantPropagation(IRModule tmpModule) {
        super(tmpModule);
        BlockVisited = new LinkedHashSet<>();
        ConstValueMap = new LinkedHashMap<>();
    }

    @Override
    public boolean run() {
        ReturnChanged = false;
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                curFunc = tmpFunc;
                SCCPInFunc();
            }
        return ReturnChanged;
    }

    public void SCCPInFunc() {
        int cnt = 50;
        while (true) {
            cnt--;;
            if(cnt == 0) break;
            ChangedInFunc = false;
            BlockVisited.clear();
            SCCPInBlock(curFunc.thisEntranceBlock);
            if (!ChangedInFunc) break;
        }
    }

    public void SCCPInBlock(IRBasicBlock curBlock) {
        if(BlockVisited.contains(curBlock)) return;

        BlockVisited.add(curBlock);

        //(1) remove unused block
/*        if (curBlock != curFunc.thisEntranceBlock && curBlock.CFGPredecessor.isEmpty()) {
            IRInstruction replaceInst = new brInstruction(curBlock,
                    null, curBlock, null);
            System.out.println(curBlock);
            curBlock.TailInst.replaceInst(replaceInst);
        }
*/
        //(2) check phi
        for(IRInstruction tmpInst = curBlock.HeadInst; tmpInst != null;
            tmpInst = tmpInst.nextIRInstruction){
            if(tmpInst instanceof phiInstruction){
                checkPhiInst((phiInstruction) tmpInst);
            } else break;
        }


        //(3) check inst
        for (IRInstruction tmpInst = curBlock.HeadInst;
             tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
            if (tmpInst instanceof brInstruction) {
                checkBranch((brInstruction) tmpInst);
            } else if ((tmpInst instanceof binaryOpInstruction && checkBinary((binaryOpInstruction) tmpInst))
                    || (tmpInst instanceof bitwiseBinaryInstruction && checkBitwise((bitwiseBinaryInstruction) tmpInst))
                    || (tmpInst instanceof icmpInstruction && checkIcmp((icmpInstruction) tmpInst))) {
                tmpInst.removeInst();
                ChangedInFunc = true;
            } else if(tmpInst instanceof moveInstruction && checkMove((moveInstruction) tmpInst)){
            //    tmpInst.removeInst();
                ChangedInFunc = true;
            }
        }

        for(var sucBlock : curBlock.CFGSuccessor)
            SCCPInBlock(sucBlock);
    }

    public void checkPhiInst(phiInstruction curInst){
        IROperand V1 = getConstant(curInst.PhiValue.get(0));
        if(curInst.PhiValue.size() == 1) {
            IRInstruction replaceInst = new moveInstruction(curInst.thisBasicBlock,
                    curInst.PhiResult, curInst.PhiValue.get(0));
            curInst.replaceInst(replaceInst);

            if(V1 != null) curInst.PhiResult.ReplaceRegisterUse(V1);
            else curInst.PhiResult.ReplaceRegisterUse(curInst.PhiValue.get(0));
            ChangedInFunc = true;
        } else if(V1 != null) {
            boolean PhiValueSame = true;
            if(V1 instanceof IntegerConstant) {
                for (int i = 1; i < curInst.PhiValue.size(); ++i) {
                    IROperand Vn = getConstant(curInst.PhiValue.get(i));
                    if (Vn == null || !(Vn instanceof IntegerConstant) ||
                            ((IntegerConstant) Vn).value != ((IntegerConstant) V1).value){
                        PhiValueSame = false;
                        break;
                    }
                }
                if(PhiValueSame){
                    curInst.PhiResult.ReplaceRegisterUse(V1);
                    ChangedInFunc = true;
                }
            } else if(V1 instanceof BooleanConstant){
                for (int i = 1; i < curInst.PhiValue.size(); ++i) {
                    IROperand Vn = getConstant(curInst.PhiValue.get(i));
                    if (Vn == null || !(Vn instanceof BooleanConstant) ||
                            ((BooleanConstant) Vn).value != ((BooleanConstant) V1).value){
                        PhiValueSame = false;
                        break;
                    }
                }
                if(PhiValueSame){
                    IRInstruction replaceInst = new moveInstruction(curInst.thisBasicBlock,
                            curInst.PhiResult, curInst.PhiValue.get(0));
                    curInst.replaceInst(replaceInst);
                    curInst.PhiResult.ReplaceRegisterUse(curInst.PhiValue.get(0));
                    ChangedInFunc = true;
                }
            }
        }
    }

    public void checkBranch(brInstruction curInst) {
        if (curInst.brCond != null && curInst.brCond.isConstant() && curInst.brCond instanceof BooleanConstant) {
            if (((BooleanConstant) curInst.brCond).value) {
                curInst.brCond = null;
                if(curInst.brIfFalse != null) {
                    curInst.brIfFalse.removePhiInstBlock(curInst.thisBasicBlock);
                    curInst.brIfFalse = null;
                }
            } else {
                curInst.brCond = null;
                if(curInst.brIfTrue != null) {
                    curInst.brIfTrue.removePhiInstBlock(curInst.thisBasicBlock);
                    curInst.brIfTrue = curInst.brIfFalse;
                    curInst.brIfFalse = null;
                }
            }
            ReturnChanged = true;
            ChangedInFunc = true;
        }
    }

    public boolean checkBinary(binaryOpInstruction curInst) {
        IROperand op1 = getConstant(curInst.BinaryOp1);
        IROperand op2 = getConstant(curInst.BinaryOp2);
        if (op1 != null && op2 != null) {
            if (op1 instanceof IntegerConstant && op2 instanceof IntegerConstant) {
                long value;
                if (curInst.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.add) {
                    value = ((IntegerConstant) op1).value + ((IntegerConstant) op2).value;
                } else if (curInst.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.sub) {
                    value = ((IntegerConstant) op1).value - ((IntegerConstant) op2).value;
                } else if (curInst.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.mul) {
                    value = ((IntegerConstant) op1).value * ((IntegerConstant) op2).value;
                } else if (curInst.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.sdiv) {
                    if (((IntegerConstant) op2).value == 0) return false;
                    value = ((IntegerConstant) op1).value / ((IntegerConstant) op2).value;
                } else if (curInst.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.srem) {
                    if (((IntegerConstant) op2).value == 0) return false;
                    value = ((IntegerConstant) op1).value % ((IntegerConstant) op2).value;
                } else {
                    throw new RuntimeException();
                }
                IntegerConstant replaceResult = new IntegerConstant(IntegerType.IRBitWidth.i32, value);
                ConstValueMap.put(curInst.BinaryResult, replaceResult);
                curInst.BinaryResult.ReplaceRegisterUse(replaceResult);
                return true;
            }
        }
        return false;
    }

    public boolean checkBitwise(bitwiseBinaryInstruction curInst) {
        IROperand op1 = getConstant(curInst.bitwiseBinaryOp1);
        IROperand op2 = getConstant(curInst.bitwiseBinaryOp2);
        if (op1 != null && op2 != null) {
            if (op1 instanceof IntegerConstant && op2 instanceof IntegerConstant) {
                long value;
                if (curInst.bitwiseBinaryOperandType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.shl) {
                    value = ((IntegerConstant) op1).value << ((IntegerConstant) op2).value;
                } else if (curInst.bitwiseBinaryOperandType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.ashr) {
                    value = ((IntegerConstant) op1).value >> ((IntegerConstant) op2).value;
                } else if (curInst.bitwiseBinaryOperandType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.or) {
                    value = ((IntegerConstant) op1).value | ((IntegerConstant) op2).value;
                } else if (curInst.bitwiseBinaryOperandType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor) {
                    value = ((IntegerConstant) op1).value ^ ((IntegerConstant) op2).value;
                } else if (curInst.bitwiseBinaryOperandType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.and) {
                    value = ((IntegerConstant) op1).value & ((IntegerConstant) op2).value;
                } else {
                    throw new RuntimeException();
                }
                IntegerConstant replaceResult = new IntegerConstant(IntegerType.IRBitWidth.i32, value);
                ConstValueMap.put(curInst.bitwiseBinaryResult, replaceResult);
                curInst.bitwiseBinaryResult.ReplaceRegisterUse(replaceResult);
                return true;
            } else if(op1 instanceof BooleanConstant && op2 instanceof BooleanConstant){
                boolean value;
                if(curInst.bitwiseBinaryOperandType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.and){
                    value = (((BooleanConstant) op1).value && ((BooleanConstant) op2).value);
                } else if(curInst.bitwiseBinaryOperandType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.or){
                    value = (((BooleanConstant) op1).value || ((BooleanConstant) op2).value);
                } else if(curInst.bitwiseBinaryOperandType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor){
                    value = (((BooleanConstant) op1).value != ((BooleanConstant) op2).value);
                } else {
                    throw new RuntimeException(curInst.toString());
                }
                BooleanConstant replaceResult = new BooleanConstant(value);
                ConstValueMap.put(curInst.bitwiseBinaryResult, replaceResult);
                curInst.bitwiseBinaryResult.ReplaceRegisterUse(replaceResult);
                return true;
            }
        }
        return false;
    }

    public boolean checkIcmp(icmpInstruction curInst) {
        IROperand op1 = getConstant(curInst.IcmpOp1);
        IROperand op2 = getConstant(curInst.IcmpOp2);
        if (op1 != null && op2 != null) {
            if (op1 instanceof BooleanConstant && op2 instanceof BooleanConstant) {
                boolean value;
                if (curInst.IcmpOperandType == icmpInstruction.IcmpOperandENUM.eq) {
                    value = (((BooleanConstant) op1).value == ((BooleanConstant) op2).value);
                } else if (curInst.IcmpOperandType == icmpInstruction.IcmpOperandENUM.ne) {
                    value = (((BooleanConstant) op1).value != ((BooleanConstant) op2).value);
                } else {
                    throw new RuntimeException();
                }
                BooleanConstant replaceResult = new BooleanConstant(value);
                ConstValueMap.put(curInst.IcmpResult, replaceResult);
                curInst.IcmpResult.ReplaceRegisterUse(replaceResult);
                return true;
            } else if (op1 instanceof IntegerConstant && op2 instanceof IntegerConstant) {
                boolean value;
                if (curInst.IcmpOperandType == icmpInstruction.IcmpOperandENUM.eq) {
                    value = (((IntegerConstant) op1).value == ((IntegerConstant) op2).value);
                } else if (curInst.IcmpOperandType == icmpInstruction.IcmpOperandENUM.ne) {
                    value = (((IntegerConstant) op1).value != ((IntegerConstant) op2).value);
                } else if (curInst.IcmpOperandType == icmpInstruction.IcmpOperandENUM.sgt) {
                    value = (((IntegerConstant) op1).value > ((IntegerConstant) op2).value);
                } else if (curInst.IcmpOperandType == icmpInstruction.IcmpOperandENUM.sge) {
                    value = (((IntegerConstant) op1).value >= ((IntegerConstant) op2).value);
                } else if (curInst.IcmpOperandType == icmpInstruction.IcmpOperandENUM.slt) {
                    value = (((IntegerConstant) op1).value < ((IntegerConstant) op2).value);
                } else if (curInst.IcmpOperandType == icmpInstruction.IcmpOperandENUM.sle) {
                    value = (((IntegerConstant) op1).value <= ((IntegerConstant) op2).value);
                } else {
                    throw new RuntimeException();
                }
                BooleanConstant replaceResult = new BooleanConstant(value);
                ConstValueMap.put(curInst.IcmpResult, replaceResult);
                curInst.IcmpResult.ReplaceRegisterUse(replaceResult);
                return true;
            }
        }
        return false;
    }

    public boolean checkMove(moveInstruction curInst){
        boolean canRemove = true;
        IRInstruction preInst = null;
        for(var tmp : curInst.rd.Defs){
            if(preInst == null){
                preInst = tmp;
            } else {
                if(preInst != tmp){
                    canRemove = false;
                    break;
                }
            }
        }
        if(!canRemove) return false;
        IROperand rs = getConstant(curInst.rs);
        if(rs != null){
            if (rs instanceof BooleanConstant) {
                BooleanConstant replaceResult = new BooleanConstant(((BooleanConstant) rs).value);
                ConstValueMap.put(curInst.rd, replaceResult);
                curInst.rd.ReplaceRegisterUse(replaceResult);
                return true;
            } else if (rs instanceof IntegerConstant) {
                IntegerConstant replaceResult = new IntegerConstant(IntegerType.IRBitWidth.i32,
                        ((IntegerConstant) rs).value);
                ConstValueMap.put(curInst.rd,replaceResult);

                curInst.rd.ReplaceRegisterUse(replaceResult);
                return true;
            }
        }
        return false;
    }

    public IROperand getConstant(IROperand curOperand) {
        if (curOperand.isConstant()) {
            if (curOperand instanceof NullConstant)
                return new IntegerConstant(IntegerType.IRBitWidth.i32, 0);
            else
                return curOperand;
        }
        return ConstValueMap.getOrDefault(curOperand, null);
    }
}
