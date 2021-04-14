package IR.Instruction;

import Backend.IRVisitor;
import IR.IRBasicBlock;
import IR.Operand.IROperand;
import IR.Operand.Register;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class phiInstruction extends IRInstruction{
    public Register PhiResult;
    public ArrayList<IROperand> PhiValue;
    public ArrayList<IRBasicBlock> PhiLabel;

    public phiInstruction(IRBasicBlock tmpBasicBlock, Register tmpResult) {
        super(tmpBasicBlock);
        PhiResult = tmpResult;
        PhiValue = new ArrayList<>();
        PhiLabel = new ArrayList<>();
        PhiResult.Defs = this;
    }

    @Override
    public void replaceUse(IROperand originObject, IROperand newObject) {

    }

    @Override
    public HashSet<IROperand> getuse() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        for(int i = 0;i < PhiValue.size();++i)
            if(PhiValue.get(i) instanceof Register)
                res.add(PhiValue.get(i));
        return res;
    }

    @Override
    public HashSet<IROperand> getdef() {
        HashSet<IROperand> res = new LinkedHashSet<>();
        res.add(PhiResult);
        return res;
    }


    //for SSA Destructor use
    public void replaceBlock(IRBasicBlock originBlock, IRBasicBlock newBlock){
        for(int i = 0;i < PhiLabel.size();++i){
            IRBasicBlock tmpLabel = PhiLabel.get(i);
            if(tmpLabel == originBlock){
                PhiLabel.set(i,newBlock);
            }
        }
    }

    //for CFG Simplification use
    public void removeBlock(IRBasicBlock tmpBlock){
        for(int i = 0;i < PhiLabel.size();++i){
            if(PhiLabel.get(i) == tmpBlock){
                PhiLabel.remove(i);
                PhiValue.remove(i);
            }
        }
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

    public void accept(IRVisitor it){
        it.visit(this);
    }

}
