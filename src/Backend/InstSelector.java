package Backend;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.*;
import IR.TypeSystem.IntegerType;
import IR.TypeSystem.PointerType;
import IR.TypeSystem.StructureType;
import RISCV.Inst.*;
import RISCV.Operand.*;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;
import org.stringtemplate.v4.ST;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import static RISCV.RISCVModule.Max_Imm;
import static RISCV.RISCVModule.Min_Imm;

public class InstSelector implements IRVisitor {

    public IRModule curIRModule;
    public RISCVModule curRISCVModule;
    public RISCVFunction curRISCVFunction;
    public RISCVBasicBlock curRISCVBasicBlock;

    public InstSelector(IRModule tmpModule) {
        curIRModule = tmpModule;
        curRISCVModule = new RISCVModule();
        curRISCVFunction = null;
        curRISCVBasicBlock = null;
    }

    @Override
    public void visit(IRModule it) {
        for (var tmpVar : it.IRGlobalVarTable.values()) {
            curRISCVModule.addGlobalReg(tmpVar);
        }
        for (var tmpFunc : it.IRFunctionTable.values()) {
            curRISCVModule.addFunc(tmpFunc);
        }
        for (var tmpFunc : it.IRFunctionTable.values()) {
            if (!tmpFunc.IsBuiltIn) {
                tmpFunc.accept(this);
            }
        }
    }

    @Override
    public void visit(IRFunction it) {
        curRISCVFunction = curRISCVModule.RISCVFuncMap.get(it);
        curRISCVBasicBlock = curRISCVModule.getRISCVBasicBlock(it.thisEntranceBlock);

        //(1) save reg
        ArrayList<RISCVVirtualReg> calleeSaveReg;//s0-s11
        calleeSaveReg = new ArrayList<>();
        for (int i = 0; i < 12; ++i) {
            RISCVVirtualReg tmpReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(tmpReg, curRISCVModule.getPhyReg("s" + i)));
            calleeSaveReg.add(tmpReg);
        }
        curRISCVBasicBlock.addInstruction(new RISCVmvInst(new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++),
                curRISCVModule.getPhyReg("ra")));

        //(2) add para to PhyReg
        for (int i = 0; i < Integer.min(8, it.thisFunctionParameters.size()); ++i) {//a0-a7
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(curRISCVModule.getPhyReg("a" + i),
                    curRISCVModule.getRISCVReg(it.thisFunctionParameters.get(i), curRISCVBasicBlock)));
        }
        int OffsetValue = 0;
        for (int i = 8; i < it.thisFunctionParameters.size(); ++i) {
            curRISCVBasicBlock.addInstruction(new RISCVlInst(
                    curRISCVModule.getWidth(it.thisFunctionParameters.get(i)),
                    curRISCVModule.getPhyReg("sp"),
                    curRISCVModule.getRISCVReg(it.thisFunctionParameters.get(i), curRISCVBasicBlock),
                    new RISCVImm(OffsetValue)));
            OffsetValue += 4;
        }

        for (IRBasicBlock tmpBlock = it.thisEntranceBlock; tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks){
            curRISCVModule.getRISCVBasicBlock(tmpBlock);
        }

        for (IRBasicBlock tmpBlock = it.thisEntranceBlock; tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks)
            tmpBlock.accept(this);
        curRISCVFunction = null;
        curRISCVBasicBlock = null;
    }

    @Override
    public void visit(IRBasicBlock it) {
        curRISCVBasicBlock = curRISCVModule.getRISCVBasicBlock(it);
        curRISCVFunction.addBlock(curRISCVBasicBlock);
        for (IRInstruction tmpInst = it.HeadInst; tmpInst != null; tmpInst = tmpInst.nextIRInstruction)
            tmpInst.accept(this);
    }


    @Override
    public void visit(retInstruction it) {
        if (it.returnValue != null) {
            RISCVRegister tmpRISCVReturnVal = curRISCVModule.getRISCVReg(it.returnValue, curRISCVBasicBlock);
            if (tmpRISCVReturnVal instanceof RISCVGlobalReg)
                curRISCVBasicBlock.addInstruction(new RISCVlaInst(curRISCVModule.getPhyReg("a0"),
                        (RISCVGlobalReg) tmpRISCVReturnVal));
            else
                curRISCVBasicBlock.addInstruction(new RISCVmvInst(curRISCVModule.getPhyReg("a0"),
                        tmpRISCVReturnVal));
        }
        curRISCVBasicBlock.addInstruction(new RISCVretInst());
    }

    @Override
    public void visit(brInstruction it) {
        if (it.brCond == null) {
            curRISCVBasicBlock.addInstruction(new RISCVJumpInst(curRISCVModule.BasicBlockMap.get(it.brIfTrue)));
        } else {
            //todo (why need in here?)
        }
    }

    @Override
    public void visit(binaryOpInstruction it) {
        RISCVRegister rs1 = null, rs2 = null;
        RISCVImm imm = null;
        RISCVRegister rd = curRISCVModule.getRISCVReg(it.BinaryResult, curRISCVBasicBlock);

        rs1 = curRISCVModule.getRISCVReg(it.BinaryOp1, curRISCVBasicBlock);
        if ((it.BinaryOp2 instanceof IntegerConstant) && ((IntegerConstant) it.BinaryOp2).value <= Max_Imm &&
                ((IntegerConstant) it.BinaryOp2).value >= Min_Imm &&
                (it.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.add ||
                        it.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.sub)) {//mul sdiv srem don't have IType
            int tmpval = (int) ((IntegerConstant) it.BinaryOp2).value;
            if (it.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.sub) tmpval = -tmpval;
            imm = new RISCVImm(tmpval);
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                    rd, rs1, null, imm));
        } else {
            rs2 = curRISCVModule.getRISCVReg(it.BinaryOp2, curRISCVBasicBlock);
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(
                    curRISCVModule.getRISCVBinaryENUMTypeFromIRBinaryENUMType(it.BinaryOperandType),
                    rd, rs1, rs2, null));
        }
    }

    @Override
    public void visit(bitwiseBinaryInstruction it) {
        RISCVRegister rs1 = null, rs2 = null;
        RISCVImm imm = null;
        RISCVRegister rd = curRISCVModule.getRISCVReg(it.bitwiseBinaryResult, curRISCVBasicBlock);

        if (it.bitwiseBinaryOp1 instanceof BooleanConstant) {
            rs1 = curRISCVModule.getRISCVReg(it.bitwiseBinaryOp2, curRISCVBasicBlock);
            imm = new RISCVImm(((BooleanConstant) it.bitwiseBinaryOp1).value ? 1 : 0);
        } else if ((it.bitwiseBinaryOp1 instanceof IntegerConstant) && ((IntegerConstant) it.bitwiseBinaryOp1).value <= Max_Imm &&
                ((IntegerConstant) it.bitwiseBinaryOp1).value >= Min_Imm) {
            rs1 = curRISCVModule.getRISCVReg(it.bitwiseBinaryOp2, curRISCVBasicBlock);
            imm = new RISCVImm((int) ((IntegerConstant) it.bitwiseBinaryOp1).value);
        } else {
            rs1 = curRISCVModule.getRISCVReg(it.bitwiseBinaryOp1, curRISCVBasicBlock);
            if (it.bitwiseBinaryOp2 instanceof BooleanConstant)
                imm = new RISCVImm(((BooleanConstant) it.bitwiseBinaryOp2).value ? 1 : 0);
            else if ((it.bitwiseBinaryOp2 instanceof IntegerConstant) && ((IntegerConstant) it.bitwiseBinaryOp2).value <= Max_Imm &&
                    ((IntegerConstant) it.bitwiseBinaryOp2).value >= Min_Imm)
                imm = new RISCVImm((int) ((IntegerConstant) it.bitwiseBinaryOp2).value);
            else
                rs2 = curRISCVModule.getRISCVReg(it.bitwiseBinaryOp2, curRISCVBasicBlock);
        }
        curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(
                curRISCVModule.getRISCVBinaryENUMTypeFromIRBitwiseENUMType(it.bitwiseBinaryOperandType),
                rd, rs1, rs2, imm
        ));
    }

    @Override
    public void visit(allocaInstruction it) {
        //todo
    }

    @Override
    public void visit(loadInstruction it) {
        RISCVRegister rd = curRISCVModule.getRISCVReg(it.LoadResult, curRISCVBasicBlock);
        RISCVRegister rs = curRISCVModule.getRISCVReg(it.LoadPointer, curRISCVBasicBlock);

        curRISCVBasicBlock.addInstruction(new RISCVlInst(curRISCVModule.getWidth(it.LoadResult)
                , rd, rs, new RISCVImm(0)));
    }

    @Override
    public void visit(storeInstruction it) {
        RISCVRegister rd = curRISCVModule.getRISCVReg(it.StorePointer, curRISCVBasicBlock);
        RISCVRegister rs = curRISCVModule.getRISCVReg(it.StoreValue, curRISCVBasicBlock);
        if (rd instanceof RISCVGlobalReg) {
            RISCVVirtualReg tmpRdReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVLUIInst(tmpRdReg, new RISCVRelocationImm(
                    (RISCVGlobalReg) rd, RISCVRelocationImm.RelocationENUMType.hi)));
            curRISCVBasicBlock.addInstruction(new RISCVsInst(curRISCVModule.getWidth(it.StorePointer),
                    tmpRdReg, rs, new RISCVRelocationImm((RISCVGlobalReg) rd, RISCVRelocationImm.RelocationENUMType.lo)));
        } else {
            curRISCVBasicBlock.addInstruction(new RISCVsInst(curRISCVModule.getWidth(it.StorePointer),
                    rd, rs, new RISCVImm(0)));
        }
    }

    @Override
    public void visit(getElementPtrInstruction it) {
        //maybe need?
//        if (!(it.GetElementPtrPtr.thisType instanceof PointerType))
  //          throw new RuntimeException("Attention! GEP ptr is not PointerType!--"+it.toString());
        if(it.GetElementPtrPtr.thisType instanceof PointerType) {
            RISCVRegister baseReg = curRISCVModule.getRISCVReg(it.GetElementPtrPtr, curRISCVBasicBlock);
            RISCVRegister rd = curRISCVModule.getRISCVReg(it.GetElementPtrResult, curRISCVBasicBlock);
            if (it.GetElementPtrIdx.size() == 1) {
                //array
                IROperand ArrayIndex = it.GetElementPtrIdx.get(0);
                if (ArrayIndex instanceof IntegerConstant) { // rd = baseReg + 4*val;
                    long val = ((IntegerConstant) ArrayIndex).value * 4;
                    if (val <= Max_Imm && val >= Min_Imm)
                        curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                rd, baseReg, null, new RISCVImm((int) val)));
                    else
                        curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                rd, baseReg,
                                curRISCVModule.getRISCVReg(new IntegerConstant(IntegerType.IRBitWidth.i32, val), curRISCVBasicBlock),
                                null));
                } else { // rd = baseReg + Index * 4
                    RISCVRegister IndexReg = curRISCVModule.getRISCVReg(it.GetElementPtrIdx.get(0), curRISCVBasicBlock);
                    RISCVRegister tmpReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
                    curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.sll,
                            tmpReg, IndexReg, null, new RISCVImm(2)));// tmpReg = IndexReg << 2;
                    curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                            rd, baseReg, tmpReg, null));
                }
            } else if (((PointerType) it.GetElementPtrPtr.thisType).baseType instanceof StructureType) {
                //struct
                StructureType tmpStructureType = (StructureType) ((PointerType) it.GetElementPtrPtr.thisType).baseType;
                if (!(it.GetElementPtrIdx.get(0) instanceof IntegerConstant && ((IntegerConstant) it.GetElementPtrIdx.get(0)).value == 0))
                    throw new RuntimeException();
                if (!(it.GetElementPtrIdx.get(1) instanceof IntegerConstant))
                    throw new RuntimeException();
                long tmpIndex = ((IntegerConstant) it.GetElementPtrIdx.get(1)).value;
                long tmpGetMemberOffset = tmpStructureType.getMemberOffset(tmpIndex);
                if (tmpGetMemberOffset <= Max_Imm && tmpGetMemberOffset >= Min_Imm)
                    curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                            rd, baseReg, null, new RISCVImm((int) tmpGetMemberOffset)));
                else
                    curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                            rd, baseReg,
                            curRISCVModule.getRISCVReg(new IntegerConstant(IntegerType.IRBitWidth.i32, tmpGetMemberOffset), curRISCVBasicBlock),
                            null));

            } else throw new RuntimeException();
        } else {//const string or maybe others?
            RISCVRegister rd = curRISCVModule.getRISCVReg(it.GetElementPtrResult, curRISCVBasicBlock);
            RISCVGlobalReg rs = curRISCVModule.GlobalRegMap.get(it.GetElementPtrPtr);
            if(rs == null) throw new RuntimeException();
            curRISCVBasicBlock.addInstruction(new RISCVlaInst(rd,rs));
        }
    }

    @Override
    public void visit(icmpInstruction it) {
        //eq, ne, sgt, sge, slt, sle -> eq,ne,lt,le,gt,ge
        RISCVRegister rd = curRISCVModule.getRISCVReg(it.IcmpResult, curRISCVBasicBlock);
        RISCVRegister rs1 = curRISCVModule.getRISCVReg(it.IcmpOp1, curRISCVBasicBlock);
        RISCVRegister rs2 = curRISCVModule.getRISCVReg(it.IcmpOp2, curRISCVBasicBlock);

        if (it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.eq) {
            RISCVVirtualReg tmpXorReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.xor,
                    tmpXorReg, rs1, rs2, null));
            curRISCVBasicBlock.addInstruction(new RISCVsetzInst(RISCVInstruction.RISCVCompareENUMType.eq
                    , rd, tmpXorReg));
        } else if (it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.ne) {
            RISCVVirtualReg tmpXorReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.xor,
                    tmpXorReg, rs1, rs2, null));
            curRISCVBasicBlock.addInstruction(new RISCVsetzInst(RISCVInstruction.RISCVCompareENUMType.ne
                    , rd, tmpXorReg));
        } else if (it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.sgt) {
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.slt,
                    rd, rs2, rs1, null));
        } else if (it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.slt) {
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.slt,
                    rd, rs1, rs2, null));
        } else if (it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.sge) {
            RISCVVirtualReg tmpSltReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.slt,
                    tmpSltReg, rs1, rs2, null));
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.xor,
                    rd, tmpSltReg, null, new RISCVImm(1)));
        } else if (it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.sle) {
            RISCVVirtualReg tmpSltReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.slt,
                    tmpSltReg, rs2, rs1, null));
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.xor,
                    rd, tmpSltReg, null, new RISCVImm(1)));
        } else throw new RuntimeException();
    }

    @Override
    public void visit(phiInstruction it) {
        //todo
    }

    @Override
    public void visit(callInstruction it) {
        //(1) save 1st-8th par to a0-a7
        for (int i = 0; i < Integer.min(8, it.CallParameters.size()); ++i) {
            RISCVRegister tmpReg = curRISCVModule.getRISCVReg(it.CallParameters.get(i), curRISCVBasicBlock);
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(curRISCVModule.getPhyReg("a" + i), tmpReg));
        }
        //(2) save others to stack
        int OffsetValue = 0;
        for (int i = 8; i < it.CallParameters.size(); ++i) {
            curRISCVBasicBlock.addInstruction(new RISCVsInst(
                    curRISCVModule.getWidth(it.CallParameters.get(i)),
                    curRISCVModule.getPhyReg("sp"),
                    curRISCVModule.getRISCVReg(it.CallParameters.get(i), curRISCVBasicBlock),
                    new RISCVImm(OffsetValue)));
            OffsetValue += 4;
        }
        //(3) funccall
        curRISCVBasicBlock.addInstruction(new RISCVCallInst(curRISCVModule.RISCVFuncMap.get(it.CallFunction)));
        if (it.CallFunction.thisReturnValue != null) {
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(curRISCVModule.getPhyReg("a0"),
                    curRISCVModule.getRISCVReg(it.CallResult, curRISCVBasicBlock)));
        }
    }

    @Override
    public void visit(bitcastInstruction it) {
        curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                curRISCVModule.getRISCVReg(it.bitcastResult, curRISCVBasicBlock),
                curRISCVModule.getRISCVReg(it.bitcastOperand, curRISCVBasicBlock),
                null, new RISCVImm(0)));
    }
}
