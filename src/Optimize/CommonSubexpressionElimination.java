package Optimize;

import IR.IRBasicBlock;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.*;
import IR.Operand.Register;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;

//useless

public class CommonSubexpressionElimination extends Pass{

    public HashMap<String, Register> CSEInstMap;

    public CommonSubexpressionElimination(IRModule tmpModule) {
        super(tmpModule);
        CSEInstMap = new HashMap<>();
    }

    @Override
    public boolean run() {
        boolean modified = false;
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                for (IRBasicBlock tmpBlock = tmpFunc.thisEntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
                    CSEInstMap.clear();
                    for(IRInstruction tmpInst = tmpBlock.HeadInst;
                    tmpInst != null; tmpInst = tmpInst.nextIRInstruction)
                        if(tmpInst instanceof binaryOpInstruction
                        || tmpInst instanceof bitcastInstruction
                        || tmpInst instanceof bitwiseBinaryInstruction
                        || tmpInst instanceof icmpInstruction
                     /*   || tmpInst instanceof getElementPtrInstruction*/){
                            String tmpString = getCSEString(tmpInst);
                            if(CSEInstMap.containsKey(tmpString)){
                                Register rd = getRd(tmpInst);
                                Register rs = CSEInstMap.get(tmpString);
                                IRInstruction repInst =
                                        new moveInstruction(tmpBlock,rd,rs);
                                tmpInst.replaceInst(repInst);
                                tmpInst = repInst;
                                rd.ReplaceRegisterUse(rs);
                                modified = true;
                            } else {
                                CSEInstMap.put(tmpString,getRd(tmpInst));
                            }
                        }
                }
            }

        return modified;
    }

    public String getCSEString(IRInstruction curInst){
        if(curInst instanceof binaryOpInstruction) {
            binaryOpInstruction tmpInst = (binaryOpInstruction) curInst;
            return tmpInst.BinaryOp1+ "|"+tmpInst.BinaryOperandType.name() +
                    "|"+tmpInst.BinaryOp2;
        } else if(curInst instanceof bitcastInstruction){
            bitcastInstruction tmpInst = (bitcastInstruction) curInst;
            return tmpInst.bitcastOperand+"|"+tmpInst.bitcastType2;
        } else if(curInst instanceof bitwiseBinaryInstruction){
            bitwiseBinaryInstruction tmpInst = (bitwiseBinaryInstruction) curInst;
            return tmpInst.bitwiseBinaryOp1+"|"+tmpInst.bitwiseBinaryOperandType.name()+
                    "|"+tmpInst.bitwiseBinaryOp2;
        } else if(curInst instanceof icmpInstruction){
            icmpInstruction tmpInst = (icmpInstruction) curInst;
            return tmpInst.IcmpOp1+"|"+tmpInst.IcmpOperandType.name()+"|"+
                    tmpInst.IcmpOp2;
        } else if(curInst instanceof getElementPtrInstruction){
            getElementPtrInstruction tmpInst = (getElementPtrInstruction) curInst;
            StringBuilder tmpRet = new StringBuilder();
            tmpRet.append(tmpInst.GetElementPtrResult+"|"+tmpInst.GetElementPtrPtr+"|");
            for(int i = 0;i < tmpInst.GetElementPtrIdx.size();++i)
                tmpRet.append(tmpInst.GetElementPtrIdx.get(i)+"|");
            return tmpRet.toString();
        } else {
            throw new RuntimeException();
        }
    }

    public Register getRd(IRInstruction curInst){
        if(curInst instanceof binaryOpInstruction) {
            return ((binaryOpInstruction) curInst).BinaryResult;
        } else if(curInst instanceof bitcastInstruction){
            return ((bitcastInstruction) curInst).bitcastResult;
        } else if(curInst instanceof bitwiseBinaryInstruction){
            return ((bitwiseBinaryInstruction) curInst).bitwiseBinaryResult;
        } else if(curInst instanceof icmpInstruction){
            return ((icmpInstruction) curInst).IcmpResult;
        } else if(curInst instanceof getElementPtrInstruction){
            return ((getElementPtrInstruction) curInst).GetElementPtrResult;
        } else {
            throw new RuntimeException();
        }
    }


}
