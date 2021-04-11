package Optimize;

import RISCV.Inst.RISCVInstruction;
import RISCV.Operand.RISCVRegister;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVFunction;

import java.util.HashSet;
import java.util.LinkedHashSet;

import java.util.HashMap;
import java.util.HashSet;

public class LivenessAnalysis{

    public RISCVFunction curFunc;

    public LivenessAnalysis(RISCVFunction tmpFunc) {
        curFunc = tmpFunc;
    }

    public boolean run() {
        //Algorithm in Ch17.4

        RISCVCFGConstructor tmpCFG = new RISCVCFGConstructor(curFunc);
        tmpCFG.run();

        //(1) get the DFS order(17.4.3)
        curFunc.getDFSOrder();

        //(2) get RISCVBasicBlock Gen & Kill
        for (var tmpBlock : curFunc.DFSOrder) {
            tmpBlock.gen = new LinkedHashSet<>();
            tmpBlock.kill = new LinkedHashSet<>();
            for (RISCVInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null; tmpInst = tmpInst.nextInst) {
                tmpInst.ComputeGenAndKill(tmpBlock.gen, tmpBlock.kill);
            }
        }

        //(3) get in & out in BasicBlock-based CFG(17.4.3)
        boolean modified = true;
        while (modified) {
            modified = false;
            for (int i = curFunc.DFSOrder.size() - 1; i >= 0; --i) {
                RISCVBasicBlock curBlock = curFunc.DFSOrder.get(i);
                HashSet<RISCVRegister> NewLiveOut = new LinkedHashSet<>();
                for (var sucBlock : curBlock.successor) {

                    HashSet<RISCVRegister> tmp = new LinkedHashSet<>(sucBlock.LiveOut);
                    tmp.removeAll(sucBlock.kill);
                    tmp.addAll(sucBlock.gen);
                    NewLiveOut.addAll(tmp);
                }
                if (!NewLiveOut.equals(curBlock.LiveOut)) {
                    modified = true;
                    curBlock.LiveOut = NewLiveOut;
                }
            }
        }
/*        for(var tmp:curFunc.DFSOrder){
            System.out.println(tmp+","+tmp.LiveOut +","+tmp.gen+","+tmp.kill );
        }
   */     return false;
    }
}
