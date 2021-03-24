package Backend;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import RISCV.Inst.*;
import RISCV.Operand.*;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class NaiveRegAllocator {

    public RISCVModule curRISCVModule;
    public HashMap<RISCVVirtualReg, RISCVRegister> RegAllocMap;
    public static int StackCnt;

    public NaiveRegAllocator(RISCVModule tmpModule) {
        RegAllocMap = new LinkedHashMap<>();
        curRISCVModule = tmpModule;
        StackCnt = 0;
    }

    public void run() {
        for (var tmpFunc : curRISCVModule.RISCVFuncMap.values())
            if (!tmpFunc.IsBuiltIn) {
                for (RISCVBasicBlock tmpBlock = tmpFunc.EntranceBlock; tmpBlock != null; tmpBlock = tmpBlock.nextBlock) {
                    for (RISCVInstruction tmpInst = tmpBlock.HeadInst; tmpInst != null; tmpInst = tmpInst.nextInst) {

                        for (int i = 0; i < tmpInst.UsedVirtualReg.size(); ++i) {
                            RISCVVirtualReg tmpReg = tmpInst.UsedVirtualReg.get(i);
                            RISCVRegister tmpStoreReg;
                            if (!RegAllocMap.containsKey(tmpReg)) {
                                tmpStoreReg = new RISCVStackReg(tmpFunc, (tmpInst instanceof RISCVCallInst));
                                RegAllocMap.put(tmpReg, tmpStoreReg);
                            } else tmpStoreReg = RegAllocMap.get(tmpReg);
                            if (!(tmpStoreReg instanceof RISCVPhyReg)) {
                                tmpInst.addInstPre(tmpBlock,
                                        new RISCVlaInst(curRISCVModule.getPhyReg("s" + i), tmpStoreReg));
                                tmpInst.replaceReg(tmpReg, curRISCVModule.getPhyReg("s" + i));
                            } else {
                                tmpInst.replaceReg(tmpReg, (RISCVPhyReg) tmpStoreReg);
                            }
                        }

                        for (int i = 0; i < tmpInst.UsedVirtualReg.size(); ++i) {
                            RISCVVirtualReg tmpReg = tmpInst.UsedVirtualReg.get(i);
                            RISCVRegister tmpStoreReg = RegAllocMap.get(tmpReg);
                            if (!(tmpStoreReg instanceof RISCVPhyReg))
                                tmpInst.addInstNxt(tmpBlock,
                                        new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                curRISCVModule.getPhyReg("s" + i),
                                                tmpStoreReg,
                                                new RISCVImm(0)));
                            tmpInst = tmpInst.nextInst;
                        }

                    }
                }
                if (tmpFunc.EntranceBlock == null) throw new RuntimeException();
                tmpFunc.EntranceBlock.HeadInst.addInstPre(tmpFunc.EntranceBlock,
                        new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                curRISCVModule.getPhyReg("sp"), curRISCVModule.getPhyReg("sp"),
                                null, new RISCVImm(-tmpFunc.RealStackSize())));

                if (/*tmpFunc.LastBlock == null ||*/ tmpFunc.LastBlock.TailInst == null) {
//                System.out.println(tmpFunc.LastBlock.BlockName);
//                    System.out.println(tmpFunc.LastBlock != null);
                    //              System.out.println(tmpFunc.EntranceBlock.HeadInst != null);
                    throw new RuntimeException(tmpFunc.FunctionName);
                }
                tmpFunc.LastBlock.TailInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                curRISCVModule.getPhyReg("sp"), curRISCVModule.getPhyReg("sp"),
                                null, new RISCVImm(tmpFunc.RealStackSize())));

            }
    }
}
