package RISCV.Inst;

import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVBranchInst extends RISCVInstruction{

    public RISCVCompareENUMType CompareType;
    public RISCVRegister rs1,rs2;
    public boolean BranchUnsigned;
    public RISCVBasicBlock IfTrueBasicBlock,IfFalseBasicBlock;


    public RISCVBranchInst(RISCVCompareENUMType tmpType, boolean tmpUnsigned, RISCVRegister tmprs1,
                           RISCVRegister tmprs2, RISCVBasicBlock tmpIfTrue, RISCVBasicBlock tmpIfFalse){
        super();
        CompareType = tmpType;
        BranchUnsigned = tmpUnsigned;
        rs1 = tmprs1;
        rs2 = tmprs2;
        IfTrueBasicBlock = tmpIfTrue;
        IfFalseBasicBlock = tmpIfFalse;
        if(rs1 instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rs1);
        if(rs2 instanceof RISCVVirtualReg) UsedVirtualReg.add((RISCVVirtualReg) rs2);
    }

    @Override
    public void replaceReg(RISCVModule curModule) {
        for(int i = 0;i < UsedVirtualReg.size();++i){
            if(rs1 == UsedVirtualReg.get(i)) rs1 = curModule.getPhyReg("s"+i);
            if(rs2 == UsedVirtualReg.get(i)) rs2 = curModule.getPhyReg("s"+i);
        }
    }


    @Override
    public String toString() {
        StringBuilder tmpString = new StringBuilder("b");
        tmpString.append(CompareType.name());
        if(BranchUnsigned) tmpString.append("u");
        tmpString.append(" ").append(rs1.toString()).append(",").append(rs2.toString()).append(",");
        tmpString.append(IfTrueBasicBlock.toString());
        tmpString.append("\n\tj ").append(IfFalseBasicBlock.toString());
        return tmpString.toString();
    }
}
