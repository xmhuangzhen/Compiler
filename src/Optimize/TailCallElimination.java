package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;

//https://www.cs.cornell.edu/courses/cs6120/2019fa/blog/tail-call-elimination/

public class TailCallElimination extends Pass{

    public IRFunction curFunc;

    public TailCallElimination(IRModule tmpModule) {
        super(tmpModule);
    }

    @Override
    public boolean run() {
        for(var tmpFunc : curIRModule.IRFunctionTable.values())
            if(!tmpFunc.IsBuiltIn){
                curFunc = tmpFunc;
                TCEForFunc();
            }
        return false;
    }

    public void TCEForFunc(){
        for(IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;
        tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks){
            for(IRInstruction tmpInst = tmpBlock.HeadInst;
            tmpInst != null; tmpInst = tmpInst.nextIRInstruction){
                if(tmpInst instanceof callInstruction &&
                        ((callInstruction) tmpInst).IsTailCall){
                    callInstruction curInst = (callInstruction) tmpInst;
                    for(int i = 0;i < curInst.CallParameters.size();++i)
                        tmpBlock.addBasicBlockInstPreInst(curInst,
                                new moveInstruction(tmpBlock,
                                        curFunc.thisFunctionParameters.get(i),
                                        curInst.CallParameters.get(i)));
                    IRInstruction nxtInst = curInst.nextIRInstruction;
                    curInst.removeInst();
                    if(nxtInst instanceof moveInstruction)
                        nxtInst = nxtInst.nextIRInstruction;
                    if(!(nxtInst instanceof brInstruction)) throw new RuntimeException();
                    tmpBlock.addBasicBlockInstPreInst(nxtInst,
                            new brInstruction(tmpBlock, null,
                                    curFunc.thisEntranceBlock, null));
//                    System.out.println(nxtInst+","+nxtInst.preIRInstruction+","+nxtInst.preIRInstruction.preIRInstruction.nextIRInstruction);
                    nxtInst.removeInst();
                    break;
                }
            }
        }
    }
}
