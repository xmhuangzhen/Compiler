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
                for (IRBasicBlock Blockb = tmpFunc.thisEntranceBlock;
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
            }
        return false;
    }
}
