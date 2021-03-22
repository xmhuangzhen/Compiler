package Backend;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import RISCV.Inst.RISCVInstruction;
import RISCV.Inst.RISCVlInst;
import RISCV.Inst.RISCVlaInst;
import RISCV.Inst.RISCVsInst;
import RISCV.Operand.RISCVGlobalReg;
import RISCV.Operand.RISCVImm;
import RISCV.Operand.RISCVStackReg;
import RISCV.Operand.RISCVVirtualReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVModule;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class NaiveRegAllocator{

    public RISCVModule curRISCVModule;
    public HashMap<RISCVVirtualReg, RISCVGlobalReg> RegAllocMap;
    public static int StackCnt;

    public NaiveRegAllocator(RISCVModule tmpModule){
        RegAllocMap = new LinkedHashMap<>();
        curRISCVModule = tmpModule;
        StackCnt = 0;
    }

    public void run(){
        for(var tmpFunc : curRISCVModule.RISCVFuncMap.values()){
            for(int i = 0;i < tmpFunc.BasicBlockList.size();++i){
                RISCVBasicBlock tmpBlock = tmpFunc.BasicBlockList.get(i);
                for(RISCVInstruction tmpInst = tmpBlock.HeadInst;tmpInst != null;tmpInst = tmpInst.nextInst){

                    for(var tmpReg : tmpInst.UsedVirtualReg){
                        if(RegAllocMap.containsKey(tmpReg))
                            tmpInst.addInstPre(tmpBlock,new RISCVlaInst(tmpReg,RegAllocMap.get(tmpReg)));
                    }

                    for(var tmpReg : tmpInst.UsedVirtualReg) {
                        RISCVGlobalReg tmpStoreReg;
                        if (!RegAllocMap.containsKey(tmpReg)) {
                            tmpStoreReg = new RISCVGlobalReg("stack_" + (StackCnt++));
                            RegAllocMap.put(tmpReg, tmpStoreReg);
                        } else tmpStoreReg = RegAllocMap.get(tmpReg);
                        tmpInst.addInstNxt(tmpBlock, new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                tmpStoreReg,tmpReg,new RISCVImm(0)));
                        tmpInst = tmpInst.nextInst;
                    }
                }
            }
        }
    }
}
