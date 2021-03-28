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

import java.util.*;

public class NaiveRegAllocator {

    public RISCVModule curRISCVModule;
    public HashMap<RISCVRegister, RISCVRegister> RegAllocMap;
    public HashSet<RISCVRegister> RegCountSet;
    public static int StackCnt;

    public NaiveRegAllocator(RISCVModule tmpModule) {
        RegAllocMap = new LinkedHashMap<>();
        RegCountSet = new LinkedHashSet<>();
        curRISCVModule = tmpModule;
        StackCnt = 0;
    }

    public void run() {
        for (var tmpFunc : curRISCVModule.RISCVFuncMap.values())
            if (!tmpFunc.IsBuiltIn) {
                for (RISCVBasicBlock tmpBlock = tmpFunc.EntranceBlock; tmpBlock != null; tmpBlock = tmpBlock.nextBlock) {
                    for (RISCVInstruction tmpInst = tmpBlock.HeadInst; tmpInst != null; tmpInst = tmpInst.nextInst) {
                        for (int i = 0; i < tmpInst.UsedVirtualReg.size(); ++i) {
                            RISCVRegister tmpReg = tmpInst.UsedVirtualReg.get(i);
                            if (!RegCountSet.contains(tmpReg)) {
                                tmpFunc.StackCounting++;
                                RegCountSet.add(tmpReg);
                            }
                        }
                    }
                }
            }

        for (var tmpFunc : curRISCVModule.RISCVFuncMap.values())
            if (!tmpFunc.IsBuiltIn) {

                for (RISCVBasicBlock tmpBlock = tmpFunc.EntranceBlock; tmpBlock != null; tmpBlock = tmpBlock.nextBlock) {
                    for (RISCVInstruction tmpInst = tmpBlock.HeadInst; tmpInst != null; tmpInst = tmpInst.nextInst) {
                        for (int i = 0; i < tmpInst.UsedVirtualReg.size(); ++i) {
                            RISCVRegister tmpReg = tmpInst.UsedVirtualReg.get(i);
                            if (!RegCountSet.contains(tmpReg)) {
                                tmpFunc.StackCounting++;
                                RegCountSet.add(tmpReg);
                            }
                        }
                    }
                }



                int RealSize = tmpFunc.RealStackSize();
                int UpperSize = RealSize / 2 - (RealSize / 2) % 4;
                int DownSize = RealSize - UpperSize;


                for (RISCVBasicBlock tmpBlock = tmpFunc.EntranceBlock; tmpBlock != null; tmpBlock = tmpBlock.nextBlock) {
                    for (RISCVInstruction tmpInst = tmpBlock.HeadInst; tmpInst != null; tmpInst = tmpInst.nextInst) {

                        RISCVInstruction thisInst = tmpInst;

                        int NumOfPhyReg = 0;
                        for (int i = 0; i < thisInst.UsedVirtualReg.size(); ++i) {
                            RISCVRegister tmpReg = thisInst.UsedVirtualReg.get(i);
                            RISCVRegister tmpStoreReg;
                            if (!RegAllocMap.containsKey(tmpReg)) {
                                tmpStoreReg = new RISCVStackReg(tmpFunc, curRISCVModule.getPhyReg("t5"),
                                        UpperSize);
                                RegAllocMap.put(tmpReg, tmpStoreReg);
                            } else tmpStoreReg = RegAllocMap.get(tmpReg);
                            if (tmpStoreReg instanceof RISCVStackReg) {
                                if (tmpReg instanceof RISCVVirtualReg) {
                                    thisInst.addInstPre(tmpBlock,
                                            new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                    curRISCVModule.getPhyReg("t" + NumOfPhyReg),
                                                    ((RISCVStackReg) tmpStoreReg).baseReg,
                                                    ((RISCVStackReg) tmpStoreReg).Offset));
                                    thisInst.replaceReg(tmpReg, curRISCVModule.getPhyReg("t" + NumOfPhyReg));
                                    NumOfPhyReg++;
                                } else if (tmpReg instanceof RISCVGlobalReg) {//global reg
                                    //lui t0,%hi(a)
                                    //lw t1,%lo(a)(t0)
                                    thisInst.addInstPre(tmpBlock,
                                            new RISCVLUIInst(curRISCVModule.getPhyReg("t" + NumOfPhyReg),
                                                    new RISCVRelocationImm((RISCVGlobalReg) tmpReg, RISCVRelocationImm.RelocationENUMType.hi)));
                                    NumOfPhyReg++;
                                    thisInst.addInstPre(tmpBlock,
                                            new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                    curRISCVModule.getPhyReg("t" + NumOfPhyReg),
                                                    curRISCVModule.getPhyReg("t" + (NumOfPhyReg - 1)),
                                                    new RISCVRelocationImm((RISCVGlobalReg) tmpReg, RISCVRelocationImm.RelocationENUMType.lo)));
                                    thisInst.replaceReg(tmpReg, curRISCVModule.getPhyReg("t" + NumOfPhyReg));
                                    NumOfPhyReg++;
                                } else throw new RuntimeException();
                            } else {
                                thisInst.replaceReg(tmpReg, (RISCVPhyReg) tmpStoreReg);
                            }
                        }

                        NumOfPhyReg = 0;
                        for (int i = 0; i < thisInst.UsedVirtualReg.size(); ++i) {
                            RISCVRegister tmpReg = thisInst.UsedVirtualReg.get(i);
                            RISCVRegister tmpStoreReg = RegAllocMap.get(tmpReg);
                            if (tmpStoreReg instanceof RISCVStackReg) {
                                if (tmpReg instanceof RISCVVirtualReg) {
                                    tmpInst.addInstNxt(tmpBlock,
                                            new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                    curRISCVModule.getPhyReg("t" + NumOfPhyReg),
                                                    ((RISCVStackReg) tmpStoreReg).baseReg,
                                                    ((RISCVStackReg) tmpStoreReg).Offset));
                                    tmpInst = tmpInst.nextInst;
                                    NumOfPhyReg++;
                                } else if (tmpReg instanceof RISCVGlobalReg) {//global reg
                                    //lui t0,%hi(a)
                                    //sw t1,%lo(a)(t0)
                                    tmpInst.addInstNxt(tmpBlock,
                                            new RISCVLUIInst(curRISCVModule.getPhyReg("t" + NumOfPhyReg),
                                                    new RISCVRelocationImm((RISCVGlobalReg) tmpReg, RISCVRelocationImm.RelocationENUMType.hi)));
                                    NumOfPhyReg++;
                                    tmpInst = tmpInst.nextInst;
                                    tmpInst.addInstNxt(tmpBlock,
                                            new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                    curRISCVModule.getPhyReg("t" + NumOfPhyReg),
                                                    curRISCVModule.getPhyReg("t" + (NumOfPhyReg - 1)),
                                                    new RISCVRelocationImm((RISCVGlobalReg) tmpReg, RISCVRelocationImm.RelocationENUMType.lo)));
                                    NumOfPhyReg++;
                                    tmpInst = tmpInst.nextInst;
                                } else throw new RuntimeException();
                            }


                            //System.out.println("");
                        }
                    }

                }


                //////////////////////////////////////////////////////////////
                if (tmpFunc.EntranceBlock == null) throw new RuntimeException();
                // addi s0,sp,0
                // addi sp,sp,-UpperSize
                // sw ra,-4(s0)
                // sw t5,-8(s0)
                // addi t5,sp,0
                // addi sp,sp,-DownSize

                RISCVInstruction tmpInst = tmpFunc.EntranceBlock.HeadInst;
                if (tmpInst == null) {
                    tmpFunc.EntranceBlock.HeadInst = new RISCVBinaryOpInst(
                            RISCVInstruction.RISCVBinaryENUMType.add,
                            curRISCVModule.getPhyReg("s0"),
                            curRISCVModule.getPhyReg("sp"),null,
                            new RISCVImm(0));
                    tmpInst = tmpFunc.EntranceBlock.HeadInst;

                    tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                            new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                    curRISCVModule.getPhyReg("sp"), curRISCVModule.getPhyReg("sp"),
                                    null, new RISCVImm(-UpperSize)));
                    tmpInst = tmpInst.nextInst;

                    tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                            new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                    curRISCVModule.getPhyReg("ra"),
                                    curRISCVModule.getPhyReg("s0"),
                                    new RISCVImm(-4)));
                    tmpInst = tmpInst.nextInst;
                    tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                            new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                    curRISCVModule.getPhyReg("t5"),
                                    curRISCVModule.getPhyReg("s0"),
                                    new RISCVImm(-8)));
                    tmpInst = tmpInst.nextInst;

                    tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                            new RISCVBinaryOpInst(
                                    RISCVInstruction.RISCVBinaryENUMType.add,
                                    curRISCVModule.getPhyReg("t5"),
                                    curRISCVModule.getPhyReg("sp"),null,
                                    new RISCVImm(0)));
                    tmpInst = tmpInst.nextInst;
                    tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                            new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                    curRISCVModule.getPhyReg("sp"),
                                    curRISCVModule.getPhyReg("sp"),
                                    null, new RISCVImm(-DownSize)));
                } else {
                    tmpInst.addInstPre(tmpFunc.EntranceBlock, new RISCVmvInst(
                            curRISCVModule.getPhyReg("s0"),
                            curRISCVModule.getPhyReg("sp")));
                    tmpInst.addInstPre(tmpFunc.EntranceBlock,
                            new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                    curRISCVModule.getPhyReg("sp"),
                                    curRISCVModule.getPhyReg("sp"),
                                    null, new RISCVImm(-UpperSize)));
                    tmpInst.addInstPre(tmpFunc.EntranceBlock,
                            new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                    curRISCVModule.getPhyReg("ra"),
                                    curRISCVModule.getPhyReg("s0"),
                                    new RISCVImm(-4)));
                    tmpInst.addInstPre(tmpFunc.EntranceBlock,
                            new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                    curRISCVModule.getPhyReg("t5"),
                                    curRISCVModule.getPhyReg("s0"),
                                    new RISCVImm(-8)));
                    tmpInst.addInstPre(tmpFunc.EntranceBlock,
                            new RISCVmvInst(curRISCVModule.getPhyReg("t5"),
                                    curRISCVModule.getPhyReg("sp")));
                    tmpInst.addInstPre(tmpFunc.EntranceBlock,
                            new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                    curRISCVModule.getPhyReg("sp"),
                                    curRISCVModule.getPhyReg("sp"),
                                    null, new RISCVImm(-DownSize)));
                }


                if (tmpFunc.LastBlock.TailInst == null) {
                    throw new RuntimeException(tmpFunc.FunctionName);
                }

                tmpInst = tmpFunc.LastBlock.TailInst;
                //addi sp,sp,48
                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                curRISCVModule.getPhyReg("sp"),
                                curRISCVModule.getPhyReg("sp"),
                                null, new RISCVImm(DownSize)));
                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                curRISCVModule.getPhyReg("sp"),
                                curRISCVModule.getPhyReg("sp"),
                                null, new RISCVImm(UpperSize)));
                //lw t5,-8(sp)
                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                curRISCVModule.getPhyReg("t5"),
                                curRISCVModule.getPhyReg("sp"),
                                new RISCVImm(-8)));
                //lw ra,-4(sp)
                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                curRISCVModule.getPhyReg("ra"),
                                curRISCVModule.getPhyReg("sp"),
                                new RISCVImm(-4)));

            }
    }
}
