package Backend;


import IR.Instruction.IRInstruction;
import IR.Operand.IROperand;

import java.util.LinkedHashMap;
import java.util.Map;

// for the calculation of usage in Inst & Reg
abstract public class IRObject {
    public Map<IRInstruction, Integer> use;

    public IRObject(){
        use = new LinkedHashMap<>();
    }

    public void AddRegisterUseInInstruction(IRInstruction tmpInst){
        if(!use.containsKey(tmpInst))
            use.put(tmpInst,1);
        else{
            Integer tmpCnt = use.get(tmpInst);
            use.replace(tmpInst,tmpCnt+1);
        }
    }


    public void ReplaceRegisterUse(IROperand tmpObject){
        for(IRInstruction tmpInst : use.keySet()){
            tmpInst.replaceUse((IROperand) this, tmpObject);
        }
        use.clear();
    }

    public void DeleteRegisterUseInInstruction(IRInstruction tmpInst){
        if(use.containsKey(tmpInst)){
            Integer tmpCnt = use.get(tmpInst);
            if(tmpCnt == 1)
                use.remove(tmpInst);
            else
                use.replace(tmpInst,tmpCnt-1);
        }
    }
}
