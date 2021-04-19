package Optimize;

import IR.IRBasicBlock;
import IR.IRModule;
import IR.Instruction.IRInstruction;

public class RegisterUseRefresher extends Pass {
    public RegisterUseRefresher(IRModule tmpModule) {
        super(tmpModule);
    }

    @Override
    public boolean run() {
        for (var curFunc : curIRModule.IRFunctionTable.values())
            if (!curFunc.IsBuiltIn) {
                for (IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;
                     tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
                    for (IRInstruction tmpInst = tmpBlock.HeadInst;
                         tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                        for(var tmpReg : tmpInst.getuse()) {
                            if (!tmpReg.use.isEmpty())
                                tmpReg.use.clear();
                            if(!tmpReg.Defs.isEmpty())
                                tmpReg.Defs.clear();
                        }
                        for(var tmpReg : tmpInst.getuse()) {
                            if (!tmpReg.use.isEmpty())
                                tmpReg.use.clear();
                            if(!tmpReg.Defs.isEmpty())
                                tmpReg.Defs.clear();
                        }
                    }
                }
                for(IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;
                tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks){
                    for(IRInstruction tmpInst = tmpBlock.HeadInst;
                    tmpInst != null; tmpInst = tmpInst.nextIRInstruction){
                        tmpInst.refreshRegisterUse();
                    }
                }
            }
        return false;
    }
}
