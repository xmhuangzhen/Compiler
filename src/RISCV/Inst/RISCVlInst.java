package RISCV.Inst;

import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVRegister;

public class RISCVlInst extends RISCVInstruction{

    public RISCVWidthENUMType WidthType;
    public RISCVRegister rd,rs1;
    public RISCVImm offset;

    public RISCVlInst(RISCVWidthENUMType tmpType, RISCVRegister tmprd, RISCVRegister tmprs1,
                      RISCVImm tmpoffset){
        WidthType = tmpType;
        rd = tmprd;
        rs1 = tmprs1;
        offset = tmpoffset;
    }

    @Override
    public String toString() {
        return "l"+WidthType.name()+" "+rd.toString()+","+rs1.toString()+"("+offset+")";
    }
}
