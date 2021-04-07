package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.brInstruction;
import IR.Instruction.callInstruction;
import IR.Instruction.getElementPtrInstruction;
import IR.Operand.Register;

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

    public void preInitializeCall() {
        for (IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;
             tmpBlock != null;
             tmpBlock = tmpBlock.nextBasicBlocks) {
            for(IRInstruction tmpInst = tmpBlock.HeadInst; tmpInst != null;
            tmpInst = tmpInst.nextIRInstruction){
                if(tmpInst instanceof callInstruction){
                    for(var tmp : ((callInstruction) tmpInst).CallParameters){
                        if(tmp instanceof Register) tmp.AddRegisterUseInInstruction(tmpInst);
                    }
                } else if(tmpInst instanceof getElementPtrInstruction){
                    for(var tmp : ((getElementPtrInstruction) tmpInst).GetElementPtrIdx)
                        if(tmp instanceof Register) tmp.AddRegisterUseInInstruction(tmpInst);
                }
            }
        }
    }

    @Override
    public boolean run() {
        for (var tmpIRFunc : curIRModule.IRFunctionTable.values())
            if (!tmpIRFunc.IsBuiltIn) {

                curFunc = tmpIRFunc;
                preSetBranch();
                preInitializeCall();

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

                tmpIRFunc.CalculateDFSOrder();
            }
        return false;
    }
}
