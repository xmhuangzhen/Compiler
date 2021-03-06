package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Parameter;
import IR.Operand.Register;
import IR.TypeSystem.PointerType;

import java.util.HashSet;
import java.util.LinkedHashSet;

public class storeInstruction extends IRInstruction{
    public IROperand StoreValue;
    public IROperand StorePointer;

    public storeInstruction(IRBasicBlock tmpBasicBlock, IROperand tmpValue, IROperand tmpPointer) {
        super(tmpBasicBlock);
        StoreValue = tmpValue;
        StorePointer = tmpPointer;
        if (StoreValue instanceof Register || StoreValue instanceof Parameter)
            StoreValue.AddRegisterUseInInstruction(this);
        if (StorePointer instanceof Register || StorePointer instanceof Parameter)
            StorePointer.AddRegisterUseInInstruction(this);

        HasSideEffect = true;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(StoreValue == originObject){
            StoreValue.DeleteRegisterUseInInstruction(this);
            StoreValue = newObject;
            StoreValue.NeedPtr = originObject.NeedPtr;
            StoreValue.AddRegisterUseInInstruction(this);
        }
        if(StorePointer == originObject){
            StorePointer.DeleteRegisterUseInInstruction(this);
            StorePointer = newObject;
            StorePointer.NeedPtr = originObject.NeedPtr;
            StorePointer.AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        if(StorePointer instanceof Register || StorePointer instanceof Parameter)
            res.add(StorePointer);
        if(StoreValue instanceof Register || StoreValue instanceof Parameter)
            res.add(StoreValue);
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        return res;
    }

    @Override
    public void refreshRegisterUse() {
        if (StoreValue instanceof Register || StoreValue instanceof Parameter)
            StoreValue.AddRegisterUseInInstruction(this);
        if (StorePointer instanceof Register || StorePointer instanceof Parameter)
            StorePointer.AddRegisterUseInInstruction(this);

    }

    @Override
    public String toString() {
        //System.out.println("Here");
        if(StorePointer.thisType instanceof PointerType) {
            String tmpString = "store " + ((PointerType) StorePointer.thisType).baseType.toString()
                    + " " + StoreValue.toString() + ", " + StorePointer.thisType.toString()
                    + " " + StorePointer.toString();
        //    System.out.println(tmpString);
            return tmpString;
        }else {
         //   System.out.println(StorePointer.isConstant());
            return "store pointer is not pointertype"+StorePointer.thisType;
        }
        //else throw new RuntimeException(StorePointer.thisType.toString()+","+StorePointer.toString());
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}
