package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.TypeSystem.IRTypeSystem;
import IR.TypeSystem.VoidType;

public class retInstruction extends IRInstruction{

    public IRTypeSystem returnType;
    public IROperand returnValue;

    public retInstruction(IRBasicBlock tmpBasicBlock, IRTypeSystem tmpType, IROperand tmpValue){
        super(tmpBasicBlock);
        returnType = tmpType;
        returnValue = tmpValue;
    }

    @Override
    public String toString() {
        if(returnType instanceof VoidType)
            return "ret void";
        return "ret " + returnType.toString() + " " + returnValue.toString();
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}
