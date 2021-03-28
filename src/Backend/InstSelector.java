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
            for (IRBasicBlock tmpBlock = tmpFunc.thisEntranceBlock; tmpBlock != null;
                 tmpBlock = tmpBlock.nextBasicBlocks){
                curRISCVModule.getRISCVBasicBlock(tmpBlock);
            }
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

        //(1) add para to PhyReg
        for (int i = 0; i < Integer.min(8, it.thisFunctionParameters.size()); ++i) {//a0-a7
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(
                    curRISCVModule.getRISCVReg(it.thisFunctionParameters.get(i), curRISCVBasicBlock),
                    curRISCVModule.getPhyReg("a" + i)));
        }

        int OffsetValue = 0;
        for (int i = 8; i < it.thisFunctionParameters.size(); ++i) {
            curRISCVBasicBlock.addInstruction(new RISCVlInst(
                    RISCVInstruction.RISCVWidthENUMType.w,
                    curRISCVModule.getPhyReg("s0"),
                    curRISCVModule.getRISCVReg(it.thisFunctionParameters.get(i), curRISCVBasicBlock),
                    new RISCVImm(OffsetValue)));
            OffsetValue += 4;
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
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(
                    curRISCVModule.getPhyReg("a0"),
                    tmpRISCVReturnVal));
  /*          if (tmpRISCVReturnVal instanceof RISCVGlobalReg) {
                RISCVVirtualReg tmpAddrReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);

                //lui t0,%hi(a)
                //lw t1,%lo(a)(t0)
                curRISCVBasicBlock.addInstruction(new RISCVLUIInst(tmpAddrReg, new RISCVRelocationImm(
                        (RISCVGlobalReg) tmpRISCVReturnVal, RISCVRelocationImm.RelocationENUMType.hi)));

                curRISCVBasicBlock.addInstruction(new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                        curRISCVModule.getPhyReg("a0"), null,
                        new RISCVRelocationImm((RISCVGlobalReg) tmpRISCVReturnVal,
                                RISCVRelocationImm.RelocationENUMType.lo),tmpAddrReg));
            }
            else {
                curRISCVBasicBlock.addInstruction(new RISCVmvInst(curRISCVModule.getPhyReg("a0"),
                        tmpRISCVReturnVal));
            }
*/        }
        curRISCVBasicBlock.addInstruction(new RISCVretInst());
    }

    @Override
    public void visit(brInstruction it) {
        if (it.brCond == null) {
            RISCVBasicBlock tmpJumptoBlock = curRISCVModule.getRISCVBasicBlock(it.brIfTrue);
            if(tmpJumptoBlock == null) throw new RuntimeException(it.toString());
            curRISCVBasicBlock.addInstruction(new RISCVJumpInst(tmpJumptoBlock));
        } else {
            RISCVBasicBlock tmpIfTrueBlock = curRISCVModule.getRISCVBasicBlock(it.brIfTrue);
            RISCVBasicBlock tmpIfFalseBlock = curRISCVModule.getRISCVBasicBlock(it.brIfFalse);
            RISCVRegister tmpCondReg = curRISCVModule.getRISCVReg(it.brCond,curRISCVBasicBlock);
            curRISCVBasicBlock.addInstruction(new RISCVBranchInst(tmpCondReg,tmpIfTrueBlock,tmpIfFalseBlock));
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
        if(curRISCVFunction.GEPAddrMap.containsKey(rs)){
            RISCVAddrImm tmpAddrImm = curRISCVFunction.GEPAddrMap.get(rs);
            curRISCVBasicBlock.addInstruction(new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                    rd, tmpAddrImm.baseReg, tmpAddrImm));
        } else if(it.LoadPointer.NeedPtr) {
            curRISCVBasicBlock.addInstruction(new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                    rd,rs,new RISCVAddrImm(rs,0)));
        } else{
         //   System.out.println(it.toString()+","+it.LoadResult.toString()+","+it.LoadPointer.toString());
           // System.out.println(rd.RegisterName+","+rs.RegisterName);
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(rd,rs));
        }
/*        if(it.LoadResult.thisType.equals(it.LoadPointer.thisType)){
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(rd,rs));
        } else {
            curRISCVBasicBlock.addInstruction(new RISCVlInst(curRISCVModule.getWidth(it.LoadResult),
                    rd, rs, new RISCVImm(0)));
        }
        if (rs instanceof RISCVGlobalReg) {
            RISCVVirtualReg tmpAddrReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            //lui t0,%hi(a)
            //lw t1,%lo(a)(t0)
            curRISCVBasicBlock.addInstruction(new RISCVLUIInst(tmpAddrReg, new RISCVRelocationImm(
                    (RISCVGlobalReg) rs, RISCVRelocationImm.RelocationENUMType.hi)));
            curRISCVBasicBlock.addInstruction(new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                    rd, tmpAddrReg,
                    new RISCVRelocationImm((RISCVGlobalReg) rs, RISCVRelocationImm.RelocationENUMType.lo)));
        } else {
            curRISCVBasicBlock.addInstruction(new RISCVlInst(curRISCVModule.getWidth(it.LoadResult)
                    , rd, rs, new RISCVImm(0)));
        }
  */  }

    @Override
    public void visit(storeInstruction it) {
     /*   if(it.StorePointer == null){
            System.out.println(it.StoreValue instanceof Parameter);
            System.out.println(it.StoreValue.thisType+","+it.StoreValue.toString());
            if(it.StoreValue instanceof Parameter)
                System.out.println(((Parameter) it.StoreValue).ParameterName);
        }*/
        RISCVRegister addr = curRISCVModule.getRISCVReg(it.StorePointer, curRISCVBasicBlock);
        RISCVRegister val = curRISCVModule.getRISCVReg(it.StoreValue, curRISCVBasicBlock);
        if (curRISCVFunction.GEPAddrMap.containsKey(addr)) {
            RISCVAddrImm tmpAddrImm = curRISCVFunction.GEPAddrMap.get(addr);
            curRISCVBasicBlock.addInstruction(new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                    val, tmpAddrImm.baseReg, tmpAddrImm));
//            System.out.println(tmpAddrImm.baseReg.RegisterName);
        } else if (it.StorePointer.NeedPtr) {
            curRISCVBasicBlock.addInstruction(new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                    val,addr,new RISCVAddrImm(addr,0)));
        } else {
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(addr, val));
        }
        /*if(val instanceof RISCVGlobalReg){
            RISCVVirtualReg tmpValReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVLUIInst(tmpValReg, new RISCVRelocationImm(
                    (RISCVGlobalReg) val, RISCVRelocationImm.RelocationENUMType.hi)));

            val = tmpValReg;
        }
        if (addr instanceof RISCVGlobalReg) {
            RISCVVirtualReg tmpAddrReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVLUIInst(tmpAddrReg, new RISCVRelocationImm(
                    (RISCVGlobalReg) addr, RISCVRelocationImm.RelocationENUMType.hi)));
            curRISCVBasicBlock.addInstruction(new RISCVsInst(curRISCVModule.getWidth(it.StorePointer),
                    val, tmpAddrReg,
                    new RISCVRelocationImm((RISCVGlobalReg) addr, RISCVRelocationImm.RelocationENUMType.lo)));
        } else {

        if( it.StorePointer.thisType.equals(it.StoreValue.thisType) ){
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(addr,val));
        } else {
        curRISCVBasicBlock.addInstruction(new RISCVsInst(curRISCVModule.getWidth(it.StorePointer),
                val, addr, new RISCVImm(0)));
        }*/
/*        curRISCVBasicBlock.addInstruction(new RISCVsInst(curRISCVModule.getWidth(it.StorePointer),
                val,addr,new RISCVImm(0)));*/
//        curRISCVBasicBlock.addInstruction(new RISCVmvInst(addr,val));
//        System.out.println("HERE-"+it.toString()+","+(it.StoreValue instanceof Parameter));
    }

    @Override
    public void visit(moveInstruction it) {
        RISCVRegister rd = curRISCVModule.getRISCVReg(it.rd,curRISCVBasicBlock);
        RISCVRegister rs = curRISCVModule.getRISCVReg(it.rs,curRISCVBasicBlock);
        curRISCVBasicBlock.addInstruction(new RISCVmvInst(rd,rs));
    }

    @Override
    public void visit(getElementPtrInstruction it) {

        if(it.GetElementPtrPtr instanceof GlobalVariables){
            RISCVRegister rd = curRISCVModule.getRISCVReg(it.GetElementPtrResult, curRISCVBasicBlock);
            curRISCVBasicBlock.addInstruction(new RISCVlaInst(rd,
                    curRISCVModule.GlobalRegMap.get(it.GetElementPtrPtr)));
        }
        else if(it.GetElementPtrPtr.thisType instanceof PointerType) {
            RISCVRegister baseReg = curRISCVModule.getRISCVReg(it.GetElementPtrPtr, curRISCVBasicBlock);
            RISCVRegister rd = curRISCVModule.getRISCVReg(it.GetElementPtrResult, curRISCVBasicBlock);
            if (it.GetElementPtrIdx.size() == 1) {
                //array
                IROperand ArrayIndex = it.GetElementPtrIdx.get(0);
                if (ArrayIndex instanceof IntegerConstant) { // rd = baseReg + 4*val;
                    long val = ((IntegerConstant) ArrayIndex).value * 4;
                    if (val <= Max_Imm && val >= Min_Imm) {
                        curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                rd, baseReg, null, new RISCVImm((int) val)));
                    }
                    else
                        curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                rd, baseReg,
                                curRISCVModule.getRISCVReg(new IntegerConstant(IntegerType.IRBitWidth.i32, val), curRISCVBasicBlock),
                                null));
             //       System.out.println("Here!"+it.toString()+rd.RegisterName);
                    curRISCVFunction.GEPAddrMap.put(rd,new RISCVAddrImm(baseReg,(int)val));
                } else { // rd = baseReg + Index * 4
                    if(!(ArrayIndex instanceof Register|| ArrayIndex instanceof Parameter))
                        throw new RuntimeException();
                    RISCVRegister IndexReg = curRISCVModule.getRISCVReg(ArrayIndex, curRISCVBasicBlock);
                    RISCVRegister tmpReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
                    curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.sll,
                            tmpReg, IndexReg, null, new RISCVImm(2)));// tmpReg = IndexReg << 2;
                    curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                            rd, baseReg, tmpReg, null));

//                    curRISCVFunction.GEPAddrMap.put(rd,new RISCVAddrImm(baseReg,));
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
                //System.out.println(it.toString()+","+tmpIndex+","+tmpGetMemberOffset);
                if (!(tmpStructureType.StructureMemberType.get((int) tmpIndex) instanceof PointerType)) {
                 //   System.out.println(baseReg.RegisterName+","+rd.RegisterName);
                    curRISCVFunction.GEPAddrMap.put(rd,new RISCVAddrImm(baseReg,(int)tmpGetMemberOffset));
                } else {
                  //  System.out.println("HERE!"+tmpGetMemberOffset+baseReg.RegisterName);
                    if (tmpGetMemberOffset <= Max_Imm && tmpGetMemberOffset >= Min_Imm)
                        curRISCVBasicBlock.addInstruction(
                                new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                rd, baseReg, null, new RISCVImm((int) tmpGetMemberOffset)));
                    else
                        curRISCVBasicBlock.addInstruction(
                                new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                rd, baseReg,
                                curRISCVModule.getRISCVReg(new IntegerConstant(IntegerType.IRBitWidth.i32,
                                        tmpGetMemberOffset), curRISCVBasicBlock),
                                null));
                }
            }
        } else {//const string or maybe others?
            RISCVRegister rd = curRISCVModule.getRISCVReg(it.GetElementPtrResult, curRISCVBasicBlock);
            RISCVGlobalReg rs = curRISCVModule.getGlobalReg(it.GetElementPtrPtr);
            if(rs != null)curRISCVBasicBlock.addInstruction(new RISCVlaInst(rd,rs));
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
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(
                    curRISCVModule.getPhyReg("a"+i),
                    tmpReg));
        }

        //(2) save others to stack
        int OffsetValue = 0;
        for (int i = 8; i < it.CallParameters.size(); ++i) {
            curRISCVBasicBlock.addInstruction(new RISCVsInst(
                    curRISCVModule.getWidth(it.CallParameters.get(i)),
                    curRISCVModule.getRISCVReg(it.CallParameters.get(i), curRISCVBasicBlock),
                    curRISCVModule.getPhyReg("sp"),
                    new RISCVImm(OffsetValue)));
            OffsetValue += 4;
        }
        //(3) funccall
        curRISCVBasicBlock.addInstruction(new RISCVCallInst(curRISCVModule.RISCVFuncMap.get(it.CallFunction)));
        if (it.CallFunction.thisReturnValue != null) {
            curRISCVBasicBlock.addInstruction(new RISCVmvInst(
                    curRISCVModule.getRISCVReg(it.CallResult, curRISCVBasicBlock),
                    curRISCVModule.getPhyReg("a0")));
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
