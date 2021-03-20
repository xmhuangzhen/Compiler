package Backend;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.*;
import RISCV.Inst.*;
import RISCV.Operand.*;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;

import static RISCV.RISCVModule.Max_Imm;
import static RISCV.RISCVModule.Min_Imm;

public class InstSelector implements IRVisitor{

    public IRModule curIRModule;
    public RISCVModule curRISCVModule;
    public RISCVFunction curRISCVFunction;
    public RISCVBasicBlock curRISCVBasicBlock;

    public InstSelector(IRModule tmpModule){
        curIRModule = tmpModule;
        curRISCVModule = new RISCVModule();
        curRISCVFunction = null;
        curRISCVBasicBlock = null;
    }

    @Override
    public void visit(IRModule it) {
        for(var tmpVar : it.IRGlobalVarTable.values()){
            //todo
        }
        //todo
    }

    @Override
    public void visit(IRFunction it) {

    }

    @Override
    public void visit(IRBasicBlock it) {

    }

    @Override
    public void visit(IRInstruction it) { }

    @Override
    public void visit(retInstruction it) {
        if(it.returnValue != null){
            RISCVRegister tmpRISCVReturnVal = curRISCVModule.getRISCVReg(it.returnValue,curRISCVBasicBlock);
            if(tmpRISCVReturnVal instanceof RISCVGlobalReg)
                curRISCVBasicBlock.addInstruction(new RISCVlaInst(curRISCVModule.PhyRegList.get(10),
                        (RISCVGlobalReg) tmpRISCVReturnVal));
            else
                curRISCVBasicBlock.addInstruction(new RISCVmvInst(curRISCVModule.PhyRegList.get(10),
                    tmpRISCVReturnVal));
        }
    }

    @Override
    public void visit(brInstruction it) {
        if(it.brCond == null){
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
                ((IntegerConstant) it.BinaryOp2).value >= Min_Imm && (it.BinaryOperandType == binaryOpInstruction.BinaryOperandENUM.add ||
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

        if(it.bitwiseBinaryOp1 instanceof BooleanConstant){
            rs1 = curRISCVModule.getRISCVReg(it.bitwiseBinaryOp2,curRISCVBasicBlock);
            imm = new RISCVImm(((BooleanConstant) it.bitwiseBinaryOp1).value?1:0);
        } else if((it.bitwiseBinaryOp1 instanceof IntegerConstant) && ((IntegerConstant) it.bitwiseBinaryOp1).value <= Max_Imm &&
                ((IntegerConstant) it.bitwiseBinaryOp1).value >= Min_Imm){
            rs1 = curRISCVModule.getRISCVReg(it.bitwiseBinaryOp2,curRISCVBasicBlock);
            imm = new RISCVImm((int)((IntegerConstant) it.bitwiseBinaryOp1).value);
        } else {
            rs1 = curRISCVModule.getRISCVReg(it.bitwiseBinaryOp1,curRISCVBasicBlock);
            if(it.bitwiseBinaryOp2 instanceof BooleanConstant)
                imm = new RISCVImm(((BooleanConstant) it.bitwiseBinaryOp2).value?1:0);
            else if((it.bitwiseBinaryOp2 instanceof IntegerConstant) && ((IntegerConstant) it.bitwiseBinaryOp2).value <= Max_Imm &&
                    ((IntegerConstant) it.bitwiseBinaryOp2).value >= Min_Imm)
                imm = new RISCVImm((int)((IntegerConstant) it.bitwiseBinaryOp2).value);
            else
                rs2 = curRISCVModule.getRISCVReg(it.bitwiseBinaryOp2,curRISCVBasicBlock);
        }
        curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(
                curRISCVModule.getRISCVBinaryENUMTypeFromIRBitwiseENUMType(it.bitwiseBinaryOperandType),
                rd,rs1,rs2,imm
        ));
    }

    @Override
    public void visit(allocaInstruction it) {

    }

    @Override
    public void visit(loadInstruction it) {
        RISCVRegister rd = curRISCVModule.getRISCVReg(it.LoadResult,curRISCVBasicBlock);
        RISCVRegister rs = curRISCVModule.getRISCVReg(it.LoadPointer,curRISCVBasicBlock);

        curRISCVBasicBlock.addInstruction(new RISCVlInst(curRISCVModule.getWidth(it.LoadResult)
                ,rd,rs,new RISCVImm(0)));
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

    }

    @Override
    public void visit(icmpInstruction it) {
        //eq, ne, sgt, sge, slt, sle -> eq,ne,lt,le,gt,ge
        RISCVRegister rd = curRISCVModule.getRISCVReg(it.IcmpResult,curRISCVBasicBlock);
        RISCVRegister rs1 = curRISCVModule.getRISCVReg(it.IcmpOp1,curRISCVBasicBlock);
        RISCVRegister rs2 = curRISCVModule.getRISCVReg(it.IcmpOp2,curRISCVBasicBlock);

        if(it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.eq){
            RISCVVirtualReg tmpXorReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.xor,
                    tmpXorReg,rs1,rs2,null));
            curRISCVBasicBlock.addInstruction(new RISCVsetzInst(RISCVInstruction.RISCVCompareENUMType.eq
                    ,rd,tmpXorReg));
        } else if(it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.ne){
            RISCVVirtualReg tmpXorReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.xor,
                    tmpXorReg,rs1,rs2,null));
            curRISCVBasicBlock.addInstruction(new RISCVsetzInst(RISCVInstruction.RISCVCompareENUMType.ne
                    ,rd,tmpXorReg));
        } else if(it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.sgt){
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.slt,
                    rd,rs2,rs1,null));
        } else if(it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.slt){
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.slt,
                    rd,rs1,rs2,null));
        } else if(it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.sge){
            RISCVVirtualReg tmpSltReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.slt,
                    tmpSltReg,rs1,rs2,null));
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.xor,
                    rd,tmpSltReg,null,new RISCVImm(1)));
        } else if(it.IcmpOperandType == icmpInstruction.IcmpOperandENUM.sle){
            RISCVVirtualReg tmpSltReg = new RISCVVirtualReg(curRISCVModule.VirtualRegCnt++);
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.slt,
                    tmpSltReg,rs2,rs1,null));
            curRISCVBasicBlock.addInstruction(new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.xor,
                    rd,tmpSltReg,null,new RISCVImm(1)));
        } else throw new RuntimeException();
    }

    @Override
    public void visit(phiInstruction it) {
        //todo
    }

    @Override
    public void visit(callInstruction it) {

    }

    @Override
    public void visit(bitcastInstruction it) {

    }
}
