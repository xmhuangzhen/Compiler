package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.Map;

abstract public class RISCVInstruction {
    public enum RISCVBinaryENUMType{
        add,sub,mul,div,rem,
        slt,
        sll,sra,
        and,or,xor
    }
    public enum RISCVWidthENUMType{
        b,h,w
    }
    public enum RISCVCompareENUMType{
        eq,ne,lt,le,gt,ge
    }

    public RISCVInstruction nextInst, preInst;
    public ArrayList<RISCVVirtualReg> UsedVirtualReg;

    public RISCVInstruction(){
        UsedVirtualReg = new ArrayList<>();
    }

    public void addInstPre(RISCVBasicBlock tmpBlock, RISCVInstruction tmpInst){
        if(this.preInst == null){
            tmpBlock.HeadInst = tmpInst;
            tmpInst.nextInst = this;
            this.preInst = tmpInst;
        } else {
            this.preInst.nextInst = tmpInst;
            tmpInst.nextInst = this;
            tmpInst.preInst = this.preInst;
            this.preInst = tmpInst;
        }
    }

    public void addInstNxt(RISCVBasicBlock tmpBlock,RISCVInstruction tmpInst){
        if(this.nextInst == null){
            tmpBlock.TailInst = tmpInst;
            tmpInst.preInst = this;
            this.nextInst = tmpInst;
        } else {
            this.nextInst.preInst = tmpInst;
            tmpInst.nextInst = this.nextInst;
            tmpInst.preInst = this;
            this.nextInst = tmpInst;
        }
    }

    abstract public void replaceReg(RISCVVirtualReg reg1, RISCVPhyReg reg2);
}
