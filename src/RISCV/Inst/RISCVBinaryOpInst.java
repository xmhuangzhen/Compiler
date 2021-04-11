package RISCV.Inst;

import RISCV.Operand.*;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;

public class RISCVBinaryOpInst extends RISCVInstruction{

    public RISCVBinaryENUMType RISCVBinaryType;
    public RISCVRegister rd,rs1,rs2;
    public RISCVImm imm;


    public RISCVBinaryOpInst(RISCVBinaryENUMType tmpType, RISCVRegister tmprd, RISCVRegister tmprs1,
                             RISCVRegister tmprs2, RISCVImm tmpimm) {
        super();
        RISCVBinaryType = tmpType;
        rd = tmprd;
        rs1 = tmprs1;
        rs2 = tmprs2;
        imm = tmpimm;

        //for Naive Reg Allocator use
        if ((rd instanceof RISCVVirtualReg)||(rd instanceof RISCVGlobalReg)) {
            UsedVirtualReg.add(rd);
        }
        if ((rs1 instanceof RISCVVirtualReg)||(rs1 instanceof RISCVGlobalReg)) UsedVirtualReg.add(rs1);
        if ((rs2 instanceof RISCVVirtualReg)||(rs2 instanceof RISCVGlobalReg)) UsedVirtualReg.add(rs2);

        //for graph coloring use
        if(!(rd instanceof RISCVGlobalReg)) def.add(rd);
        if(!(rs1 instanceof RISCVGlobalReg)) use.add(rs1);
        if(rs2 != null && !(rs2 instanceof RISCVGlobalReg)) use.add(rs2);
    }

    @Override
    public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2) {
        if(rd == reg1) rd = reg2;
        if(rs1 == reg1) rs1 = reg2;
        if(rs2 == reg1) rs2 = reg2;
    }

    @Override
    public void ComputeGenAndKill(HashSet<RISCVRegister> BlockGen, HashSet<RISCVRegister> BlockKill) {
        if(!(rs1 instanceof RISCVGlobalReg) && !BlockKill.contains(rs1))
            BlockGen.add(rs1);
        if(!(rs2 instanceof RISCVGlobalReg) && rs2 != null && !BlockKill.contains(rs2))
            BlockGen.add(rs2);
        if(!(rd instanceof RISCVGlobalReg)) BlockKill.add(rd);
    }

    @Override
    public void replaceUse(RISCVRegister reg1, RISCVRegister reg2) {
        if(rd != null && rd == reg1 && def.contains(rd)){
            def.remove(rd);
            rd = reg2;
            def.add(rd);
        }
        if(rs1 != null && rs1 == reg1 && use.contains(rs1)) {
            use.remove(rs1);
            rs1 = reg2;
            use.add(rs1);
        }
        if(rs2 != null && rs2 == reg1 && use.contains(rs2)) {
            use.remove(rs2);
            rs2 = reg2;
            use.add(rs2);
        }
    }

    @Override
    public String toString() {
        StringBuilder tmpString = new StringBuilder(RISCVBinaryType.name());
        if(imm == null){
            tmpString.append(" ");
            tmpString.append(rd.toString()).append(",").append(rs1.toString()).append(",");
            tmpString.append(rs2.toString());
        } else {
            tmpString.append("i ");
            tmpString.append(rd.toString()).append(",").append(rs1.toString()).append(",");
            tmpString.append(imm);
        }
        return tmpString.toString();
    }
}
