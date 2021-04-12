package Optimize;

import RISCV.Inst.RISCVInstruction;
import RISCV.Operand.RISCVRegister;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVFunction;

import java.util.*;

import java.util.HashSet;

public class LivenessAnalysis {

    public RISCVFunction curFunc;
    public HashMap<RISCVBasicBlock, HashSet<RISCVRegister>> BLockUses;
    public HashMap<RISCVBasicBlock, HashSet<RISCVRegister>> BLockDefs;
    public HashSet<RISCVBasicBlock> BlockVisited;

    public LivenessAnalysis(RISCVFunction tmpFunc) {
        curFunc = tmpFunc;
        BLockUses = new LinkedHashMap<>();
        BLockDefs = new LinkedHashMap<>();
        BlockVisited = new LinkedHashSet<>();
    }

    public boolean run() {
        RISCVCFGConstructor tmpCFG = new RISCVCFGConstructor(curFunc);
        tmpCFG.run();


        for (RISCVBasicBlock tmpBlock = curFunc.EntranceBlock; tmpBlock != null;
             tmpBlock = tmpBlock.nextBlock) {
            HashSet<RISCVRegister> tmpUse = new LinkedHashSet<>();
            HashSet<RISCVRegister> tmpDef = new LinkedHashSet<>();
            for (RISCVInstruction tmpInst = tmpBlock.HeadInst; tmpInst != null;
                 tmpInst = tmpInst.nextInst) {
                HashSet<RISCVRegister> usenotdef = new LinkedHashSet<>(tmpInst.use());
                usenotdef.removeAll(tmpDef);
                tmpUse.addAll(usenotdef);
                tmpDef.addAll(tmpInst.def());
            }
            BLockUses.put(tmpBlock, tmpUse);
            BLockDefs.put(tmpBlock, tmpDef);
            tmpBlock.LiveIn.clear();
            tmpBlock.LiveOut.clear();
        }

        CalculateLiveOut(curFunc.LastBlock);

    /*    System.out.println(curFunc.FunctionName);
        for(RISCVBasicBlock tmpBlock = curFunc.EntranceBlock;tmpBlock != null;
        tmpBlock = tmpBlock.nextBlock){
            System.out.println(tmpBlock.BlockName+","+tmpBlock.LiveOut  );
        }
      */  return false;
    }

    public void CalculateLiveOut(RISCVBasicBlock curBlock) {
        if(BlockVisited.contains(curBlock)) return;
        BlockVisited.add(curBlock);

        HashSet<RISCVRegister> liveOut = new LinkedHashSet<>();
        for (var sucBlock : curBlock.successor)
            liveOut.addAll(sucBlock.LiveIn);
        curBlock.LiveOut.addAll(liveOut);

        HashSet<RISCVRegister> liveIn = new LinkedHashSet<>(liveOut);
        liveIn.removeAll(BLockDefs.get(curBlock));
        liveIn.addAll(BLockUses.get(curBlock));
        liveIn.removeAll(curBlock.LiveIn);

        if (!liveIn.isEmpty()) {
            curBlock.LiveIn.addAll(liveIn);
            BlockVisited.removeAll(curBlock.predecessor);
        }

        for (var preBlock : curBlock.predecessor) {
            CalculateLiveOut(preBlock);
        }
    }

}
