package Optimize;

import IR.IRBasicBlock;
import IR.IRModule;

import java.util.HashSet;
import java.util.LinkedHashSet;

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
        BlockW.DominatorTreeAncestor = BlockV;
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

/*                System.out.println("---------------------");
                System.out.println(tmpFunc.thisFunctionName);
                for(var tmp : tmpFunc.DFSOrder)
                    System.out.print(tmp.BasicBlockName+",");
*/
                //(2) get semi dominator
                for (int i = tmpFunc.DFNcurNumber; i > 1; --i) {
                    IRBasicBlock BlockW = tmpFunc.DFSOrder.get(i - 1);
                    for (IRBasicBlock BlockV : BlockW.CFGPredecessor) {
                        IRBasicBlock BlockU = Eval(BlockV);
                        if (BlockU.DominatorTreeSemiDominator.DFN < BlockW.DominatorTreeSemiDominator.DFN) {
                            BlockW.DominatorTreeSemiDominator = BlockU.DominatorTreeSemiDominator;
                        }
                    }
                    BlockW.DominatorTreeSemiDominator.DominatorTreeBucket.add(BlockW);
                    Link(BlockW.DominatorTreeFather, BlockW);


/*                    System.out.println(BlockW.BasicBlockName+","+
                            BlockW.DominatorTreeFather.BasicBlockName+","+
                            BlockW.DominatorTreeSemiDominator.BasicBlockName);
  */
                    for (IRBasicBlock BlockV : BlockW.DominatorTreeFather.DominatorTreeBucket) {
                    //    BlockW.DominatorTreeFather.DominatorTreeBucket.remove(BlockV);
                        IRBasicBlock BlockU = Eval(BlockV);
//                        System.out.println(BlockV.BasicBlockName);
                        if (BlockU.DominatorTreeSemiDominator.DFN < BlockV.DominatorTreeSemiDominator.DFN)
                            BlockV.DominatorTreeImmediateDominator = BlockU;
                        else
                            BlockV.DominatorTreeImmediateDominator = BlockW.DominatorTreeFather;
                    }
                    BlockW.DominatorTreeFather.DominatorTreeBucket.clear();
                }

                for (int i = 2; i <= tmpFunc.DFNcurNumber; ++i) {
                    IRBasicBlock BlockW = tmpFunc.DFSOrder.get(i - 1);
              //      System.out.println(BlockW.BasicBlockName);
                    if (BlockW.DominatorTreeImmediateDominator.DFN != BlockW.DominatorTreeSemiDominator.DFN)
                        BlockW.DominatorTreeImmediateDominator =
                                BlockW.DominatorTreeImmediateDominator.DominatorTreeImmediateDominator;
                }



                for (int i = 1; i <= tmpFunc.DFNcurNumber; ++i) {
                    IRBasicBlock BlockW = tmpFunc.DFSOrder.get(i - 1);
                    BlockW.StrictDominator = new LinkedHashSet<>();
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
