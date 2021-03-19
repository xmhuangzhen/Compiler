package RISCV.Inst;

import RISCV.Operand.RISCVRegister;
import RISCV.RISCVBasicBlock;

public class RISCVBranchInst extends RISCVInstruction{

    public RISCVCompareENUMType CompareType;
    public RISCVRegister rs1,rs2;
    public boolean BranchUnsigned;
    public RISCVBasicBlock IfTrueBasicBlock,IfFalseBasicBlock;

    public RISCVBranchInst(RISCVCompareENUMType tmpType, boolean tmpUnsigned, RISCVRegister tmprs1,
                           RISCVRegister tmprs2, RISCVBasicBlock tmpIfTrue, RISCVBasicBlock tmpIfFalse){
        CompareType = tmpType;
        BranchUnsigned = tmpUnsigned;
        rs1 = tmprs1;
        rs2 = tmprs2;
        IfTrueBasicBlock = tmpIfTrue;
        IfFalseBasicBlock = tmpIfFalse;
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
