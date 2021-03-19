package RISCV;

import IR.Operand.IROperand;
import IR.Operand.Parameter;
import IR.Operand.Register;
import RISCV.Operand.RISCVPhyReg;
import RISCV.Operand.RISCVRegister;
import RISCV.Operand.RISCVVirtualReg;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class RISCVModule {
    public static ArrayList<String> RISCVPhyRegName = new ArrayList<>(Arrays.asList(
            "zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2", "s0", "s1",
            "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
            "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"));
    public ArrayList<RISCVPhyReg> PhyRegList;
    public HashMap<IROperand, RISCVVirtualReg> VirtualRegMap;
    public int VirtualRegCnt;

    public RISCVModule(){
        PhyRegList = new ArrayList<>();
        for(int i = 0;i < 32;++i){
            PhyRegList.add(new RISCVPhyReg(RISCVPhyRegName.get(i)));
        }
        VirtualRegMap = new LinkedHashMap<>();
        VirtualRegCnt = 0;
    }

    public RISCVRegister getRISCVVirtualReg(IROperand tmpIROperand){

        if(tmpIROperand instanceof Register || tmpIROperand instanceof Parameter){
            //todo
        }

        //todo
        if(VirtualRegMap.containsKey(tmpIROperand)) return VirtualRegMap.get(tmpIROperand);
        RISCVVirtualReg tmpRISCVRegister = new RISCVVirtualReg(VirtualRegCnt++);
        VirtualRegMap.put(tmpIROperand,tmpRISCVRegister);
        return tmpRISCVRegister;
    }
}
