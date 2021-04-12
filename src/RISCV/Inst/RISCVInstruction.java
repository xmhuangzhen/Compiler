package RISCV.Inst;

import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVModule;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

abstract public class RISCVInstruction {
    public enum RISCVBinaryENUMType{
        add,sub,mul,div,rem,
        slt,
        sll,sra,
        and,or,xor
    }
    public enum RISCVWidthENUMType{
        b,w
    }
    public enum RISCVCompareENUMType{
        eq,ne,lt,le,gt,ge
    }

    public RISCVInstruction nextInst, preInst;
    public ArrayList<RISCVRegister> UsedVirtualReg;


    public RISCVInstruction(){
        UsedVirtualReg = new ArrayList<>();
    }

    public void addInstPre(RISCVBasicBlock tmpBlock, RISCVInstruction tmpInst){
        if(this.preInst == null){
            tmpInst.nextInst = this;
            tmpInst.preInst = null;
            tmpBlock.HeadInst = tmpInst;
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
            tmpInst.nextInst = null;
            this.nextInst = tmpInst;
        } else {
            this.nextInst.preInst = tmpInst;
            tmpInst.nextInst = this.nextInst;
            tmpInst.preInst = this;
            this.nextInst = tmpInst;
        }
    }

    //for Naive Reg Allocator use
    abstract public void replaceReg(RISCVRegister reg1, RISCVPhyReg reg2);



    //for graph coloring use
    abstract public HashSet<RISCVRegister> use();
    abstract public HashSet<RISCVRegister> def();

    abstract public void replaceUse(RISCVRegister reg1, RISCVRegister reg2);

    //for graph coloring use
    public void replaceInst(RISCVBasicBlock tmpBlock, RISCVInstruction tmpInst){
        tmpInst.preInst = preInst;
        tmpInst.nextInst = nextInst;
        if(preInst == null)
            tmpBlock.HeadInst = tmpInst;
        else
            preInst.nextInst = tmpInst;
        if(nextInst == null)
            tmpBlock.TailInst = tmpInst;
        else
            nextInst.preInst = tmpInst;
    }

    public void removeInst(RISCVBasicBlock tmpBlock){
        if (preInst == null)
            tmpBlock.HeadInst = nextInst;
        else
            preInst.nextInst = nextInst;
        if(nextInst == null)
            tmpBlock.TailInst = preInst;
        else
            nextInst.preInst = preInst;
    }
}
