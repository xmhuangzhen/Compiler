package IR.Instruction;

import IR.IRBasicBlock;
import IR.Operand.IROperand;

public class loadInstruction extends IRInstruction{
    public IROperand LoadResult;
    public IROperand LoadPointer;

    public loadInstruction(IRBasicBlock tmpBasicBlock, IROperand tmpResult, IROperand tmpPointer) {
        super(tmpBasicBlock);
        LoadResult = tmpResult;
        LoadPointer = tmpPointer;
    }

    @Override
    public String toString() {
        return LoadResult.toString() + " = load " + LoadResult.thisType.toString()
                +", " + LoadPointer.thisType.toString() + " "+ LoadPointer.toString();
    }
}
