package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVModule;

import java.util.ArrayList;

public class RISCVBranchInst extends RISCVInstruction {

  //  public RISCVCompareENUMType CompareType;
    //    public RISCVRegister rs1,rs2;
//    public boolean BranchUnsigned;
    public RISCVRegister rs1;
    public RISCVBasicBlock IfTrueBasicBlock, IfFalseBasicBlock;


    /*    public RISCVBranchInst(RISCVCompareENUMType tmpType, boolean tmpUnsigned, RISCVRegister tmprs1,
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
    */
    public RISCVBranchInst(RISCVRegister tmprs1, RISCVBasicBlock tmpIfTrue, RISCVBasicBlock tmpIfFalse) {
        super();
        rs1 = tmprs1;
        IfTrueBasicBlock = tmpIfTrue;
        IfFalseBasicBlock = tmpIfFalse;
        if ((rs1 instanceof RISCVVirtualReg)||(rs1 instanceof RISCVGlobalReg)) UsedVirtualReg.add(rs1);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if (rs1 == reg1) rs1 = reg2;
    }


    @Override
    public String toString() {
        StringBuilder tmpString = new StringBuilder("b");
    /*    tmpString.append(CompareType.name());
        if(BranchUnsigned) tmpString.append("u");
        tmpString.append(" ").append(rs1.toString()).append(",").append(rs2.toString()).append(",");
        tmpString.append(IfTrueBasicBlock.toString());
    */

        tmpString.append("nez " + rs1.toString() + "," + IfTrueBasicBlock.toString());
        tmpString.append("\n\tj ").append(IfFalseBasicBlock.toString());
        return tmpString.toString();
    }
}
