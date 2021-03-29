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

//                System.out.println("#####################"+tmpFunc.FunctionName);

                for (RISCVBasicBlock tmpBlock = tmpFunc.EntranceBlock; tmpBlock != null; tmpBlock = tmpBlock.nextBlock) {

             //       System.out.println("--------------"+ tmpBlock.BlockName+ "-----------------");
                    for (RISCVInstruction tmpInst = tmpBlock.HeadInst; tmpInst != null; tmpInst = tmpInst.nextInst) {

                        RISCVInstruction thisInst = tmpInst;

                      //  System.out.println(thisInst.toString());
                        int NumOfPhyReg = 0;
                        for (int i = 0; i < thisInst.UsedVirtualReg.size(); ++i) {
                            RISCVRegister tmpReg = thisInst.UsedVirtualReg.get(i);
                            RISCVRegister tmpStoreReg;
                            if (!RegAllocMap.containsKey(tmpReg)) {
                                tmpStoreReg = new RISCVStackReg(tmpFunc,
                                        curRISCVModule.getPhyReg("s0"),
                                        UpperSize);
                                RegAllocMap.put(tmpReg, tmpStoreReg);
                            } else tmpStoreReg = RegAllocMap.get(tmpReg);

                            if (tmpStoreReg instanceof RISCVStackReg) {
                                if (tmpReg instanceof RISCVVirtualReg) {
                               //     if(tmpReg.NeedLoad) {
                                        thisInst.addInstPre(tmpBlock,
                                                new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                        curRISCVModule.getPhyReg("t" + NumOfPhyReg),
                                                        ((RISCVStackReg) tmpStoreReg).baseReg,
                                                        ((RISCVStackReg) tmpStoreReg).Offset));
                                 //   }
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
                //            System.out.println("["+tmpReg.RegisterName+","+((RISCVStackReg) tmpStoreReg).Offset+"]");
                        }

                        NumOfPhyReg = 0;
                        for (int i = 0; i < Integer.min(1,thisInst.UsedVirtualReg.size()); ++i) {
                            RISCVRegister tmpReg = thisInst.UsedVirtualReg.get(i);
                            RISCVRegister tmpStoreReg = RegAllocMap.get(tmpReg);
                            if (tmpStoreReg instanceof RISCVStackReg) {
                                if (tmpReg instanceof RISCVVirtualReg) {
                                //    if(!tmpReg.NeedLoad) {
                                        tmpInst.addInstNxt(tmpBlock,
                                                new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                        curRISCVModule.getPhyReg("t" + NumOfPhyReg),
                                                        ((RISCVStackReg) tmpStoreReg).baseReg,
                                                        ((RISCVStackReg) tmpStoreReg).Offset));
                                        tmpInst = tmpInst.nextInst;
                                  //  }
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
                // mv s1,sp
                // sw ra,-4(sp)
                // sw s0,-8(sp)
                // addi sp,sp,-UpperSize
                // mv s0,sp
                // addi sp,sp,-DownSize

                RISCVInstruction tmpInst = tmpFunc.EntranceBlock.HeadInst;
                RISCVInstruction tmpInst0 = new RISCVmvInst(
                        curRISCVModule.getPhyReg("s1"),
                        curRISCVModule.getPhyReg("sp"));
                RISCVInstruction tmpInst1 = new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                        curRISCVModule.getPhyReg("ra"),
                        curRISCVModule.getPhyReg("sp"),
                        new RISCVImm(-4));
                RISCVInstruction tmpInst2 = new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                        curRISCVModule.getPhyReg("s0"),
                        curRISCVModule.getPhyReg("sp"),
                        new RISCVImm(-8));
                RISCVInstruction tmpInst3 = new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                        curRISCVModule.getPhyReg("sp"),
                        curRISCVModule.getPhyReg("sp"),
                        null, new RISCVImm(-UpperSize));
                RISCVInstruction tmpInst4 = new RISCVmvInst(curRISCVModule.getPhyReg("s0"),
                        curRISCVModule.getPhyReg("sp"));
                RISCVInstruction tmpInst5 = new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                        curRISCVModule.getPhyReg("sp"),
                        curRISCVModule.getPhyReg("sp"),
                        null, new RISCVImm(-DownSize));


                if (tmpInst == null) {
                    tmpFunc.EntranceBlock.HeadInst = tmpInst0;
                } else {
                    tmpInst.addInstPre(tmpFunc.EntranceBlock, tmpInst0);
                }
                tmpInst0.addInstNxt(tmpFunc.EntranceBlock, tmpInst1);
                tmpInst1.addInstNxt(tmpFunc.EntranceBlock, tmpInst2);
                tmpInst2.addInstNxt(tmpFunc.EntranceBlock, tmpInst3);
                tmpInst3.addInstNxt(tmpFunc.EntranceBlock, tmpInst4);
                tmpInst4.addInstNxt(tmpFunc.EntranceBlock, tmpInst5);

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
                //lw s0,-8(sp)
                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                curRISCVModule.getPhyReg("s0"),
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
