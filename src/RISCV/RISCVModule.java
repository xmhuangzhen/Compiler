package RISCV;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.Instruction.binaryOpInstruction;
import IR.Instruction.bitwiseBinaryInstruction;
import IR.Instruction.icmpInstruction;
import IR.Operand.*;
import RISCV.Inst.RISCVInstruction;
import RISCV.Inst.RISCVliInst;
import RISCV.Operand.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class RISCVModule {
    public static ArrayList<String> RISCVPhyRegName = new ArrayList<>(Arrays.asList(
            "zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2", "s0", "s1",
            "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
            "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"));
    public static int Max_Imm = (1<<11)-1, Min_Imm = -(1<<11);
    public ArrayList<RISCVPhyReg> PhyRegList;
    public HashMap<IROperand, RISCVVirtualReg> VirtualRegMap;
    public HashMap<IROperand, RISCVGlobalReg> GlobalRegMap;
    public HashMap<IRFunction, RISCVFunction> RISCVFuncMap;
    public int VirtualRegCnt;

    public HashMap<IRBasicBlock, RISCVBasicBlock> BasicBlockMap;

    public RISCVModule(){
        //Reg
        PhyRegList = new ArrayList<>();
        for(int i = 0;i < 32;++i){
            PhyRegList.add(new RISCVPhyReg(RISCVPhyRegName.get(i)));
        }
        VirtualRegMap = new LinkedHashMap<>();
        VirtualRegCnt = 0;
        GlobalRegMap = new LinkedHashMap<>();

        //BasicBlock
        BasicBlockMap = new LinkedHashMap<>();

        //func
        RISCVFuncMap = new LinkedHashMap<>();
    }

    public RISCVRegister getRISCVReg(IROperand tmpIROperand, RISCVBasicBlock tmpBasicBlock){
        if(tmpIROperand instanceof IntegerConstant){
            long tmpval = ((IntegerConstant) tmpIROperand).value;
            RISCVVirtualReg tmpRISCVRegister = new RISCVVirtualReg(VirtualRegCnt++);
            tmpBasicBlock.addInstruction(new RISCVliInst(tmpRISCVRegister,new RISCVImm((int)tmpval)));
            return tmpRISCVRegister;
        } else if(tmpIROperand instanceof BooleanConstant){
            int tmpval = ((BooleanConstant) tmpIROperand).value ? 1 : 0;
            RISCVVirtualReg tmpRISCVRegister = new RISCVVirtualReg(VirtualRegCnt++);
            tmpBasicBlock.addInstruction(new RISCVliInst(tmpRISCVRegister,new RISCVImm(tmpval)));
            return tmpRISCVRegister;
        } else if(tmpIROperand instanceof StringConstant){
            throw new RuntimeException();
        } else if(tmpIROperand instanceof NullConstant){
            int tmpval = 0;
            RISCVVirtualReg tmpRISCVRegister = new RISCVVirtualReg(VirtualRegCnt++);
            tmpBasicBlock.addInstruction(new RISCVliInst(tmpRISCVRegister,new RISCVImm(tmpval)));
            return tmpRISCVRegister;
        } else if(tmpIROperand instanceof GlobalVariables){
            if(GlobalRegMap.containsKey(tmpIROperand)) return GlobalRegMap.get(tmpIROperand);
            RISCVGlobalReg tmpRISCVRegister = new RISCVGlobalReg(((GlobalVariables) tmpIROperand).VariablesName);
            GlobalRegMap.put(tmpIROperand,tmpRISCVRegister);
            return tmpRISCVRegister;
        } else if(tmpIROperand instanceof Parameter || tmpIROperand instanceof Register){
            if(VirtualRegMap.containsKey(tmpIROperand)) return VirtualRegMap.get(tmpIROperand);
            RISCVVirtualReg tmpRISCVRegister = new RISCVVirtualReg(VirtualRegCnt++);
            VirtualRegMap.put(tmpIROperand,tmpRISCVRegister);
            return tmpRISCVRegister;
        } else
            return PhyRegList.get(0);
    }

    public RISCVInstruction.RISCVBinaryENUMType getRISCVBinaryENUMTypeFromIRBinaryENUMType(binaryOpInstruction.BinaryOperandENUM tmpType){
        //        add,sub,mul,sdiv,srem->add,sub,mul,div,rem,slt,sll,sra,and,or,xor
        if(tmpType == binaryOpInstruction.BinaryOperandENUM.add) return RISCVInstruction.RISCVBinaryENUMType.add;
        else if(tmpType == binaryOpInstruction.BinaryOperandENUM.sub) return RISCVInstruction.RISCVBinaryENUMType.sub;
        else if(tmpType == binaryOpInstruction.BinaryOperandENUM.mul) return RISCVInstruction.RISCVBinaryENUMType.mul;
        else if(tmpType == binaryOpInstruction.BinaryOperandENUM.sdiv)return RISCVInstruction.RISCVBinaryENUMType.div;
        else if(tmpType == binaryOpInstruction.BinaryOperandENUM.srem)return RISCVInstruction.RISCVBinaryENUMType.rem;
        else throw new RuntimeException();
    }

    public RISCVInstruction.RISCVBinaryENUMType getRISCVBinaryENUMTypeFromIRBitwiseENUMType(
            bitwiseBinaryInstruction.BitwiseBinaryOperandType tmpType){
        //        shl, ashr, and, or, xor->add,sub,mul,div,rem,slt,sll,sra,and,or,xor
        if(tmpType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.shl) return RISCVInstruction.RISCVBinaryENUMType.sll;
        else if(tmpType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.ashr) return RISCVInstruction.RISCVBinaryENUMType.sra;
        else if(tmpType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.and) return RISCVInstruction.RISCVBinaryENUMType.and;
        else if(tmpType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.or) return RISCVInstruction.RISCVBinaryENUMType.or;
        else if(tmpType == bitwiseBinaryInstruction.BitwiseBinaryOperandType.xor) return RISCVInstruction.RISCVBinaryENUMType.xor;
        else throw new RuntimeException();
    }

    public RISCVInstruction.RISCVWidthENUMType getWidth(IROperand tmpOperand){
        if(tmpOperand.thisType.getTypeSize()/8 <= 1) return RISCVInstruction.RISCVWidthENUMType.b;
        else return RISCVInstruction.RISCVWidthENUMType.w;
    }

    public RISCVPhyReg getPhyReg(String tmpName){
        for(int i = 0;i < 32; ++i){
            if(RISCVPhyRegName.get(i).equals(tmpName))
                return PhyRegList.get(i);
        }
        throw new RuntimeException("no such PhyReg name");
    }
}
