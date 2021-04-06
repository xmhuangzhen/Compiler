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


                int RealSize = tmpFunc.RealStackSize();
                int SegNum = RealSize/2048 + 1;
//                SegSize.replace(SegNum,0);

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
                                int OffsetOfSp = 4*(SegNum+1+tmpFunc.StackNum+1);
                                int SegNumberOfThis = OffsetOfSp/2048;
                                tmpStoreReg = new RISCVStackReg(tmpFunc,
                                        curRISCVModule.getPhyReg("s"+SegNumberOfThis),
                                        1024-OffsetOfSp%2048);
                                RegAllocMap.put(tmpReg, tmpStoreReg);
                            } else tmpStoreReg = RegAllocMap.get(tmpReg);

                            if (tmpStoreReg instanceof RISCVStackReg) {
                                if (tmpReg instanceof RISCVVirtualReg) {
                                    if (tmpReg.NeedLoad || i != 0) {
                                        thisInst.addInstPre(tmpBlock,
                                                new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                                        curRISCVModule.getPhyReg("t" + NumOfPhyReg),
                                                        ((RISCVStackReg) tmpStoreReg).baseReg,
                                                        ((RISCVStackReg) tmpStoreReg).Offset));
                                    }
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
                        int tmpSize = Integer.min(1,thisInst.UsedVirtualReg.size());
                        if(thisInst instanceof RISCVsInst) tmpSize = 0;
                        if(thisInst instanceof RISCVJumpInst) break;
                        for (int i = 0; i < tmpSize; ++i) {
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
                // sw ra,-4(sp)
                // sw s0,-8(sp)
                // addi sp,sp,-UpperSize
                // mv s0,sp
                // addi sp,sp,-DownSize

                RISCVInstruction tmpInst = tmpFunc.EntranceBlock.HeadInst;
                RISCVInstruction tmpInst1 = new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                        curRISCVModule.getPhyReg("ra"),
                        curRISCVModule.getPhyReg("sp"),
                        new RISCVImm(-4));
                if (tmpInst == null) {
                    tmpFunc.EntranceBlock.HeadInst = tmpInst1;
                } else {
                    tmpInst.addInstPre(tmpFunc.EntranceBlock, tmpInst1);
                }
                tmpInst = tmpInst1;
                for(int i = 0;i < SegNum;++i){
                    tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                            new RISCVsInst(RISCVInstruction.RISCVWidthENUMType.w,
                            curRISCVModule.getPhyReg("s"+i),
                            curRISCVModule.getPhyReg("sp"),
                            new RISCVImm(-8-4*i)));
                    tmpInst = tmpInst.nextInst;
                }

                for(int i = 0;i < SegNum;++i){
                    tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                        new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                        curRISCVModule.getPhyReg("sp"),
                        curRISCVModule.getPhyReg("sp"),
                        null, new RISCVImm(-1024)));
                    tmpInst= tmpInst.nextInst;
                    tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                            new RISCVmvInst(curRISCVModule.getPhyReg("s"+i),
                                    curRISCVModule.getPhyReg("sp")));
                    tmpInst= tmpInst.nextInst;
                    tmpInst.addInstNxt(tmpFunc.EntranceBlock,
                            new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                    curRISCVModule.getPhyReg("sp"),
                                    curRISCVModule.getPhyReg("sp"),
                                    null, new RISCVImm(-1024)));
                    tmpInst= tmpInst.nextInst;
                }

                if (tmpFunc.LastBlock.TailInst == null) {
                    throw new RuntimeException(tmpFunc.FunctionName);
                }

                tmpInst = tmpFunc.LastBlock.TailInst;
                for(int i = 0;i < SegNum;++i){
                    tmpInst.addInstPre(tmpFunc.LastBlock,
                            new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                    curRISCVModule.getPhyReg("sp"),
                                    curRISCVModule.getPhyReg("sp"),
                                    null, new RISCVImm(1024)));
                    tmpInst.addInstPre(tmpFunc.LastBlock,
                            new RISCVBinaryOpInst(RISCVInstruction.RISCVBinaryENUMType.add,
                                    curRISCVModule.getPhyReg("sp"),
                                    curRISCVModule.getPhyReg("sp"),
                                    null, new RISCVImm(1024)));
                }

                for(int i = 0;i < SegNum;++i){
                    tmpInst.addInstPre(tmpFunc.LastBlock,
                            new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                    curRISCVModule.getPhyReg("s"+i),
                                    curRISCVModule.getPhyReg("sp"),
                                    new RISCVImm(-8-4*i)));
                }

                //lw ra,-4(sp)
                tmpInst.addInstPre(tmpFunc.LastBlock,
                        new RISCVlInst(RISCVInstruction.RISCVWidthENUMType.w,
                                curRISCVModule.getPhyReg("ra"),
                                curRISCVModule.getPhyReg("sp"),
                                new RISCVImm(-4)));

            }
    }
}
