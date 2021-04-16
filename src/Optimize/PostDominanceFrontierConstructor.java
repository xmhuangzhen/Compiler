package Optimize;

import IR.IRBasicBlock;
import IR.IRModule;

import java.util.ArrayList;
import java.util.HashSet;

public class PostDominanceFrontierConstructor extends Pass {
    public PostDominanceFrontierConstructor(IRModule tmpModule) {
        super(tmpModule);
    }

    @Override
    public boolean run() {
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                //wiki
                for (IRBasicBlock BlockB = tmpFunc.thisEntranceBlock; BlockB != null;
                     BlockB = BlockB.nextBasicBlocks)
                    if (BlockB.PostDFN != 0) {
                        if (BlockB.PostCFGPredecessor.size() > 1) {
                            for (IRBasicBlock BlockP : BlockB.PostCFGPredecessor) {
                                IRBasicBlock runner = BlockP;
                                while (runner != BlockB.PostDominatorTreeImmediateDominator) {
                                    runner.PostDominanceFrontier.add(BlockB);
                                    runner = runner.PostDominatorTreeImmediateDominator;
                                }
                            }
                        }
                    }
            }
        return false;
    }
}
