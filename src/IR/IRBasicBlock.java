package IR;

import Backend.IRVisitor;
import IR.Instruction.IRInstruction;
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

    //for Dominator Tree Use
    public ArrayList<IRBasicBlock> DominatorTreeSuccessor;
    public ArrayList<IRBasicBlock> DominatorTreePredecessor;
    public int DFN;//0 -- no visit
    public IRBasicBlock DominatorTreeFather;
    public IRBasicBlock DominatorTreeImmediateDominator, DominatorTreeSemiDominator;
    public IRBasicBlock DominatorTreeLabel, DominatorTreeAncestor;
    public HashSet<IRBasicBlock> DominatorTreeBucket;
    public HashSet<IRBasicBlock> StrictDominator;

    //for Dominance Frontier Use
    public HashSet<IRBasicBlock> DominanceFrontier;

    public IRBasicBlock(IRFunction tmpFunction, String tmpName){
        BasicBlockFunction = tmpFunction;
        BasicBlockName = tmpName;
        prevBasicBlocks = null;
        nextBasicBlocks = null;
        HeadInst = null;
        TailInst = null;
        IRRegisterTable = new LinkedHashMap<>();

        DominatorTreeSuccessor = new ArrayList<>();
        DominatorTreePredecessor = new ArrayList<>();
        DFN = 0;
        DominatorTreeFather = null;
        DominatorTreeImmediateDominator = null;
        DominatorTreeSemiDominator = null;
        DominatorTreeLabel = null;
        DominatorTreeAncestor = null;
        DominatorTreeBucket = new LinkedHashSet<>();
        StrictDominator = new LinkedHashSet<>();

        DominanceFrontier = new LinkedHashSet<>();
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
            HeadInst.preIRInstruction = tmpInst;
            tmpInst.nextIRInstruction = HeadInst;
            HeadInst = tmpInst;
        }
    }

    public void addBasicBlockInstPreInst(IRInstruction NxtInst, IRInstruction tmpInst){
        tmpInst.preIRInstruction = NxtInst.preIRInstruction;
        tmpInst.nextIRInstruction = NxtInst;
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

    public void accept(IRVisitor it){
        it.visit(this);
    }
}
