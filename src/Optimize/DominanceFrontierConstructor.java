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
                for (IRBasicBlock curBlock = tmpFunc.thisEntranceBlock;
                     curBlock != null;
                     curBlock = curBlock.nextBasicBlocks)
                    if (curBlock.DFN != 0) {
                        for (IRBasicBlock Blockb : curBlock.CFGSuccessor) {
                           // System.out.println(curBlock.BasicBlockName);
                            for (IRBasicBlock Blockx = curBlock;
                                 Blockx != null && !Blockx.StrictDominator.contains(Blockb);
                                 Blockx = Blockx.DominatorTreeImmediateDominator) {
                                Blockx.DominanceFrontier.add(Blockb);
                            }
                        }
                    }
            }
        return false;
    }
}
