package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.TypeSystem.PointerType;

public class storeInstruction extends IRInstruction{
    public IROperand StoreValue;
    public IROperand StorePointer;

    public storeInstruction(IRBasicBlock tmpBasicBlock, IROperand tmpValue, IROperand tmpPointer) {
        super(tmpBasicBlock);
        StoreValue = tmpValue;
        StorePointer = tmpPointer;
    }

    @Override
    public String toString() {
        if(StorePointer.thisType instanceof PointerType)
            return "store " + ((PointerType) StorePointer.thisType).baseType.toString()
                + " " + StoreValue.toString() + ", " + StorePointer.thisType.toString()
                + " " + StorePointer.toString();
        else throw new RuntimeException(StorePointer.thisType.toString());
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}