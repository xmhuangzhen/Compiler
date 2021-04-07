package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.brInstruction;

public class CFGConstructor extends Pass {

    public IRFunction curFunc;

    public CFGConstructor(IRModule tmpModule) {
        super(tmpModule);
    }

    public void preSetBranch(){
        for(IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;
        tmpBlock.nextBasicBlocks != null; tmpBlock = tmpBlock.nextBasicBlocks){
            for(IRInstruction tmpInst = tmpBlock.HeadInst;tmpInst != null;
            tmpInst = tmpInst.nextIRInstruction){
                if(tmpInst instanceof brInstruction)
                    if(((brInstruction) tmpInst).brCond == null){
                        tmpInst.nextIRInstruction = null;
                        tmpBlock.TailInst = tmpInst;
                    }
            }
            if(!(tmpBlock.TailInst instanceof brInstruction)){
                tmpBlock.addBasicBlockInst(new brInstruction(tmpBlock,
                        null,tmpBlock.nextBasicBlocks,null));
            }
        }
    }

    @Override
    public boolean run() {
        for (var tmpIRFunc : curIRModule.IRFunctionTable.values())
            if (!tmpIRFunc.IsBuiltIn) {

                curFunc = tmpIRFunc;
                preSetBranch();

                for (IRBasicBlock tmpIRBasicBlock = tmpIRFunc.thisEntranceBlock;
                     tmpIRBasicBlock != null;
                     tmpIRBasicBlock = tmpIRBasicBlock.nextBasicBlocks) {
                    for (IRInstruction tmpInst = tmpIRBasicBlock.HeadInst;
                         tmpInst != null;
                         tmpInst = tmpInst.nextIRInstruction) {
                        if (tmpInst instanceof brInstruction) {
                            if (((brInstruction) tmpInst).brIfTrue != null) {
                                tmpIRBasicBlock.CFGSuccessor.add(((brInstruction) tmpInst).brIfTrue);
                                ((brInstruction) tmpInst).brIfTrue.CFGPredecessor.add(tmpIRBasicBlock);
                            }
                            if (((brInstruction) tmpInst).brIfFalse != null) {
                                tmpIRBasicBlock.CFGSuccessor.add(((brInstruction) tmpInst).brIfFalse);
                                ((brInstruction) tmpInst).brIfFalse.CFGPredecessor.add(tmpIRBasicBlock);
                            }
                        }
                    }
                }
            }
        return false;
    }
}
