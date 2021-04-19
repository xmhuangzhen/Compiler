package IR;

import Backend.IRVisitor;
import IR.Instruction.IRInstruction;
import IR.Instruction.allocaInstruction;
import IR.Instruction.brInstruction;
import IR.Operand.IROperand;
import IR.Operand.Parameter;
import IR.Operand.Register;
import IR.TypeSystem.FunctionType;

import java.lang.reflect.Array;
import java.util.*;

public class IRFunction {
    public FunctionType thisFunctionType;
    public String thisFunctionName;
    public boolean IsBuiltIn;

    public ArrayList<IRBasicBlock> thisFunctionBasicBlocks;
    public ArrayList<Parameter> thisFunctionParameters;

    public IROperand thisReturnValue;

    public IRBasicBlock thisEntranceBlock;
    public IRBasicBlock thisReturnBlock;

    //for Dominator Tree
    public ArrayList<IRBasicBlock> DFSOrder;
    public int DFNcurNumber;

    //for ADCE
    public ArrayList<IRBasicBlock> PostDFSOrder;
    public int PostDFNcurNumber;


    //for SSA Constructor
    public ArrayList<allocaInstruction> allocaInstTable;

    public IRFunction(FunctionType tmpFunctionType, String tmpFunctionName){
        thisFunctionType = tmpFunctionType;
        thisFunctionName = tmpFunctionName;
        IsBuiltIn = false;

        thisFunctionBasicBlocks = new ArrayList<>();
        thisFunctionParameters = new ArrayList<>();
        thisEntranceBlock = new IRBasicBlock(this,tmpFunctionName+"_entrance_block");
        thisReturnBlock = new IRBasicBlock(this,tmpFunctionName+"_return_block");
        thisEntranceBlock.nextBasicBlocks = thisReturnBlock;
        thisReturnBlock.prevBasicBlocks = thisEntranceBlock;

        DFSOrder = new ArrayList<>();
        DFNcurNumber = 0;

        PostDFSOrder = new ArrayList<>();
        PostDFNcurNumber = 0;

        allocaInstTable = new ArrayList<>();
    }

    public void addFunctionBasicBlock(IRBasicBlock tmpBasicBlock){
        //always add before the ReturnBlock
        IRBasicBlock tmpPreBlock = thisReturnBlock.prevBasicBlocks;
        tmpBasicBlock.prevBasicBlocks = tmpPreBlock;
        tmpBasicBlock.nextBasicBlocks = thisReturnBlock;
        tmpPreBlock.nextBasicBlocks = tmpBasicBlock;
        thisReturnBlock.prevBasicBlocks = tmpBasicBlock;
    }

    //for SSA Destructor use
    public void addFunctionBasicBlockAfterBlock(IRBasicBlock preBlock, IRBasicBlock tmpBasicBlock){
        tmpBasicBlock.prevBasicBlocks = preBlock;
        tmpBasicBlock.nextBasicBlocks = preBlock.nextBasicBlocks;
        preBlock.nextBasicBlocks.prevBasicBlocks = tmpBasicBlock;
        preBlock.nextBasicBlocks = tmpBasicBlock;
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

    //for IRPrinter use
    @Override
    public String toString() {
        StringBuilder tmpString = new StringBuilder("define ");
        tmpString.append(thisFunctionType.toString()+" @"+thisFunctionName);
        tmpString.append("(");
        for(int i = 0;i < thisFunctionParameters.size();++i){
            if(i != 0) tmpString.append(", ");
            tmpString.append(thisFunctionParameters.get(i).thisType.toString());
        }
        tmpString.append(")");
        return tmpString.toString();
    }

    //for Dominator Tree Use
    public void CalculateDFSOrder() {
        DFNcurNumber = 0;
        DFSOrder.clear();
        for (IRBasicBlock tmpBlock = thisEntranceBlock; tmpBlock != null;
             tmpBlock = tmpBlock.nextBasicBlocks) {
            tmpBlock.DominatorTreeImmediateDominator = null;
            tmpBlock.DominatorTreeSemiDominator = tmpBlock;
            tmpBlock.DFN = 0;
            tmpBlock.DominatorTreeLabel = null;
            tmpBlock.DominatorTreeAncestor = null;
            tmpBlock.DominatorTreeFather = null;
        }
        CFGDFS(thisEntranceBlock);
    }

    public void CFGDFS(IRBasicBlock curBlock) {
        ++DFNcurNumber;
        curBlock.DFN = DFNcurNumber;
        curBlock.DominatorTreeSemiDominator = curBlock;
        curBlock.DominatorTreeLabel = curBlock;
        curBlock.DominatorTreeAncestor = null;
        curBlock.DominatorTreeBucket = new LinkedHashSet<>();
        DFSOrder.add(curBlock);
        for (var nextBlock : curBlock.CFGSuccessor) {
            if (nextBlock.DFN == 0) {
                nextBlock.DominatorTreeFather = curBlock;
                CFGDFS(nextBlock);
            }
        }
    }

    //for ADCE
    public void PostCFGConstructor(){
        for(IRBasicBlock tmpBlock = thisEntranceBlock;tmpBlock != null;
        tmpBlock = tmpBlock.nextBasicBlocks){
            tmpBlock.PostCFGPredecessor.clear();
            tmpBlock.PostCFGSuccessor.clear();
        }
        for(IRBasicBlock tmpBlock = thisEntranceBlock; tmpBlock != null;
        tmpBlock = tmpBlock.nextBasicBlocks){
            for (IRInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null;
                 tmpInst = tmpInst.nextIRInstruction) {
                if (tmpInst instanceof brInstruction) {
                    if (((brInstruction) tmpInst).brIfTrue != null) {
                    //    System.out.println(tmpInst+","+tmpBlock+","+((brInstruction) tmpInst).brIfTrue);
                        tmpBlock.PostCFGPredecessor.add(((brInstruction) tmpInst).brIfTrue);
                        ((brInstruction) tmpInst).brIfTrue.PostCFGSuccessor.add(tmpBlock);
                    }
                    if (((brInstruction) tmpInst).brIfFalse != null) {
                        tmpBlock.PostCFGPredecessor.add(((brInstruction) tmpInst).brIfFalse);
                        ((brInstruction) tmpInst).brIfFalse.PostCFGSuccessor.add(tmpBlock);
                    }
                }
            }
        }
    }

    public void CalculatePostDFSOrder() {
        PostDFNcurNumber = 0;
        PostDFSOrder.clear();
        for (IRBasicBlock tmpBlock = thisEntranceBlock; tmpBlock != null;
             tmpBlock = tmpBlock.nextBasicBlocks) {
            tmpBlock.PostDominatorTreeImmediateDominator = null;
            tmpBlock.PostDominatorTreeSemiDominator = tmpBlock;
            tmpBlock.PostDFN = 0;
            tmpBlock.PostDominatorTreeLabel = null;
            tmpBlock.PostDominatorTreeAncestor = null;
            tmpBlock.PostDominatorTreeFather = null;
            tmpBlock.PostDominanceFrontier.clear();
          //  tmpBlock.PostDominanceFrontierReverse.clear();
        }
        PostCFGDFS(thisReturnBlock);
    }

    public void PostCFGDFS(IRBasicBlock curBlock) {
        ++PostDFNcurNumber;
        curBlock.PostDFN = PostDFNcurNumber;
        curBlock.PostDominatorTreeSemiDominator = curBlock;
        curBlock.PostDominatorTreeLabel = curBlock;
        curBlock.PostDominatorTreeAncestor = null;
        curBlock.PostDominatorTreeBucket = new LinkedHashSet<>();
        PostDFSOrder.add(curBlock);
        for (var nextBlock : curBlock.PostCFGSuccessor) {
            if (nextBlock.PostDFN == 0) {
                nextBlock.PostDominatorTreeFather = curBlock;
                PostCFGDFS(nextBlock);
            }
        }
    }



    //for CFG simplification
    public void removeBasicBlock(IRBasicBlock curBlock) {
        if(curBlock == thisReturnBlock) return;

        for (IRInstruction tmpInst = curBlock.HeadInst;
             tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
            curBlock.removeInst(tmpInst);
        }

        if(curBlock == thisEntranceBlock) thisEntranceBlock = curBlock.nextBasicBlocks;
        else
            curBlock.prevBasicBlocks.nextBasicBlocks = curBlock.nextBasicBlocks;

        curBlock.nextBasicBlocks.prevBasicBlocks = curBlock.prevBasicBlocks;

        //after maybe not need
        for(var tmpPreBlock : curBlock.CFGPredecessor)
            tmpPreBlock.CFGSuccessor.remove(curBlock);
        for (var tmpNxtBlock : curBlock.CFGSuccessor)
            tmpNxtBlock.CFGPredecessor.remove(curBlock);
    }

    public void CFGSimpGetDFS(){
        DFSOrder.clear();
        DFNcurNumber = 0;
        for (IRBasicBlock tmpBlock = thisEntranceBlock; tmpBlock != null;
             tmpBlock = tmpBlock.nextBasicBlocks) {
            tmpBlock.DFN = 0;
        }
        CFGSimpDFS(thisEntranceBlock);
    }

    public void CFGSimpDFS(IRBasicBlock curBlock){
        ++DFNcurNumber;
        curBlock.DFN = DFNcurNumber;
        DFSOrder.add(curBlock);
        for(var nextBlock : curBlock.CFGSuccessor){
            if(nextBlock.DFN == 0){
                CFGSimpDFS(nextBlock);
            }
        }
    }

}
