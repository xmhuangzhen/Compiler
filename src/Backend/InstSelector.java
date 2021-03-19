package Backend;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.Constant;
import IR.Operand.Register;
import RISCV.Inst.RISCVliInst;
import RISCV.Inst.RISCVmvInst;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;

public class InstSelector implements IRVisitor{

    public IRModule curIRModule;
    public RISCVModule curRISCVModule;
    public RISCVFunction curRISCVFunction;
    public RISCVBasicBlock curRISCVBasicBlock;

    public InstSelector(IRModule tmpModule){
        curIRModule = tmpModule;
        curRISCVModule = new RISCVModule();
        curRISCVFunction = null;
        curRISCVBasicBlock = null;
    }

    @Override
    public void visit(IRModule it) {
        for(var tmpVar : it.IRGlobalVarTable.values()){
            //todo
        }
        //todo
    }

    @Override
    public void visit(IRFunction it) {

    }

    @Override
    public void visit(IRBasicBlock it) {

    }

    @Override
    public void visit(IRInstruction it) { }

    @Override
    public void visit(retInstruction it) {
        if(it.returnValue != null){

                curRISCVBasicBlock.addInstruction(new RISCVmvInst(curRISCVModule.PhyRegList.get(10),
                    curRISCVModule.getRISCVVirtualReg(it.returnValue)));
            //else if(it.returnValue instanceof Constant)
              //  curRISCVBasicBlock.addInstruction(new RISCVliInst());
        }
    }

    @Override
    public void visit(brInstruction it) {

    }

    @Override
    public void visit(binaryOpInstruction it) {

    }

    @Override
    public void visit(bitwiseBinaryInstruction it) {

    }

    @Override
    public void visit(allocaInstruction it) {

    }

    @Override
    public void visit(loadInstruction it) {

    }

    @Override
    public void visit(storeInstruction it) {

    }

    @Override
    public void visit(getElementPtrInstruction it) {

    }

    @Override
    public void visit(icmpInstruction it) {

    }

    @Override
    public void visit(phiInstruction it) {

    }

    @Override
    public void visit(callInstruction it) {

    }

    @Override
    public void visit(bitcastInstruction it) {

    }
}
