package RISCV.Operand;

import RISCV.Inst.RISCVmvInst;

import java.util.HashSet;

public class RISCVRegister extends RISCVOperand{

    public String RegisterName;
    public boolean NeedLoad;

    //for Graph Coloring use
    public HashSet<RISCVRegister> adjList;
    public double weight;
    public int degree;
    public HashSet<RISCVmvInst> moveList;
    public RISCVRegister alias;
    public RISCVPhyReg color;
    public int StackOffset;

    public RISCVRegister(String tmpName){
        RegisterName = tmpName;
        NeedLoad = true;

        adjList = new HashSet<>();
        degree = 0;
        moveList = new HashSet<>();
        alias = null;
        if(this instanceof RISCVPhyReg) color = (RISCVPhyReg) this;
        else color = null;
        StackOffset = 0;
    }
}
