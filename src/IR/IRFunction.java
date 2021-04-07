package IR;

import Backend.IRVisitor;
import IR.Instruction.IRInstruction;
import IR.Instruction.allocaInstruction;
import IR.Operand.IROperand;
import IR.Operand.Parameter;
import IR.Operand.Register;
import IR.TypeSystem.FunctionType;

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

    //for SSA Constructor
    public HashSet<allocaInstruction> allocaInstTable;

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

        allocaInstTable = new LinkedHashSet<>();
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
        CFGDFS(thisEntranceBlock);
    }

    public void CFGDFS(IRBasicBlock curBlock){
        ++DFNcurNumber;
        curBlock.DFN = DFNcurNumber;
        curBlock.DominatorTreeSemiDominator = curBlock;
        curBlock.DominatorTreeLabel = curBlock;
        curBlock.DominatorTreeAncestor = null;
        DFSOrder.add(curBlock);
        for(var nextBlock : curBlock.CFGSuccessor){
            if(nextBlock.DFN == 0){
                nextBlock.DominatorTreeFather = curBlock;
                CFGDFS(nextBlock);
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

        for(var tmpPreBlock : curBlock.CFGPredecessor)
            tmpPreBlock.CFGSuccessor.remove(curBlock);
        for (var tmpNxtBlock : curBlock.CFGSuccessor)
            tmpNxtBlock.CFGPredecessor.remove(curBlock);
    }
}
