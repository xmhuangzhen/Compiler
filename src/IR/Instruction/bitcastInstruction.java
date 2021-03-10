package IR.Instruction;

import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;
import IR.TypeSystem.IRTypeSystem;

public class bitcastInstruction extends IRInstruction{
    //<result> = bitcast <ty> <value> to <ty2>             ; yields ty2
    public Register bitcastResult;
    public IROperand bitcastOperand;
    public IRTypeSystem bitcastType2;

    public bitcastInstruction(IRBasicBlock tmpBasicBlock, IROperand tmpOperand, IRTypeSystem tmpType2, Register tmpResult) {
        super(tmpBasicBlock);
        bitcastOperand = tmpOperand;
        bitcastType2 = tmpType2;
        bitcastResult = tmpResult;
    }

    @Override
    public String toString() {
        return bitcastResult.RegisterName + " = bitcast " + bitcastOperand.thisType.toString() +
                " " + bitcastOperand.toString() + " to " + bitcastType2.toString();
    }
}
