package RISCV.Inst;

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

}
