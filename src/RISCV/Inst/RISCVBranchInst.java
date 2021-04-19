package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

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
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {
        if(rs1 != null && rs1 == reg1) {
            rs1 = reg2;
        }
    }

    @Override
    public HashSet<RISCVRegister> use() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
        if(!(rs1 instanceof RISCVGlobalReg)) res.add(rs1);
        return res;
    }

    @Override
    public HashSet<RISCVRegister> def() {
        HashSet<RISCVRegister> res = new LinkedHashSet<>();
        return res;
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
