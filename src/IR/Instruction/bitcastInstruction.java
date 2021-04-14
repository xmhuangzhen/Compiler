package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;
import IR.TypeSystem.IRTypeSystem;

import java.util.HashSet;
import java.util.LinkedHashSet;

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
        if (bitcastOperand instanceof Register)
            bitcastOperand.AddRegisterUseInInstruction(this);
        bitcastResult.Defs = this;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {
        if(originObject == bitcastOperand){
            bitcastOperand.DeleteRegisterUseInInstruction(this);
            bitcastOperand = newObject;
            bitcastOperand.NeedPtr = originObject.NeedPtr;
            bitcastOperand.AddRegisterUseInInstruction(this);
        }
    }

    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        if(bitcastOperand instanceof Register) res.add(bitcastOperand);
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        res.add(bitcastResult);
        return res;
    }

    @Override
    public String toString() {
        return bitcastResult.RegisterName + " = bitcast " + bitcastOperand.thisType.toString() +
                " " + bitcastOperand.toString() + " to " + bitcastType2.toString();
    }

    public void accept(IRVisitor it){
        it.visit(this);
    }

}
