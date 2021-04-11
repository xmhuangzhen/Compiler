package Optimize;

import RISCV.Inst.RISCVBranchInst;
import RISCV.Inst.RISCVInstruction;
import RISCV.Inst.RISCVJumpInst;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;

public class RISCVCFGConstructor {

    public RISCVFunction curFunc;

    public RISCVCFGConstructor(RISCVFunction tmpFunc) {
        curFunc = tmpFunc;
    }

    public boolean run() {
        for (RISCVBasicBlock tmpBlock = curFunc.EntranceBlock;
             tmpBlock != null; tmpBlock = tmpBlock.nextBlock) {
            tmpBlock.successor.clear();
            tmpBlock.predecessor.clear();
        }
        for (RISCVBasicBlock tmpBlock = curFunc.EntranceBlock;
             tmpBlock != null; tmpBlock = tmpBlock.nextBlock) {
            for (RISCVInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null; tmpInst = tmpInst.nextInst) {
                if (tmpInst instanceof RISCVBranchInst) {
                    if (((RISCVBranchInst) tmpInst).IfTrueBasicBlock != null) {
                        tmpBlock.successor.add(((RISCVBranchInst) tmpInst).IfTrueBasicBlock);
                        ((RISCVBranchInst) tmpInst).IfTrueBasicBlock.predecessor.add(tmpBlock);
                    }
                    if (((RISCVBranchInst) tmpInst).IfFalseBasicBlock != null) {
                        tmpBlock.successor.add(((RISCVBranchInst) tmpInst).IfFalseBasicBlock);
                        ((RISCVBranchInst) tmpInst).IfFalseBasicBlock.predecessor.add(tmpBlock);
                    }
                } else if (tmpInst instanceof RISCVJumpInst) {
                    tmpBlock.successor.add(((RISCVJumpInst) tmpInst).JumpToBlock);
                    ((RISCVJumpInst) tmpInst).JumpToBlock.predecessor.add(tmpBlock);
                }
            }
        }

        return false;
    }
}
