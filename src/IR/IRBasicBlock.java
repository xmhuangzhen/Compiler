package IR;

import Backend.IRVisitor;
import IR.Instruction.IRInstruction;
import IR.Instruction.brInstruction;
import IR.Instruction.phiInstruction;
import IR.Operand.IROperand;

import java.lang.reflect.Array;
import java.util.*;

public class IRBasicBlock {
    public String BasicBlockName;
    public IRFunction BasicBlockFunction;
    public IRBasicBlock prevBasicBlocks;
    public IRBasicBlock nextBasicBlocks;

    public IRInstruction HeadInst;
    public IRInstruction TailInst;

    public Map<String, IROperand> IRRegisterTable;

    //for CFG use
    public ArrayList<IRBasicBlock> CFGSuccessor;
    public ArrayList<IRBasicBlock> CFGPredecessor;
    public int DFN;//0 -- no visit

    //for Dominator Tree Use
    public IRBasicBlock DominatorTreeFather;
    public IRBasicBlock DominatorTreeImmediateDominator, DominatorTreeSemiDominator;
    public IRBasicBlock DominatorTreeLabel, DominatorTreeAncestor;
    public HashSet<IRBasicBlock> DominatorTreeBucket;

    //for Dominance Frontier Use
    public HashSet<IRBasicBlock> DominanceFrontier;

    //for ADCE use
    public ArrayList<IRBasicBlock> PostCFGSuccessor;
    public ArrayList<IRBasicBlock> PostCFGPredecessor;
    public int PostDFN;//0 -- no visit
    public IRBasicBlock PostDominatorTreeFather;
    public IRBasicBlock PostDominatorTreeImmediateDominator, PostDominatorTreeSemiDominator;
    public IRBasicBlock PostDominatorTreeLabel, PostDominatorTreeAncestor;
    public HashSet<IRBasicBlock> PostDominatorTreeBucket;
    public HashSet<IRBasicBlock> PostDominanceFrontier;

    //for LICM use
    public HashSet<IRBasicBlock> DominatorChildren;

    //for polyhedral
    public enum PolyBBENUMType{init_stmt,cond_stmt,step_stmt,otherwise}
    public PolyBBENUMType PolyBBType;
    public ArrayList<IROperand> DefsInBB;
    public int LoopPos;

    public IRBasicBlock(IRFunction tmpFunction, String tmpName){
        BasicBlockFunction = tmpFunction;
        BasicBlockName = tmpName;
        prevBasicBlocks = null;
        nextBasicBlocks = null;
        HeadInst = null;
        TailInst = null;
        IRRegisterTable = new LinkedHashMap<>();

        CFGPredecessor = new ArrayList<>();
        CFGSuccessor = new ArrayList<>();
        DFN = 0;

        PostCFGPredecessor = new ArrayList<>();
        PostCFGSuccessor = new ArrayList<>();
        PostDFN = 0;

        DominatorTreeFather = null;
        DominatorTreeImmediateDominator = null;
        DominatorTreeSemiDominator = null;
        DominatorTreeLabel = null;
        DominatorTreeAncestor = null;
        DominatorTreeBucket = new LinkedHashSet<>();

        DominanceFrontier = new LinkedHashSet<>();

        PostDominatorTreeFather = null;
        PostDominatorTreeImmediateDominator = null;
        PostDominatorTreeSemiDominator = null;
        PostDominatorTreeLabel = null;
        PostDominatorTreeAncestor = null;
        PostDominatorTreeBucket = new LinkedHashSet<>();
        PostDominanceFrontier = new LinkedHashSet<>();

        DominatorChildren = new HashSet<>();

        PolyBBType = PolyBBENUMType.otherwise;
        DefsInBB = new ArrayList<>();
        LoopPos = 0;
    }

    public void addBasicBlockInst(IRInstruction tmpInst){
        if(HeadInst == null){
            HeadInst = tmpInst;
            TailInst = tmpInst;
        } else {
            tmpInst.preIRInstruction = TailInst;
            TailInst.nextIRInstruction = tmpInst;
            TailInst = tmpInst;
        }
    }

    public void addBasicBlockInstAtFront(IRInstruction tmpInst){
        if(HeadInst == null){
            HeadInst = tmpInst;
            TailInst = tmpInst;
        } else {
            tmpInst.nextIRInstruction = HeadInst;
            HeadInst.preIRInstruction = tmpInst;
            HeadInst = tmpInst;
        }
    }

    public void addBasicBlockInstPreInst(IRInstruction NxtInst, IRInstruction tmpInst){
        tmpInst.preIRInstruction = NxtInst.preIRInstruction;
        if(NxtInst.preIRInstruction == null)
            HeadInst = tmpInst;
        tmpInst.nextIRInstruction = NxtInst;
        if(NxtInst.preIRInstruction != null)
            NxtInst.preIRInstruction.nextIRInstruction = tmpInst;
        NxtInst.preIRInstruction = tmpInst;
    }

    //for IRPrinter use
    @Override
    public String toString() {
        return "%" + BasicBlockName;
    }

    //for SSA use
    public void removeInst(IRInstruction tmpInst){
        if(tmpInst.preIRInstruction == null)
            HeadInst = tmpInst.nextIRInstruction;
        else
            tmpInst.preIRInstruction.nextIRInstruction = tmpInst.nextIRInstruction;

        if(tmpInst.nextIRInstruction == null)
            TailInst = tmpInst.preIRInstruction;
        else
            tmpInst.nextIRInstruction.preIRInstruction = tmpInst.preIRInstruction;
    }

    public void removePhiInstBlock(IRBasicBlock tmpBlock){
        for(IRInstruction tmpInst = HeadInst; tmpInst != null; tmpInst = tmpInst.nextIRInstruction){
            if(tmpInst instanceof phiInstruction) {
                ((phiInstruction) tmpInst).removeBlock(tmpBlock);
            }
            else return;
        }
    }

    public void removebrBlock(IRBasicBlock tmpBlock) {
        for(IRInstruction tmpInst = TailInst; tmpInst != null; tmpInst = tmpInst.preIRInstruction)
            if(tmpInst instanceof brInstruction){
                if(((brInstruction) tmpInst).brIfTrue == tmpBlock){
                    ((brInstruction) tmpInst).brIfTrue = null;
                }
                if(((brInstruction) tmpInst).brIfFalse == tmpBlock){
                    ((brInstruction) tmpInst).brIfFalse = null;
                }
            }
        for(IRInstruction tmpInst = TailInst; tmpInst != null; tmpInst = tmpInst.preIRInstruction)
            if(tmpInst instanceof brInstruction){
                if(((brInstruction) tmpInst).brIfTrue == null && ((brInstruction) tmpInst).brIfFalse == null){
                    removeInst(tmpInst);
                } else if(((brInstruction) tmpInst).brCond != null){
                    if(((brInstruction) tmpInst).brIfTrue == null){
                        ((brInstruction) tmpInst).brCond = null;
                    } else if(((brInstruction) tmpInst).brIfFalse == null){
                        ((brInstruction) tmpInst).brIfTrue = ((brInstruction) tmpInst).brIfFalse;
                        ((brInstruction) tmpInst).brIfFalse = null;
                        ((brInstruction) tmpInst).brCond = null;
                    }
                }
            }
    }

    public void replacePhiInstBlock(IRBasicBlock tmpBlock, IRBasicBlock newBlock){
        for(IRInstruction tmpInst = HeadInst; tmpInst != null; tmpInst = tmpInst.nextIRInstruction){
            if(tmpInst instanceof phiInstruction) {
//                System.out.println(tmpInst+","+tmpBlock+"->"+newBlock);
                ((phiInstruction) tmpInst).replaceBlock(tmpBlock,newBlock);
            }
            else return;
        }
    }

    public void replacePhiInstBlockAggressive(IRBasicBlock tmpBlock,IRBasicBlock newBlock){
        for(IRInstruction tmpInst = HeadInst; tmpInst != null; tmpInst = tmpInst.nextIRInstruction){
            if(tmpInst instanceof phiInstruction) {
//                System.out.println(tmpInst+","+tmpBlock+"->"+newBlock);
                ((phiInstruction) tmpInst).replaceBlockAggressive(tmpBlock,newBlock);
            }
            else return;
        }
    }
    public void accept(IRVisitor it){
        it.visit(this);
    }
}
