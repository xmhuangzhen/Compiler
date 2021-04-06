package Optimize;

import IR.IRBasicBlock;
import IR.IRModule;

import java.util.HashSet;

//using Lengauer-Tarjan algorithm
public class DominatorTreeConstructor extends Pass {

    public DominatorTreeConstructor(IRModule tmpModule) {
        super(tmpModule);
    }

    public void Compress(IRBasicBlock curBlock) {
        if (curBlock.DominatorTreeAncestor != null &&
                curBlock.DominatorTreeAncestor.DominatorTreeAncestor != null) {
            Compress(curBlock.DominatorTreeAncestor);
            if (curBlock.DominatorTreeAncestor.DominatorTreeLabel.DominatorTreeSemiDominator.DFN
                    < curBlock.DominatorTreeLabel.DominatorTreeSemiDominator.DFN) {
                curBlock.DominatorTreeLabel = curBlock.DominatorTreeAncestor.DominatorTreeLabel;
            }
            curBlock.DominatorTreeAncestor = curBlock.DominatorTreeAncestor.DominatorTreeAncestor;
        }
    }

    public void Link(IRBasicBlock BlockV, IRBasicBlock BlockW) {
        BlockV.DominatorTreeAncestor = BlockW;
    }

    public IRBasicBlock Eval(IRBasicBlock BlockV) {
        if (BlockV.DominatorTreeAncestor == null) return BlockV;
        Compress(BlockV);
        return BlockV.DominatorTreeLabel;
    }

    @Override
    public boolean run() {
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                //(1) get dfs order
                tmpFunc.CalculateDFSOrder();

                //(2) get semi dominator
                for (int i = tmpFunc.DFNcurNumber; i > 1; --i) {
                    IRBasicBlock BlockW = tmpFunc.DFSOrder.get(i - 1);
                    for (IRBasicBlock BlockV : BlockW.DominatorTreePredecessor) {
                        IRBasicBlock BlockU = Eval(BlockV);
                        if (BlockU.DominatorTreeSemiDominator.DFN < BlockW.DominatorTreeSemiDominator.DFN) {
                            BlockW.DominatorTreeSemiDominator = BlockU.DominatorTreeSemiDominator;
                        }
                    }
                    BlockW.DominatorTreeSemiDominator.DominatorTreeBucket.add(BlockW);
                    Link(BlockW.DominatorTreeFather, BlockW);

                    for (IRBasicBlock BlockV : BlockW.DominatorTreeFather.DominatorTreeBucket) {
                        IRBasicBlock BlockU = Eval(BlockV);
                        if (BlockU.DominatorTreeSemiDominator.DFN < BlockV.DominatorTreeSemiDominator.DFN)
                            BlockV.DominatorTreeImmediateDominator = BlockU;
                        else
                            BlockV.DominatorTreeImmediateDominator = BlockW.DominatorTreeFather;
                    }

                    BlockW.DominatorTreeFather.DominatorTreeBucket.clear();
                }

                for (int i = 2; i <= tmpFunc.DFNcurNumber; ++i) {
                    IRBasicBlock BlockW = tmpFunc.DFSOrder.get(i - 1);
                    if (BlockW.DominatorTreeImmediateDominator.DFN != BlockW.DominatorTreeSemiDominator.DFN)
                        BlockW.DominatorTreeImmediateDominator =
                                BlockW.DominatorTreeImmediateDominator.DominatorTreeImmediateDominator;
                }

                for (int i = 1; i <= tmpFunc.DFNcurNumber; ++i) {
                    IRBasicBlock BlockW = tmpFunc.DFSOrder.get(i - 1);
                    for (IRBasicBlock BlockU = BlockW.DominatorTreeImmediateDominator;
                         BlockU != null;
                         BlockU = BlockU.DominatorTreeImmediateDominator) {
                        BlockW.StrictDominator.add(BlockU);
                    }
                }
            }
        return false;
    }
}
