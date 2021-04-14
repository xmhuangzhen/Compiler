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

                //Algorithm 3.2
/*                for (IRBasicBlock Blockb = tmpFunc.thisEntranceBlock;
                     Blockb != null;
                     Blockb = Blockb.nextBasicBlocks)
                    if (Blockb.DFN != 0) {
                        for (IRBasicBlock Blocka : Blockb.CFGPredecessor)
                        if(Blocka.DFN != 0){
                            for (IRBasicBlock Blockx = Blocka;
                                 Blockx != null && !Blockb.StrictDominator.contains(Blockx);
                                 Blockx = Blockx.DominatorTreeImmediateDominator) {
                                Blockx.DominanceFrontier.add(Blockb);
                            }
                        }
                    }
*/
                //wiki
                for (IRBasicBlock BlockB = tmpFunc.thisEntranceBlock; BlockB != null;
                     BlockB = BlockB.nextBasicBlocks)
                    if (BlockB.DFN != 0) {
                        if (BlockB.CFGPredecessor.size() > 1) {
                            for (IRBasicBlock BlockP : BlockB.CFGPredecessor) {
                                IRBasicBlock runner = BlockP;
                                while (runner != BlockB.DominatorTreeImmediateDominator) {
                                    runner.DominanceFrontier.add(BlockB);
                                    runner = runner.DominatorTreeImmediateDominator;
                                }
                            }
                        }
                    }

                /*
                for (IRBasicBlock tmpBlock = tmpFunc.thisEntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
                    System.out.print(tmpBlock.BasicBlockName + ":");
                    for (var t : tmpBlock.DominanceFrontier) {
                        System.out.print(t + ",");
                    }
                    System.out.println("");
                }
 */
            }
        return false;
    }
}
