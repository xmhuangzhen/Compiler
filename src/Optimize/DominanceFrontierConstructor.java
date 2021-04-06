package Optimize;

import IR.IRBasicBlock;
import IR.IRModule;

public class DominanceFrontierConstructor extends Pass {
    public DominanceFrontierConstructor(IRModule tmpModule) {
        super(tmpModule);
    }

    @Override
    public boolean run() {
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                for (IRBasicBlock curBlock = tmpFunc.thisEntranceBlock;
                     curBlock != null;
                     curBlock = curBlock.nextBasicBlocks)
                    if (curBlock.DFN != 0) {
                        for (IRBasicBlock BlockPre : curBlock.DominatorTreePredecessor) {
                            for (IRBasicBlock BlockW = BlockPre;
                                 !curBlock.StrictDominator.contains(BlockW);
                                 BlockW = BlockW.DominatorTreeImmediateDominator) {
                                BlockW.DominanceFrontier.add(curBlock);
                            }
                        }
                    }
            }
        return false;
    }
}
