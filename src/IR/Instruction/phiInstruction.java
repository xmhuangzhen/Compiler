package IR.Instruction;

import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;

import java.util.ArrayList;

public class phiInstruction extends IRInstruction{
    public Register PhiResult;
    public ArrayList<IROperand> PhiValue;
    public ArrayList<IRBasicBlock> PhiLabel;

    public phiInstruction(IRBasicBlock tmpBasicBlock, Register tmpResult) {
        super(tmpBasicBlock);
        PhiResult = tmpResult;
        PhiValue = new ArrayList<>();
        PhiLabel = new ArrayList<>();
    }

    @Override
    public String toString() {
        //<result> = phi [fast-math-flags] <ty> [ <val0>, <label0>], ...
        StringBuilder PhiName = new StringBuilder();
        PhiName.append(PhiResult.toString());
        PhiName.append(" = phi ");
        PhiName.append(PhiResult.thisType.toString());

        for(int i = 0;i < PhiValue.size();++i){
            if(i != 0) PhiName.append(", ");
            PhiName.append("[ "+ PhiValue.get(i).toString()+", "+PhiLabel.get(i).toString()+"]");
        }
        return PhiName.toString();
    }
}
