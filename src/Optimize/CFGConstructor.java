package Optimize;

import IR.IRBasicBlock;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.brInstruction;

public class CFGConstructor extends Pass {

    public CFGConstructor(IRModule tmpModule) {
        super(tmpModule);
    }

    @Override
    public boolean run() {
        for (var tmpIRFunc : curIRModule.IRFunctionTable.values())
            if (!tmpIRFunc.IsBuiltIn) {
                for (IRBasicBlock tmpIRBasicBlock = tmpIRFunc.thisEntranceBlock;
                     tmpIRBasicBlock != null;
                     tmpIRBasicBlock = tmpIRBasicBlock.nextBasicBlocks) {
                    for (IRInstruction tmpInst = tmpIRBasicBlock.HeadInst;
                         tmpInst != null;
                         tmpInst = tmpInst.nextIRInstruction) {
                        if (tmpInst instanceof brInstruction) {
                            if (((brInstruction) tmpInst).brIfTrue != null) {
                                tmpIRBasicBlock.DominatorTreeSuccessor.add(((brInstruction) tmpInst).brIfTrue);
                                ((brInstruction) tmpInst).brIfTrue.DominatorTreePredecessor.add(tmpIRBasicBlock);
                            }
                            if (((brInstruction) tmpInst).brIfFalse != null) {
                                tmpIRBasicBlock.DominatorTreeSuccessor.add(((brInstruction) tmpInst).brIfFalse);
                                ((brInstruction) tmpInst).brIfFalse.DominatorTreePredecessor.add(tmpIRBasicBlock);
                            }
                        }
                    }
                }
            }
        return false;
    }
}
