package Optimize;

import IR.IRBasicBlock;
import IR.IRModule;

import java.util.HashSet;
import java.util.LinkedHashSet;

//using Lengauer-Tarjan algorithm
public class PostDominatorTreeConstructor extends Pass {

    public PostDominatorTreeConstructor(IRModule tmpModule) {
        super(tmpModule);
    }

    public void Compress(IRBasicBlock curBlock) {
        if (curBlock.PostDominatorTreeAncestor != null &&
                curBlock.PostDominatorTreeAncestor.PostDominatorTreeAncestor != null) {
            Compress(curBlock.PostDominatorTreeAncestor);
            if (curBlock.PostDominatorTreeAncestor.PostDominatorTreeLabel.PostDominatorTreeSemiDominator.PostDFN
                    < curBlock.PostDominatorTreeLabel.PostDominatorTreeSemiDominator.PostDFN) {
                curBlock.PostDominatorTreeLabel = curBlock.PostDominatorTreeAncestor.PostDominatorTreeLabel;
            }
            curBlock.PostDominatorTreeAncestor = curBlock.PostDominatorTreeAncestor.PostDominatorTreeAncestor;
        }
    }

    public void Link(IRBasicBlock BlockV, IRBasicBlock BlockW) {
        BlockW.PostDominatorTreeAncestor = BlockV;
    }

    public IRBasicBlock Eval(IRBasicBlock BlockV) {
        if (BlockV.PostDominatorTreeAncestor == null) return BlockV;
        Compress(BlockV);
        return BlockV.PostDominatorTreeLabel;
    }

    @Override
    public boolean run() {
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                tmpFunc.PostCFGConstructor();

                //(1) get dfs order
                tmpFunc.CalculatePostDFSOrder();

                //(2) get semi dominator
                for (int i = tmpFunc.PostDFNcurNumber; i > 1; --i) {
                    IRBasicBlock BlockW = tmpFunc.PostDFSOrder.get(i - 1);
                    for (IRBasicBlock BlockV : BlockW.PostCFGPredecessor) {
                        IRBasicBlock BlockU = Eval(BlockV);
                        if (BlockU.PostDominatorTreeSemiDominator.PostDFN < BlockW.PostDominatorTreeSemiDominator.PostDFN) {
                            BlockW.PostDominatorTreeSemiDominator = BlockU.PostDominatorTreeSemiDominator;
                        }
                    }
                    BlockW.PostDominatorTreeSemiDominator.PostDominatorTreeBucket.add(BlockW);
                    Link(BlockW.PostDominatorTreeFather, BlockW);


                    for (IRBasicBlock BlockV : BlockW.PostDominatorTreeFather.PostDominatorTreeBucket) {
                        //    BlockW.DominatorTreeFather.DominatorTreeBucket.remove(BlockV);
                        IRBasicBlock BlockU = Eval(BlockV);
                        if (BlockU.PostDominatorTreeSemiDominator.PostDFN < BlockV.PostDominatorTreeSemiDominator.PostDFN)
                            BlockV.PostDominatorTreeImmediateDominator = BlockU;
                        else
                            BlockV.PostDominatorTreeImmediateDominator = BlockW.PostDominatorTreeFather;
                    }
                    //BlockW.DominatorTreeFather.DominatorTreeBucket.clear();
                }

                for (int i = 2; i <= tmpFunc.PostDFNcurNumber; ++i) {
                    IRBasicBlock BlockW = tmpFunc.PostDFSOrder.get(i - 1);
                    if (BlockW.PostDominatorTreeImmediateDominator.PostDFN != BlockW.PostDominatorTreeSemiDominator.PostDFN)
                        BlockW.PostDominatorTreeImmediateDominator =
                                BlockW.PostDominatorTreeImmediateDominator.PostDominatorTreeImmediateDominator;
                }

            }
        return false;
    }
}
