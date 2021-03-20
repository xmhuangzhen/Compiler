package Backend;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.*;
import RISCV.Inst.*;
import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVRegister;
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
            //todo
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

    }

    @Override
    public void visit(storeInstruction it) {

    }

    @Override
    public void visit(getElementPtrInstruction it) {

    }

    @Override
    public void visit(icmpInstruction it) {

    }

    @Override
    public void visit(phiInstruction it) {

    }

    @Override
    public void visit(callInstruction it) {

    }

    @Override
    public void visit(bitcastInstruction it) {

    }
}
