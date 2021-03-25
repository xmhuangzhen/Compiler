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

                        RISCVInstruction thisInst = tmpInst;

//                        System.out.println(thisInst.toString());
//                        System.out.print(tmpInst.UsedVirtualReg.size());
                        for (int i = 0; i < thisInst.UsedVirtualReg.size(); ++i) {
                            RISCVVirtualReg tmpReg = thisInst.UsedVirtualReg.get(i);
                            RISCVRegister tmpStoreReg;
                            if (!RegAllocMap.containsKey(tmpReg)) {
                                tmpStoreReg = new RISCVStackReg(tmpFunc, (tmpInst instanceof RISCVCallInst));
                                RegAllocMap.put(tmpReg, tmpStoreReg);
                            } else tmpStoreReg = RegAllocMap.get(tmpReg);
                            if (!(tmpStoreReg instanceof RISCVPhyReg)) {
                                thisInst.addInstPre(tmpBlock,
                                        new RISCVlaInst(curRISCVModule.getPhyReg("t" + i), tmpStoreReg));
                                thisInst.replaceReg(tmpReg, curRISCVModule.getPhyReg("t" + i));
                            } else {
                                thisInst.replaceReg(tmpReg, (RISCVPhyReg) tmpStoreReg);
                            }
//                            System.out.println(tmpFunc.FunctionName+","+thisInst.toString()+","+tmpReg.toString());
                        }

                        for (int i = 0; i < thisInst.UsedVirtualReg.size(); ++i) {
                            RISCVVirtualReg tmpReg = thisInst.UsedVirtualReg.get(i);
                            RISCVRegister tmpStoreReg = RegAllocMap.get(tmpReg);
                            if (!(tmpStoreReg instanceof RISCVPhyReg)) {
                             //   System.out.print("s"+i+",");
                                tmpInst.addInstNxt(tmpBlock,
                                        new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                curRISCVModule.getPhyReg("t" + i),
                                                tmpStoreReg,
                                                new RISCVImm(0)));
                                tmpInst = tmpInst.nextInst;
                            }// else System.out.println(tmpInst.toString());
                        }
                        //System.out.println("");
                    }
                }
                if (tmpFunc.EntranceBlock == null) throw new RuntimeException();
                //addi sp,sp,-48
                RISCVInstruction tmpInst = tmpFunc.EntranceBlock.HeadInst;
                tmpInst.addInstPre(tmpFunc.EntranceBlock,
                        new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                curRISCVModule.getPhyReg("sp"), curRISCVModule.getPhyReg("sp"),
                                null, new RISCVImm(-tmpFunc.RealStackSize())));
                //sw ra,44(sp)
                tmpInst.addInstPre(tmpFunc.EntranceBlock,
                        new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                curRISCVModule.getPhyReg("ra"),
                                new RISCVDirectStackReg("sp", tmpFunc.RealStackSize()-4),
                                new RISCVImm(0)));
                //sw s0,40(sp)
                tmpInst.addInstPre(tmpFunc.EntranceBlock,
                        new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                curRISCVModule.getPhyReg("s0"),
                                new RISCVDirectStackReg("sp",tmpFunc.RealStackSize()-8),
                                 new RISCVImm(0)));
                //addi s0,sp,48
                tmpInst.addInstPre(tmpFunc.EntranceBlock,
                        new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                curRISCVModule.getPhyReg("s0"), curRISCVModule.getPhyReg("sp"),
                                null, new RISCVImm(tmpFunc.RealStackSize())));


                if (tmpFunc.LastBlock.TailInst == null) {
                    throw new RuntimeException(tmpFunc.FunctionName);
                }

                tmpInst = tmpFunc.LastBlock.TailInst;
                //lw s0,40(sp)
                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                curRISCVModule.getPhyReg("s0"),
                                new RISCVDirectStackReg("sp",tmpFunc.RealStackSize()-8),
                                new RISCVImm(0)));
                //lw ra,44(sp)
                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                curRISCVModule.getPhyReg("ra"),
                                new RISCVDirectStackReg("sp", tmpFunc.RealStackSize()-4),
                                new RISCVImm(0)));
                //addi sp,sp,48
                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                curRISCVModule.getPhyReg("sp"), curRISCVModule.getPhyReg("sp"),
                                null, new RISCVImm(tmpFunc.RealStackSize())));

            }
    }
}
